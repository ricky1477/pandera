require 'rails_helper'

RSpec.describe "estimates/index", type: :view do
  before(:each) do
    assign(:estimates, [
      Estimate.create!(
        :description => "Description",
        :price => "9.99",
        :client_id => 2,
        :notes => "MyText"
      ),
      Estimate.create!(
        :description => "Description",
        :price => "9.99",
        :client_id => 2,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of estimates" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
