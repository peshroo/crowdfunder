class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validate :valid_user

  def valid_user
    if self.user == project.owner
      errors.add(:user, "Can't pledge to your own project")
    end
  end
end
