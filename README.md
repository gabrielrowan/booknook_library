# Booknook

Live link to project: [https://gabrielrowan.pythonanywhere.com/](https://gabrielrowan.pythonanywhere.com/)

## Contents
- What does this project do?
- What technologies does it use?
- Data models & relationships
- Front End
- Future Steps

### What doees this project do?

Booknook shows the relationships between books, authors and books in a series. It shows books which are part of the same series and provides the ability to search by book or author.

![search](https://github.com/user-attachments/assets/80b71ed6-2c07-4b92-82f1-379521c7832e)

The name 'booknook' comes from the idea of having a corner ('nook') of the internet focused on books relating to books (in particular, fantasy fiction).

![odyssey](https://github.com/user-attachments/assets/70f3a454-4154-4103-9801-e6019a5d3c08)

### What technologies does it use?

Booknook uses Django, Bootstrap, some custom CSS and SQLLite. 

### Data models & relationships

Booknook has models relating to:
- Book
- Author
- Genre
- Subgenre
- Series

Through foreign keys and many-to-many relationships, it is able to reflect the relationships between books and their authors, books that are part of a series
and the (possibly many) genres and subgenres associated with a single book.

### Front End 

Booknook uses bootstrap with some custom CSS for its front end. It is designed to be fully responsive for mobile, ipad and desktop screen sizes.

![booknook-mobile](https://github.com/user-attachments/assets/2a30abc9-0a02-4e9d-8242-b129b16a560c)

### Future steps
Listing authors and books is the first stage of this application. The second stage is to create the ability for a user to log into the app. 
Next, I would like to turn this into a library application, so that a user can take out a book/ multiple books on loan, see their return data and receive a message if a book is overdue.
