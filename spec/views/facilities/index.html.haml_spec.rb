require 'rails_helper'

RSpec.describe "facilities/index", :type => :view do
  before(:each) do
    assign(:facilities, [
      Facility.create!(
        :name => Faker::Company.name
      ),
      Facility.create!(
        :name => Faker::Company.name
      )
    ])
  end

  it "renders a list of facilities" do
    render
    assert_select "tr>td", :count => 8
  end
end
