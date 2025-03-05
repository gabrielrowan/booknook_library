from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import ListView, DetailView
from .models import Book, Author, Genre, SubGenre, BookInstance
from django.views import View
from django.utils import timezone
from .forms import BookTitleFilterForm
from django.db.models import Q
from django.shortcuts import redirect
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from datetime import timedelta


class BookListView(ListView):
    model = Book
    template_name = 'books.html'
    context_object_name='books'  

    def get(self, request, *args, **kwargs):
        if request.GET.get('searchQuery') == "":
            return redirect('books')  
        return super().get(request, *args, **kwargs)

    def get_queryset(self):
        books = Book.objects.all()
        search_query = self.request.GET.get('searchQuery')
        if search_query:
            books = books.filter(
            Q(title__icontains=search_query) | 
            Q(author__first_name__icontains=search_query) | 
            Q(author__last_name__icontains=search_query)
        )
        return books

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['subgenres'] = SubGenre.objects.all()

        context['form'] = BookTitleFilterForm()
        return context

class AuthorListView(ListView):
    model = Author
    template_name = 'authors.html'
    context_object_name='authors'

class GenreListView(ListView):
    model = Genre
    template_name = 'genres.html'
    context_object_name='genres'

def index_view(request):
    return render(request, 'index.html')

class BookDetailView(DetailView):
    model = Book

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        other_books = Book.objects.filter(author=self.object.author).exclude(id=self.object.id)
        context['other_books_by_author'] = other_books if other_books.exists() else None

        if self.object.series:
            context['series_books'] = (
                Book.objects.filter(series=self.object.series)
                .exclude(id=self.object.id)
                .order_by('num_in_series')
            )
        else:
            context['series_books'] = Book.objects.none()

        context['book_genres'] = self.object.genre.all()
        context['book_subgenres'] = self.object.subgenre.all()

        return context

class AuthorDetailView(DetailView):
    model = Author

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["authors_books"] =   self.object.book_set.order_by('publication_date')[:4]

        return context
 

class LoanedBooksByUserListView(LoginRequiredMixin,ListView):
    model = BookInstance
    template_name = 'library/bookinstance_list_borrowed_user.html'

    def get_queryset(self):
        return (
            BookInstance.objects.filter(borrower=self.request.user)
            .filter(status__exact='o')
            .order_by('due_back')
        )


class BorrowBookView(LoginRequiredMixin, View):
    def post(self, request, book_id):
        return self.process_borrow_request(request, book_id)

    def process_borrow_request(self, request, book_id):
        book = get_object_or_404(Book, id=book_id)
        available_instance = BookInstance.objects.filter(book=book, status='a').first()

        if available_instance:
            available_instance.borrower = request.user
            available_instance.status = 'o'  
            available_instance.borrowed_date = timezone.now().date()
            available_instance.due_back = timezone.now().date() + timedelta(days=30)
            available_instance.save()
            messages.success(request, "You have successfully borrowed this book!")
        else:
            messages.error(request, "Sorry, this book is currently unavailable for borrowing.")

        return redirect('book-detail', pk=book.id)
