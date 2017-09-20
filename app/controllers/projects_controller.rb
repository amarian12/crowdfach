class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @chosen_projects = Project.last(3).reverse
    @popular_projects = @chosen_projects
    @last_projects = @chosen_projects
    @successful_projects = Project.where(successful: true).last(3).reverse
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find params[:id]
  end

  def create
    @project = Project.new project_params
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path }
      else
        print @project.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def update
    @project = Project.find params[:id]
    respond_to do |format|
      if @project.update project_params
        format.html { redirect_to @project, notice: 'Project was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :target,
        :category_id, :full_description, :expiration_time).merge({
          user_id: current_user.id
        })
    end
end
