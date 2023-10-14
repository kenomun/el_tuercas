Rails.application.routes.draw do
  resources :solicitudes
  resources :vehiculos
  resources :servicios
  get 'home/index'
  devise_for :users
  # config/routes.rb
  resources :users, only: [:show]
  get 'admin', to: 'administrador#admin'
  get 'admin/servicio_clientes', to: 'administrador#servicio_clientes'
  get 'admin/servicio_personal', to: 'administrador#servicio_personal'
  get 'admin/nuevo_cliente', to: 'administrador#nuevo_cliente'
  post 'admin/crear_cliente', to: 'administrador#crear_cliente'
  get 'admin/editar_cliente/:id', to: 'administrador#editar_cliente', as: 'admin_editar_cliente'
  patch 'admin/actualizar_cliente/:id', to: 'administrador#actualizar_cliente', as: 'admin_actualizar_cliente'
  delete 'admin/eliminar_cliente/:id', to: 'administrador#eliminar_cliente', as: 'admin_eliminar_cliente'

  get 'admin/nuevo_personal', to: 'administrador#nuevo_personal'
  post 'admin/crear_personal', to: 'administrador#crear_personal'
  get 'admin/editar_personal/:id', to: 'administrador#editar_personal', as: 'admin_editar_personal'
  patch 'admin/actualizar_personal/:id', to: 'administrador#actualizar_personal', as: 'admin_actualizar_personal'
  delete 'admin/eliminar_personal/:id', to: 'administrador#eliminar_personal', as: 'admin_eliminar_personal'


  





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end
