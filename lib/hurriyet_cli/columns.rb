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
      columns.each.with_index(1) do |a, i|
        created_at = Time.parse(a["CreatedDate"]).strftime("%d/%m/%y | %H:%M")
        @display.puts "#{i} - #{Rainbow(a["Title"]).red} - #{Rainbow(a["Fullname"]).orange} - #{Rainbow(created_at).color(:blue)}"
        @display.puts Rainbow(a["Description"]).color(:dimgray)
        @display.puts Rainbow(a["Url"]).cyan
        @display.puts ""
      end
    end
  end
end
