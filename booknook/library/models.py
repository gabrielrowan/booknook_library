from django.db import models
from django.urls import reverse


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
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name
    
class Series(models.Model):
    name = models.CharField(max_length=200, unique=True)  
     # Number of books in the series
    total_books = models.PositiveIntegerField(default=0) 
    author = models.ForeignKey('Author', on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = 'series'
    
class SubGenre(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = 'subgenres'