json.extract! user, :id, :thename, :thetype, :created_at, :updated_at
json.url user_url(user, format: :json)
