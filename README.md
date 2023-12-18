# Marvel Comics Library
<img width="1678" alt="Screenshot 2023-12-17 at 22 32 16" src="https://github.com/migalvalm/marvel-library/assets/59445459/9ce72107-b3be-4b58-bac3-4d66850caae0">

This project is a Rails application that showcases comic covers from the Marvel API. It uses Turbo, Stimulus, and Tailwind to create a modern, reactive web application. The WillPaginate gem is used to handle pagination.

## Getting Started

### Prerequisites

- Ruby 3.2.2 or later
- Rails 7.1.2 or later

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/marvel-library.git
```

2. Navigate to the project directory:

```bash
cd marvel-library
```

3. Install the dependencies:

```bash
bundle install
```

4. Set up the database:

```bash
rails db:create
rails db:migrate
rails db:seed
```

5. Start the server:

```bash
rails server
```

Now, you can visit the application in your web browser at `http://localhost:3000`.

### Usage

The application displays a list of comic covers from the Marvel API. It uses Turbo to update the page asynchronously, Stimulus to add behavior to the HTML, and Tailwind to style the application. The WillPaginate gem is used to paginate the list of comic covers.

## Built With

- [Ruby on Rails](https://rubyonrails.org/)
- [Turbo](https://turbo.hotwired.dev/)
- [Stimulus](https://stimulus.hotwired.dev/)
- [Tailwind CSS](https://tailwindcss.com/)
- [WillPaginate](https://github.com/mislav/will_paginate)
