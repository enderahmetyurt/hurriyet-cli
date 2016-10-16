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
  end
end

$thor_runner = false
# Thor::Runner.start