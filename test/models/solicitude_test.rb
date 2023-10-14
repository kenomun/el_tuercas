# == Schema Information
#
# Table name: solicitudes
#
#  id            :bigint           not null, primary key
#  codigo        :string
#  fecha_inicio  :date
#  fecha_termino :date
#  estado        :string
#  user_id       :bigint           not null
#  vehiculo_id   :bigint           not null
#  servicio_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class SolicitudeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
