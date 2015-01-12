require 'rails_helper'

RSpec.describe "suggestions/index", :type => :view do
  before(:each) do
    assign(:suggestions, [
      Suggestion.create!(
        :completed => false,
        :verified => false,
        :meets_theme => false,
        :funded => false,
        :suggestion_type => "Suggestion Type",
        :status => "Status",
        :statement => "Statement",
        :facility_id => 1,
        :department_id => 2,
        :reviewed => false,
        :current_state => "MyText",
        :ideal_state => "MyText",
        :benefits => "MyText",
        :line => "Line"
      ),
      Suggestion.create!(
        :completed => false,
        :verified => false,
        :meets_theme => false,
        :funded => false,
        :suggestion_type => "Suggestion Type",
        :status => "Status",
        :statement => "Statement",
        :facility_id => 1,
        :department_id => 2,
        :reviewed => false,
        :current_state => "MyText",
        :ideal_state => "MyText",
        :benefits => "MyText",
        :line => "Line"
      )
    ])
  end

  it "renders a list of suggestions" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Suggestion Type".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Statement".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Line".to_s, :count => 2
  end
end
