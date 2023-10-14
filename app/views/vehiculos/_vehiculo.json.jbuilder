json.extract! vehiculo, :id, :marca, :modelo, :año, :patente, :user_id, :created_at, :updated_at
json.url vehiculo_url(vehiculo, format: :json)
