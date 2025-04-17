# Booknook

Live link to project: [https://gabrielrowan.pythonanywhere.com/](https://gabrielrowan.pythonanywhere.com/)

# Summary

Booknook is a **Django** library web app focused on fantasy books

## Project features
- Users can borrow, renew and return fantasy books
- Search bar to find books by book title or author
- Full user authentication journey (sign up, login, log out, password reset)
- Fully responsive **Bootstrap** frontend
- Author bio pages with links to books and series by the same author


# Demo

![Booknook video-VEED](https://github.com/user-attachments/assets/01399a1f-3e38-4857-aab6-4c412ae1cedc)

### What doees this project do?

Booknook shows the relationships between books, authors and books in a series. It shows books which are part of the same series and provides the ability to search by book or author.

![search](https://github.com/user-attachments/assets/80b71ed6-2c07-4b92-82f1-379521c7832e)

The name 'booknook' comes from the idea of having a corner ('nook') of the internet focused on books relating to books (in particular, fantasy fiction).

![odyssey](https://github.com/user-attachments/assets/70f3a454-4154-4103-9801-e6019a5d3c08)

### What technologies does it use?

Booknook uses Django, Bootstrap, custom CSS and SQLLite. 

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

### Future steps
Listing authors and books is the first stage of this application. 

The second stage is to create the ability for a user to log into the app. 
Next, I would like to turn this into a library application, so that a user can take out a book/ multiple books on loan, see their return data and receive a message if a book is overdue.
