require 'spec_helper'

describe HurriyetCli::Articles do
  describe "#formated_articles" do
    it "fetch all articles in a format" do
      formated_article = "1 - \e[31mMHP Toprakkale İlçe Başkanı Gür, vefat etti\e[0m - \e[33m13/10/16 | 16:46 +03\e[0m \n \e[38;5;102m MHP Toprakkale İlçe Başkanı Gür, vefat etti\e[0m \n \e[36mhttp://www.hurriyet.com.tr/mhp-toprakkale-ilce-baskani-gur-vefat-etti-40247928\e[0m \n"
      mock_articles = [{"Id"=>"40247928",
                        "ContentType"=>"Article",
                        "CreatedDate"=>"2016-10-13T13:46:16Z",
                        "Description"=>" MHP Toprakkale İlçe Başkanı Gür, vefat etti",
                        "Files"=>[{"FileUrl"=>"http://i.hurimg.com/i/hurriyet/98/0x0/57ff9076eb10bb12008f9f25.jpg", "Metadata"=>{"Title"=>" MHP Toprakkale İlçe Başkanı Gür, vefat etti"}}],
                        "ModifiedDate"=>"2016-10-13T13:46:16Z",
                        "Path"=>"/yerel-haberler/osmaniye/",
                        "Title"=>"MHP Toprakkale İlçe Başkanı Gür, vefat etti",
                        "Url"=>"http://www.hurriyet.com.tr/mhp-toprakkale-ilce-baskani-gur-vefat-etti-40247928"}]
      client = double('client')
      display = double('display')
      articles = HurriyetCli::Articles.new(client, display)
      expect(client).to receive_message_chain('articles.all') {mock_articles}
      expect(display).to receive(:print).with(formated_article)
      articles.fetch
    end
  end
end
