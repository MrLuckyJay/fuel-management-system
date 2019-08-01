json.extract! transaction, :id, :productType, :liters, :vehicleNumber, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
