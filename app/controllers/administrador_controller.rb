class AdministradorController < ApplicationController
    before_action :authorize_admin
  
    def admin
      render 'administrador/admin' 
    end

		#Metodos usuarios clientes
  
		def servicio_clientes
			@users = User.where(role: 'user').order(:nombre)
			render 'administrador/usuarios'
		end
      
    def nuevo_cliente
			@user = User.new
      render 'administrador/nuevo_cliente'
    end

	
		def editar_cliente
			@user = User.find(params[:id])
			render 'administrador/editar_cliente'
		end

		def eliminar_cliente
			@user = User.find(params[:id])
			@user.destroy
			redirect_to admin_servicio_clientes_path, notice: 'Cliente eliminado exitosamente.'
		end

    def crear_cliente
			if request.post?
				@user = User.new(user_params)
				
				rut = params[:user][:rut]
				@user.password = rut[0..5]
				@user.password_confirmation = rut[0..5]
		

				respond_to do |format|
					if @user.save
						format.html { redirect_to admin_servicio_clientes_path, notice: 'Cliente creado exitosamente.' }
						format.json { render :show, status: :created, location: @user }
					else
						format.html { render :nuevo_cliente, status: :unprocessable_entity }
						format.json { render json: @user.errors, status: :unprocessable_entity }
					end
				end
			else
				@user = User.new
			end
		end

		def actualizar_cliente

			@user = User.find(params[:id])
		
			if @user.update(user_params)
				redirect_to admin_servicio_clientes_path, notice: 'Cliente actualizado exitosamente.'
			else

				render 'editar_cliente'
			end
		end

		#Metodos usuarios personal

		def servicio_personal
			@users = User.where(role: 'admin')
			render 'administrador/personal'
		end

		def nuevo_personal
			@user = User.new
			render 'administrador/nuevo_personal'
		end

		def crear_personal
			if request.post?
				@user = User.new(user_params)
				
				rut = params[:user][:rut]
				@user.password = rut[0..5]
				@user.password_confirmation = rut[0..5]
				@user.role = 'admin'
		

				respond_to do |format|
					if @user.save
						format.html { redirect_to admin_servicio_personal_path, notice: 'Personal creado exitosamente.' }
						format.json { render :show, status: :created, location: @user }
					else
						format.html { render :nuevo_cliente, status: :unprocessable_entity }
						format.json { render json: @user.errors, status: :unprocessable_entity }
					end
				end
			else
				@user = User.new
			end
		end

		def editar_personal
			@user = User.find(params[:id])
			render 'administrador/editar_personal'
		end

		def actualizar_personal

			@user = User.find(params[:id])
		
			if @user.update(user_params)
				redirect_to admin_servicio_personal_path, notice: 'Personal actualizado exitosamente.'
			else

				render 'editar_personal'
			end
		end

		def eliminar_personal
			@user = User.find(params[:id])
			@user.destroy
			redirect_to admin_servicio_personal_path, notice: 'Cliente eliminado exitosamente.'
		end
		
		
  
    private
  
    def authorize_admin
      redirect_to root_path, alert: 'No tienes permisos para acceder a esta página.' unless current_user.admin?
    end



		def user_params
			params.require(:user).permit(:nombre, :rut, :direccion, :telefono, :email)
		end
  end
  