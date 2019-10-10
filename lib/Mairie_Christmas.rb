require 'nokogiri'
require 'open-uri'

def get_townhall_urls
  @page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_urls_array = []
    @page.xpath('//tr/td/p/a[@class= "lientxt"]/@href').each do |url|
      townhall_urls_array << url.text
    end
    return townhall_urls_array
  end

get_townhall_urls

def get_townhall_names
  @page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_names_array = []
    @page.xpath('//tr[2]//p/a').each do |name|
      townhall_names_array << name.text
    end
    return townhall_names_array
end

get_townhall_names

=begin
def get_townhall_email
  @page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_email_array = []
  @pages.xpath()
  =end
