from django.urls import path
from .views import BookListView, AuthorListView, GenreListView, BookDetailView, AuthorDetailView, LoanedBooksByUserListView, BorrowBookView



urlpatterns = [
    path('', BookListView.as_view(), name='books'),
    path('authors/', AuthorListView.as_view(), name='authors'),
    path('genres/', GenreListView.as_view(), name='genres'),
    path('book/<int:pk>', BookDetailView.as_view(), name='book-detail'),
    path('author/<int:pk>', AuthorDetailView.as_view(), name='author-detail'),
    path('mybooks/', LoanedBooksByUserListView.as_view(), name='borrowed-books'),
    path('book/<int:pk>/borrow/', BorrowBookView.as_view(), name='borrow-book'),
    path('book/<int:pk>/return/', LoanedBooksByUserListView.as_view(), name='return-book'),
    path('book/<int:pk>/renew/', LoanedBooksByUserListView.as_view(), name='renew-book')
]