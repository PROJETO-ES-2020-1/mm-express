require "application_system_test_case"

class SobreavisoDeEntregasTest < ApplicationSystemTestCase
  setup do
    @sobreaviso_de_entrega = sobreaviso_de_entregas(:one)
  end

  test "visiting the index" do
    visit sobreaviso_de_entregas_url
    assert_selector "h1", text: "Sobreaviso De Entregas"
  end

  test "creating a Sobreaviso de entrega" do
    visit sobreaviso_de_entregas_url
    click_on "New Sobreaviso De Entrega"

    fill_in "Data prevista entrega", with: @sobreaviso_de_entrega.data_prevista_entrega
    fill_in "Urgencia de repasse", with: @sobreaviso_de_entrega.urgencia_de_repasse
    fill_in "Usuario", with: @sobreaviso_de_entrega.usuario_id
    click_on "Create Sobreaviso de entrega"

    assert_text "Sobreaviso de entrega was successfully created"
    click_on "Back"
  end

  test "updating a Sobreaviso de entrega" do
    visit sobreaviso_de_entregas_url
    click_on "Edit", match: :first

    fill_in "Data prevista entrega", with: @sobreaviso_de_entrega.data_prevista_entrega
    fill_in "Urgencia de repasse", with: @sobreaviso_de_entrega.urgencia_de_repasse
    fill_in "Usuario", with: @sobreaviso_de_entrega.usuario_id
    click_on "Update Sobreaviso de entrega"

    assert_text "Sobreaviso de entrega was successfully updated"
    click_on "Back"
  end

  test "destroying a Sobreaviso de entrega" do
    visit sobreaviso_de_entregas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sobreaviso de entrega was successfully destroyed"
  end
end
