# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# seeds.rb

services = [
  { nombre: 'Afinación', descripcion: 'Proceso que implica ajustar o reemplazar ciertos componentes para mejorar el rendimiento y la eficiencia del motor. Esto puede incluir el ajuste de bujías, cables de encendido, filtro de aire y otros componentes relacionados con la combustión.' },
  { nombre: 'Cambio de neumáticos', descripcion: 'El cambio de neumáticos es el proceso de reemplazar los neumáticos gastados o dañados por neumáticos nuevos.' },
  { nombre: 'Alineación y balance', descripcion: 'Configuración precisa de las ruedas del vehículo para que estén paralelas entre sí y perpendiculares al suelo. El balance se relaciona con equilibrar el peso de las ruedas y los neumáticos para evitar vibraciones y desgaste irregular. La alineación y el balance aseguran un manejo suave y evitan el desgaste prematuro de los neumáticos.' },
  { nombre: 'Cambio de aceite y filtro', descripcion: 'El cambio de aceite implica drenar el aceite usado del motor y reemplazarlo con aceite nuevo y limpio. El filtro de aceite garantiza que el aceite se mantenga limpio y eficiente en la lubricación del motor.' },
  { nombre: 'Reemplazo de las pastillas de freno', descripcion: 'Las pastillas de freno son componentes críticos del sistema de frenos de un vehículo. Su reemplazo periódico es esencial para garantizar que el vehículo pueda detenerse de manera efectiva y segura.' },
  { nombre: 'Cambio del líquido de frenos', descripcion: 'El líquido de frenos es fundamental para la operación del sistema de frenos. El cambio del líquido de frenos implica eliminar el líquido antiguo y reemplazarlo con líquido fresco para mantener un frenado eficiente y seguro.' },
  { nombre: 'Cambio de líquido refrigerante', descripcion: 'El líquido refrigerante, también conocido como anticongelante, mantiene la temperatura del motor en un rango seguro. Cambiar el líquido refrigerante regularmente ayuda a prevenir el sobrecalentamiento del motor y la corrosión.' },
  { nombre: 'Comprobación del rendimiento de la batería', descripcion: 'La batería del automóvil suministra la energía necesaria para arrancar el motor y alimentar sistemas eléctricos. La comprobación del rendimiento de la batería implica verificar su carga y estado para asegurarse de que esté en condiciones óptimas y que el vehículo arranque de manera confiable.' },
  { nombre: 'Mantenimiento General', descripcion: 'Conjunto de tareas regulares que se realizan para asegurar que el automóvil funcione de manera segura y eficiente. Esto incluye la inspección y servicio de componentes clave como frenos, aceite, filtros, sistema de enfriamiento, transmisión, entre otros.' }
]

services.each do |service_params|
    Servicio.create!(service_params)
end

puts "Se crearon #{Servicio.count} servicios"

# Crear usuarios con roles de administrador
User.create!(nombre: 'Admin 1', rut: '1111111-1', direccion: 'Dirección 1', telefono: '123456789', email: 'admin1@example.com', password: '123456', password_confirmation: '123456', role: 'admin')
User.create!(nombre: 'Admin 2', rut: '2222222-2', direccion: 'Dirección 2', telefono: '987654321', email: 'admin2@example.com', password: '123456', password_confirmation: '123456', role: 'admin')

puts "Se crearon #{User.where(role: 'admin').count} administradores"

# Crear usuarios con roles por defecto y vehículos asociados
default_users = [
  { nombre: 'Usuario 1', rut: '3333333-3', direccion: 'Dirección 3', telefono: '555555555', email: 'user1@example.com', password: '123123', password_confirmation: '123123' },
  { nombre: 'Usuario 2', rut: '4444444-4', direccion: 'Dirección 4', telefono: '666666666', email: 'user2@example.com', password: '123123', password_confirmation: '123123' },
  { nombre: 'Usuario 3', rut: '5555555-5', direccion: 'Dirección 5', telefono: '777777777', email: 'user3@example.com', password: '123123', password_confirmation: '123123' }
]

default_users.each do |user_params|
    user = User.create!(user_params)
    # Asociar vehículos a los usuarios
    2.times do |i|
      Vehiculo.create!(user: user, marca: "Marca #{i + 1}", modelo: "Modelo #{i + 1}", año: 2022, patente: "ABC123#{i}")
    end
    puts "Se crearon #{user.vehiculos.count} vehículos para #{user.nombre}"
  end
