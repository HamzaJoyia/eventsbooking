# README
This is a simple Ruby on Rails event booking system that handles all booking processes efficiently.

For concurrency, I’ve implemented an event lock to prevent double-booking and ensure smooth ticket reservations. For scalability, the system is designed to handle increased traffic, with optimized database queries and 

Authentication is managed with Devise, offering secure user registration and login. Caching is used to improve performance, reducing database load for frequently accessed data.

Key gems used include Devise for authentication, Sidekiq for background jobs, and Pundit for authorization.

This system is built to be scalable, efficient, and easy to maintai
