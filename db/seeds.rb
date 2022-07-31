# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.create([
    { role_name: 'Librarian' },
    { role_name: 'Student' }
])

Genre.create([
    { genre_name: 'Fantasy' },
    { genre_name: 'Adventure' },
    { genre_name: 'Romance' },
    { genre_name: 'Contemporary' },
    { genre_name: 'Dystopian' },
    { genre_name: 'Mystery' },
    { genre_name: 'Horror' },
    { genre_name: 'Thriller' },
    { genre_name: 'Paranormal' },
    { genre_name: 'Historical fiction' },
    { genre_name: 'Science Fiction' },
    { genre_name: 'Children’s' },
    { genre_name: 'Memoir' },
    { genre_name: 'Cooking' },
    { genre_name: 'Art' },
    { genre_name: 'Self-help / Personal' },
    { genre_name: 'Development' },
    { genre_name: 'Motivational' },
    { genre_name: 'Health' },
    { genre_name: 'History' },
    { genre_name: 'Travel' },
    { genre_name: 'Guide / How-to' },
    { genre_name: 'Families & Relationships' },
    { genre_name: 'Humor' }
])

Book.create([
    {
        title: 'Dune',
        author: 'Frank Herbert',
        published_year: 2011,
        copies: 5,
        genre_id: 1
    },
    {
        title: '1984',
        author: 'George Orwell',
        published_year: 2008,
        copies: 3,
        genre_id: 11
    },
    {
        title: 'Atomic Habits',
        author: 'James Clear',
        published_year: 2018,
        copies: 2,
        genre_id: 16
    },
    {
        title: 'The Boy, The Mole, The Fox and The Horse',
        author: 'Charlie Mackesy',
        published_year: 2019,
        copies: 1,
        genre_id: 16
    },
    {
        title: 'Clean Code',
        author: 'Robert Martin',
        published_year: 2009,
        copies: 5,
        genre_id: 17
    },
    {
        title: 'Best Places to Eat in Every Country',
        author: 'Food',
        published_year: 2021,
        copies: 6,
        genre_id: 21
    }
])

User.create!([
    {
        first_name: 'Fernando',
        last_name: 'González',
        email: 'fGonzalez@uadmin.com',
        password: '1234pass',
        password_confirmation: '1234pass',
        role_id: 1
    },
    {
        first_name: 'José',
        last_name: 'Castillo',
        email: 'jCastillo@ustudent.com',
        password: 'elchepe',
        password_confirmation: 'elchepe',
        role_id: 2
    }
])