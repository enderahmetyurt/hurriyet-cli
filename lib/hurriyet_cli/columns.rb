module HurriyetCli
  class Columns
    def self.fetch
      client = Hurriyet::Client.new(ENV["API_KEY"])
      columns = client.columns.all
      formated_parse(columns)
    end

    def self.top_columns(top)
      client = Hurriyet::Client.new(ENV["API_KEY"])
      columns = client.columns.all top: top
      formated_parse(columns)
    end

    private
    def self.formated_parse(columns)
      columns.each do |a|
        created_at = Time.parse(a["CreatedDate"]).strftime("%d/%m/%y|%H:%M")
        puts "#{created_at} - #{Rainbow(a["Title"]).red} - #{Rainbow(a["Fullname"]).orange} - #{Rainbow(a["Url"]).cyan}"
      end
    end
  end
end