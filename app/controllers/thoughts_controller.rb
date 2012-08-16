class ThoughtsController < ApplicationController
  include ThoughtsHelper
  
  def new
    @thought = Thought.new
    @thought.author = current_user[:info][:name] if current_user
  end
  
  def create
    @thought = Thought.new params[:thought]
    if @thought.save
      redirect_to @thought
    else
      render 'new'
    end
  end
  
  def show
    @thought = Thought.find params[:id]
  end
  
  def edit
    @thought = Thought.find params[:id]
  end
  
  def update
    @thought = Thought.find params[:id]
    if @thought.update_attributes params[:thought]
      redirect_to @thought
    else
      render 'edit'
    end
  end
  
  def index
    @tags = Thought.tag_counts_on(:tags)
    if params[:tags]
      @thoughts = Thought.tagged_with params[:tags], any: true
    else
      @thoughts = Thought.all
    end
  end
  
end