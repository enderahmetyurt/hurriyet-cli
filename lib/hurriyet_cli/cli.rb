require "rubygems"
require 'thor'
require "thor/runner"

module HurriyetCli
  class HammerOfTheGods < Thor
    desc "articles", "Fetch all articles"

    def articles
      puts "Fetching all articles"
      HurriyetCli::Articles.fetch
    end

    desc "columns", "Fetch all columns"

    def columns
      puts "Fetching all columns"
      HurriyetCli::Columns.fetch
    end
  end
end

$thor_runner = false
# Thor::Runner.start