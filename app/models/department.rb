class Department < ActiveRecord::Base
  belongs_to :facility

  validates :name, presence: true, length: { maximum: 45 }, uniqueness: true
  validates :facility_id, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000 }

end
