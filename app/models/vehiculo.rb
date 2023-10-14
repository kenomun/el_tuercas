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
  belongs_to :user
  has_many :requests
end
