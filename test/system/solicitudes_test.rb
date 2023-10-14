require "application_system_test_case"

class SolicitudesTest < ApplicationSystemTestCase
  setup do
    @solicitude = solicitudes(:one)
  end

  test "visiting the index" do
    visit solicitudes_url
    assert_selector "h1", text: "Solicitudes"
  end

  test "should create solicitude" do
    visit solicitudes_url
    click_on "New solicitude"

    fill_in "Codigo", with: @solicitude.codigo
    fill_in "Estado", with: @solicitude.estado
    fill_in "Fecha inicio", with: @solicitude.fecha_inicio
    fill_in "Fecha termino", with: @solicitude.fecha_termino
    fill_in "Servicio", with: @solicitude.servicio_id
    fill_in "User", with: @solicitude.user_id
    fill_in "Vehiculo", with: @solicitude.vehiculo_id
    click_on "Create Solicitude"

    assert_text "Solicitude was successfully created"
    click_on "Back"
  end

  test "should update Solicitude" do
    visit solicitude_url(@solicitude)
    click_on "Edit this solicitude", match: :first

    fill_in "Codigo", with: @solicitude.codigo
    fill_in "Estado", with: @solicitude.estado
    fill_in "Fecha inicio", with: @solicitude.fecha_inicio
    fill_in "Fecha termino", with: @solicitude.fecha_termino
    fill_in "Servicio", with: @solicitude.servicio_id
    fill_in "User", with: @solicitude.user_id
    fill_in "Vehiculo", with: @solicitude.vehiculo_id
    click_on "Update Solicitude"

    assert_text "Solicitude was successfully updated"
    click_on "Back"
  end

  test "should destroy Solicitude" do
    visit solicitude_url(@solicitude)
    click_on "Destroy this solicitude", match: :first

    assert_text "Solicitude was successfully destroyed"
  end
end
