require 'rails_helper'

feature 'home page' do
    scenario 'home logo' do
        visit('/')
        expect(page).to have_content('Home')
        expect(page).to have_content('Clientes')
        expect(page).to have_content('Serviços')
        expect(page).to have_content('Faturas')
        expect(page).to have_content('Login')
        expect(page).to have_content('Bem vindo ao sistema de faturamento da Nice and Green Lanscaping!')
        expect(page).to have_content('Escolha o idioma')
        expect(page).to have_content('Inglês ')
        expect(page).to have_content('Português')
    end
    scenario 'switch default language to English', js: true do
        visit('/')
        find('#dynamic_select').find(:xpath, '//*[@id="dynamic_select"]/option[2]').select_option
        #find('#dynamic_select').find(:xpath, '//*[@id="dynamic_select"]/option[2]').trigger('click')
        #select('Inglês', from: 'dynamic_select')
        #a = page.find('#dynamic_select').find(:xpath, '//*[@id="dynamic_select"]/option[2]').click
        #page.save_screenshot('/Users/ricardokreyhsig/Desktop/picb.png')
        expect(page).to have_content('Home')
        expect(page).to have_content('Clients')
        expect(page).to have_content('Services')
        expect(page).to have_content('Invoices')
        expect(page).to have_content('Login')
        expect(page).to have_content('Welcome to the Nice and Green Lanscaping billing system!')
        expect(page).to have_selector('#dynamic_select', visible: true)
        #save_screenshot('/Users/ricardokreyhsig/Desktop/pic.png')
    end

end