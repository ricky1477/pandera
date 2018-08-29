require 'rails_helper'

RSpec.describe "service_types/new", type: :view do
  before(:each) do
    assign(:service_type, ServiceType.new(
      :description => "MyString"
    ))
  end

  it "renders new service_type form" do
    render

    assert_select "form[action=?][method=?]", service_types_path, "post" do

      assert_select "input#service_type_description[name=?]", "service_type[description]"
    end
  end
end
