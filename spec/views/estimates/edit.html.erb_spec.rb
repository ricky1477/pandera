require 'rails_helper'

RSpec.describe "estimates/edit", type: :view do
  before(:each) do
    @estimate = assign(:estimate, Estimate.create!(
      :description => "MyString",
      :price => "9.99",
      :client_id => 1,
      :notes => "MyText"
    ))
  end

  it "renders the edit estimate form" do
    render

    assert_select "form[action=?][method=?]", estimate_path(@estimate), "post" do

      assert_select "input#estimate_description[name=?]", "estimate[description]"

      assert_select "input#estimate_price[name=?]", "estimate[price]"

      assert_select "input#estimate_client_id[name=?]", "estimate[client_id]"

      assert_select "textarea#estimate_notes[name=?]", "estimate[notes]"
    end
  end
end
