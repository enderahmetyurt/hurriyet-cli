require 'spec_helper'

describe HurriyetCli::Articles do
  describe "#formated_articles" do
    it "fetch all articles in a format" do
      # 13/10/16|13:46 -  MHP Toprakkale İlçe Başkanı Gür, vefat etti - http://www.hurriyet.com.tr/mhp-toprakkale-ilce-baskani-gur-vefat-etti-40247928
      mock_articles = [{"Id"=>"40247928",
                        "ContentType"=>"Article",
                        "CreatedDate"=>"2016-10-13T13:46:16Z",
                        "Description"=>" MHP Toprakkale İlçe Başkanı Gür, vefat etti",
                        "Files"=>[{"FileUrl"=>"http://i.hurimg.com/i/hurriyet/98/0x0/57ff9076eb10bb12008f9f25.jpg", "Metadata"=>{"Title"=>" MHP Toprakkale İlçe Başkanı Gür, vefat etti"}}],
                        "ModifiedDate"=>"2016-10-13T13:46:16Z",
                        "Path"=>"/yerel-haberler/osmaniye/",
                        "Title"=>" MHP Toprakkale İlçe Başkanı Gür, vefat etti",
                        "Url"=>"http://www.hurriyet.com.tr/mhp-toprakkale-ilce-baskani-gur-vefat-etti-40247928"}]
      formated_articles = HurriyetCli::Articles.send(:formated_parse, mock_articles)
      expect(formated_articles) == Array
    end
  end
end
