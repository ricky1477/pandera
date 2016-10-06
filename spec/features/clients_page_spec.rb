require 'rails_helper'

feature 'clients page' do
    scenario 'client content' do
        visit('/clients')
        expect(page).to have_content('Home')
        expect(page).to have_content('Clientes')
        expect(page).to have_content('Serviços')
        expect(page).to have_content('Faturas')
        expect(page).to have_content('Login')
        expect(page).to have_content('Listagem de Clientes')
        expect(page).to have_content('New Client')
    end
    scenario 'client content' do
        visit('/clients')
        click_on('New Client')
        expect(page).to have_content('Home')
        expect(page).to have_content('New Client')
        expect(page).to have_content('Back')
    end
end