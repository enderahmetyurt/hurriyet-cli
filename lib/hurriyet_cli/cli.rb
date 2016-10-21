require "rubygems"
require 'thor'
require "thor/runner"

module HurriyetCli
  class HammerOfTheGods < Thor
    desc "articles", "Fetch all articles"
    method_option :top, alias: :t, desc: "Fetch N articles"
    def articles
      if options[:top]
        puts "Fetching #{options[:top]} articles"
        HurriyetCli::Articles.top_articles(options[:top])
      else
        puts "Fetching all articles"
        HurriyetCli::Articles.fetch
      end
    end

    desc "columns", "Fetch all columns"
    def columns
      puts "Fetching all columns"
      HurriyetCli::Columns.fetch
    end

    desc "pages", "Get all pages"
    def pages
      puts "Fetching all pages"
      HurriyetCli::Pages.fetch
    end

    desc "writers", "Get all writers"
    def writers
      puts "Fetching all writers"
      HurriyetCli::Writers.fetch
    end
  end
end

$thor_runner = false
# Thor::Runner.start