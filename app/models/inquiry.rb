class Inquiry < ActiveRecord::Base
  validates :email, presence: true
  validates :subject, presence: true
  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
