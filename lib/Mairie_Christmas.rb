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

def get_townhall_email
    n = get_townhall_urls.count
    i = 0
    emails = []
    while i < n
        @page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{get_townhall_urls[i].to_s}"))
        result = @page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').map do |node|
            emails.push(node.text)
        end
        p emails[i]
        i += 1
    end

    names = get_townhall_names
    result_email = names.map.with_index do |name, index|
        new_hash = {}
        new_hash[name] = emails[index]
        new_hash
    end
    return result_email
end

print get_townhall_email
=begin

def get_townhall_email
  @page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_email_array = []
  @pages.xpath()

=end
