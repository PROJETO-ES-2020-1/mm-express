require "test_helper"

class EntregaInternasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrega_interna = entrega_internas(:one)
  end

  test "should get index" do
    get entrega_internas_url
    assert_response :success
  end

  test "should get new" do
    get new_entrega_interna_url
    assert_response :success
  end

  test "should create entrega_interna" do
    assert_difference('EntregaInterna.count') do
      post entrega_internas_url, params: { entrega_interna: { data_entrega: @entrega_interna.data_entrega, hora_recebida: @entrega_interna.hora_recebida, recebido_por: @entrega_interna.recebido_por } }
    end

    assert_redirected_to entrega_interna_url(EntregaInterna.last)
  end

  test "should show entrega_interna" do
    get entrega_interna_url(@entrega_interna)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrega_interna_url(@entrega_interna)
    assert_response :success
  end

  test "should update entrega_interna" do
    patch entrega_interna_url(@entrega_interna), params: { entrega_interna: { data_entrega: @entrega_interna.data_entrega, hora_recebida: @entrega_interna.hora_recebida, recebido_por: @entrega_interna.recebido_por } }
    assert_redirected_to entrega_interna_url(@entrega_interna)
  end

  test "should destroy entrega_interna" do
    assert_difference('EntregaInterna.count', -1) do
      delete entrega_interna_url(@entrega_interna)
    end

    assert_redirected_to entrega_internas_url
  end
end
