# == Schema Information
#
# Table name: vehiculos
#
#  id         :bigint           not null, primary key
#  marca      :string
#  modelo     :string
#  año        :integer
#  patente    :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vehiculo < ApplicationRecord
  
  #Relaciones
  belongs_to :user
  has_many :requests
  has_many :solicitudes

  #Validaciones
  validates :marca, presence: true
  validates :modelo, presence: true
  validates :año, presence: true
  validates :patente, presence: true

  def marca_modelo
    "#{marca} - #{modelo}"
  end

end
