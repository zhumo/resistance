class UsersController < ApplicationController
  before_action :set_game
  before_action :set_user

  # GET /users/1
  # GET /users/1.json
  def show
    redirect_to edit_game_user_path(@game, @user) if @user.password_digest.blank?
  end

  # GET /users/1/edit
  def edit
    redirect_to [@game, @user] if @user.password_digest.present?
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [@game, @user], notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:game_id])
    end

    def set_user
      @user = @game.users.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
