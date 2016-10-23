require 'rails_helper'
require_relative '../support/new_client_form'

feature 'clients page' do
    let(:new_client_form) { NewClientForm.new }

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
    scenario 'new client content' do
        visit('/clients')
        click_on('New Client')
        expect(page).to have_content('Home')
        expect(page).to have_content('New Client')
        expect(page).to have_content('Back')
    end
    scenario 'new client test validation' do
        visit('/clients')
        click_on('New Client')
        click_on('Criar Client')
        expect(page).to have_content('2 errors prohibited this client from being saved:')
        expect(page).to have_content('Name não pode estar em branco')
        expect(page).to have_content('Street address não pode estar em branco')
    end
    scenario 'add new client fail no street address' do
        visit('/clients')
        click_on('New Client')
        fill_in('Name', with: 'Test')
        click_on('Criar Client')
        expect(page).to have_content('1 error prohibited this client from being saved:')
        expect(page).to have_content('Street address não pode estar em branco')
    end
    scenario 'add new client' do
        visit('/clients')
        click_on('New Client')
        fill_in('Name', with: 'Test')
        fill_in('Street address', with: 'Test')
        click_on('Criar Client')
        expect(page).to have_content('Name: Test')
        expect(page).to have_content('Address: Test')
        expect(page).to have_content('City: Zipcode: Email: Phone:')
    end
    scenario 'add new client again' do # Now with NewClientForm helper
        new_client_form.visit_page.fill_in_with(
            {name: 'Test',
            street_address: 'Test'}
        ).submit
        expect(page).to have_content('Name: Test')
        expect(page).to have_content('Address: Test')
        expect(page).to have_content('City: Zipcode: Email: Phone:')
    end
    scenario 'client public page' do
        client = Client.create(name: 'Test', street_address: 'Test')
        visit("/clients/#{client.id}")
        expect(page).to have_content('Name: Test')
    end
    scenario 'client public page with factory' do
        client = FactoryGirl.create(:client)
        visit("/clients/#{client.id}")
        expect(page).to have_content('Name: TestClient')
    end
    scenario 'client list public page with factory and CSS' do
        clients = FactoryGirl.create_list(:client, 4)
        visit("/clients")
        expect(page).to have_css('a' , text: 'Details')
    end
    scenario 'test client#index' do
        client = FactoryGirl.create(:client)
        visit("/clients")
        expect(page).to have_content(client.name)
        expect(page).to have_content(client.street_address)
        expect(page).to have_content(client.email)
    end

end