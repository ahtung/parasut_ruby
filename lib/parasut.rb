require 'omniauth-oauth2'
require 'oauth2'
require 'rest-client'
require 'uri'

require_relative 'parasut/version'
require_relative 'parasut/options'
require_relative 'parasut/client'
require_relative 'parasut/product'

# lib/parasut.rb
module Parasut
  API_VERSION = 'v1'.freeze
  BASE_URL = 'https://api.parasut.com'.freeze
end
