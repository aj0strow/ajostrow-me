class ProjectsController < ApplicationController
  
  before_filter :admins_only, except: [:show, :index]
  
  def index
    @projects = Project.find :all, order: 'finished_at desc'
  end
  
  def show
    @project = Project.find params[:id]
  end
  
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new params[:project]
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
    
      
  def edit
    @project = Project.find params[:id]
  end  

  def update
    @project = Project.find params[:id]
    if @project.update_attributes params[:project]
      redirect_to @project
    else
      render 'edit'
    end
  end
  
  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path
  end
  

  
  
end
