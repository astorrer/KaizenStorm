class Facility < ActiveRecord::Base
  has_many :departments
  has_many :suggestions

  validates :name, presence: true, length: { maximum: 45 }, uniqueness: true

end
