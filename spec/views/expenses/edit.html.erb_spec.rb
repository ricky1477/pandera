require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      :price => "9.99",
      :description => "MyString",
      :category => "MyString"
    ))
  end

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(@expense), "post" do

      assert_select "input#expense_price[name=?]", "expense[price]"

      assert_select "input#expense_description[name=?]", "expense[description]"

      assert_select "input#expense_category[name=?]", "expense[category]"
    end
  end
end
