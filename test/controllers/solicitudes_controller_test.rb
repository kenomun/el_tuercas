require "test_helper"

class SolicitudesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solicitude = solicitudes(:one)
  end

  test "should get index" do
    get solicitudes_url
    assert_response :success
  end

  test "should get new" do
    get new_solicitude_url
    assert_response :success
  end

  test "should create solicitude" do
    assert_difference("Solicitude.count") do
      post solicitudes_url, params: { solicitude: { codigo: @solicitude.codigo, estado: @solicitude.estado, fecha_inicio: @solicitude.fecha_inicio, fecha_termino: @solicitude.fecha_termino, servicio_id: @solicitude.servicio_id, user_id: @solicitude.user_id, vehiculo_id: @solicitude.vehiculo_id } }
    end

    assert_redirected_to solicitude_url(Solicitude.last)
  end

  test "should show solicitude" do
    get solicitude_url(@solicitude)
    assert_response :success
  end

  test "should get edit" do
    get edit_solicitude_url(@solicitude)
    assert_response :success
  end

  test "should update solicitude" do
    patch solicitude_url(@solicitude), params: { solicitude: { codigo: @solicitude.codigo, estado: @solicitude.estado, fecha_inicio: @solicitude.fecha_inicio, fecha_termino: @solicitude.fecha_termino, servicio_id: @solicitude.servicio_id, user_id: @solicitude.user_id, vehiculo_id: @solicitude.vehiculo_id } }
    assert_redirected_to solicitude_url(@solicitude)
  end

  test "should destroy solicitude" do
    assert_difference("Solicitude.count", -1) do
      delete solicitude_url(@solicitude)
    end

    assert_redirected_to solicitudes_url
  end
end
