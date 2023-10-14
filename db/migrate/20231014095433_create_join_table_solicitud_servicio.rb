class CreateJoinTableSolicitudServicio < ActiveRecord::Migration[7.0]
  def change
    create_join_table :solicituds, :servicios do |t|
      # t.index [:solicitud_id, :servicio_id]
      # t.index [:servicio_id, :solicitud_id]
    end
  end
end
