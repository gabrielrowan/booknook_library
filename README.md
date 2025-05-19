# Booknook

Live link to project: [https://gabrielrowan.pythonanywhere.com/](https://gabrielrowan.pythonanywhere.com/)

## Summary

Booknook is a **Django** library web app focused on fantasy books. 
It uses the **OpenAI REST API** with a model from **Nebius** to generate the reviews and ratings based on 4 pre-defined user personalities.
For the front-end styling, the app uses Bootstrap with custom CSS and JavaScript for a responsive, dynamic front-end.


## Contents
- Demo
- Project features
- Ratings & Reviews
- What does borrowing look like? (with demo)
- Aesthetic book & author pages



## Project features
- Users can borrow, renew and return fantasy books
- Search bar to find books by book title or author
- Full user authentication journey (sign up, login, log out, password reset)
- Ability to filter by subgenre (aka Hobbits/ Witches/ Space/ Mythology and more)
- Ability to rate and review a book

## Ratings and Reviews

### Defining review personas 

I predefined 4 character personas as mock users of the web app who would write reviews

These characters were:
- Jayden Brooks - high school student with an excitable and casual writing style
- Monica Reyes - a screenwriter with a witty and journalistic review style
- Jack Webber - a mechanic with a direct writing style who enjoys reading in their down time
- Zoe Patel - a children's librarian with a lighthearted, whimsical writing style

### Defining classes

I used OOP to define 3 different classes for the reviews:
1) **LLMClient** - this class contains the config for making the API call, such as the api key and base url and the method for calling the API
2) **LLMPromptGenerator** - this class dynamically changes the values of the prompt depending on the character, book and author specified
3) **LLMResponseProcessor** - this class reads in the API response, separating the review text from the rating score so they can be stored separately


### Creating the prompt

Based on these characters (defined in a `.JSON` file), I used a prompt and the OpenAI REST API to generate a review and rating from every persona for each book in my web app. 

There are 2 parts to a prompt - the system prompt (provides the model with context) and the user prompt (direct instructions for what the model needs to do).

Here is an example of my system prompt:

```
# Context
        
You are a user of a library web application where users can borrow, renew and return fantasy 
themed books online. On this site, users can also rate and review books they have read. 
They can rate the book on a scale of 1-5, with 5 being the most positive rating, and can only give integers as ratings. 
        
# Role 

Your name is Jayden Brooks and you are 17 years old. 
You live in Texas, US. 
When you write reviews, your style of writing is excitable and casual.
You are a high school student who devours books during study hall. Your reviews are full of emojis, and exclamations.
You focus on character arcs and epic moments.
You always give rating scores between 4–5.
```

Then, I specified the instructions for the model to follow in my user prompt. Here is where I specified which book to review, how long the review should be and the rating range of the character:

```
# Instruction
Write a review of the book The Hobbit by J.R.R Tolkein in 30-50 words. 
Your review must correspond to a rating score within the rating range. 
For example, if the rating range is 3-5, you can choose whether to give a 3, 4 or 5 star review.
Every review should contain a numerical rating at the end.
After the review text, , output the exact tag `#RATING` followed by the rating score as a single integer (e.g. `#RATING 5`).

```

### Processing the review data

After the API call returned the data, I saved it to a `.csv` file. This involved making sure to store the numerical rating (ie 1-5) and the text part of the review in separate columns. 

### A custom command to save the reviews

Last, I created a custom Django command called 'add_reviews' which reads the reviews from the `.csv` file and saves them to the database, so that they show up on the website.

### The Results

#### Jayden Review

![Jayden Review - Hitch Hikers Guide to the Galaxy](https://github.com/user-attachments/assets/5a639e6a-11b7-450c-a4e3-5d62f0e4f6b1)

#### Zoe Review

![Zoe Review Circe](https://github.com/user-attachments/assets/27ab19bd-5cc7-4ff9-aa5c-fbcd3e9c03eb)

#### Jack Review

![Jack Review A Day of Fallen Night](https://github.com/user-attachments/assets/20c0b64b-6d3a-4410-9788-20aab340b9c8)

#### Monica Review

![Monica Review](https://github.com/user-attachments/assets/92760fe2-b19e-40de-a368-3f7c0c1f5f3a)

### Review Overview

It took 5 different iterations of changing the prompt to get a result I was happy with - on the whole, I found a simple prompt asking for a short review produced the best results. 
I think Monica and Zoe's voices could have been more distinctive (this is likely down to their character traits not being different enough) but I'm happy that I was able
to ensure that every book on the web app has a collection of reviews and ratings from different (AI) perspectives.


## What does borrowing look like?

### Demo


https://github.com/user-attachments/assets/71a47281-f8cd-4187-8db7-e941a34902b5


When a book has successfully been renewed:

![book_successfully_renewed](https://github.com/user-attachments/assets/f2bca456-2508-4ae2-a091-20c813cc477c)

Booknook comes with built-in library validation rules (what's a library without a few rules? :smiley:) such as only being able to renew books for up to 90 days after its initial borrow date.

![book_over_renew_limit](https://github.com/user-attachments/assets/9be71c36-96f2-4bed-b282-3a4c32ff1dfd)

## Aesthetic Book & Author Pages

Booknook provides aesthetic web pages where users can:
- See what number the book is in a series (for example, Cursebound is the 2nd book of The Faebound Trilogy)
- View a book's genre and any associated subgenres
- Read the book's blurb
- View its publication date and number of pages
- Virtually borrow the book!

![borrow-book-cursebound](https://github.com/user-attachments/assets/72b1484c-2801-4178-a641-fa5cc2d5b639)





