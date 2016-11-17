require 'rails_helper'

RSpec.describe "estimates/new", type: :view do
  before(:each) do
    assign(:estimate, Estimate.new(
      :description => "MyString",
      :price => "9.99",
      :client_id => 1,
      :notes => "MyText"
    ))
  end

  it "renders new estimate form" do
    render

    assert_select "form[action=?][method=?]", estimates_path, "post" do

      assert_select "input#estimate_description[name=?]", "estimate[description]"

      assert_select "input#estimate_price[name=?]", "estimate[price]"

      assert_select "input#estimate_client_id[name=?]", "estimate[client_id]"

      assert_select "textarea#estimate_notes[name=?]", "estimate[notes]"
    end
  end
end
