class TeamMembersController < ApplicationController
  before_action :set_user
  before_action :set_team_member

  def update
    redirect_to :back, notice: "Incorrect Password" unless @user.authenticate(params[:password])
    respond_to do |format|
      if @team_member.update(team_member_params)
        format.html { redirect_to [@user.game, @user], notice: 'Mission was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_member }
      else
        format.html { render :edit }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_team_member
      @team_member = @user.team_memberships.find(params[:id])
    end

    def team_member_params
      params.require(:team_member).permit(:result)
    end
end
