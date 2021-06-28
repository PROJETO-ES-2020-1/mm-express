Feature: EntregaExterna
  As an Funcionario
  I want to realizar cadastrar uma nova entrega externa
  So that eu possa gerenciar entregas externas

  Scenario: criar nova entrega externa com sucesso
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And acesso a pagina de criacao de nova entrega externa
    When preencho o peso com '1.1' remetente 'jose henrique' destinatario 'administrador FAB' dataChegada '2021 June 15' horaChegada '12 30' recebidoPor 'funcionario jose'
    And clico em criar Entrega Externa
    Then eu vejo a mensagem de entrega externa cadastrada criada com sucesso

  Scenario: criar entrega externa vazia
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And acesso a pagina de criacao de nova entrega externa
    When clico em Create Entrega Externa
    Then eu vejo uma mensagem informando que nao foi possivel criar a entrega externa

  Scenario: criar nova entrega externa com peso negativo
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And acesso a pagina de criacao de nova entrega externa
    When preencho o peso com '-1.1' remetente 'jose henrique' destinatario 'administrador FAB' dataChegada '2021 June 15' horaChegada '12 30' recebidoPor 'funcionario jose'
    And clico em Create Entrega Externa
    Then eu vejo uma mensagem informando que nao foi possivel criar a entrega externa

  Scenario: criar nova entrega externa com remetente com apenas 2 caracteres
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And acesso a pagina de criacao de nova entrega externa
    When preencho o peso com '1.1' remetente 'jo' destinatario 'administrador FAB' dataChegada '2021 June 15' horaChegada '12 30' recebidoPor 'funcionario jose'
    And clico em Create Entrega Externa
    Then eu vejo uma mensagem informando que nao foi possivel criar a entrega externa

  Scenario: criar nova entrega externa com data superior a data atual
    Given ha um usuario do tipo funcionario cadastrado com nome "administrador FAB", email "administrador@fab.com.br", password "ADMINFAB", telefone '98654123', cpf '237.713.510-22', numero_residencia '1', bloco_residencia '1'
    And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
    And acesso a pagina de criacao de nova entrega externa
    When preencho o peso com '1.1' remetente 'jose henrique' destinatario 'administrador FAB' dataChegada '2022 June 15' horaChegada '12 30' recebidoPor 'funcionario jose'
    And clico em Create Entrega Externa
    Then eu vejo uma mensagem informando que nao foi possivel criar a entrega externa
