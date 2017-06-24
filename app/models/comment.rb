class Comment<ApplicationRecord
  belongs_to :project
  

  validates :input, presence: true
end
