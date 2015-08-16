require 'spec_helper'

feature 'Criacao usuarios', :type => :feature do
  scenario 'criando um novo usuário' do
    visit '/usuarios/new'

    fill_in 'Nome', with: 'chris'
    fill_in 'Email', with: 'chris@teste2.com'
    fill_in 'Password', with: '1234'
    fill_in 'Confirmation', with: '1234'

    click_button 'Criar conta'

    expect(page).to have_text('Usuário: chris')
    expect(page).to have_text('Conta criada com sucesso!!')
  end
end
