require "rubygems"
require 'thor'
require "thor/runner"

module HurriyetCli
  class HammerOfTheGods < Thor
    desc "articles", "Fetch all articles"
    method_option :top, desc: "Fetch N articles"
    def articles
      client = Hurriyet::Client.new(ENV['API_KEY'])
      articles = HurriyetCli::Articles.new(client)
      if options[:top]
        puts "Fetching #{options[:top]} articles"
        articles.top_articles(options[:top])
      else
        puts "Fetching all articles"
        articles.fetch
      end
    end

    desc "columns", "Fetch all columns"
    method_option :top, alias: :t, desc: "Fetch N columns"
    def columns
      client = Hurriyet::Client.new(ENV['API_KEY'])
      columns = HurriyetCli::Columns.new(client)
      if options[:top]
        puts "Fetching #{options[:top]} columns"
        columns.top_columns(options[:top])
      else
        puts "Fetching all columns"
        columns.fetch
      end
    end

    desc "pages", "Fetch all pages"
    method_option :top, alias: :t, desc: "Fetch N pages"
    def pages
      client = Hurriyet::Client.new(ENV['API_KEY'])
      pages = HurriyetCli::Pages.new(client)
      if options[:top]
        puts "Fetching #{options[:top]} pages"
        pages.top_pages(options[:top])
      else
        puts "Fetching all pages"
        pages.fetch
      end
    end

    desc "writers", "Fetch all writers"
    method_option :top, alias: :t, desc: "Fetch N writers"
    def writers
      if options[:top]
        puts "Fetching #{options[:top]} writers"
        HurriyetCli::Writers.top_writers(options[:top])
      else
        puts "Fetching all writers"
        HurriyetCli::Writers.fetch
      end
    end
  end
end

$thor_runner = false
# Thor::Runner.start