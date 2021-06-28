require "test_helper"

class SobreavisoDeEntregaTest < ActiveSupport::TestCase
  test "nao deve criar um sobreavio de entrega vazio" do
    sobreavisoEntrega = SobreavisoDeEntrega.new

    assert_not sobreavisoEntrega.save
  end

  test "deve criar um sobreaviso de entrega valido" do
    usuario = Usuario.new(nome: "Eleanor Walker", email: "eleanor@gmail.com", telefone: "89653210",
                          cpf: "368.408.980-08", password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)

    assert usuario.save

    sobreavisoEntrega = SobreavisoDeEntrega.new(data_prevista_entrega: Date.new(2021, 7, 7), urgencia_de_repasse: 1)
    sobreavisoEntrega.usuario = usuario

    assert sobreavisoEntrega.save
  end

  test "nao deve criar um sobreaviso de entrega que nao esteja atrelado a um usuario" do
    sobreavisoEntrega = SobreavisoDeEntrega.new(data_prevista_entrega: Date.new(2021, 7, 7), urgencia_de_repasse: 1)

    assert_not sobreavisoEntrega.save
  end

  test "nao deve criar um sobreaviso de entrega com uma data invalida" do
    usuario = Usuario.new(nome: "Eleanor Walker", email: "eleanor@gmail.com", telefone: "89653210",
                          cpf: "368.408.980-08", password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)

    assert usuario.save

    sobreavisoEntrega = SobreavisoDeEntrega.new(data_prevista_entrega: Date.new(2020, 7, 7), urgencia_de_repasse: 1)
    sobreavisoEntrega.usuario = usuario

    assert_not sobreavisoEntrega.save
  end
end
