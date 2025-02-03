from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Book, Author, Genre, Series, SubGenre
from django.utils import timezone

class BookListView(ListView):
    model = Book
    template_name = 'books.html'
    context_object_name='books'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['subgenres'] = SubGenre.objects.all()
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
 
