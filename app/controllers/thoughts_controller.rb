class ThoughtsController < ApplicationController
  include ThoughtsHelper
  
  before_filter :editors_only, except: [:index, :show]
  before_filter :admins_only, only: [:destroy]
  
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
    @facebook_data = {}
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
      @thoughts = Thought.find :all, order: 'updated_at DESC'
    end
  end
  
  def destroy
    Thought.find(params[:id]).destroy
    redirect_to thoughts_path
  end
  
end