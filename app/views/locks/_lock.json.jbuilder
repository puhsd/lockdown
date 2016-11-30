json.extract! lock, :id, :url, :user_id, :created_at, :updated_at
json.url lock_url(lock, format: :json)