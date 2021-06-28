require "test_helper"

class SobreavisoDeEntregasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sobreaviso_de_entrega = sobreaviso_de_entregas(:one)
  end

  test "should get index" do
    get sobreaviso_de_entregas_url
    assert_response :success
  end

  test "should get new" do
    get new_sobreaviso_de_entrega_url
    assert_response :success
  end

  test "should create sobreaviso_de_entrega" do
    assert_difference('SobreavisoDeEntrega.count') do
      post sobreaviso_de_entregas_url, params: { sobreaviso_de_entrega: { data_prevista_entrega: @sobreaviso_de_entrega.data_prevista_entrega, urgencia_de_repasse: @sobreaviso_de_entrega.urgencia_de_repasse, usuario_id: @sobreaviso_de_entrega.usuario_id } }
    end

    assert_redirected_to sobreaviso_de_entrega_url(SobreavisoDeEntrega.last)
  end

  test "should show sobreaviso_de_entrega" do
    get sobreaviso_de_entrega_url(@sobreaviso_de_entrega)
    assert_response :success
  end

  test "should get edit" do
    get edit_sobreaviso_de_entrega_url(@sobreaviso_de_entrega)
    assert_response :success
  end

  test "should update sobreaviso_de_entrega" do
    patch sobreaviso_de_entrega_url(@sobreaviso_de_entrega), params: { sobreaviso_de_entrega: { data_prevista_entrega: @sobreaviso_de_entrega.data_prevista_entrega, urgencia_de_repasse: @sobreaviso_de_entrega.urgencia_de_repasse, usuario_id: @sobreaviso_de_entrega.usuario_id } }
    assert_redirected_to sobreaviso_de_entrega_url(@sobreaviso_de_entrega)
  end

  test "should destroy sobreaviso_de_entrega" do
    assert_difference('SobreavisoDeEntrega.count', -1) do
      delete sobreaviso_de_entrega_url(@sobreaviso_de_entrega)
    end

    assert_redirected_to sobreaviso_de_entregas_url
  end
end
