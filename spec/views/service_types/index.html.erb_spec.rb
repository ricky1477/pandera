require 'rails_helper'

RSpec.describe "service_types/index", type: :view do
  before(:each) do
    assign(:service_types, [
      ServiceType.create!(
        :description => "Description"
      ),
      ServiceType.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of service_types" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
