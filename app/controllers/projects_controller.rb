class ProjectsController < ApplicationController
	before_action :require_login, only: [:new, :create]

	def index
		@projects = Project.all
		@projects = @projects.order(:end_date)
	end

	def show
		@project = Project.find(params[:id])
		@pledge = Pledge.where(project_id: params[:id])
		@owner = @project.owner
	end

	def new
		@project = Project.new
		@project.rewards.build
	end

	def create
		@project = Project.create(project_params)
		@project.image = project_params[:image]
		@project.owner = current_user

			if @project.save
			flash[:notice] = "Project Created!"
			redirect_to projects_url
		else
			flash.now[:error] = "Sorry try again!"
			render :new
		end
	end

	def search
		 @projects = Project.where('title LIKE ? OR description LIKE ?', "%#{params[:title]}%","%#{params[:description]}")
		 @projects = @projects.order(:title).page(params[:page])
	 end

# 	def edit
# 		@project = Project.find(params[:id])
# 	end
#
# 	def update
# 		@project = Project.find(params[:id])
# 		if @project.update(project_params)
# 			flash[:notice] = "Project udpated!"
# 			redirect_to @project
# 		else
# 			redirect_back_or_to @project
# 		end
# 	end
#
# 	def destroy
# 		@product = Product.find(params[:id])
# 		@product.destroy
# 		flash[:alert] = "Product deleted!"
# 		redirect_to "/products"
# #   end

	private
	def project_params
		params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image)
	end
end
