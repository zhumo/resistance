class MissionsController < ApplicationController
  before_action :set_game
  before_action :set_mission

  # PATCH/PUT /missions/1
  # PATCH/PUT /missions/1.json
  def update
    respond_to do |format|
      if @mission.update(mission_params)
        format.html { redirect_to @game, notice: 'Mission was successfully updated.' }
        format.json { render :show, status: :ok, location: @mission }
      else
        format.html { redirect_to @game, notice: 'Mission update failed.' }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:game_id])
    end

    def set_mission
      @mission = @game.missions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mission_params
      params.require(:mission).permit(:status)
    end
end
