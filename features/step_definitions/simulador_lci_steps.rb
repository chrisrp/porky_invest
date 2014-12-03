Dado(/^que eu esteja no simulador de LCI$/) do
  visit new_simuladores_lci_path
end

Quando(/^eu informo a taxa do cdi de "(.*?)"$/) do |taxa|
  fill_in 'simuladores_lci_taxa_di', with: taxa
end

Quando(/^"(.*?)" dias de aplicacao$/) do |dias|
  fill_in 'simuladores_lci_dias', with: dias
end

Quando(/^o valor do investimento de "(.*?)"$/) do |valor|
  fill_in 'simuladores_lci_valor', with: valor
end

Quando(/^o percentual do cdi de "(.*?)"%$/) do |percentual|
  fill_in 'simuladores_lci_percentual', with: percentual
end

Quando(/^peco para calcular$/) do
  click_button 'Calcular'
end

Entao(/^devo ver o montante de "(.*?)"$/) do |montante|
  expect(page).to have_content(montante)
end

