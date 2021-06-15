Feature: EntregaInterna
    As an Funcionario 
    I want to realizar o cadastro, editar e deletar os dados de um uma entrega interna
    So that eu possa gerenciar as informacoes sobre entregas internas destinadas aos morador

    Scenario:  criar nova entrega interna
        Given ha um usuario cadastrado com nome 'administrador FAB', email 'administrador@fab.com.br', telefone '99999999', cpf '237.713.510-22', numero da residencia '1', bloco da residencia '5', isMorador 'false' password 'ADMINFAB' e confirmacao de password 'ADMINFAB' 
        And ha uma entrega externa cadastrada com data de chegada '2021,06,09', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'true' password 'eleanorpassword' e confirmacao de password 'eleanorpassword' 
        And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
        And eu acesso a pagina de listagem de encomendas
        When eu clico no link de marcar como entregue internamente a encomenda chegada em '2021 June 09' e que tem como destinatario o morador de nome 'Eleanor Walker'
        And preencho a data de entrega interna '2021 June 12', hora da entrega '15:00' e recebido por 'Maria Yeun'
        And clico no botao de criacao de entrega interna
        Then vejo uma mensagem de confirmacao de criacao da entrega interna

    Scenario:  editar dados de uma entrega interna cadastrada
        Given ha um usuario cadastrado com nome 'administrador FAB', email 'administrador@fab.com.br', telefone '99999999', cpf '237.713.510-22', numero da residencia '1', bloco da residencia '5', isMorador 'false' password 'ADMINFAB' e confirmacao de password 'ADMINFAB' 
        And ha uma entrega externa cadastrada com data de chegada '2021,06,09', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'true' password 'eleanorpassword' e confirmacao de password 'eleanorpassword' 
        And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
        And eu acesso a pagina de listagem de encomendas
        And eu clico no link de marcar como entregue internamente a encomenda chegada em '2021 June 09' e que tem como destinatario o morador de nome 'Eleanor Walker'
        And preencho a data de entrega interna '2021 June 12', hora da entrega '15:00' e recebido por 'Maria Yeun'
        And clico no botao de criacao de entrega interna
        When estou na pagina de edicao de dados de uma entrega interna que foi recebida por 'Maria Yeun'
        And preencho a data de entrega interna '2021 June 12', hora da entrega '14:00' e recebido por 'Julia Maye' 
        And clico no botao para editar os dados da entrega interna
        Then eu vejo que a entrega interna teve seus dados alterados com sucesso

    Scenario:  editar dados de uma entrega interna cadastrada
        Given ha um usuario cadastrado com nome 'administrador FAB', email 'administrador@fab.com.br', telefone '99999999', cpf '237.713.510-22', numero da residencia '1', bloco da residencia '5', isMorador 'false' password 'ADMINFAB' e confirmacao de password 'ADMINFAB' 
        And ha uma entrega externa cadastrada com data de chegada '2021,06,09', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'true' password 'eleanorpassword' e confirmacao de password 'eleanorpassword' 
        And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
        And eu acesso a pagina de listagem de encomendas
        And eu clico no link de marcar como entregue internamente a encomenda chegada em '2021 June 09' e que tem como destinatario o morador de nome 'Eleanor Walker'
        And preencho a data de entrega interna '2021 June 12', hora da entrega '15:00' e recebido por 'Maria Yeun'
        And clico no botao de criacao de entrega interna
        When clico no link para excluir uma entrega interna que foi recebida por 'Maria Yeun'
        Then eu vejo que a entrega interna recebida por 'Maria Yeun' foi excluida com sucesso

    Scenario:  criar nova entrega interna com data invalida
        Given ha um usuario cadastrado com nome 'administrador FAB', email 'administrador@fab.com.br', telefone '99999999', cpf '237.713.510-22', numero da residencia '1', bloco da residencia '5', isMorador 'false' password 'ADMINFAB' e confirmacao de password 'ADMINFAB' 
        And ha uma entrega externa cadastrada com data de chegada '2021,06,09', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'true' password 'eleanorpassword' e confirmacao de password 'eleanorpassword' 
        And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
        And eu acesso a pagina de listagem de encomendas
        When eu clico no link de marcar como entregue internamente a encomenda chegada em '2021 June 09' e que tem como destinatario o morador de nome 'Eleanor Walker'
        And preencho a data de entrega interna '2022 June 12', hora da entrega '15:00' e recebido por 'Maria Yeun'
        And clico no botao de criacao de entrega interna
        Then eu vejo uma mensagem informando que nao foi possivel realizar a operacao
    
    Scenario:  criar nova entrega interna com  hora invalida
        Given ha um usuario cadastrado com nome 'administrador FAB', email 'administrador@fab.com.br', telefone '99999999', cpf '237.713.510-22', numero da residencia '1', bloco da residencia '5', isMorador 'false' password 'ADMINFAB' e confirmacao de password 'ADMINFAB' 
        And ha uma entrega externa cadastrada com data de chegada '2021,06,09', hora de chegada '14:00' e recebido por 'Eleanor Walker', atrelada a uma encomenda de peso '5.0', remetente 'Ellen Roberts', e tendo como destinatario um morador cadastrado com nome 'Eleanor Walker', email 'eleanor@gmail.com', telefone '89653210', cpf '938.431.650-41', numero da residencia '5', bloco da residencia '2', isMorador 'true' password 'eleanorpassword' e confirmacao de password 'eleanorpassword' 
        And estou logado no sistema com um usuario que possui email 'administrador@fab.com.br' e senha 'ADMINFAB'
        And eu acesso a pagina de listagem de encomendas
        When eu clico no link de marcar como entregue internamente a encomenda chegada em '2021 June 09' e que tem como destinatario o morador de nome 'Eleanor Walker'
        And preencho a data de entrega interna '2022 June 12', hora da entrega '02:00' e recebido por 'Maria Yeun'
        And clico no botao de criacao de entrega interna
        Then eu vejo uma mensagem informando que nao foi possivel realizar a operacao


