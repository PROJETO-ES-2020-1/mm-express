
And("eu acesso a pagina de criacao de usuario") do
  visit "/usuarios/new"
  expect(page).to have_content("New Usuario")
end

And("eu acesso a pagina que lista todos os usuarios cadastrados") do
  visit "/usuarios"
  expect(page).to have_content("Usuarios")
end

When("estou na pagina de edicao de dados do usuario que possui email {string}") do |email|
  find("tr", text: email).click_link("Editar")
  expect(page).to have_content("Editing Usuario")
end

When("clico no link para excluir o usuario que possui o email {string}") do |email|
  find("tr", text: email).click_link("Excluir")
end

When("preencho o nome {string}, email {string}, password {string}, password confimation {string},  telefone {string}, cpf: {string},  numero residencia: {string} e bloco_residencia: {string}") do |nome, email, password, passwordConfirmation, telefone, cpf, numero_residencia, bloco_residencia|
  fill_in "usuario[nome]", :with => nome
  fill_in "usuario[email]", :with => email
  fill_in "usuario[password]", :with => password
  fill_in "usuario[password_confirmation]", :with => passwordConfirmation
  fill_in "usuario[telefone]", :with => telefone
  fill_in "usuario[cpf]", :with => cpf
  fill_in "usuario[numero_residencia]", :with => numero_residencia.to_i
  fill_in "usuario[bloco_residencia]", :with => bloco_residencia.to_i
end

And("clico no botao para cadastro do usuario") do
  click_button "Create Usuario"
end

And("clico no botao para editar os dados do usuario") do
  click_button "Update Usuario"
end

Then("eu vejo que usuario que possui email {string} foi criado com sucesso") do |email|
  expect(page).to have_content(email)
end

Then("eu vejo que usuario que possui email {string} foi editado com sucesso") do |email|
  expect(page).to have_content("Usuario was successfully updated")
  expect(page).to have_content(email)
end

Then("eu vejo que usuario que possui email {string} nao esta na lista de usuarios cadastrados") do |email|
  expect(page).not_to have_content(email)
end

Then("eu vejo uma mensagem informando que nao foi possivel realizar a operacao") do
  assert_selector("div#error_explanation")
end