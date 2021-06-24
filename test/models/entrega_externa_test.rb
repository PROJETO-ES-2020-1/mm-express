require "test_helper"

class EntregaExternaTest < ActiveSupport::TestCase
  test "nao deve criar uma entrega externa vazia" do
    entrega_externa = EntregaExterna.new
    assert_not entrega_externa.save
  end

  test "nao deve criar uma entrega externa com recebido_por vazio" do
    entrega_externa = EntregaExterna.new(dataChegada: Time.zone.today, horaChegada: Time.now, recebidoPor: "",
                                         encomenda_attributes: { peso: 4.5, remetente: "Lara Marshall", usuario_id: usuarios(:one).id })
    assert_not entrega_externa.save
  end

  test "nao deve criar entrega externa com data posterior a data atual" do
    entrega_externa = EntregaExterna.new(dataChegada: Time.zone.tomorrow, horaChegada: Time.now, recebidoPor: "recebido por alguem",
                                         encomenda_attributes: { peso: 4.5, remetente: "Lara Marshall", usuario_id: usuarios(:one).id })
    assert_not entrega_externa.save
  end

  test "deve criar entrega externa corretamente" do
    entregaExterna = EntregaExterna.new(dataChegada: Date.new(2021, 6, 10), horaChegada: Time.new(2021, 6, 10, 14, 30, 0), recebidoPor: "Kyle Sparks",
                                        encomenda_attributes: { peso: 4.5, remetente: "Lara Marshall", usuario_id: usuarios(:one).id })

    assert entregaExterna.save
  end
end
