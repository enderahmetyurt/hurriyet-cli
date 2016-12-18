module HurriyetCli
  class Pages
    def initialize(client, display = STDOUT)
      @client = client
      @display = display
    end

    def fetch
      pages = @client.pages.all
      formated_parse(pages)
    end

    def top_pages(top)
      pages = @client.pages.all top: top
      formated_parse(pages)
    end

    private

    def formated_parse(pages)
      pages.each do |a|
        Time.zone = "Istanbul"
        created_at = Time.zone.parse(a['CreatedDate']).strftime('%d/%m/%y | %H:%M %Z')
        @display.puts "#{created_at} - #{Rainbow(a['Title']).red} - #{Rainbow(a['Url']).cyan}"
      end
    end
  end
end
