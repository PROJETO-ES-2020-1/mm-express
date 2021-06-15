require "test_helper"

class EntregaInternaTest < ActiveSupport::TestCase
  test "nao deve criar uma entrega interna vazia" do
    entregaInterna = EntregaInterna.new

    assert_not entregaInterna.save
  end

  test "deve criar uma entrega interna valida" do
    usuario = Usuario.new(nome: "Eleanor Walker", email: "eleanor@gmail.com", telefone: "89653210",
                          cpf: "368.408.980-08", password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)

    assert usuario.save

    entregaExterna = EntregaExterna.new(dataChegada: Date.new(2021, 6, 10), horaChegada: Time.new(2021, 6, 10, 14, 30, 0), recebidoPor: "Kyle Sparks",
                                        encomenda_attributes: { peso: 4.5, remetente: "Lara Marshall", usuario_id: usuario.id })

    assert entregaExterna.save

    entregaInterna = EntregaInterna.new(data_entrega: Date.new(2021, 6, 11), hora_recebida: Time.new(2021, 6, 11, 14, 30, 0),
                                        recebido_por: "Eleanor Walker", entrega_externa_id: entregaExterna.id)

    assert entregaInterna.save
  end

  test "nao deve criar uma entrega interna com data invalida" do
    usuario = Usuario.new(nome: "Eleanor Walker", email: "eleanor@gmail.com", telefone: "89653210",
                          cpf: "368.408.980-08", password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)

    assert usuario.save

    entregaExterna = EntregaExterna.new(dataChegada: Date.new(2021, 6, 10), horaChegada: Time.new(2021, 6, 10, 14, 30, 0), recebidoPor: "Kyle Sparks",
                                        encomenda_attributes: { peso: 4.5, remetente: "Lara Marshall", usuario_id: usuario.id })

    assert entregaExterna.save

    entregaInterna = EntregaInterna.new(data_entrega: Date.new(2022, 6, 11), hora_recebida: Time.new(2021, 6, 11, 14, 30, 0),
                                        recebido_por: "Eleanor Walker", entrega_externa_id: entregaExterna.id)

    assert_not entregaInterna.save
  end

  test "nao deve criar uma entrega interna que nao esteja atrelada a uma entrega externa" do
    entregaInterna = EntregaInterna.new(data_entrega: Date.new(2022, 6, 11), hora_recebida: Time.new(2021, 6, 11, 14, 30, 0),
                                        recebido_por: "Eleanor Walker")

    assert_not entregaInterna.save
  end
end
