from django.core.management.base import BaseCommand
from library.models import Book, Author, Genre, SubGenre, Series
from django.db import IntegrityError

class Command(BaseCommand): 
    help = 'Adds more books to the books list'

    # Helper Methods
    def get_author(self, full_name):
        first_name, last_name = full_name.split(' ', 1)
        return Author.objects.get(first_name=first_name, last_name=last_name)


    def create_series(self, series_data, author):
        try:
            series, created = Series.objects.get_or_create(
                name=series_data['name'],
                defaults={
                    'total_books': series_data['total_books'],
                    'author': author
                }
            )
            if created:
                self.stdout.write(self.style.SUCCESS(f"Added new series: {series.name}"))
            return series
        except Exception as e:
            self.stderr.write(self.style.ERROR(f"Failed to add/get series '{series_data['name']}': {e}"))
            return None


    def handle(self, *args, **options):
            
            fantasy = Genre.objects.get(name='Fantasy')
            mythology = SubGenre.objects.get(name='Mythology')
            space = SubGenre.objects.get(name='Space')

            authors_data = {
                'Stephen Fry': {
                    'subgenre': mythology,
                    'series': {'name': "Stephen Fry's Great Mythology", 'total_books': 4},
                    'books': [
                        {'title': 'Mythos', 'publication_date': '2017-11-02'},
                        {'title': 'Heroes', 'publication_date': '2018-11-01'},
                        {'title': 'Troy', 'publication_date': '2020-10-29'},
                        {'title': 'Odyssey', 'publication_date': '2024-09-26'}
                    ]
                },
                'Douglas Adams': {
                    'subgenre': space,
                    'series': {'name': "The Hitchhiker's Guide to the Galaxy", 'total_books': 4},
                    'books': [
                        {'title': "The Hitchhiker's Guide to the Galaxy", 'publication_date': '1979-10-12'},
                        {'title': "The Restaurant at the End of the Universe", 'publication_date': '1980-10-12'},
                        {'title': "Life, the Universe and Everything", 'publication_date': '1982-10-12'},
                        {'title': "So Long, and Thanks for All the Fish", 'publication_date': '1984-10-12'}
                    ]
                },
                'Madeline Miller': {
                    'subgenre': mythology,
                    'series': None,
                    'books': [
                        {'title': 'Circe', 'publication_date': '2018-04-10'},
                        {'title': 'The Song of Achilles', 'publication_date': '2011-09-20'}
                    ]
                },
                'Tamsyn Muir': {
                    'subgenre': space,
                    'series': {'name': "The Locked Tomb", 'total_books': 3},
                    'books': [
                        {'title': 'Gideon the Ninth', 'publication_date': '2019-09-10'},
                        {'title': 'Harrow the Ninth', 'publication_date': '2020-08-04'},
                        {'title': 'Nona the Ninth', 'publication_date': '2022-09-13'}
                    ]
                }
            }

            for author_name, data in authors_data.items():
                try:
                    author, created = Author.objects.get_or_create(first_name=author_name.split()[0], last_name=author_name.split()[-1])
                    if created:
                        self.stdout.write(self.style.SUCCESS(f"Added new author: {author}"))
                    else:
                        self.stdout.write(f"Author already exists: {author}")
                except Exception as e:
                    self.stderr.write(self.style.ERROR(f"Failed to add/get author '{author_name}': {e}"))
                    continue

                series = self.create_series(data['series'], author) if data['series'] else None

                for book_data in data['books']:
                    try:
                        book, created = Book.objects.get_or_create(
                            title=book_data['title'],
                            publication_date=book_data['publication_date'],
                            author=author,
                            series=series,
                            num_in_series=book_data.get('num_in_series'),
                            description=book_data.get('description', '')
                        )

                        book.genre.add(fantasy)
                        book.subgenre.add(data['subgenre'])

                        if created:
                            self.stdout.write(self.style.SUCCESS(f"Added new book: {book.title}"))
                        else:
                            self.stdout.write(f"Book already exists: {book.title}")

                    except IntegrityError as e:
                        self.stderr.write(self.style.ERROR(f"IntegrityError adding book '{book_data['title']}': {e}"))
                    except Exception as e:
                        self.stderr.write(self.style.ERROR(f"Failed to add book '{book_data['title']}': {e}"))
