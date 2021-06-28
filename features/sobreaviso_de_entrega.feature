Feature: Um morador pode gerenciar seus sobreavisos de entrega de encomendas
    As a morador
    I want to realizar o cadastro, editar e excluir um sobreaviso de chegada de encomendas
    So that eu possa gerenciar meus avisos e definir um nível de urgência a um pacote que ainda não foi entregue externamente

    Scenario: criar um novo sobreaviso de encomendas
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    When eu acesso a pagina de criacao de sobreavisos de entrega de encomendas
    And eu preencho a data prevista para chegada com '2021 July 3' e urgencia de repasse 'Baixa'
    And clico no botao de criacao de um sobreaviso de entrega de encomenda
    Then vejo uma mensagem de confirmacao de criacao de sobreaviso de entrega de encomenda

    Scenario: editar um sobreaviso de encomendas ja criado
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    And existe um sobreaviso ja criado com data prevista para chegada com '2021 July 3' e urgencia de repasse 'Baixa'
    And eu acesso a pagina de listagem dos meus sobreavisos de entrega de encomendas
    And clico no link para editar o sobreaviso que tem data prevista de entrega '2021-06-03' e urgencia de repasse 'Baixa'
    And eu preencho a data prevista para chegada com '2021 July 1' e urgencia de repasse 'Alta'
    And clico no botao de edicao de um sobreaviso de entrega de encomenda
    Then vejo uma mensagem de confirmacao de edicao de sobreaviso de entrega de encomenda

    Scenario: deletar um sobreaviso de encomendas ja criado
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    And existe um sobreaviso ja criado com data prevista para chegada com '2021 July 3' e urgencia de repasse 'Baixa'
    When eu acesso a pagina de listagem dos meus sobreavisos de entrega de encomendas
    And clico no link para deletar o sobreaviso que tem data prevista de entrega '2021 July 3' e urgencia de repasse 'Baixa'
    Then vejo que o sobreaviso que tem data prevista de entrega '2021 July 3' e urgencia de repasse 'Baixa' ja nao esta na pagina de listagem de sobreavisos de chegada de encomendas

Scenario: criar um novo sobreaviso de encomendas com data anterior a atual
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    When eu acesso a pagina de criacao de sobreavisos de entrega de encomendas
    And eu preencho a data prevista para chegada com '2020 July 3' e urgencia de repasse 'Baixa'
    And clico no botao de criacao de um sobreaviso de entrega de encomenda
    Then vejo uma mensagem informando que nao foi possivel criar o sobreaviso de chegada de encomendas

Scenario: criar um novo sobreaviso de encomendas com data futura invalida
    Given ha um usuario de nome 'Eleanor Walker', email "eleanor@gmail.com", password "eleanorpassword", password confimation "eleanorpassword",  telefone "89653210", cpf: '938.431.650-41',  numero residencia: '5', bloco_residencia: '2' e isMorador "Sim" cadastrado por um funcionario
    And estou logado no sistema com um usuario que possui email 'eleanor@gmail.com' e senha 'eleanorpassword'
    When eu acesso a pagina de criacao de sobreavisos de entrega de encomendas
    And eu preencho a data prevista para chegada com '2022 July 3' e urgencia de repasse 'Baixa'
    And clico no botao de criacao de um sobreaviso de entrega de encomenda
    Then vejo uma mensagem informando que nao foi possivel criar o sobreaviso de chegada de encomendas

