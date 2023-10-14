class HomeController < ApplicationController

  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action only: [:new, :create] do
    authorize_request(["admin", "user"])
  end

  
  def index
    @servicios = Servicio.order(:id)
  end
end
