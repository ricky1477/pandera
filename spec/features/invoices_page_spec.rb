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
    scenario 'invoice#index' do
        client = FactoryGirl.create(:client)
        service = FactoryGirl.create(:service, client_id: client.id)
        sa = FactoryGirl.create(:shipping_address)
        invoice = FactoryGirl.create(:invoice, client_id: client.id)
        visit('/invoices')
        expect(page).to have_content(client.name)
        expect(page).to have_content(invoice.invoice_number)
        expect(page).to have_content(invoice.total)
        expect(page).to have_content(invoice.paid)
    end
    scenario 'invoice print all' do
        client = FactoryGirl.create(:client)
        service = FactoryGirl.create(:service, client_id: client.id)
        sa = FactoryGirl.create(:shipping_address)
        invoice = FactoryGirl.create(:invoice, client_id: client.id)
        visit('/invoices')
        expect(page).to have_content('Home')
        click_on('Print all invoices')
        expect(page).to have_content(sa.name)
        expect(page).to have_content(sa.street)
        expect(page).to have_content(sa.city)
        expect(page).to have_content(sa.state)
        expect(page).to have_content(sa.zipcode)
        expect(page).to have_content(client.name)
        expect(page).to have_content(client.street_address)
        expect(page).to have_content(client.city)
        expect(page).to have_content(client.zipcode)
        expect(page).to have_content('Services')
        expect(page).to have_content('Invoice')
        expect(page).to have_content(service.description)
        expect(page).to have_content(service.date)
        expect(page).to have_content(service.date)
        expect(page).to have_content(invoice.invoice_number)
        expect(page).to have_content(invoice.total)
    end
end