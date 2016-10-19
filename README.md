# HurriyetCli

A Ruby CLI for Hurriyet Public API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hurriyet_cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hurriyet_cli

## Usage

Export your API_KEY that you get from https://developers.hurriyet.com.tr/

```bash
$ bundle exec bin/hurriyet_cli articles # Fetch all articles
$ bundle exec bin/hurriyet_cli columns  # Fetch all columns
$ bundle exec bin/hurriyet_cli pages    # Fetch all pages
$ bundle exec bin/hurriyet_cli writers  # Fetch all writers
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

