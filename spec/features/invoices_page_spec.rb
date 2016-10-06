require 'rails_helper'

feature 'invoices page' do
    scenario 'invoice content' do
        visit('/invoices')
        expect(page).to have_content('Home')
        expect(page).to have_content('Clientes')
        expect(page).to have_content('Serviços')
        expect(page).to have_content('Faturas')
        expect(page).to have_content('Login')
        expect(page).to have_content('Listagem de Faturas')
        expect(page).to have_content('Receivables: $')
        expect(page).to have_content('Services without invoice:')
        expect(page).to have_content('Print all invoices')
    end
    scenario 'invoice print all' do
        visit('/invoices')
        expect(page).to have_content('Home')
        click_on('Print all invoices')
        pending # Add tests once I am able to add test data to db
        expect(page).to have_content('Dawg')
    end
end