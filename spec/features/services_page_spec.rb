require 'rails_helper'

feature 'services page' do
    scenario 'services content' do
        visit('/services')
        expect(page).to have_content('Home')
        expect(page).to have_content('Clientes')
        expect(page).to have_content('Serviços')
        expect(page).to have_content('Faturas')
        expect(page).to have_content('Login')
        expect(page).to have_content('Listagem de Serviços')
    end
end