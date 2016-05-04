class Api::CommentsController < ApplicationController
  protect_from_forgery except: :create

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.create(comment_params)
    render :index, status: :created
  end

  private
  def comment_params
    params.require(:data).permit(:author, :text)
  end
end
