require "test_helper"

class moradoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @morador = moradores(:one)
  end

  test "should get index" do
    get moradores_url
    assert_response :success
  end

  test "should get new" do
    get new_morador_url
    assert_response :success
  end

  test "should create morador" do
    assert_difference('Morador.count') do
      post moradores_url, params: { morador: { bloco: @morador.bloco, cpf: @morador.cpf, email: @morador.email, nome: @morador.nome, numero_residencia: @morador.numero_residencia, telefone: @morador.telefone } }
    end

    assert_redirected_to morador_url(Morador.last)
  end

  test "should show morador" do
    get morador_url(@morador)
    assert_response :success
  end

  test "should get edit" do
    get edit_morador_url(@morador)
    assert_response :success
  end

  test "should update morador" do
    patch morador_url(@morador), params: { morador: { bloco: @morador.bloco, cpf: @morador.cpf, email: @morador.email, nome: @morador.nome, numero_residencia: @morador.numero_residencia, telefone: @morador.telefone } }
    assert_redirected_to morador_url(@morador)
  end

  test "should destroy morador" do
    assert_difference('Morador.count', -1) do
      delete morador_url(@morador)
    end

    assert_redirected_to moradores_url
  end
end
