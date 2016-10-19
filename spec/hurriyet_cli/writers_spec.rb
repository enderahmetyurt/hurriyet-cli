require 'spec_helper'

describe HurriyetCli::Writers do
  describe "#formated_writeres" do
    it "fetch all writers in a format" do
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
      formated_writers = HurriyetCli::Writers.send(:formated_parse, mock_writers)
      expect(formated_writers) == Array
    end
  end
end
