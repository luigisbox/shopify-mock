require 'spec_helper'

describe :response do
  
  after(:all) { ShopifyAPI::Mock.reset }
  
  describe "#new" do
    before { @fixture = ShopifyAPI::Mock::Fixture.find :orders }
    it "should cache the new response" do
      count = ShopifyAPI::Mock::Response.all.count
      ShopifyAPI::Mock::Response.new(:get, "/orders.json", @fixture.to_s)
      ShopifyAPI::Mock::Response.all.count.should eq count + 1
    end
  end
  
  describe "class methods" do
    describe "#all" do
      subject { ShopifyAPI::Mock::Response.all }
      it { should be_kind_of Hash }
    end
    
    describe "#clear" do
      it "should clear the responses" do
        ShopifyAPI::Mock::Response.new(:get, "/orders.json", @fixture)
        ShopifyAPI::Mock::Response.all.count.should > 0
        ShopifyAPI::Mock::Response.clear
        ShopifyAPI::Mock::Response.all.count.should eq 0
      end
    end
  end
  
end
