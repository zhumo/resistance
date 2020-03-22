class MissionTeamsController < ApplicationController
  before_action :set_game
  before_action :set_mission_team, only: [:show]

  # GET /mission_teams/1
  # GET /mission_teams/1.json
  def show
  end

  # GET /mission_teams/new
  def new
    @mission_team = @game.mission_teams.new.tap do |mission_team|
      @game.users.each do |user|
        mission_team.team_members.new(user: user)
      end
    end
  end

  # POST /mission_teams
  # POST /mission_teams.json
  def create
    @mission_team = @game.mission_teams.new(mission_team_params)

    respond_to do |format|
      if @mission_team.save
        format.html { redirect_to [@game, @mission_team], notice: 'Mission team was successfully created.' }
        format.json { render :show, status: :created, location: @mission_team }
      else
        format.html { render :new }
        format.json { render json: @mission_team.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_game
      @game = Game.find(params[:game_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_mission_team
      @mission_team = @game.mission_teams.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mission_team_params
      params.require(:mission_team).permit(team_members_attributes: [:user_id])
    end
end
