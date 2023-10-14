# == Schema Information
#
# Table name: servicios
#
#  id         :bigint           not null, primary key
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Servicio < ApplicationRecord

    #Validaciones
  validates :nombre, presence: true
  
end
