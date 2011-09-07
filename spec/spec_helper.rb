# require the Mockify library
require File.expand_path("../../lib/mockify", __FILE__)

# load support files
Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| load f}

# enable Mockify and disable real-world Internet access
ShopifyAPI::Mock.enabled = true
ShopifyAPI::Mock.allow_internet = false