class Reward < ActiveRecord::Base
	belongs_to :project
	validates :description, :dollar_amount, :project, presence: true
end
