from django.contrib import admin
from .models import Book, Author, Genre, Series, SubGenre, BookInstance

admin.site.register([Book, Author, Genre, Series, SubGenre])

@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
    list_display = ('book', 'status', 'borrower', 'borrowed_date', 'due_back')
    list_filter = ('status', 'due_back')

    fieldsets = (
        (None, {
            'fields': ('book', 'id')
        }),
        ('Availability', {
            'fields': ('status', 'borrowed_date', 'due_back', 'borrower')
        }),
    )
