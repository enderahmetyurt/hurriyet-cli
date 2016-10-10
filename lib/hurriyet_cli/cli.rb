require "rubygems"
require 'thor'
require "thor/runner"

module HurriyetCli
  class HammerOfTheGods < Thor
    desc "articles", "Fetch all articles"

    def articles
      puts "Fetching all articles"
      client = Hurriyet::Client.new(ENV["API_KEY"])
      articles = client.articles.all
      articles.each do |a|
        created_at = Time.parse(a["CreatedDate"]).strftime("%d/%m/%y|%H:%M")
        puts "#{created_at} - #{Rainbow(a["Title"]).red} - #{Rainbow(a["Url"]).cyan}"
      end
    end
  end
end

$thor_runner = false
# Thor::Runner.start