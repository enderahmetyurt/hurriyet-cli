require 'spec_helper'

describe HurriyetCli::Writers do
  describe "#formated_writeres" do
    it "fetch all writers in a format" do
      formated_writer = "\e[31mAdnan KAYA\e[0m - \e[36mhttp://sosyal.hurriyet.com.tr/yazar/adnan-kaya_427\e[0m"
      mock_writers = [{"Id"=> "55ea09f8f018fbaf44942523",
                       "Fullname"=> "Adnan KAYA",
                       "ContentType"=> "PersonContainer",
                       "CreatedDate"=> "2011-10-31T07:50:44.43Z",
                       "Files"=> [
                         {
                           "FileUrl"=> "http://i.hurimg.com/i/hurriyet/98/0x0/55ea09f8f018fbaf44942521.jpg",
                           "Metadata"=> {
                             "Title"=> "Adnan KAYA"
                           }
                         }
                       ],
                       "Path"=> "/yazarlar/",
                       "Url"=> "http://sosyal.hurriyet.com.tr/yazar/adnan-kaya_427"}]
      client = double('client')
      display = double('display')
      writers = HurriyetCli::Writers.new(client, display)
      expect(client).to receive_message_chain('writers.all') {mock_writers}
      expect(display).to receive(:puts).with(formated_writer)
      writers.fetch
    end
  end
end
