require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

	def test_creating_a_comment
		@project = Project.find(params[:project_id(1)])
		@comment = @project.commments.create(comment_params)

	end
end
