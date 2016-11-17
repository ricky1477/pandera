require 'rails_helper'

RSpec.describe "estimates/show", type: :view do
  before(:each) do
    @estimate = assign(:estimate, Estimate.create!(
      :description => "Description",
      :price => "9.99",
      :client_id => 2,
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
