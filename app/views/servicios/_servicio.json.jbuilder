json.extract! servicio, :id, :nombre, :descripcion, :created_at, :updated_at
json.url servicio_url(servicio, format: :json)
