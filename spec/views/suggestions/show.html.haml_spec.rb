require 'rails_helper'

RSpec.describe "suggestions/show", :type => :view do
  before(:each) do
    @suggestion = assign(:suggestion, Suggestion.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Suggestion Type/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Statement/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Line/)
  end
end
