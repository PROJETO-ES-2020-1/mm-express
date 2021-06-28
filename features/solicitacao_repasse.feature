Feature: um morador pode geraincias suas solicitacoes de repasse
  As a Morador
  I want to cadastrar, editar e excluir uma solicitacao de repasse de encomendas
  So that eu posso gerenciar minhas solicitacoes de repasse e possa receber minhas encomendas antes da data prevista de entrega

  Scenario: Criar nova solicitacao de repasse com sucesso
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And ha um usuario cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'Sim' password 'eleanorpassword' e confirmacao de password 'eleanorpassword'
    And ha uma entrega externa cadastrada com data de chegada '2021 June 9', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker'
    And acesso a pagina de nova soliciatacao de repasse
    When preencho a data solicitada com data de solicitacao com '2021 July 15' e entrega externa com id '1'
    And clico em criar Solicitacao de repasse
    Then eu vejo a mensagem de solicitacao de repasse criada com sucesso

  Scenario: Editar solicitacao de repasse com sucesso
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And ha um usuario cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'Sim' password 'eleanorpassword' e confirmacao de password 'eleanorpassword'
    And ha uma entrega externa cadastrada com data de chegada '2021 June 9', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker'
    And ha uma solicitacao de repasse com com data de solicitacao com '2021 July 15' e entrega externa com id '1'
    And acesso a pagina de soliciatacao de repasse
    And clico em editar a solicitacao de repasse com id '1'
    When preencho a data solicitada com '2021 July 16' e entrega externa com id '1'
    And clico em atualizar Solicitacao de repasse
    Then eu vejo a mensagem de solicitacao de repasse atualizada com sucesso

  Scenario: Excluir solicitacao de repasse com sucesso
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And ha um usuario cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'Sim' password 'eleanorpassword' e confirmacao de password 'eleanorpassword'
    And ha uma entrega externa cadastrada com data de chegada '2021 June 9', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker'
    And ha uma solicitacao de repasse com com data de solicitacao com '2021 July 15' e entrega externa com id '1'
    When acesso a pagina de soliciatacao de repasse
    And clico em exlcuir a solicitacao de repasse com id '1'
    Then eu vejo a mensagem de solicitacao de repasse excluida com sucesso

  Scenario: Criar nova solicitacao de repasse com data de solicitacao invalida
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And ha um usuario cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'Sim' password 'eleanorpassword' e confirmacao de password 'eleanorpassword'
    And ha uma entrega externa cadastrada com data de chegada '2021 June 9', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker'
    And acesso a pagina de nova soliciatacao de repasse
    When preencho a data solicitada com data de solicitacao com '2021 May 10' e entrega externa com id '1'
    And clico em criar Solicitacao de repasse
    Then eu vejo a mensagem de erro ao criar solicitacao de repasse

  Scenario: Editar solicitacao de repasse com data de solicitacao invalida
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And ha um usuario cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'Sim' password 'eleanorpassword' e confirmacao de password 'eleanorpassword'
    And ha uma entrega externa cadastrada com data de chegada '2021 June 9', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker'
    And acesso a pagina de nova soliciatacao de repasse
    When preencho a data solicitada com data de solicitacao com '2021 May 12' e entrega externa com id '1'
    And clico em criar Solicitacao de repasse
    Then eu vejo a mensagem de erro ao editar solicitacao de repasse