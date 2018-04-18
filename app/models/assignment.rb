class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :course

 validates_presence_of :title, :description, :proposed_date, :deadline

   has_many :submissions, inverse_of: :assignment, dependent: :nullify
  accepts_nested_attributes_for :submissions, reject_if: :all_blank, allow_destroy: true


end
