module HurriyetCli
  class Pages
    def self.fetch
      client = Hurriyet::Client.new(ENV["API_KEY"])
      pages = client.pages.all
      formated_parse(pages)
    end

    def self.top_pages(top)
      client = Hurriyet::Client.new(ENV["API_KEY"])
      pages = client.pages.all top: top
      formated_parse(pages)
    end

    private
    def self.formated_parse(pages)
      pages.each do |a|
        created_at = Time.parse(a["CreatedDate"]).strftime("%d/%m/%y|%H:%M")
        puts "#{created_at} - #{Rainbow(a["Title"]).red} - #{Rainbow(a["Url"]).cyan}"
      end
    end
  end
end