require 'rails_helper'

RSpec.describe Facility, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:facility)).to be_valid
  end

  it "is invalid without a name" do
    facility = FactoryGirl.build(:facility, :name => nil)
    facility.valid?
    expect(facility.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a name longer than 45 characters" do
    facility = FactoryGirl.build(:facility, name: "Howard Plate#{ 'M' * 46}")
    facility.valid?
    expect(facility.errors[:name]).to include("is too long (maximum is 45 characters)")
  end

  it "is invalid with a duplicate name" do
    FactoryGirl.create(:facility, name: 'Marksman Armour')
    facility = FactoryGirl.build(:facility, name: 'Marksman Armour')
    facility.valid?
    expect(facility.errors[:name]).to include("has already been taken")
  end
end
