require "test_helper"

class EntregaExternaTest < ActiveSupport::TestCase
  
  test "nao deve criar uma entrega externa vazia" do
    entrega_externa = EntregaExterna.new
    assert_not entrega_externa.save
  end

  test "nao deve criar uma entrega externa com recebido_por vazio" do
    entrega_externa = EntregaExterna.new dataChegada: Date.today, horaChegada: Time.now, recebidoPor: ""
    assert_not entrega_externa.save
  end

  test "nao deve criar entrega externa com data posterior a data atual" do
    entrega_externa = EntregaExterna.new dataChegada: Date.tomorrow, horaChegada: Time.now, recebidoPor: ""
    assert_not entrega_externa.save
  end

end
