class User < ActiveRecord::Base
	authenticates_with_sorcery!

	has_many :projects
	
	validates :password, length: { minimum: 8 }, on: :create
	validates :password, confirmation: true, on: :create
	validates :password_confirmation, presence: true, on: :create
	validates :email, uniqueness: true

	ALLOWED_ROLES = ["user", "owner"]
end
