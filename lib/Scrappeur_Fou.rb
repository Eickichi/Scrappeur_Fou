require 'nokogiri'
require 'open-uri'

@page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def sign
  symbol = @page.xpath('//td[@class = "text-left col-symbol"]')
  @sign_array = []

  symbol.each do |symbol|
    @sign_array << symbol.text
  end
  return @sign_array
end

sign

def price
  value = @page.xpath('//td/a[@class="price"]')
  @value_array = []

  value.each do |value|
    @value_array << value.text.gsub(/[$]/, '')
  end
  return @value_array
end

price

def final_hash
    @sign_array.map.with_index do |key , value|
    last_hash ={}
    last_hash[key] = @value_array[value]
    last_hash
  end
end

#hash_all = Hash[sign.zip(price)]
#return hash_all

print final_hash
