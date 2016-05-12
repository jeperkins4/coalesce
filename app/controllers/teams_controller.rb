class TeamsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:teams) {  Team.all }
  expose(:team, attributes: :team_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: TeamsDatatable.new(view_context) }
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    respond_to do |format|
      if team.save
        format.html { redirect_to team, notice: 'Team was successfully created.' }
        format.json { render json: team, status: ':created', location: team }
      else
        format.html { render action: 'new' }
        format.json { render json: team.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    respond_to do |format|
      if team.update(team_params)
        format.html { redirect_to team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: team.errors, status: ':unprocessable_entity' }
      end
    end
  end

  def join
    team.users << current_user
    if team.save
      format.html { redirect_to team, notice: "#{current_user.name} was successfully added to #{team.name}" }
    else
      format.html { redirect_to team }
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:name, :project_ids => [])
    end
end
