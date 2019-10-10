require_relative '../lib/Scrappeur_Fou'

describe "for crypto_symbols" do
    it "should return crypto_symbols" do
      expect(sign).to be_an_instance_of(Array)
    end
end

describe "for crypto_price" do
    it "should return crypto_price array" do
      expect(price).to be_an_instance_of(Array)
    end
end
