class UsersController < ApplicationController
	before_action :set_user, only: [:show]
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:show]



	def show
		@user = User.find(params[:id])
	end


  private

	def authorize_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'Acceso no autorizado'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
