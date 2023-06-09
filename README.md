# LotrSdk Gem

The LotrSdk Gem is a Ruby gem that provides a convenient way to interact with "The One to API," which offers various datasets related to "The Lord of the Rings" books by J. R. R. Tolkien and the official movie adaptations by Peter Jackson. This gem leverages the power of ActiveResource to consume endpoints related to movies and quotes, making it easy to retrieve and work with the data provided by the API.

## Features

The LotrSdk Gem offers the following features:

- Retrieve information about "The Lord of the Rings" movies, including details such as title, runtine, budget, revenue, among other info.
- Fetch memorable quotes from the movies to enhance your applications or projects.
- Access other datasets provided by "The One to API" by utilizing the ActiveResource framework.

## Installation

To install the gem, simply add it to your Gemfile:

```ruby
gem 'lotr_sdk'
```

Then, run the following command:

```shell
bundle install
```

Alternatively, you can install it directly using:

```shell
gem install lotr_sdk
```

## Usage

### API Access

To access the datasets provided by "The One to API," you will need to sign up and obtain an access key. Visit the API documentation to sign up and get your access key.

### Configuration

Before using the gem, you need to configure it with your access key. You can do this by adding the following env variable to your environment: `LOTR_API_KEY`

The gem is setup to use `dotenv-rails` so you could achieve the same result by adding the following line to your `.env` file:

```bash
LOTR_API_KEY=YOUR_ACCESS_KEY
```

Replace `'YOUR_ACCESS_KEY'` with the access key you obtained from the API.

### Retrieving Movie Details

To retrieve information about "The Lord of the Rings" movies, you can use the `Movie` class provided by the gem. Here's an example of how to fetch movie details:

```ruby
# Retrieve all movies
movies = LotrSdk::Movie.all

# Iterate over the movies and print their titles
movies.each do |movie|
  puts movie.name
end

# Retrieve a specific movie by ID
movie = LotrSdk::Movie.find(1)
puts movie.name
puts movie.runtimeInMinutes
puts movie.budgetInMillions
puts movie.boxOfficeRevenueInMillions
```

### Fetching Quotes

To fetch memorable quotes from "The Lord of the Rings" movies, you can use the `Quote` class provided by the gem. Here's an example of how to retrieve quotes:

```ruby
# Retrieve all quotes
quotes = LotrSdk::Quote.all

# Iterate over the quotes and print them
quotes.each do |quote|
  puts quote.dialog
end

# Retrieve a quote
quote = LotrSdk::Quote.first
puts quote.dialog
puts quote.character
puts quote.movie.name
```

## Accessibility of Movie Quotes and Quotes Movie

The LotrSdk Gem provides associations between the `Movie` and `Quote` classes, allowing easy access to related data. Here's how you can access movie quotes and the movie associated with a quote:

### Movie Quotes

Each `Movie` instance has a `quotes` method that retrieves all the quotes associated with that movie. Here's an example:

```ruby
# Retrieve a specific movie by ID
movie = LotrSdk::Movie.find(1)

# Retrieve all quotes for the movie
quotes = movie.quotes

# Iterate over the quotes and print their content
quotes.each do |quote|
  puts quote.dialog
end
```

By calling the `quotes` method on a movie instance, you can retrieve all the quotes associated with that movie.

### Quote's Movie

Each `Quote` instance has a `movie` method that retrieves the movie associated with that quote. Here's an example:

```ruby
# Retrieve a specific quote by ID
quote = LotrSdk::Quote.find(1)

# Retrieve the movie associated with the quote
movie = quote.movie

# Print the title of the movie
puts movie.name
```

By calling the `movie` method on a quote instance, you can retrieve the movie associated with that quote. This allows you to access details of the movie.

These associations provide a convenient way to navigate between movies and quotes, making it easier to retrieve and work with related data.

Please refer to the gem's documentation or explore the available methods and attributes of the `Movie` and `Quote` classes for more information on accessing related data.

### Accessing Other Datasets

You can expand this gem and access other datasets provided by "The One to API" using the gem's ActiveResource integration. Refer to the API documentation to discover available endpoints.

## Acknowledgements

This gem is built using the power of ActiveResource and relies on the data provided by "The One to API."

For more information about "The One to API," please visit their official website or documentation.
