Given("ha um usuario de nome {string}, email {string}, password {string}, password confimation {string},  telefone {string}, cpf: {string},  numero residencia: {string}, bloco_residencia: {string} e isMorador {string} cadastrado por um funcionario") do |nome, email, password, password_confirmation, telefone, cpf, num_residencia, bloco_residencia, isMorador|
  Usuario.create(nome: "administrador FAB", email: "administrador@fab.com.br", password: "ADMINFAB", telefone: "99999999", cpf: "237.713.510-22", numero_residencia: 1, bloco_residencia: 1, isMorador: false)

  visit "/sign_in"
  fill_in "session[email]", :with => "administrador@fab.com.br"
  fill_in "session[password]", :with => "ADMINFAB"
  click_button "Log in"

  visit "/usuarios/new"
  expect(page).to have_current_path("/usuarios/new")

  fill_in "usuario[nome]", :with => nome
  fill_in "usuario[email]", :with => email
  fill_in "usuario[telefone]", :with => telefone
  fill_in "usuario[cpf]", :with => cpf
  fill_in "usuario[numero_residencia]", :with => num_residencia.to_i
  fill_in "usuario[bloco_residencia]", :with => bloco_residencia.to_i
  fill_in "usuario[password]", :with => password
  fill_in "usuario[password_confirmation]", :with => password_confirmation
  select isMorador, :from => "usuario[isMorador]"

  click_button "Create Usuario"
  expect(page).not_to have_content("prohibited this usuario from being saved")

  click_link "Log out"
end

When("eu acesso a pagina de criacao de sobreavisos de entrega de encomendas") do
  visit "/sobreaviso_de_entregas/new"
  expect(page).to have_content("New Sobreaviso De Entrega")
end

And("eu preencho a data prevista para chegada com {string} e urgencia de repasse {string}") do |dataPrevistaChegada, urgenciaRepasse|
  select dataPrevistaChegada.split(" ")[0], :from => "sobreaviso_de_entrega[data_prevista_entrega(1i)]" # ano
  select dataPrevistaChegada.split(" ")[1], :from => "sobreaviso_de_entrega[data_prevista_entrega(2i)]" # mes
  select dataPrevistaChegada.split(" ")[2], :from => "sobreaviso_de_entrega[data_prevista_entrega(3i)]" # mes

  select urgenciaRepasse, :from => "sobreaviso_de_entrega[urgencia_de_repasse]"
end

And ("clico no botao de criacao de um sobreaviso de entrega de encomenda") do
  click_button "Create Sobreaviso de entrega"
end

Then ("vejo uma mensagem de confirmacao de criacao de sobreaviso de entrega de encomenda") do
  expect(page).to have_content("Sobreaviso de entrega was successfully created")
end

And ("existe um sobreaviso ja criado com data prevista para chegada com {string} e urgencia de repasse {string}") do |dataPrevistaChegada, urgenciaRepasse|
  visit "/sobreaviso_de_entregas/new"
  expect(page).to have_content("New Sobreaviso De Entrega")

  select dataPrevistaChegada.split(" ")[0], :from => "sobreaviso_de_entrega[data_prevista_entrega(1i)]" # ano
  select dataPrevistaChegada.split(" ")[1], :from => "sobreaviso_de_entrega[data_prevista_entrega(2i)]" # mes
  select dataPrevistaChegada.split(" ")[2], :from => "sobreaviso_de_entrega[data_prevista_entrega(3i)]" # mes

  select urgenciaRepasse, :from => "sobreaviso_de_entrega[urgencia_de_repasse]"

  click_button "Create Sobreaviso de entrega"
  expect(page).to have_content("Sobreaviso de entrega was successfully created")
end

And ("clico no link para editar o sobreaviso que tem data prevista de entrega {string} e urgencia de repasse {string}") do |dataPrevistaChegada, urgenciaRepasse|
  find("tr", text: dataPrevistaChegada, text: urgenciaRepasse).click_link("Edit")
  expect(page).to have_content("Editing Sobreaviso De Entrega")
end

And ("eu acesso a pagina de listagem dos meus sobreavisos de entrega de encomendas") do
  visit "/sobreaviso_de_entregas"
  expect(page).to have_content("Sobreaviso De Entregas")
end

And ("clico no botao de edicao de um sobreaviso de entrega de encomenda") do
  click_button "Update Sobreaviso de entrega"
end

Then ("vejo uma mensagem de confirmacao de edicao de sobreaviso de entrega de encomenda") do
  expect(page).to have_content("Sobreaviso de entrega was successfully updated")
end

And("clico no link para deletar o sobreaviso que tem data prevista de entrega {string} e urgencia de repasse {string}") do |dataPrevistaChegada, urgenciaRepasse|
  find("tr", text: dataPrevistaChegada, text: urgenciaRepasse).click_link("Destroy")
end

Then ("vejo que o sobreaviso que tem data prevista de entrega {string} e urgencia de repasse {string} ja nao esta na pagina de listagem de sobreavisos de chegada de encomendas") do |dataPrevistaChegada, urgenciaRepasse|
  expect(page).not_to have_content(dataPrevistaChegada)
  expect(page).not_to have_content(urgenciaRepasse)
end
Then ("vejo uma mensagem informando que nao foi possivel criar o sobreaviso de chegada de encomendas") do
  assert_selector("div#error_explanation")
  expect(page).to have_content("prohibited this sobreaviso_de_entrega from being saved")
end
