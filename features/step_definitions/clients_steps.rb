Given(/^I am a guest user$/) do
end

When(/^I go to clients' page$/) do
    @client = FactoryGirl.create(:client, name: 'Cucumber')
    visit(client_path(@client.id))
end

Then(/^I must see clients' content$/) do
    expect(page).to have_content('Cucumber')
end