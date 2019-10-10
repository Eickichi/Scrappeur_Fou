require 'nokogiri'
require 'open-uri'

def get_townhall_urls
  @page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_urls_array = []
    @page.xpath('//tr/td/p/a[@class= "lientxt"]/@href').each do |url|
      townhall_urls_array << url.text
    end
    #return townhall_urls_array
    result_url = names.map do |x|
        x[1..-1]
    end
    return result_url
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

def get_townhall_email
  n = townhall_urls_array.count
  i = 0
  emails = []
  while i < n
    @page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html#{get_townhall_urls[i].to_s}"))
    result = @page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').map do |node|
      emails.push(node.text)
    end
    print emails[i]
    i = i + 1
  end
end

print get_townhall_email
