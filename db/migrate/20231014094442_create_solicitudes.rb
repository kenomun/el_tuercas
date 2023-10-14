class CreateSolicitudes < ActiveRecord::Migration[7.0]
  def change
    create_table :solicitudes do |t|
      t.string :codigo
      t.date :fecha_inicio
      t.date :fecha_termino
      t.string :estado
      t.references :user, null: false, foreign_key: true
      t.references :vehiculo, null: false, foreign_key: true
      t.references :servicio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
