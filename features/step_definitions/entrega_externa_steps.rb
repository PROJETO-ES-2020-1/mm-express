And("estou logado no sistema com um usuario que possui email {string} e senha {string}") do |email, senha|
  visit "/sign_in"
  fill_in "session[email]", :with => email
  fill_in "session[password]", :with => senha
  click_button "Log in"
  expect(page).to have_content(email)
end

And("acesso a pagina de criacao de nova entrega externa") do
  visit "/entrega_externas/new"
  expect(page).to have_content("New Entrega Externa")
end

When("preencho o peso com {string} remetente {string} destinatario {string} dataChegada {string} horaChegada {string} recebidoPor {string}") do |peso, remetente, destinatario, dataChegada, horaChegada, recebidoPor|
  fill_in "entrega_externa[encomenda_attributes][peso]", :with => peso
  fill_in "entrega_externa[encomenda_attributes][remetente]", :with => remetente
  select destinatario, :from => "entrega_externa[encomenda_attributes][usuario_id]"
  select dataChegada.split(" ")[2], :from => "entrega_externa_dataChegada_3i"
  select dataChegada.split(" ")[1], :from => "entrega_externa_dataChegada_2i"
  select dataChegada.split(" ")[0], :from => "entrega_externa_dataChegada_1i"

  select horaChegada.split(" ")[0], :from => "entrega_externa_horaChegada_4i"
  select horaChegada.split(" ")[1], :from => "entrega_externa_horaChegada_5i"
  fill_in "entrega_externa[recebidoPor]", :with => recebidoPor
end

When("clico em criar Entrega Externa") do
  click_button "Create Entrega externa"
end

And("clico em Create Entrega Externa") do
  click_button "Create Entrega externa"
end

Then("eu vejo a mensagem de entrega externa cadastrada criada com sucesso") do
  assert_selector("p#notice", text: "")
end

Then("eu vejo uma mensagem informando que nao foi possivel criar a entrega externa") do
  assert_selector("div#error_explanation")
  expect(page).to have_content("prohibited this entrega_externa from being saved")
end
