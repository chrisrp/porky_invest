Dado(/^que eu esteja no cadastro de taxas cdi$/) do
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



