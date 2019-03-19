# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require_relative '../app/models/book.rb'
require_relative '../app/models/review.rb'
require_relative '../app/models/author.rb'
require_relative '../app/models/user.rb'

Book.destroy_all
Review.destroy_all
Author.destroy_all
User.destroy_all

book_1 = Book.create(title: "Harry Potter and the Prisoner of Azkaban", pages: 435, year_pub: 1999, image: "https://upload.wikimedia.org/wikipedia/en/a/a0/Harry_Potter_and_the_Prisoner_of_Azkaban.jpg", publisher: "Bloomsbury", created_at: 5.days.ago, updated_at: 2.days.ago)
book_2 = Book.create(title: "Harry Potter and the Half-Blood Prince", pages: 652, year_pub: 2005, image: "https://upload.wikimedia.org/wikipedia/en/f/f0/Harry_Potter_and_the_Half-Blood_Prince.jpg", publisher: "Bloomsbury", created_at: 5.days.ago, updated_at: 2.days.ago)
book_3 = Book.create(title: "The Princess Bride", pages: 493, year_pub: 1973, image: "https://upload.wikimedia.org/wikipedia/en/c/cf/The_Princess_Bride_%28First_Edition%29.jpg", publisher: "Harcourt Brace Jovanovich", created_at: 4.days.ago, updated_at: 2.days.ago)
book_4 = Book.create(title: "The Shining", pages: 447, year_pub: 1977, image: "https://upload.wikimedia.org/wikipedia/en/4/4c/Shiningnovel.jpg", publisher: "Doubleday", created_at: 3.days.ago, updated_at: 12.days.ago)
book_5 = Book.create(title: "Ruby on Rails", pages: 447, year_pub: 2005, image: "https://i.ebayimg.com/images/g/x1oAAOSwL~FbdPNO/s-l1600.jpg", publisher: "Random House", created_at: 2.days.ago, updated_at: 22.days.ago)
book_6 = Book.create(title: "Harry Potter and the Order of the Phoenix", pages: 870, year_pub: 2003, image: "https://upload.wikimedia.org/wikipedia/en/7/70/Harry_Potter_and_the_Order_of_the_Phoenix.jpg", publisher: "Bloomsbury", created_at: 5.days.ago, updated_at: 2.days.ago)
book_7 = Book.create(title: "The Casual Vacancy", pages: 503, year_pub: 2012, image: "https://upload.wikimedia.org/wikipedia/en/9/91/The_Casual_Vacancy.jpg", publisher: "Little, Brown and Company", created_at: 5.days.ago, updated_at: 2.days.ago)
book_8 = Book.create(title: "In Search of Lost Time", pages: 4215, year_pub: 1927, image: "https://upload.wikimedia.org/wikipedia/commons/5/57/MS_A_la_recherche_du_temps_perdu.jpg", publisher: "Grasset and Gallimard", created_at: 4.days.ago, updated_at: 2.days.ago)
book_9 = Book.create(title: "Don Quixote", pages: 928, year_pub: 1620, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/El_ingenioso_hidalgo_don_Quijote_de_la_Mancha.jpg/500px-El_ingenioso_hidalgo_don_Quijote_de_la_Mancha.jpg", publisher: "Penguin Classics", created_at: 3.days.ago, updated_at: 2.days.ago)
book_10 = Book.create(title: "The Great Gatsby", pages: 180, year_pub: 1925, image: "https://upload.wikimedia.org/wikipedia/en/f/f7/TheGreatGatsby_1925jacket.jpeg", publisher: "Charles Scribner's Sons", created_at: 2.years.ago, updated_at: 2.days.ago)
book_11 = Book.create(title: "Slaughterhouse-Five", pages: 288, year_pub: 1969, image: "https://prodimage.images-bn.com/pimages/9780385333849_p0_v1_s550x406.jpg", publisher: "Delacorte", created_at: 5.days.ago, updated_at: 2.days.ago)
book_12 = Book.create(title: "Nudge", pages: 312, year_pub: 2009, image: "https://books.google.com/books/content/images/frontcover/bt6sPxiYdfkC?fife=w400-h600", publisher: "Penguin", created_at: 5.days.ago, updated_at: 2.days.ago)
book_13 = Book.create(title: "The World According to Star Wars", pages: 245, year_pub: 2016, image: "https://books.google.com/books/content/images/frontcover/a_7_CgAAQBAJ?fife=w400-h600", publisher: "HarperCollins", created_at: 4.days.ago, updated_at: 2.days.ago)
book_14 = Book.create(title: "Good Omens", pages: 288, year_pub: 1990, image: "https://images-na.ssl-images-amazon.com/images/I/51NtyVHtAmL._SX307_BO1,204,203,200_.jpg", publisher: "Workman", created_at: 3.years.ago, updated_at: 2.days.ago)
book_15 = Book.create(title: "American Gods", pages: 736, year_pub: 2001, image: "https://upload.wikimedia.org/wikipedia/en/4/49/American_gods.jpg", publisher: "Headline Publishing Group", created_at: 2.months.ago, updated_at: 2.days.ago)

Author.create(books: [book_1, book_2, book_6, book_7], name: "JK Rowling", age: 53, hometown: "Yate", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/J._K._Rowling_2010.jpg/220px-J._K._Rowling_2010.jpg")
Author.create(books: [book_3], name: "William Goldman", age: 87, hometown: "Manhattan, New York", image: "https://upload.wikimedia.org/wikipedia/commons/c/c4/William_Goldman.jpg")
Author.create(books: [book_4], name: "Stephen King", age: 71, hometown: "Portland, Maine", image: "https://upload.wikimedia.org/wikipedia/commons/e/e3/Stephen_King%2C_Comicon.jpg")
Author.create(books: [book_5], name: "Some nerd", age: 26, hometown: "lameville", image: "https://savageminds.org/wp-content/image-upload/600full-revenge-of-the-nerds-screenshot.jpg")
Author.create(books: [book_8], name: "Marcel Proust", age: 51, hometown: "Auteuil, France", image: "https://upload.wikimedia.org/wikipedia/commons/a/a5/Marcel_Proust_1900-2.jpg")
Author.create(books: [book_9], name: "Miguel de Cervantes Saavedra", age: 68, hometown: "Alcalá de Henares, Spain", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Cervantes_J%C3%A1uregui.jpg/1024px-Cervantes_J%C3%A1uregui.jpg")
Author.create(books: [book_10], name: "F. Scott Fitzgerald", age: 44, hometown: "St. Paul, Minnesota", image: "https://upload.wikimedia.org/wikipedia/commons/5/5c/F_Scott_Fitzgerald_1921.jpg")
Author.create(books: [book_11], name: "Kurt Vonnegut", age: 84, hometown: "Indianapolis, Indiana", image: "https://upload.wikimedia.org/wikipedia/commons/5/5e/Kurt_Vonnegut_1972.jpg")
Author.create(books: [book_12, book_13], name: "Cass R. Sunstein", age: 64, hometown: "Concord, Massachusetts", image: "https://upload.wikimedia.org/wikipedia/commons/0/0f/Cass_Sunstein_%282008%29.jpg")
Author.create(books: [book_12], name: "Richard H. Thaler", age: 73, hometown: "East Orange, NJ", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Richard_Thaler_Chatham.jpg/1024px-Richard_Thaler_Chatham.jpg")
Author.create(books: [book_14, book_15], name: "Neil Gaiman", age: 58, hometown: "Portchester, Hampshire, England", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Kyle-cassidy-neil-gaiman-April-2013.jpg/1024px-Kyle-cassidy-neil-gaiman-April-2013.jpg")
Author.create(books: [book_14], name: "Terry Pratchett", age: 66, hometown: "Beaconsfield, Buckinghamshire, England", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/10.12.12TerryPratchettByLuigiNovi1.jpg/1024px-10.12.12TerryPratchettByLuigiNovi1.jpg")

review_1 = book_1.reviews.create(title: "Good book", score: 4, review_text: "My third favorite", created_at: 1.year.ago)
review_2 = book_1.reviews.create(title: "Magic Rocks", score: 5, review_text: "I wish I was a wizard", created_at: 2.months.ago)
review_3 = book_1.reviews.create(title: "Team Hermoine", score: 4, review_text: "Screw you Ron", created_at: 2.months.ago)
review_4 = book_2.reviews.create(title: "So-so", score: 3, review_text: "Predictable", created_at: 3.months.ago)
review_5 = book_3.reviews.create(title: "Meh", score: 4, review_text: "Good, but why read when you can watch the movie", created_at: 2.days.ago)
review_6 = book_4.reviews.create(title: "Exciting", score: 4, review_text: "Another great by the King", created_at: 3.months.ago)
review_7 = book_4.reviews.create(title: "Too scary", score: 1, review_text: "Some say I'm a coward, but it's just not for me.", created_at: 2.months.ago)
review_8 = book_5.reviews.create(title: "As Expected", score: 5, review_text: "Love Ruby", created_at: 2.days.ago)
review_9 = book_5.reviews.create(title: "Boring", score: 1, review_text: "C++ is better", created_at: 3.days.ago)
review_10 = book_6.reviews.create(title: "Team Voldemort", score: 1, review_text: "The bad guys won", created_at: 2.years.ago)
review_11 = book_7.reviews.create(title: "What the?", score: 1, review_text: "The was little to no magic.", created_at: 2.months.ago)
review_12 = book_9.reviews.create(title: "Umm...", score: 3, review_text: "Think I read this for class once. There's a horse maybe?", created_at: 2.months.ago)
review_13 = book_10.reviews.create(title: "Green light", score: 4, review_text: "Wait, no, I just watched the movie.", created_at: 2.months.ago)
review_14 = book_11.reviews.create(title: "My fave", score: 5, review_text: "It's good", created_at: 2.months.ago)
review_15 = book_11.reviews.create(title: "Just read it again", score: 5, review_text: "Good dark humor for a nihilist", created_at: 10.months.ago)
review_16 = book_13.reviews.create(title: "Lame", score: 2, review_text: "No mention of Chewie at all", created_at: 2.years.ago)
review_17 = book_14.reviews.create(title: "Whoops", score: 1, review_text: "Thought it was gonna be a self-help book. Couldv'e used the help.", created_at: 1.months.ago)
review_18 = book_14.reviews.create(title: "Stay away", score: 1, review_text: "Dry AF", created_at: 8.months.ago)
review_19 = book_14.reviews.create(title: "Don't get it...", score: 5, review_text: "but good?", created_at: 5.months.ago)

User.create(reviews: [review_1, review_4, review_8, review_12, review_16, review_18], name: "April", age: 35, location: "Paris")
User.create(reviews: [review_2, review_7, review_13], name: "Peter", age: 30, location: "Pit of Despair")
User.create(reviews: [review_3, review_5, review_10, review_17], name: "Julia", age: 28, location: "Spain")
User.create(reviews: [review_6], name: "Earl", age: 40, location: "here")
User.create(reviews: [review_9, review_15, review_19], name: "Kirsten", age: 26, location: "Bed")
User.create(reviews: [review_11, review_14], name: "Scott", age: 29, location: "Brother's")
