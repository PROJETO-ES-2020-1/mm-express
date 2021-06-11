require "application_system_test_case"

class EntregaInternasTest < ApplicationSystemTestCase
  setup do
    @entrega_interna = entrega_internas(:one)
  end

  test "visiting the index" do
    visit entrega_internas_url
    assert_selector "h1", text: "Entrega Internas"
  end

  test "creating a Entrega interna" do
    visit entrega_internas_url
    click_on "New Entrega Interna"

    fill_in "Data entrega", with: @entrega_interna.data_entrega
    fill_in "Hora recebida", with: @entrega_interna.hora_recebida
    fill_in "Recebido por", with: @entrega_interna.recebido_por
    click_on "Create Entrega interna"

    assert_text "Entrega interna was successfully created"
    click_on "Back"
  end

  test "updating a Entrega interna" do
    visit entrega_internas_url
    click_on "Edit", match: :first

    fill_in "Data entrega", with: @entrega_interna.data_entrega
    fill_in "Hora recebida", with: @entrega_interna.hora_recebida
    fill_in "Recebido por", with: @entrega_interna.recebido_por
    click_on "Update Entrega interna"

    assert_text "Entrega interna was successfully updated"
    click_on "Back"
  end

  test "destroying a Entrega interna" do
    visit entrega_internas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entrega interna was successfully destroyed"
  end
end
