from django.db import models
from django.urls import reverse
from django.db.models import UniqueConstraint 
from django.db.models.functions import Lower
import uuid
from django.conf import settings
from datetime import date, timedelta



class Book(models.Model):
    title = models.CharField(max_length=200)
    publication_date = models.DateField(null=True, blank=True)
    author = models.ForeignKey('Author', on_delete=models.RESTRICT)
    # whether book is part of a series
    series = models.ForeignKey('Series', on_delete=models.SET_NULL, null=True, blank=True)
    # what number the book is in the series sequence
    num_in_series = models.PositiveIntegerField(null=True, blank=True)
    cover_image = models.ImageField(upload_to='books/', null=True, blank=True)
    description = models.TextField(blank=True)
    genre = models.ManyToManyField('Genre', blank=True)
    num_pages = models.PositiveIntegerField(null=True, blank=True)
    subgenre = models.ManyToManyField('Subgenre', blank=True)

    def get_absolute_url(self):
        return reverse('book-detail', args=[str(self.id)])


    def __str__(self):
        return self.title


class Author(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField(null=True, blank=True)
    bio = models.TextField(blank=True)
    photo = models.ImageField(upload_to='authors/', null=True, blank=True)

    def get_absolute_url(self):
        return reverse('author-detail', args=[str(self.id)])

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

class Genre(models.Model):
    name = models.CharField(max_length=100,  unique=True)

    def __str__(self):
        return self.name
    
    class Meta:
        constraints = [
            UniqueConstraint(
                Lower('name'),
                name='genre_name_case_insensitive_unique',
                violation_error_message = "Genre already exists"
            ),
        ]
    
class Series(models.Model):
    name = models.CharField(max_length=200)  
     # Number of books in the series
    total_books = models.PositiveIntegerField(default=0) 
    author = models.ForeignKey('Author', on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = 'series'
    
class SubGenre(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = 'subgenres'

        constraints = [
        UniqueConstraint(
            Lower('name'),
            name='subgenre_name_case_insensitive_unique',
            violation_error_message = "Subgenre already exists"
        ),
    ]
    
class BookInstance(models.Model):

    def get_due_date():
        return date.today() + timedelta(days=30)

    @property
    def is_overdue(self):
        # check if due back is empty/populated - if populated, compares with todays date
        return bool(self.due_back and date.today() > self.due_back)

    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    book = models.ForeignKey('Book', on_delete=models.RESTRICT, null=True)
    borrowed_date = models.DateField(null=True, blank=True)  
    due_back = models.DateField(null=True, blank=True)  
    borrower = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True)

    LOAN_STATUS = (
        ('o', 'On loan'),
        ('a', 'Available'),
    )

    status = models.CharField(
        max_length=1,
        choices=LOAN_STATUS,
        blank=True,
        default='a',
    )

    class Meta:
        ordering = ['due_back']

    def __str__(self):
        return f'{self.id} ({self.book.title})'
    
class Review(models.Model):
    book = models.ForeignKey('Book', on_delete=models.CASCADE, related_name='reviews')
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    review_text = models.TextField(blank=True)
    rating = models.PositiveSmallIntegerField(choices=[(i, i) for i in range(6)], null=True, blank=True)  
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    '''
    class Meta:
        unique_together = ('book', 'user')
    '''