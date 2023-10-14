# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nombre                 :string
#  rut                    :string
#  telefono               :string
#  direccion              :string
#  role                   :string           default("user")
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: "admin", user: "user" }

  #Relaciones
  has_many :vehiculo


  #Validaciones
  validates :nombre, presence: true
  validates :rut, presence: true
  validates :telefono, presence: true
  validates :direccion, presence: true
  validates :email, presence: true
  validates :role, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
