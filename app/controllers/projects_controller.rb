class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:projects) {  Project.order(:name) }
  expose(:project, attributes: :project_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProjectsDatatable.new(view_context) }
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    respond_to do |format|
      if project.save
        format.html { redirect_to project, notice: 'Project was successfully created.' }
        format.json { render json: project, status: ':created', location: project }
      else
        format.html { render action: 'new' }
        format.json { render json: project.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    respond_to do |format|
      if project.update(project_params)
        format.html { redirect_to project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: project.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :summary, :start_date, :end_date, :description, documents_attributes: [:id, :name, :category, :media, :description, :_destroy])
    end
end
