# Generated by Django 5.1.5 on 2025-01-21 17:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('library', '0003_book_num_pages'),
    ]

    operations = [
        migrations.CreateModel(
            name='subGenre',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.AddField(
            model_name='book',
            name='subgenre',
            field=models.ManyToManyField(blank=True, to='library.subgenre'),
        ),
    ]
