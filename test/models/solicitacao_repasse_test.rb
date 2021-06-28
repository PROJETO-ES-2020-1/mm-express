require "test_helper"

class SolicitacaoRepasseTest < ActiveSupport::TestCase

  test "nao deve criar um solicitacao de repasse vazia" do
    solicitacaoRepasse = SolicitacaoRepasse.new
    assert_not solicitacaoRepasse.save
  end

  test "deve criar uma solicitacao de repasse valida" do
    usuario = Usuario.new(nome: "Eleanor Walker", email: "eleanor@gmail.com", telefone: "89653210",
                          cpf: "368.408.980-08", password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)
    assert usuario.save

    entregaExterna = EntregaExterna.new(dataChegada: Date.new(2021, 6, 10), horaChegada: Time.new(2021, 6, 10, 14, 30, 0), recebidoPor: "Kyle Sparks",
                                        encomenda_attributes: { peso: 4.5, remetente: "Lara Marshall", usuario_id: usuario.id })

    assert entregaExterna.save

    solicitacaoRepasse = SolicitacaoRepasse.new(dataSolicitada: Time.zone.today, entrega_externa_id: entregaExterna.id)
    assert solicitacaoRepasse.save
  end

  test "nao deve criar uma solicitacao de repasse com a data anterior a o dia atual" do
    usuario = Usuario.new(nome: "Eleanor Walker", email: "eleanor@gmail.com", telefone: "89653210",
                          cpf: "368.408.980-08", password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)
    assert usuario.save

    entregaExterna = EntregaExterna.new(dataChegada: Date.new(2021, 6, 10), horaChegada: Time.new(2021, 6, 10, 14, 30, 0), recebidoPor: "Kyle Sparks",
                                        encomenda_attributes: { peso: 4.5, remetente: "Lara Marshall", usuario_id: usuario.id })

    assert entregaExterna.save

    solicitacaoRepasse = SolicitacaoRepasse.new(dataSolicitada: Date.yesterday, entrega_externa_id: entregaExterna.id)
    assert_not solicitacaoRepasse.save
  end

  test "nao deve criar uma solicitacao de repasse com sem uma entrega externa" do
    usuario = Usuario.new(nome: "Eleanor Walker", email: "eleanor@gmail.com", telefone: "89653210",
                          cpf: "368.408.980-08", password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)
    assert usuario.save

    entregaExterna = EntregaExterna.new(dataChegada: Date.new(2021, 6, 10), horaChegada: Time.new(2021, 6, 10, 14, 30, 0), recebidoPor: "Kyle Sparks",
                                        encomenda_attributes: { peso: 4.5, remetente: "Lara Marshall", usuario_id: usuario.id })

    assert entregaExterna.save

    solicitacaoRepasse = SolicitacaoRepasse.new(dataSolicitada: Time.zone.today)
    assert_not solicitacaoRepasse.save
  end

end
