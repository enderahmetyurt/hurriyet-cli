require 'spec_helper'

describe HurriyetCli::Columns do
  describe "#formated_columns" do
    it "fetch all columns in a format" do
      formated_column = "1 - \e[31mHido'ya şartlı evet\e[0m - \e[38;5;214mÜnal Özüak\e[0m - \e[34m18/10/16 | 17:29 +03\e[0m \n \e[38;5;102mHani'HAYIR'desem ne olacak o da ayrı!..\e[0m \n \e[36mhttp://sosyal.hurriyet.com.tr/yazar/unal-ozuak_418/hidoya-sartli-evet_40252323\e[0m \n"
      mock_columns = [{"Id"=>"40252323",
                      "Fullname"=>"Ünal Özüak",
                      "ContentType"=>"Column",
                      "CreatedDate"=>"2016-10-18T14:29:12.847Z",
                      "Description"=>"Hani'HAYIR'desem ne olacak o da ayrı!..",
                      "Files"=>[],
                      "Path"=>"/spor/basketbol/",
                      "Title"=>"Hido'ya şartlı evet",
                      "Url"=>"http://sosyal.hurriyet.com.tr/yazar/unal-ozuak_418/hidoya-sartli-evet_40252323",
                      "WriterId"=>"55ea09f8f018fbaf44942506"}]
      client = double('client')
      display = double('display')
      columns = HurriyetCli::Columns.new(client, display)
      expect(client).to receive_message_chain('columns.all') {mock_columns}
      expect(display).to receive(:print).with(formated_column)
      columns.fetch
    end
  end
end
