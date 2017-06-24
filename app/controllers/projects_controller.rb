class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]


  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

  def show
    @project = Project.find(params[:id])
    @pledge = Pledge.where(project_id: params[:id])
    @owner = @project
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.create(project_params)
    @project.owner = current_user
    
      if @project.save
      flash[:notice] = "Project Created!"
      redirect_to projects_url
    else
      flash.now[:error] = "Sorry try again!"
      render :new
    end
  end

#   def edit
#   @product = Project.find(params[:id])
# end
#
#   def update
#     @project = Project.find(params[:id])
#     if @product.update(product_params)
#       flash[:notice] = "Product udpated!"
#       redirect_to @product
#     else
#       redirect_back_or_to @product
#     end
#   end
#
#   def destroy
#     @product = Product.find(params[:id])
#     @product.destroy
#     flash[:alert] = "Product deleted!"
#     redirect_to "/products"
#   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image)
  end
end
