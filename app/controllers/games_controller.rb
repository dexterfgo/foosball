class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :fetch_player_list, only: [:new, :create, :edit, :update]
  

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    setup_parameters()

    respond_to do |format|
      if @game.save
        save_individual_player_results()
        format.html { redirect_to @game, notice: 'Game was successfully saved.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def fetch_player_list
      @all_players = Player.all
      if (@all_players.count < 2)
       redirect_to players_url, notice: 'You need more than one unique registered player to start a game.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:game_title)
    end

    def setup_parameters
      @game.white_team_first_player = Player.find(params[:white_team_first_player][:white_team_first_player_id]) if (params[:white_team_first_player][:white_team_first_player_id].present?)
      @game.white_team_second_player = Player.find(params[:white_team_second_player][:white_team_second_player_id]) if (params[:white_team_second_player][:white_team_second_player_id].present?)
      @game.black_team_first_player = Player.find(params[:black_team_first_player][:black_team_first_player_id]) if (params[:black_team_first_player][:black_team_first_player_id].present?)
      @game.black_team_second_player = Player.find(params[:black_team_second_player][:black_team_second_player_id]) if (params[:black_team_second_player][:black_team_second_player_id].present?)
      @game.result = params[:result][:result_id]
    end

    def save_individual_player_results
      # Save White Team First Player VS Opponents
      PlayerResult.create(game: @game, player: @game.white_team_first_player, teammate: @game.white_team_second_player, team: 1, opponent: @game.black_team_first_player, won: (@game.result == 1))
      PlayerResult.create(game: @game, player: @game.white_team_first_player, teammate: @game.white_team_second_player, team: 1, opponent: @game.black_team_second_player, won: (@game.result == 1)) if @game.black_team_second_player.present?

      # Save White Team Second Player VS Opponents
      if (@game.white_team_second_player.present?)
        PlayerResult.create(game: @game, player: @game.white_team_second_player, teammate: @game.white_team_first_player, team: 1, opponent: @game.black_team_first_player, won: (@game.result == 1))
        PlayerResult.create(game: @game, player: @game.white_team_second_player, teammate: @game.white_team_first_player, team: 1, opponent: @game.black_team_second_player, won: (@game.result == 1)) if @game.black_team_second_player.present?
      end

      # Save Black Team First Player VS Opponents
      PlayerResult.create(game: @game, player: @game.black_team_first_player, teammate: @game.black_team_second_player, team: 1, opponent: @game.white_team_first_player, won: (@game.result == 2))
      PlayerResult.create(game: @game, player: @game.black_team_first_player, teammate: @game.black_team_second_player, team: 1, opponent: @game.white_team_second_player, won: (@game.result == 2)) if @game.white_team_second_player.present?

      if (@game.black_team_second_player.present?)
        PlayerResult.create(game: @game, player: @game.black_team_second_player, teammate: @game.black_team_first_player, team: 1, opponent: @game.white_team_first_player, won: (@game.result == 2))
        PlayerResult.create(game: @game, player: @game.black_team_second_player, teammate: @game.black_team_first_player, team: 1, opponent: @game.white_team_second_player, won: (@game.result == 2)) if @game.white_team_second_player.present?
      end
    end

 
end
