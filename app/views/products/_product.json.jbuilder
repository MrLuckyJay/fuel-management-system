json.extract! product, :id, :productName, :productPrice, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
config.serve_static_assets = true
config.assets.compile = true
