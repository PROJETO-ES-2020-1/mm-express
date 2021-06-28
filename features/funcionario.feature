Feature: Usuario
  As an Funcionario
  I want to realizar o cadastro, editar e deletar os dados de um usuario do tipo Morador
  So that eu possa gerenciar suas entregas internas e externas

  Scenario:  criar novo usuario
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And eu acesso a pagina de criacao de usuario
    When preencho o nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim"
    And clico no botao para cadastro do usuario
    Then eu vejo que usuario que possui email "eleanor@gmail.com" foi criado com sucesso

  Scenario:  editar dados de um usuario cadastrado
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And ha um usuario cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'Sim' password 'eleanorpassword' e confirmacao de password 'eleanorpassword'
    And eu acesso a pagina que lista todos os usuarios cadastrados
    When estou na pagina de edicao de dados do usuario que possui email "eleanor@gmail.com"
    And preencho o nome 'Eleanor Lince', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '358.941.590-83',  numero residencia: '4', bloco_residencia: '9' e isMorador "Sim"
    And clico no botao para editar os dados do usuario
    Then eu vejo que usuario que possui email "eleanor@gmail.com" foi editado com sucesso

  Scenario:  deletar um usuario cadastrado
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And ha um usuario cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'Sim' password 'eleanorpassword' e confirmacao de password 'eleanorpassword'
    When eu acesso a pagina que lista todos os usuarios cadastrados
    And clico no link para excluir o usuario que possui o email 'eleanor@gmail.com'
    Then eu vejo que usuario que possui email "eleanor@gmail.com" nao esta na lista de usuarios cadastrados

  Scenario:  criar novo usuario com o campo de cpf invalido
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And eu acesso a pagina de criacao de usuario
    When preencho o nome 'Eleanor Lince', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '123.456.789-10',  numero residencia: '4', bloco_residencia: '9' e isMorador "Sim"
    And clico no botao para cadastro do usuario
    Then eu vejo uma mensagem informando que nao foi possivel criar o usuario

  Scenario:  criar um usuario com um email ja cadastrado
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And ha um usuario cadastrado com nome 'Eleanor Walker', email 'elle@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'Sim' password 'eleanorpassword' e confirmacao de password 'eleanorpassword'
    And eu acesso a pagina de criacao de usuario
    When preencho o nome 'Ellen Roberts', email "elle@gmail.com", password "ellenpassword", password confimation "ellenpassword",  telefone "95432014", cpf: '938.431.650-41',  numero residencia: '9', bloco_residencia: '6' e isMorador "Sim"
    And clico no botao para cadastro do usuario
    Then eu vejo uma mensagem informando que nao foi possivel criar o usuario
