require "application_system_test_case"

class moradoresTest < ApplicationSystemTestCase
  setup do
    @morador = moradores(:one)
  end

  test "visiting the index" do
    visit moradores_url
    assert_selector "h1", text: "moradores"
  end

  test "creating a Morador" do
    visit moradores_url
    click_on "New Morador"

    fill_in "Bloco", with: @morador.bloco
    fill_in "Cpf", with: @morador.cpf
    fill_in "Email", with: @morador.email
    fill_in "Nome", with: @morador.nome
    fill_in "Numero residencia", with: @morador.numero_residencia
    fill_in "Telefone", with: @morador.telefone
    click_on "Create Morador"

    assert_text "Morador was successfully created"
    click_on "Back"
  end

  test "updating a Morador" do
    visit moradores_url
    click_on "Edit", match: :first

    fill_in "Bloco", with: @morador.bloco
    fill_in "Cpf", with: @morador.cpf
    fill_in "Email", with: @morador.email
    fill_in "Nome", with: @morador.nome
    fill_in "Numero residencia", with: @morador.numero_residencia
    fill_in "Telefone", with: @morador.telefone
    click_on "Update Morador"

    assert_text "Morador was successfully updated"
    click_on "Back"
  end

  test "destroying a Morador" do
    visit moradores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Morador was successfully destroyed"
  end
end
