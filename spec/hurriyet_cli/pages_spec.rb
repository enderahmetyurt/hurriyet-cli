require 'spec_helper'

describe HurriyetCli::Pages do
  describe "#formated_pages" do
    it "fetch all pages in a format" do
      mock_pages = [{"Id"=> "580482cfc03c0e28d8c80539",
                     "CreatedDate"=> "2016-10-17T07:50:39.08Z",
                     "RelatedNews"=> [],
                     "Title"=> "Manchester United Fenerbahçe Maçı",
                     "Url"=> "/manchester-united-fenerbahce-maci"}]
      formated_pages = HurriyetCli::Pages.send(:formated_parse, mock_pages)
      expect(formated_pages) == Array
    end
  end
end
