# About ror7-htmx-sample-app

I created this app to play with HTMX.

* Ruby version: `3.0.4`
* Rails version: `7.1.3`
* System dependencies
* Configuration: Using `tailwind`.

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Post install

```bash

########
# 2024-01-20
########
rails new "$1" -j esbuild --css tailwind  # as per DHH video https://www.youtube.com/watch?v=JsNtLiph87Y

bundle add 'htmx-rails'
# As per https://github.com/rootstrap/htmx-rails?tab=readme-ov-file
rails g htmx:install

# tail wind
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
# took me a while but now it works

# https://github.com/railsjazz/rails_live_reload
bundle add .. (--devlopment?!?)
# group :development do
#   gem "rails_live_reload"
# end
rails generate rails_live_reload:install

# Firs model
rails g scaffold post title body:text published:boolean
``
