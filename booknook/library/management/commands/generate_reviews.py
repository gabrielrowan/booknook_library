import os
import pandas as pd
import re
from .LLMClient import LLMClient
from .LLMPromptGenerator import LLMPromptGenerator
from .LLMResponseProcessor import LLMResponseProcessor
from openai import OpenAI
from library.models import Book
from django.core.management.base import BaseCommand


class Command(BaseCommand): 
    def handle(self, *args, **options):
        llm_client = LLMClient()
        llm_prompt_generator = LLMPromptGenerator()
        llm_response_processor = LLMResponseProcessor()
        all_books = Book.objects.select_related('author').all()
        book_author_dict = {
            book.title: f"{book.author.first_name} {book.author.last_name}"
            for book in all_books
        }

        character_data = pd.read_json(r'C:\Users\gabriel\OneDrive\Programming\Booknook git\booknook_library\booknook\library\management\commands\characters.json')
        rows = []
        for book_title, author_name in book_author_dict.items():
            for index, row in character_data.iterrows():
                systemPrompt, userPrompt = llm_prompt_generator.generate_prompt(row, book_title, author_name)
                response = llm_client.generate_response(systemPrompt, userPrompt)
                review, rating = llm_response_processor.extract_review_and_rating(response)
                if rating and review:
                    rows.append({
                        'name': row['Name'],
                        'username': row['Username'],
                        'emailaddress': row['Email'],
                        'book': book_title,
                        'review': review,
                        'rating': rating
                    })
        character_reviews = pd.DataFrame(rows, columns=['name', 'username', 'emailaddress', 'book', 'review', 'rating'])
        character_reviews.to_csv('character_reviews.csv', index=False)
         

    