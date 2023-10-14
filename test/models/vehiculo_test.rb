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
require "test_helper"

class VehiculoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
