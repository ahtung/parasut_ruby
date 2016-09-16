require 'webmock/rspec'
require 'json'
require 'coveralls'
Coveralls.wear!
require 'webmock/rspec'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
require 'parasut'

RSpec.configure do |config|
  config.before(:suite) do
    Parasut.options do |options|
      options.client_id = 'client_id'
      options.client_secret = 'client_secret'
      options.username = 'username'
      options.password = 'password'
      options.company_id = 'company_id'
    end
  end

  config.before(:each) do
    stub_request(:post, 'https://api.parasut.com/oauth/token?client_id=client_id&client_secret=client_secret&grant_type=password&password=password&redirect_uri=urn:ietf:wg:oauth:2.0:oob&username=username')
      .to_return(status: 200, body: {
        access_token: 'e9e13c1dec7e2f6c9550f8eb1801cf48e8b8caaca611508ff3330155f8bfbe99',
        token_type: 'bearer',
        expires_in: 7200,
        refresh_token: 'refresh_token',
        scope: 'public',
        created_at: 1_473_538_387
      }.to_json, headers: {})

    stub_request(:post, 'https://api.parasut.com/oauth/token?client_id=client_id&client_secret=client_secret&grant_type=refresh_token&refresh_token=refresh_token')
      .to_return(status: 200, body: {
        access_token: 'e9e13c1dec7e2f6c9550f8eb1801cf48e8b8caaca611508ff3330155f8bfbe99',
        token_type: 'bearer',
        expires_in: 7200,
        refresh_token: 'a880825d3e1ee8b0ad5dd5b0ed099d11aa175934fc63190149750589833242bf',
        scope: 'public',
        created_at: 1_473_538_387
      }.to_json, headers: {})

    # /products
    # PUT /products/1
    stub_request(:put, 'https://api.parasut.com/v1/products/1')
      .to_return(status: 200, body: {
        product: {
          id: 1,
          code: nil,
          name: 'Gazete - dergi insert',
          vat_rate: '18.0',
          currency: 'TRL',
          list_price: '1500.00',
          archived: false,
          category: {
            id: 5,
            name: 'Baskı',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }.to_json, headers: {})

    # GET /products/1
    stub_request(:get, 'https://api.parasut.com/v1/products/1')
      .to_return(status: 200, body: {
        product: {
          id: 1,
          code: nil,
          name: 'Gazete - dergi insert',
          vat_rate: '18.0',
          currency: 'TRL',
          list_price: '1500.00',
          archived: false,
          category: {
            id: 5,
            name: 'Baskı',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }.to_json, headers: {})

    # DELETE /products/1
    stub_request(:delete, 'https://api.parasut.com/v1/products')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    # GET /products
    stub_request(:get, 'https://api.parasut.com/v1/products')
      .to_return(status: 200, body: {
        items: [
          {
            id: 1,
            code: nil,
            name: 'Gazete - dergi insert',
            vat_rate: '18.0',
            currency: 'TRL',
            list_price: '1500.00',
            archived: false,
            category: {
              id: 5,
              name: 'Baskı',
              bg_color: '5cbc68',
              text_color: 'f3f2f2'
            }
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # POST /products/1
    stub_request(:post, 'https://api.parasut.com/v1/products').to_return(status: 200, body: {
      product: {
        id: 1,
        code: nil,
        name: 'Gazete - dergi insert',
        vat_rate: '18.0',
        currency: 'TRL',
        list_price: '1500.00',
        archived: false,
        category: {
          id: 5,
          name: 'Baskı',
          bg_color: '5cbc68',
          text_color: 'f3f2f2'
        }
      }
    }.to_json, headers: {})

    # /contacts
    # PUT /contacts/1
    stub_request(:put, 'https://api.parasut.com/v1/contacts/1')
      .to_return(status: 200, body: {
        product: {
          id: 1,
          code: nil,
          name: 'Gazete - dergi insert',
          vat_rate: '18.0',
          currency: 'TRL',
          list_price: '1500.00',
          archived: false,
          category: {
            id: 5,
            name: 'Baskı',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }.to_json, headers: {})

    # GET /contacts/1
    stub_request(:get, 'https://api.parasut.com/v1/contacts/1')
      .to_return(status: 200, body: {
        product: {
          id: 1,
          code: nil,
          name: 'Gazete - dergi insert',
          vat_rate: '18.0',
          currency: 'TRL',
          list_price: '1500.00',
          archived: false,
          category: {
            id: 5,
            name: 'Baskı',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }.to_json, headers: {})

    # DELETE /contacts/1
    stub_request(:delete, 'https://api.parasut.com/v1/contacts')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    # GET /contacts
    stub_request(:get, 'https://api.parasut.com/v1/contacts')
      .to_return(status: 200, body: {
        items: [
          {
            id: 1,
            code: nil,
            name: 'Gazete - dergi insert',
            vat_rate: '18.0',
            currency: 'TRL',
            list_price: '1500.00',
            archived: false,
            category: {
              id: 5,
              name: 'Baskı',
              bg_color: '5cbc68',
              text_color: 'f3f2f2'
            }
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # POST /contacts/1
    stub_request(:post, 'https://api.parasut.com/v1/contacts').to_return(status: 200, body: {
      product: {
        id: 1,
        code: nil,
        name: 'Gazete - dergi insert',
        vat_rate: '18.0',
        currency: 'TRL',
        list_price: '1500.00',
        archived: false,
        category: {
          id: 5,
          name: 'Baskı',
          bg_color: '5cbc68',
          text_color: 'f3f2f2'
        }
      }
    }.to_json, headers: {})


    # /item_categories
    # PUT /item_categories/1
    stub_request(:put, 'https://api.parasut.com/v1/item_categories/1')
      .to_return(status: 200, body: {
        item_category: {
          id: 3,
          category_type: "Contact",
          name: "Mimarlık şirketleri",
          bg_color: "5cbc68",
          text_color: "f3f2f2"
        }
      }.to_json, headers: {})

    # GET /item_categories/1
    stub_request(:get, 'https://api.parasut.com/v1/item_categories/1')
      .to_return(status: 200, body: {
        item_category: {
          id: 3,
          category_type: "Contact",
          name: "Mimarlık şirketleri",
          bg_color: "5cbc68",
          text_color: "f3f2f2"
        }
      }.to_json, headers: {})

    # DELETE /item_categories/1
    stub_request(:delete, 'https://api.parasut.com/v1/item_categories')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    # GET /item_categories
    stub_request(:get, 'https://api.parasut.com/v1/item_categories')
      .to_return(status: 200, body: {
        "items": [
          {
            "id": 3,
            "category_type": "Contact",
            "name": "Mimarlık şirketleri",
            "bg_color": "5cbc68",
            "text_color": "f3f2f2"
          }
        ],
        "meta": {
          "item_count": 1,
          "page_count": 1,
          "per_page": 25
        }
      }.to_json, headers: {})

    # POST /item_categories/1
    stub_request(:post, 'https://api.parasut.com/v1/item_categories').to_return(status: 200, body: {
      "item_category": {
        "id": 3,
        "category_type": "Contact",
        "name": "Mimarlık şirketleri",
        "bg_color": "5cbc68",
        "text_color": "f3f2f2"
      }
    }.to_json, headers: {})
  end
end
