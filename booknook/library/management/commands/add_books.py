from django.core.management.base import BaseCommand
from library.models import Book, Author, Genre, SubGenre, Series

class Command(BaseCommand): 
    help = 'Adds more books to the books list'

    def handle(self, *args, **options):
                # Add Stephen Fry Books
                fantasy = Genre.objects.get(name = 'Fantasy')

                def get_author(author_name):
                     return Author.objects.get(first_name=author_name)
                
                def get_subgenre(subgenre_name):
                    return SubGenre.objects.get(name = subgenre_name)
                
                def create_series(series_name, total_books, author_fk):
                    return Series.objects.get_or_create(name = "Stephen Fry's Great Mythology", total_books = total_books, author = author_fk)[0]


                author = get_author('Stephen')
                subgenre = get_subgenre('Mythology')
                series = create_series("Stephen Fry's Great Mythology", 4, author)[0]

                book1 = Book.objects.get_or_create(title='Mythos',
                                           publication_date = '2017-11-02',
                                           author = author,
                                           series = series,
                                           num_in_series = 1,
                                           description = 'Mythos is a modern collection of Greek myths, stylishly retold by legendary writer, actor, and comedian Stephen Fry. Fry transforms the adventures of Zeus and the Olympians into emotionally resonant and deeply funny stories, without losing any of their original wonder.')
                book2 = Book.objects.get_or_create(title='Heroes',
                                           publication_date = '2018-11-01',
                                           author = author,
                                           series = series,
                                           num_in_series = 2,
                                           description = 'There are Heroes - and then there are Greek Heroes. Few mere mortals have ever embarked on such bold and heart-stirring adventures, overcome myriad monstrous perils, or outwitted scheming vengeful gods, quite as stylishly and triumphantly as Greek heroes.' )
                book4 = Book.objects.get_or_create(title='Odyssey',
                                           publication_date = '2024-09-26',
                                           author = author,
                                           series = series,
                                           num_in_series = 4,
                                           description = 'Follow Odysseus after he leaves the fallen city of Troy and takes ten long dramatic years—battling monsters, the temptations of goddesses and suffering the curse of Poseidon—to voyage home to his wife Penelope on the island of Ithaca.')
                book3 = Book.objects.get_or_create(title='Troy',
                                            publication_date = '2020-10-29',
                                            author = author,
                                            series = series,
                                            num_in_series = 3,
                                            description = 'The story of Troy speaks to all of us - the kidnapping of Helen, a queen celebrated for her beauty, sees the Greeks launch a thousand ships against the city of Troy, to which they will lay siege for ten whole years. It is a terrible war with casualties on all sides as well as strained relations between allies, whose consequences become tragedies.')
                
                all_books_by_author = Book.objects.filter(author__first_name__icontains='Stephen')
                for book in all_books_by_author:
                        book.genre.add(fantasy) 
                        book.subgenre.add(subgenre)