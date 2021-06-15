require "test_helper"

class EntregaExternaTest < ActiveSupport::TestCase

  test "nao deve criar uma entrega externa vazia" do
    entrega_externa = EntregaExterna.new
    assert_not entrega_externa.save
  end

  test "nao deve criar uma entrega externa com recebido_por vazio" do
    entrega_externa = EntregaExterna.new(dataChegada: Time.zone.today, horaChegada: Time.now, recebidoPor: "")
    assert_not entrega_externa.save
  end

  test "nao deve criar entrega externa com data posterior a data atual" do
    entrega_externa = EntregaExterna.new(dataChegada: Time.zone.tomorrow, horaChegada: Time.now, recebidoPor: "recebido por alguem")
    assert_not entrega_externa.save
  end

  test "deve criar entrega externa corretamente" do
    entrega_externa = EntregaExterna.new(dataChegada: Time.zone.today, horaChegada: Time.new(2021, 01, 01, 10, 10, 10), recebidoPor: "alguem recebeu")
    assert entrega_externa.save
  end

end
