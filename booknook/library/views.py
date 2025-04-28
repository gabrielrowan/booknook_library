from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import ListView, DetailView
from .models import Book, Author, Genre, SubGenre, BookInstance
from django.views import View
from django.utils import timezone
from .forms import BookTitleFilterForm, RateAndReviewForm
from django.db.models import Q, Value, CharField
from django.shortcuts import redirect
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from datetime import timedelta
from django.db.models.functions import Concat


class BookListView(ListView):
    model = Book
    template_name = 'books.html'
    context_object_name='books'  

    def get(self, request, *args, **kwargs):
        if request.GET.get('searchQuery') == "" and request.GET.get('subgenre') == "":
            return redirect('books')  
        return super().get(request, *args, **kwargs)

    def get_queryset(self):
        books = Book.objects.all()
        search_query = self.request.GET.get('searchQuery')
        subgenre_query = self.request.GET.get('subgenre')

        if search_query:
            # First, search for books by title
            books_matching_title = books.filter(title__icontains=search_query)
            
            # if there is a book matching the search term title, return it
            if books_matching_title.exists():
                return books_matching_title
            
            # next, create a virtual column for all authors' full names
            authors = Author.objects.annotate(
                full_name=Concat('first_name', Value(' '), 'last_name', output_field=CharField()))
            
            # check to see if the author's name is in the queryset of author full names
            matching_authors = authors.filter(full_name__icontains=search_query)

            if matching_authors.exists():
                # if a matching name exists, filter books by that name
                books_matching_author_name = books.filter(author__in=matching_authors)
                return books_matching_author_name

            # if nothing matching is found, return 
            return books.none()  
        
        
        if subgenre_query:
            books = books.filter(subgenre__name__iexact=subgenre_query)

        # if no search query is provided, return all books
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

        is_available = BookInstance.objects.filter(book=self.object, status='a').exists()
        context['is_available'] = is_available

        user = self.request.user

        if user.is_authenticated:
            context['user_borrowed_book_count'] = BookInstance.objects.filter(borrower=user).count()
            context['in_user_borrowed_list'] = BookInstance.objects.filter(book=self.object, borrower=user, status='o').exists()

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
        context['rate_review_form'] = RateAndReviewForm()


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


    def post(self, request, pk):
        book = get_object_or_404(Book, id=pk)
        book_inst = get_object_or_404(BookInstance, borrower=request.user, status='o', book=book)  

        action = request.POST.get("action")
        if action == "return":
            return self.return_book(request, book_inst)
        elif action == "renew":
            return self.renew_book(request, book_inst)
        else:
            print("invalid action type submitted")
        
    
    def return_book(self, request, book_inst):
        book_inst.status = 'a'
        book_inst.borrower = None
        book_inst.borrowed_date = None
        book_inst.due_back = None
        book_inst.save()
        messages.success(request, f"Thank you for returning '{book_inst.book.title}'!")
        return redirect('borrowed-books')

    def renew_book(self, request, book_inst):
        borrow_day_limit = 90
        if ((book_inst.due_back -  book_inst.borrowed_date).days <= borrow_day_limit):
            book_inst.due_back = book_inst.due_back + timedelta(days=30)
            book_inst.save()
            messages.success(request, f"You've renewed '{book_inst.book.title}' by 30 days!")
        else:
            messages.error(request, f"You can't renew '{book_inst.book.title}' because you've already borrowed it for 90 days!")
        return redirect('borrowed-books')


    def get_queryset(self):
        return (
            BookInstance.objects.filter(borrower=self.request.user)
            .filter(status__exact='o')
            .order_by('due_back')
        )


class BorrowBookView(LoginRequiredMixin, View):
    def post(self, request, pk):
        return self.process_borrow_request(request, pk)

    def process_borrow_request(self, request, pk):
        book = get_object_or_404(Book, id=pk)
        available_instance = BookInstance.objects.filter(book=book, status='a').first()

        user_borrowed_book_count = BookInstance.objects.filter(borrower=request.user).count()

        if available_instance and user_borrowed_book_count < 5:
            available_instance.borrower = request.user
            available_instance.status = 'o'  
            available_instance.borrowed_date = timezone.now().date()
            available_instance.due_back = timezone.now().date() + timedelta(days=30)
            available_instance.save()

        return redirect('book-detail', pk=pk)
