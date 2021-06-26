require "test_helper"

class SolicitacaoRepassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solicitacao_repass = solicitacao_repasses(:one)
  end

  test "should get index" do
    get solicitacao_repasses_url
    assert_response :success
  end

  test "should get new" do
    get new_solicitacao_repass_url
    assert_response :success
  end

  test "should create solicitacao_repass" do
    assert_difference('SolicitacaoRepasse.count') do
      post solicitacao_repasses_url, params: { solicitacao_repass: { dataSolicitada: @solicitacao_repass.dataSolicitada, entregaExterna_id: @solicitacao_repass.entregaExterna_id } }
    end

    assert_redirected_to solicitacao_repass_url(SolicitacaoRepasse.last)
  end

  test "should show solicitacao_repass" do
    get solicitacao_repass_url(@solicitacao_repass)
    assert_response :success
  end

  test "should get edit" do
    get edit_solicitacao_repass_url(@solicitacao_repass)
    assert_response :success
  end

  test "should update solicitacao_repass" do
    patch solicitacao_repass_url(@solicitacao_repass), params: { solicitacao_repass: { dataSolicitada: @solicitacao_repass.dataSolicitada, entregaExterna_id: @solicitacao_repass.entregaExterna_id } }
    assert_redirected_to solicitacao_repass_url(@solicitacao_repass)
  end

  test "should destroy solicitacao_repass" do
    assert_difference('SolicitacaoRepasse.count', -1) do
      delete solicitacao_repass_url(@solicitacao_repass)
    end

    assert_redirected_to solicitacao_repasses_url
  end
end
