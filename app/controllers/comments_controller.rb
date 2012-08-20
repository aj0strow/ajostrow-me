class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new params[:comment]
    respond_to do |format|
      if @comment.save
        redirect_to thoughts_path
      else
        redirect_to root_path
      end
    end
  end
  
end