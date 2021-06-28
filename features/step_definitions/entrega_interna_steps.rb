And("ha uma adm") do
  usuario = Usuario.create(nome: "administrador FAB", email: "administrador@fab.com.br", password: "ADMINFAB", telefone: "99999999", cpf: "237.713.510-22", numero_residencia: 1, bloco_residencia: 1, isMorador: false)
end

And("ha uma entrega externa cadastrada com data de chegada {string}, hora de chegada {string} e recebido por {string}, atrelada a uma encomenda de peso {string}, remetente {string}, e tendo como destinatario um morador cadastrado com nome {string}") do |data_chegada, hora_chegada, recebido_por, peso, remetente, nome_morador|
  visit "/entrega_externas/new"
  expect(page).to have_current_path("/entrega_externas/new")

  fill_in "entrega_externa[encomenda_attributes][peso]", :with => peso
  fill_in "entrega_externa[encomenda_attributes][remetente]", :with => remetente
  select nome_morador, :from => "entrega_externa[encomenda_attributes][usuario_id]"

  select data_chegada.split(" ")[0], :from => "entrega_externa_dataChegada_1i" # ano
  select data_chegada.split(" ")[1], :from => "entrega_externa_dataChegada_2i" # mes
  select data_chegada.split(" ")[2], :from => "entrega_externa_dataChegada_3i" # dia

  select hora_chegada.split(":")[0], :from => "entrega_externa_horaChegada_4i"
  select hora_chegada.split(":")[1], :from => "entrega_externa_horaChegada_5i"
  fill_in "entrega_externa[recebidoPor]", :with => recebido_por

  click_button "commit"

  expect(page).to have_content("Entrega externa was successfully created")
end

And("eu acesso a pagina de listagem de encomendas") do
  visit "/encomendas"
  expect(page).to have_content("Encomendas")
end

When("estou na pagina de edicao de dados de uma entrega interna que foi recebida por {string}") do |nome|
  visit "/entrega_internas"
  find("tr", text: nome).click_link("Edit")
end

When("clico no link para excluir uma entrega interna que foi recebida por {string}") do |nome|
  visit "/entrega_internas"
  find("tr", text: nome).click_link("Destroy")
end

And("eu acesso a pagina que lista todas as entregas internas") do
  visit "/entrega_internas"
  expect(page).to have_content("Entrega Internas")
end

When("eu clico no link de marcar como entregue internamente a encomenda chegada em {string} e que tem como destinatario o morador de nome {string}") do |data, nomeMorador|
  find("tr", text: data, text: nomeMorador).click_link("Marcar como entregue")
  expect(page).to have_content("New Entrega Interna")
end

And("preencho a data de entrega interna {string}, hora da entrega {string} e recebido por {string}") do |data, hora, recebidoPor|
  data = data.split()
  select data[0], :from => "entrega_interna[data_entrega(1i)]"
  select data[1], :from => "entrega_interna[data_entrega(2i)]"
  select data[2], :from => "entrega_interna[data_entrega(3i)]"

  hora = hora.split(":")
  select hora[0], :from => "entrega_interna[hora_recebida(4i)]"
  select hora[1], :from => "entrega_interna[hora_recebida(5i)]"

  fill_in "entrega_interna[recebido_por]", :with => recebidoPor
end

And("clico no botao de criacao de entrega interna") do
  click_button "Create Entrega interna"
end

And("clico no botao para editar os dados da entrega interna") do
  click_button "Update Entrega interna"
end

Then ("vejo uma mensagem de confirmacao de criacao da entrega interna") do
  expect(page).to have_content("Entrega interna was successfully created")
end

Then ("eu vejo que a entrega interna teve seus dados alterados com sucesso") do
  expect(page).to have_content("Entrega interna was successfully updated")
end

Then("eu vejo que a entrega interna recebida por {string} foi excluida com sucesso") do |nome|
  expect(page).not_to have_content(nome)
end
