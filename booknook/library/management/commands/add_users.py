from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
import pandas as pd
import string
import secrets

def generate_password(length=12):
    characters = string.ascii_letters + string.digits
    return ''.join(secrets.choice(characters) for _ in range(length))


class Command(BaseCommand): 
    def handle(self, *args, **options):
        users = pd.read_json(r"C:\Users\gabriel\OneDrive\Programming\Booknook git\booknook_library\booknook\library\management\commands\characters.json")

        for index, row in users.iterrows():
            username = row['Username']
            email = row['Email']

            if not User.objects.filter(username=username, email=email).exists():
                password = generate_password()
                user = User.objects.create_user(username=username, email=email, password=password)
                self.stdout.write(self.style.SUCCESS(f"Created user: {username}"))
            else:
                self.stdout.write(self.style.ERROR(f"User already exists: {username}"))