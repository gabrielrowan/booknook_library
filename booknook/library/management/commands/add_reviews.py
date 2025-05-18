from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from library.models import Review, Book
import pandas as pd


class Command(BaseCommand): 
    def handle(self, *args, **options):
        csv_path = r'C:\Users\gabriel\OneDrive\Programming\Booknook git\booknook_library\booknook\library\management\commands\character_reviews.csv'
        reviews = pd.read_csv(csv_path, encoding='utf-8-sig')

        for index, data_row in reviews.iterrows():
            username = data_row['username']
            email = data_row['emailaddress']
            book_title = data_row['book']

            try:
                book = Book.objects.get(title=book_title)
            except Book.DoesNotExist:
                self.stdout.write(self.style.ERROR(f"Book'{book_title}' not found"))
                continue

            review = data_row['review']
            rating = data_row['rating']

            user = User.objects.get(username = username, email = email)
            # if user exists in the database
            if user:
                # check if there this book already has a review by this person
                if not Review.objects.filter(book = book, user = user):
                    data_row = Review(book = book, user = user, review_text = review, rating = rating)
                    data_row.save()
                    self.stdout.write(self.style.SUCCESS(f"Review for {book.title} by {username} saved succesfully"))

                else: 
                    self.stdout.write(self.style.ERROR(f"User {username} has already left a review for {book.title}"))
            else: 
                self.stdout.write(self.style.ERROR(f"User {username} doesn't exist!"))





