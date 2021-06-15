require "test_helper"

class EncomendaTest < ActiveSupport::TestCase

  test "nao deve criar uma encomenda com remetende com menos de 3 caracteres" do
    encomenda = Encomenda.new(peso: 1.1, remetente: "F", usuario: @usuario = usuarios(:one), entrega_externa: @entega_externa = entrega_externas(:one))
    assert_not encomenda.save
  end

  test "nao deve criar uma encomenda sem um vazia" do
    encomenda = Encomenda.new
    assert_not encomenda.save
  end

  test "nao deve criar um ecomenda com peso negativo" do
    encomenda = Encomenda.new(peso: -1.1, remetente: "FAB", usuario: @usuario = usuarios(:one), entrega_externa: @entega_externa = entrega_externas(:one))
    assert_not encomenda.save
  end

  test "deve criar um ecomenda corretamente" do
    encomenda = Encomenda.new(peso: 1.1, remetente: "FAB", usuario: @usuario = usuarios(:one), entrega_externa: @entega_externa = entrega_externas(:one))
    assert encomenda.save
  end

end
