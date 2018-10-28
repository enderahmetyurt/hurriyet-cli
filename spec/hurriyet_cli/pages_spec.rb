require 'spec_helper'

describe HurriyetCli::Pages do
  describe "#formated_pages" do
    it "fetch all pages in a format" do
      formated_page = "17/10/16 | 10:50 +03 - \e[31mManchester United Fenerbahçe Maçı\e[0m - \e[36m/manchester-united-fenerbahce-maci\e[0m"
      mock_pages = [{"Id"=> "580482cfc03c0e28d8c80539",
                     "CreatedDate"=> "2016-10-17T07:50:39.08Z",
                     "RelatedNews"=> [],
                     "Title"=> "Manchester United Fenerbahçe Maçı",
                     "Url"=> "/manchester-united-fenerbahce-maci"}]
      client = double('client')
      display = double('display')
      pages = HurriyetCli::Pages.new(client, display)
      expect(client).to receive_message_chain('pages.all') {mock_pages}
      expect(display).to receive(:print).with(formated_page)
      pages.fetch
    end
  end
end
