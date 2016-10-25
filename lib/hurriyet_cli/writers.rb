module HurriyetCli
  class Writers
    def initialize(client, display = STDOUT)
      @client = client
      @display = display
    end

    def fetch
      writers = @client.writers.all
      formated_parse(writers)
    end

    def top_writers(top)
      writers = @client.writers.all top: top
      formated_parse(writers)
    end

    private
    def formated_parse(writers)
      writers.each do |a|
        @display.puts "#{Rainbow(a["Fullname"]).red} - #{Rainbow(a["Url"]).cyan}"
      end
    end
  end
end