class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.commments.create(comment_params)
    if @comment.save
      flash[:notice] = "Comment Saved"
      redirect_to projects_path
    else
      render '/projects/show'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:project_id])
    if @project.comments.update(review_params)
      flash[:notice] = "Comment(s) Updated!"
      redirect_to projects_path(:project_id)
    else
      redirect_back_or_to @comment
    end
  end

  def destroy
    @project = Project.find(params[:product_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:alert] = "Comment(s) Deleted!"
    redirect_to projects_path(:project_id)
  end

  def comment_params
    params.required(:comment).permit(:input)
  end

end
