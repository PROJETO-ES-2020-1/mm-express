Feature: Usuario
    As a morador
    I want to editar meus dados cadastrados, visualizar meus dados cadastrados e excluir minha conta
    So that Eu possa gerenciar minhas informacoes no sistema
  
  Scenario: editar os dados cadastrados na minha conta
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    When eu acesso a pagina de edicao da conta que tem nome "Eleanor Walker" e email "eleanor@gmail.com"
    And preencho os novos dados com nome 'Eleanor Lince', email "eleanorlince@gmail.com", password "eleanorpassword", password confimation "eleanorpassword", telefone "89653210", cpf: '987.447.370-33', numero residencia: '4', bloco_residencia: '9'
    And clico no botao para editar os dados do usuario
    Then eu vejo que usuario que possui email "eleanorlince@gmail.com" foi editado com sucesso

  Scenario: deletar minha conta
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    When acesso a pagina de gerenciamento da minha conta
    And clico no link para excluir o usuario que possui o email 'eleanor@gmail.com'

  Scenario: visualizar os dados cadastrados na minha conta
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    When acesso a pagina de gerenciamento da minha conta
    And clico no link para visualizar em detalhes os dados da minha conta que tem email cadastrado "eleanor@gmail.com"
    Then eu vejo meus dados de nome 'Eleanor Walker', email "eleanor@gmail.com", telefone "89653210", cpf: '938.431.650-41', numero residencia: '5', bloco_residencia: '2'

  Scenario: editar o cpf cadastrado na minha conta com um cpf invalido
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    When eu acesso a pagina de edicao da conta que tem nome "Eleanor Walker" e email "eleanor@gmail.com"
    And preencho os novos dados com nome 'Eleanor Lince', email "eleanorlince@gmail.com", password "eleanorpassword", password confimation "eleanorpassword", telefone "89653210", cpf: '123.456.789-10', numero residencia: '4', bloco_residencia: '9'
    And clico no botao para editar os dados do usuario
    Then eu vejo uma mensagem informando que nao foi possivel atualizar meus dados cadastrados

  Scenario: editar o email cadastrado na minha conta com um email ja utilizado por outra conta
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And ha um usuario de nome 'Ellen Roberts', email "elle@gmail.com", password "ellenpassword", password confimation "ellenpassword",  telefone "98562145", cpf: '987.447.370-33',  numero residencia: '4', bloco_residencia: '1' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    When eu acesso a pagina de edicao da conta que tem nome "Eleanor Walker" e email "eleanor@gmail.com"
    And preencho os novos dados com nome 'Eleanor Lince', email "elle@gmail.com", password "eleanorpassword", password confimation "eleanorpassword", telefone "89653210", cpf: '123.456.789-10', numero residencia: '4', bloco_residencia: '9'
    And clico no botao para editar os dados do usuario
    Then eu vejo uma mensagem informando que nao foi possivel atualizar meus dados cadastrados