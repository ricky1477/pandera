class NewClientForm
    include Capybara::DSL

    def visit_page
        visit('/clients')
        click_on('New Client')
        self
    end

    def fill_in_with(params = {})
        fill_in('Name', with: params.fetch(:name))
        fill_in('Street address', with: params.fetch(:street_address))
        fill_in('Email', with: params.fetch(:email))
        fill_in('Phone', with: params.fetch(:phone))
        self
    end

    def submit
        click_on('Criar Client')
        self
    end

end
