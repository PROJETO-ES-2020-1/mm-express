require "application_system_test_case"

class EntregaExternasTest < ApplicationSystemTestCase
  setup do
    @entrega_externa = entrega_externas(:one)
  end

  test "visiting the index" do
    visit entrega_externas_url
    assert_selector "h1", text: "Entrega Externas"
  end

  test "creating a Entrega externa" do
    visit entrega_externas_url
    click_on "New Entrega Externa"

    fill_in "Encomenda", with: @entrega_externa.Encomenda_id
    fill_in "Datachegada", with: @entrega_externa.dataChegada
    fill_in "Horachegada", with: @entrega_externa.horaChegada
    fill_in "Recebidopor", with: @entrega_externa.recebidoPor
    click_on "Create Entrega externa"

    assert_text "Entrega externa was successfully created"
    click_on "Back"
  end

  test "updating a Entrega externa" do
    visit entrega_externas_url
    click_on "Edit", match: :first

    fill_in "Encomenda", with: @entrega_externa.Encomenda_id
    fill_in "Datachegada", with: @entrega_externa.dataChegada
    fill_in "Horachegada", with: @entrega_externa.horaChegada
    fill_in "Recebidopor", with: @entrega_externa.recebidoPor
    click_on "Update Entrega externa"

    assert_text "Entrega externa was successfully updated"
    click_on "Back"
  end

  test "destroying a Entrega externa" do
    visit entrega_externas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entrega externa was successfully destroyed"
  end
end
