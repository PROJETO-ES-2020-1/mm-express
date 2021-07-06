And("acesso a pagina de nova soliciatacao de repasse") do
  visit "/solicitacao_repasses/new"
end

When("preencho a data solicitada com data de solicitacao com {string} e entrega externa com id {string}") do |data, id|
  data = data.split
  select data[0], :from => "solicitacao_repasse[dataSolicitada(1i)]"
  select data[1], :from => "solicitacao_repasse[dataSolicitada(2i)]"
  select data[2], :from => "solicitacao_repasse[dataSolicitada(3i)]"

  select id, :from => "solicitacao_repasse[entrega_externa_id]", match: :first
end

When("preencho a data solicitada com {string} e entrega externa com id {string}") do |data, id|
  data = data.split
  select data[0], :from => "solicitacao_repasse[dataSolicitada(1i)]"
  select data[1], :from => "solicitacao_repasse[dataSolicitada(2i)]"
  select data[2], :from => "solicitacao_repasse[dataSolicitada(3i)]"

  select id, :from => "solicitacao_repasse[entrega_externa_id]", match: :first
end

And("clico em criar Solicitacao de repasse") do
  click_button "Create Solicitacao repasse"
end

And("ha uma solicitacao de repasse com com data de solicitacao com {string} e entrega externa com id {string}") do |data, id|
  visit "/solicitacao_repasses/new"
  data = data.split
  select data[0], :from => "solicitacao_repasse[dataSolicitada(1i)]"
  select data[1], :from => "solicitacao_repasse[dataSolicitada(2i)]"
  select data[2], :from => "solicitacao_repasse[dataSolicitada(3i)]"

  select id, :from => "solicitacao_repasse[entrega_externa_id]", match: :first
  click_button "Create Solicitacao repasse"
  assert_selector("p#notice", text: "")
end

And("acesso a pagina de soliciatacao de repasse") do
  visit "/solicitacao_repasses"
end

And("clico em editar a solicitacao de repasse com id {string}") do |id|
  first("tr", text: id).click_link("Edit")
  expect(page).to have_content("Editing Solicitacao Repass")
end

And("clico em atualizar Solicitacao de repasse") do
  click_button "Update Solicitacao repasse"
end

And("clico em exlcuir a solicitacao de repasse com id {string}") do |id|
  find("tr", text: id).click_link("Destroy")
end

Then("eu vejo a mensagem de solicitacao de repasse criada com sucesso") do
  expect(page).to have_content("was successfully created")
end

Then("eu vejo a mensagem de solicitacao de repasse atualizada com sucesso") do
  assert_selector("p#notice", text: "")
end

Then("eu vejo a mensagem de solicitacao de repasse excluida com sucesso") do
  assert_selector("p#notice", text: "")
end

Then("eu vejo a mensagem de erro ao criar solicitacao de repasse") do
  assert_selector("div#error_explanation")
  expect(page).to have_content("prohibited this solicitacao_repass from being saved")
end

Then("eu vejo a mensagem de erro ao editar solicitacao de repasse") do
  assert_selector("div#error_explanation")
  expect(page).to have_content("prohibited this solicitacao_repass from being saved")
end
