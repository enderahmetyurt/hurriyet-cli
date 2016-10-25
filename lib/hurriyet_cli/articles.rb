module HurriyetCli
  class Articles
    def initialize(client, display = STDOUT)
      @client = client
      @display = display
    end

    def fetch
      articles = @client.articles.all
      formated_parse(articles)
    end

    def top_articles(top)
      articles = @client.articles.all top: top
      formated_parse(articles)
    end

    private
    def formated_parse(articles)
      articles.each do |a|
        created_at = Time.parse(a["CreatedDate"]).strftime("%d/%m/%y|%H:%M")
        @display.puts "#{created_at} - #{Rainbow(a["Title"]).red} - #{Rainbow(a["Url"]).cyan}"
      end
    end
  end
end