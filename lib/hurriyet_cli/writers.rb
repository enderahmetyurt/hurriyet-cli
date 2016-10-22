module HurriyetCli
  class Writers
    def self.fetch
      client = Hurriyet::Client.new(ENV["API_KEY"])
      writers = client.writers.all
      formated_parse(writers)
    end

    def self.top_writers(top)
      client = Hurriyet::Client.new(ENV["API_KEY"])
      writers = client.writers.all top: top
      formated_parse(writers)
    end

    private
    def self.formated_parse(writers)
      writers.each do |a|
        puts "#{Rainbow(a["Fullname"]).red} - #{Rainbow(a["Url"]).cyan}"
      end
    end
  end
end