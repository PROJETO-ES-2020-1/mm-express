require "test_helper"

class EntregaExternasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrega_externa = entrega_externas(:one)
  end

  test "should get index" do
    get entrega_externas_url
    assert_response :success
  end

  test "should get new" do
    get new_entrega_externa_url
    assert_response :success
  end

  test "should create entrega_externa" do
    assert_difference('EntregaExterna.count') do
      post entrega_externas_url, params: { entrega_externa: { Encomenda_id: @entrega_externa.Encomenda_id, dataChegada: @entrega_externa.dataChegada, horaChegada: @entrega_externa.horaChegada, recebidoPor: @entrega_externa.recebidoPor } }
    end

    assert_redirected_to entrega_externa_url(EntregaExterna.last)
  end

  test "should show entrega_externa" do
    get entrega_externa_url(@entrega_externa)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrega_externa_url(@entrega_externa)
    assert_response :success
  end

  test "should update entrega_externa" do
    patch entrega_externa_url(@entrega_externa), params: { entrega_externa: { Encomenda_id: @entrega_externa.Encomenda_id, dataChegada: @entrega_externa.dataChegada, horaChegada: @entrega_externa.horaChegada, recebidoPor: @entrega_externa.recebidoPor } }
    assert_redirected_to entrega_externa_url(@entrega_externa)
  end

  test "should destroy entrega_externa" do
    assert_difference('EntregaExterna.count', -1) do
      delete entrega_externa_url(@entrega_externa)
    end

    assert_redirected_to entrega_externas_url
  end
end
