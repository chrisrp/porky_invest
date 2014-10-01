Dado(/^que eu esteja no cadastro de taxas cdi$/) do
  pending 'disabilitado até ter o login'
    visit new_indice_cdi_path
end

Quando(/^eu informo a taxa "(.*?)"$/) do |taxa_di|
   fill_in "indice_cdi_taxa_di", with: taxa_di
end

Quando(/^data "(.*?)"$/) do |data|
  fill_in 'indice_cdi_data', with: data
end

Quando(/^gravo a informação$/) do
   click_button 'Gravar'
end

Entao(/^eu devo ser redirecionado para a página de taxas$/) do
  expect(current_path).to eql indice_cdi_index_path
end

Entao(/^visualizar a taxa "(.*?)" da data "(.*?)"$/) do |taxa, data|
 expect(page).to have_content(taxa)
 expect(page).to have_content(data)
end

Dado(/^que eu não tenha taxas cadastradas$/) do
    expect(IndiceDiario.all.count).to eql 0
end

Quando(/^eu visito a lista de taxas$/) do
   visit indice_diario_index_path
end

Dado(/^que eu tenha taxas cadastradas$/) do
   FactoryGirl.create(:indice_diario)
end

Entao(/^eu não devo visualizar a mensagem "(.*?)"$/) do |mensagem|
  expect(page).not_to have_content(mensagem)
end

