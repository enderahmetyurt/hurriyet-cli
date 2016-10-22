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
    method_option :top, alias: :t, desc: "Fetch N columns"
    def columns
      if options[:top]
        puts "Fetching #{options[:top]} columns"
        HurriyetCli::Columns.top_columns(options[:top])
      else
        puts "Fetching all columns"
        HurriyetCli::Columns.fetch
      end
    end

    desc "pages", "Fetch all pages"
    method_option :top, alias: :t, desc: "Fetch N pages"
    def pages
      if options[:top]
        puts "Fetching #{options[:top]} pages"
        HurriyetCli::Pages.top_pages(options[:top])
      else
        puts "Fetching all pages"
        HurriyetCli::Pages.fetch
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