require "application_system_test_case"

class SolicitacaoRepassesTest < ApplicationSystemTestCase
  setup do
    @solicitacao_repass = solicitacao_repasses(:one)
  end

  test "visiting the index" do
    visit solicitacao_repasses_url
    assert_selector "h1", text: "Solicitacao Repasses"
  end

  test "creating a Solicitacao repasse" do
    visit solicitacao_repasses_url
    click_on "New Solicitacao Repasse"

    fill_in "Datasolicitada", with: @solicitacao_repass.dataSolicitada
    fill_in "Entregaexterna", with: @solicitacao_repass.entrega_externa_id
    click_on "Create Solicitacao repasse"

    assert_text "Solicitacao repasse was successfully created"
    click_on "Back"
  end

  test "updating a Solicitacao repasse" do
    visit solicitacao_repasses_url
    click_on "Edit", match: :first

    fill_in "Datasolicitada", with: @solicitacao_repass.dataSolicitada
    fill_in "Entregaexterna", with: @solicitacao_repass.entrega_externa_id
    click_on "Update Solicitacao repasse"

    assert_text "Solicitacao repasse was successfully updated"
    click_on "Back"
  end

  test "destroying a Solicitacao repasse" do
    visit solicitacao_repasses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Solicitacao repasse was successfully destroyed"
  end
end
