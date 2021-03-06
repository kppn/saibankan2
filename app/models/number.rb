# == Schema Information
#
# Table name: numbers
#
#  id         :integer          not null, primary key
#  project_id :integer
#  val        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Number < ActiveRecord::Base
  belongs_to :project
  has_many :allocations, dependent: :destroy
  has_many :users, through: :allocations
  has_many :markings, dependent: :destroy
  has_many :marks, through: :markings

  validates_with NumberValidator
end
