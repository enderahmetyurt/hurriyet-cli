module HurriyetCli
  class Columns
    def initialize(client, display = STDOUT)
      @client = client
      @display = display
    end

    def fetch
      columns = @client.columns.all
      formated_parse(columns)
    end

    def top_columns(top)
      columns = @client.columns.all top: top
      formated_parse(columns)
    end

    private
    def formated_parse(columns)
      columns.each do |a|
        created_at = Time.parse(a["CreatedDate"]).strftime("%d/%m/%y|%H:%M")
        @display.puts "#{created_at} - #{Rainbow(a["Title"]).red} - #{Rainbow(a["Fullname"]).orange} - #{Rainbow(a["Url"]).cyan}"
      end
    end
  end
end