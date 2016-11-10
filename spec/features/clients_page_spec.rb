require 'rails_helper'
require_relative '../support/new_client_form'

feature 'clients page' do
    let(:new_client_form) { NewClientForm.new }
    let(:test_client) { FactoryGirl.create(:client) }

    def create_admin # This creates admin and automatically signs him/her in
        visit('/admins/sign_up')
        fill_in('Email', with: 'test@mail.com')
        fill_in('Password', with: 'secret')
        fill_in('Password confirmation', with: 'secret')
        click_on('Sign up')
    end

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
        create_admin
        visit('/clients')
        click_on('New Client')
        expect(page).to have_content('Home')
        expect(page).to have_content('New Client')
        expect(page).to have_content('Back')
    end
    scenario 'new client test validation' do
        create_admin
        visit('/clients')
        click_on('New Client')
        click_on('Criar Client')
        expect(page).to have_content('4 errors prohibited this client from being saved:')
        expect(page).to have_content('Name não pode estar em branco')
        expect(page).to have_content('Street address não pode estar em branco')
    end
    scenario 'add new client fail no street address' do
        create_admin
        visit('/clients')
        click_on('New Client')
        fill_in('Name', with: 'Test')
        click_on('Criar Client')
        expect(page).to have_content('3 errors prohibited this client from being saved:')
        expect(page).to have_content('Street address não pode estar em branco')
    end
    scenario 'add new client' do
        create_admin
        visit('/clients')
        click_on('New Client')
        fill_in('Name', with: 'Test')
        fill_in('Street address', with: 'Test')
        fill_in('Email', with: 'test@mail.com')
        fill_in('Phone', with: '2403456789')
        click_on('Criar Client')
        expect(page).to have_content('Client was successfully created.')
        expect(page).to have_content('Name: Test')
        expect(page).to have_content('Address: Test')
        expect(page).to have_content('Email: test@mail.com')
        expect(page).to have_content('Phone: 2403456789')
        expect(page).to have_content('City: Zipcode: Email:')
    end
    scenario 'add new client again' do # Now with NewClientForm helper
        create_admin
        new_client_form.visit_page.fill_in_with(
            {name: 'Test',
            street_address: 'Test',
            email: 'test@mail.com',
            phone: 'Test'}
        ).submit
        expect(page).to have_content('Name: Test')
        expect(page).to have_content('Address: Test')
        expect(page).to have_content('Email: test@mail.com')
        expect(page).to have_content('City: Zipcode:')
    end
    scenario 'client public page' do
        visit("/clients/#{test_client.id}")
        expect(page).to have_content('Name: TestClientName')
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