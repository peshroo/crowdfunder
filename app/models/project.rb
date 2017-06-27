class Project < ActiveRecord::Base
	has_many :rewards
	has_many :pledges
	has_many :backers, through: :pledges, source: :user
	belongs_to :owner, class_name: 'User'
	has_many :comments

	validates :title, :description, :goal, :start_date, :end_date, presence: true

	validate :goal_must_be_above_0
	validate :project_start_date
	validate :project_end_date

	def project_start_date
		if start_date < Time.current
			errors.add(:start_date, "Start date must be in future")
		end
	end

	def project_end_date
		if end_date < start_date
			errors.add(:end_date, "End date must be after project start date")
		end
	end

	def goal_must_be_above_0
		if goal < 0
			errors.add(:goal, "Must be above 0!")
		end
	end




end
