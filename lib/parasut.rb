require 'her'
require_relative 'her/middleware/o_auth_provider_header'
require_relative 'her/middleware/parasut_parser'
require 'json'
require 'uri'
require 'kaminari/config'
require 'kaminari/helpers/action_view_extension'
require 'kaminari/helpers/paginator'
require 'kaminari/models/page_scope_methods'
require 'kaminari/models/configuration_methods'
require 'kaminari/hooks'

Kaminari::Hooks.init

Her::API.setup url: "https://api.parasut.com/v1/#{ENV['PARSUT_COMPANY_ID']}" do |config|
  config.use Her::Middleware::ParasutParser
  config.use Faraday::Request::UrlEncoded
  config.use Her::Middleware::OAuthProviderHeader
  config.use Faraday::Adapter::NetHttp
  # config.use Faraday::Response::Logger, ActiveSupport::Logger.new(STDOUT)
end

require_relative 'parasut/version'
require_relative 'parasut/options'
require_relative 'parasut/paginated'
require_relative 'parasut/product'
require_relative 'parasut/document_status'
require_relative 'parasut/contact'
require_relative 'parasut/item_category'
require_relative 'parasut/account'
require_relative 'parasut/sales_invoice'
require_relative 'parasut/transaction'
require_relative 'parasut/payment'

# lib/parasut.rb
module Parasut
end
