# HurriyetCli

A Ruby CLI for [Hurriyet Public API]( http://developers.hurriyet.com.tr/).

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

Export your ```HURRIYET_API_KEY``` that you get from [https://developers.hurriyet.com.tr](https://developers.hurriyet.com.tr)

```bash
$ export HURRIYET_API_KEY=<YOUR_HURRIYET_API_KEY>
```

```bash
$ hurriyet_cli articles # Fetch all articles
$ hurriyet_cli articles --top 5  # Fetch top 5 articles
```

## Thanks
* [Yiğit Özkavcı](https://github.com/yigitozkavci/) for Ruby Hurriyet API Wrapper.
* [Hamdi Akoğuz](https://github.com/Hamdiakoguz) for his advices.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

