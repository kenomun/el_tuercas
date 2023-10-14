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
class Solicitude < ApplicationRecord
  before_create :generate_random_code

  #Relaciones
  belongs_to :user
  belongs_to :vehiculo
  has_and_belongs_to_many :servicios

  #Validaciones



  def generate_random_code
    self.codigo = SecureRandom.hex(3).upcase
  end
end
