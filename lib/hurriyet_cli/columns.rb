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
        created_at = Time.parse(a['CreatedDate']).localtime.strftime('%d/%m/%y | %H:%M %Z')
        @display.print "#{i} - #{Rainbow(a['Title']).red} - #{Rainbow(a['Fullname']).orange} " \
        "- #{Rainbow(created_at).color(:blue)} \n #{Rainbow(a['Description']).color(:dimgray)}" \
        " \n #{Rainbow(a['Url']).cyan} \n"
      end
    end
  end
end
