from django.contrib import admin
from .models import Book, Author, Genre, Series, SubGenre

admin.site.register([Book, Author, Genre, Series, SubGenre])