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
      articles.each.with_index(1) do |a, i|
        created_at = Time.parse(a["CreatedDate"]).localtime.strftime("%d/%m/%y | %H:%M %Z")
        @display.print "#{i} - #{Rainbow(a["Title"]).red} - #{Rainbow(created_at).color(:yellow)} \n #{Rainbow(a["Description"]).color(:dimgray)} \n #{Rainbow(a["Url"]).cyan} \n"
      end
    end
  end
end
