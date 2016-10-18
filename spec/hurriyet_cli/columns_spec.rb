require 'spec_helper'

describe HurriyetCli::Columns do
  describe "#formated_columns" do
    it "fetch all columns in a format" do
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
      formated_columns = HurriyetCli::Columns.send(:formated_parse, mock_columns)
      expect(formated_columns) == Array
    end
  end
end
