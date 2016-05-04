class Api::CommentsController < ApplicationController
  protect_from_forgery except: :create
  before_action :set_comments

  def index
  end

  def create
    if Comment.create!(comment_params)
      render :index, status: :created
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_comments
    @comments = Comment.all
  end

  def comment_params
    params.require(:data).permit(:author, :text)
  end
end
