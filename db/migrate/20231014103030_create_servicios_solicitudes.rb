class CreateServiciosSolicitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :servicios_solicitudes, id: false do |t|
      t.belongs_to :servicio
      t.belongs_to :solicitud
    end
  end
end

