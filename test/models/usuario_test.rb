require "test_helper"

require "test_helper"

class UsuarioTest < ActiveSupport::TestCase

  test "nao deve criar um usuario com cpf invalido" do
    usuario = Usuario.new(nome: 'Eleanor Walker', email: "eleanor@gmail.com", telefone: "89653210",
    cpf: '123.456.789-10', password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)
    
    assert_not usuario.save
  end


  test "deve criar um usuario valido" do
    usuario = Usuario.new(nome: 'Eleanor Walker', email: "eleanor@gmail.com", telefone: "89653210",
    cpf: '368.408.980-08', password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)
    
    assert usuario.save
  end


  test "deve deletar um usuario valido" do
    usuario = Usuario.new(nome: 'Eleanor Walker', email: "eleanor@gmail.com", telefone: "89653210",
    cpf: '368.408.980-08', password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)
    
    assert usuario.save
    
    assert usuario.delete
  end


  test "deve alterar o email de um usuario valido" do
    usuario = Usuario.new(nome: 'Eleanor Walker', email: "eleanor@gmail.com", telefone: "89653210",
    cpf: '368.408.980-08', password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)
    
    assert usuario.save
    
    assert usuario.update email: "eleanorwalker@hotmail.com"
  end
  

  test "nao deve alterar a senha de um usuario para uma senha invalida" do
    usuario = Usuario.new(nome: 'Eleanor Walker', email: "eleanor@gmail.com", telefone: "89653210",
    cpf: '368.408.980-08', password: "eleanorpassword", numero_residencia: 5, bloco_residencia: 2, isMorador: true)
    
    assert usuario.save
    
    assert_not usuario.update password: "ele"
  end


end
