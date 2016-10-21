module HurriyetCli
  class Articles
    def self.fetch
      client = Hurriyet::Client.new(ENV["API_KEY"])
      articles = client.articles.all
      formated_parse(articles)
    end

    def self.top_articles(top)
      client = Hurriyet::Client.new(ENV["API_KEY"])
      articles = client.articles.all top: top
      formated_parse(articles)
    end

    private
    def self.formated_parse(articles)
      articles.each do |a|
        created_at = Time.parse(a["CreatedDate"]).strftime("%d/%m/%y|%H:%M")
        puts "#{created_at} - #{Rainbow(a["Title"]).red} - #{Rainbow(a["Url"]).cyan}"
      end
    end
  end
end