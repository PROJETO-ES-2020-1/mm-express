When("eu acesso a pagina de edicao da conta que tem nome {string} e email {string}") do |nome, email|
  visit "/usuarios"
  find("tr", text: nome, text: email).click_link("Editar")
  expect(page).to have_content("Editing Usuario")
end

When("acesso a pagina de gerenciamento da minha conta") do
  visit "/usuarios"
  expect(page).to have_current_path("/usuarios")
end

When("preencho os novos dados com nome {string}, email {string}, password {string}, password confimation {string}, telefone {string}, cpf: {string}, numero residencia: {string}, bloco_residencia: {string}") do |nome, email, password, passwordConfirmation, telefone, cpf, numero_residencia, bloco_residencia|
  fill_in "usuario[nome]", :with => nome
  fill_in "usuario[email]", :with => email
  fill_in "usuario[password]", :with => password
  fill_in "usuario[password_confirmation]", :with => passwordConfirmation
  fill_in "usuario[telefone]", :with => telefone
  fill_in "usuario[cpf]", :with => cpf
  fill_in "usuario[numero_residencia]", :with => numero_residencia.to_i
  fill_in "usuario[bloco_residencia]", :with => bloco_residencia.to_i
end

And("clico no link para visualizar em detalhes os dados da minha conta que tem email cadastrado {string}") do |email|
  find("tr", text: email).click_link("Visualizar")
end

Then("eu vejo meus dados de nome {string}, email {string}, telefone {string}, cpf: {string}, numero residencia: {string}, bloco_residencia: {string}") do |nome, email, telefone, cpf, num_residencia, bloco_residencia|
  expect(page).to have_content(nome)
  expect(page).to have_content(email)
  expect(page).to have_content(telefone)
  expect(page).to have_content(cpf)
  expect(page).to have_content(num_residencia)
  expect(page).to have_content(bloco_residencia)
end

Then("eu vejo uma mensagem informando que nao foi possivel atualizar meus dados cadastrados") do
  assert_selector("div#error_explanation")
  expect(page).to have_content("prohibited this usuario from being saved")
end
