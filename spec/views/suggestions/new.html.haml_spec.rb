require 'rails_helper'

RSpec.describe "suggestions/new", :type => :view do
  before(:each) do
    assign(:suggestion, Suggestion.new(
      :completed => false,
      :verified => false,
      :meets_theme => false,
      :funded => false,
      :suggestion_type => "MyString",
      :status => "MyString",
      :statement => "MyString",
      :facility_id => 1,
      :department_id => 1,
      :reviewed => false,
      :current_state => "MyText",
      :ideal_state => "MyText",
      :benefits => "MyText",
      :line => "MyString"
    ))
  end

  it "renders new suggestion form" do
    render

    assert_select "form[action=?][method=?]", suggestions_path, "post" do

      assert_select "input#suggestion_completed[name=?]", "suggestion[completed]"

      assert_select "input#suggestion_verified[name=?]", "suggestion[verified]"

      assert_select "input#suggestion_meets_theme[name=?]", "suggestion[meets_theme]"

      assert_select "input#suggestion_funded[name=?]", "suggestion[funded]"

      assert_select "input#suggestion_suggestion_type[name=?]", "suggestion[suggestion_type]"

      assert_select "input#suggestion_status[name=?]", "suggestion[status]"

      assert_select "input#suggestion_statement[name=?]", "suggestion[statement]"

      assert_select "input#suggestion_facility_id[name=?]", "suggestion[facility_id]"

      assert_select "input#suggestion_department_id[name=?]", "suggestion[department_id]"

      assert_select "input#suggestion_reviewed[name=?]", "suggestion[reviewed]"

      assert_select "textarea#suggestion_current_state[name=?]", "suggestion[current_state]"

      assert_select "textarea#suggestion_ideal_state[name=?]", "suggestion[ideal_state]"

      assert_select "textarea#suggestion_benefits[name=?]", "suggestion[benefits]"

      assert_select "input#suggestion_line[name=?]", "suggestion[line]"
    end
  end
end
