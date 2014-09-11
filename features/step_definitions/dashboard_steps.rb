Dado(/^que exista uma taxa DI de "(.*?)"$/) do |taxa_di|
  FactoryGirl.create(:indice_cdi, taxa_di: taxa_di)
end

Quando(/^eu acesso o dashboard$/) do
  visit root_path
end

Entao(/^eu devo visualizar a taxa DI "(.*?)"$/) do |taxa_di|
  expect(page).to have_content(taxa_di)
end

Dado(/^que não exista uma taxa DI$/) do
  IndiceCdi.all.count == 0
end

Entao(/^eu devo visualizar a mensagem "(.*?)"$/) do |mensagem|
  expect(page).to have_content(mensagem)
end

