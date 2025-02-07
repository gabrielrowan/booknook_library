from django.core.management.base import BaseCommand
from library.models import Book, Author, Genre, SubGenre, Series

class Command(BaseCommand): 
    help = 'Adds more books to the books list'

    # Helper Methods
    def get_author(self, full_name):
        first_name, last_name = full_name.split(' ', 1)
        return Author.objects.get(first_name=first_name, last_name=last_name)

    def create_series(self, series_data, author):
        series, created = Series.objects.get_or_create(
            name=series_data['name'],
            defaults={'total_books': series_data['total_books'], 'author': author}
        )
        return series

    def handle(self, *args, **options):
            
            fantasy = Genre.objects.get(name='Fantasy')
            mythology = SubGenre.objects.get(name='Mythology')
            space = SubGenre.objects.get(name='Space')

            # Author and Book Data
            authors_data = {
            'Stephen Fry': {
                'subgenre': mythology,
                'series': {'name': "Stephen Fry's Great Mythology", 'total_books': 4},
                'books': [
                    {'title': 'Mythos', 'publication_date': '2017-11-02', 'num_in_series': 1, 'description': 'A modern retelling of Greek myths.'},
                    {'title': 'Heroes', 'publication_date': '2018-11-01', 'num_in_series': 2, 'description': 'The adventures of Greek heroes.'},
                    {'title': 'Troy', 'publication_date': '2020-10-29', 'num_in_series': 3, 'description': 'The epic tale of the Trojan War.'},
                    {'title': 'Odyssey', 'publication_date': '2024-09-26', 'num_in_series': 4, 'description': 'Odysseus’ journey home from Troy.'},
                ]
            },
            'Douglas Adams': {
                'subgenre': space,
                'series': {'name': "The Hitchhiker's Guide to the Galaxy", 'total_books': 4},
                'books': [
                    {'title': "The Hitchhiker's Guide to the Galaxy", 'publication_date': '1979-10-12', 'num_in_series': 1, 'description': 'A comedic sci-fi adventure through space.'},
                    {'title': "The Restaurant at the End of the Universe", 'publication_date': '1980-10-12', 'num_in_series': 2, 'description': 'The crew’s dining adventures across time and space.'},
                    {'title': "Life, the Universe and Everything", 'publication_date': '1982-10-12', 'num_in_series': 3, 'description': 'More intergalactic absurdities with Arthur Dent.'},
                    {'title': "So Long, and Thanks for All the Fish", 'publication_date': '1984-10-12', 'num_in_series': 4, 'description': 'Arthur returns to Earth for a romantic twist.'},
                ]
            },
            'Madeline Miller': {
                'subgenre': mythology,
                'series': None,
                'books': [
                    {'title': 'The Song of Achilles', 'publication_date': '2011-09-20', 'description': 'A retelling of the Iliad from Patroclus’ perspective.'},
                    {'title': 'Circe', 'publication_date': '2018-04-10', 'description': 'The story of the witch Circe, daughter of Helios.'},
                ]
            },
            'Tamsyn Muir': {
                'subgenre': space,
                'series': {'name': "The Locked Tomb", 'total_books': 3},
                'books': [
                    {'title': 'Gideon the Ninth', 'publication_date': '2019-09-10', 'num_in_series': 1, 'description': 'Lesbian necromancers explore a haunted gothic palace in space.'},
                    {'title': 'Harrow the Ninth', 'publication_date': '2020-08-04', 'num_in_series': 2, 'description': 'The story continues with unreliable narrators and cosmic horror.'},
                    {'title': 'Nona the Ninth', 'publication_date': '2022-09-13', 'num_in_series': 3, 'description': 'A mysterious girl with a strange past holds the key to the universe.'},
                ]
            }
            }

            # Processing Authors and Books
            for author_name, data in authors_data.items():
                author = self.get_author(author_name)
                subgenre = data['subgenre']
                series = self.create_series(data['series'], author) if data['series'] else None

            for book_data in data['books']:
                book, created = Book.objects.get_or_create(
                    title=book_data['title'],
                    publication_date=book_data.get('publication_date'),
                    author=author,
                    series=series,
                    num_in_series=book_data.get('num_in_series'),
                    description=book_data['description']
                )
                book.genre.add(fantasy)
                book.subgenre.add(subgenre)


