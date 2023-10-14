# == Schema Information
#
# Table name: servicios
#
#  id          :bigint           not null, primary key
#  nombre      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  descripcion :string
#
class Servicio < ApplicationRecord

  #Relaciones
  has_and_belongs_to_many :solicitudes

  #Validaciones
  validates :nombre, presence: true
  validates :descripcion, presence: true
  
end
