require 'rails_helper'

RSpec.describe "expenses/new", type: :view do
  before(:each) do
    assign(:expense, Expense.new(
      :price => "9.99",
      :description => "MyString",
      :category => "MyString"
    ))
  end

  it "renders new expense form" do
    render

    assert_select "form[action=?][method=?]", expenses_path, "post" do

      assert_select "input#expense_price[name=?]", "expense[price]"

      assert_select "input#expense_description[name=?]", "expense[description]"

      assert_select "input#expense_category[name=?]", "expense[category]"
    end
  end
end
