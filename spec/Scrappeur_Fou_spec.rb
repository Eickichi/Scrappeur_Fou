require_relative '../lib/Scrappeur_Fou.rb'
require 'nokogiri'
require 'open-uri'

describe "for crypto_price" do
    it "should return crypto_price array" do
      expect(sign).to be_an_instance_of(Array)
    end
end
