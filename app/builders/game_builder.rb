class GameBuilder
  SPIES_COUNT = {
    5 => 2,
    6 => 2,
    7 => 3,
    8 => 3,
    9 => 3,
    10 => 4
  }

  MISSION_PLAYERS_COUNT = {
    5 => [2,3,2,3,3],
    6 => [2,3,4,3,4],
    7 => [2,3,3,4,4],
    8 => [3,4,4,5,5],
    9 => [3,4,4,5,5],
    10 => [3,4,4,5,5]
  }

  class << self
    def build(game_params)
      Game.new(game_params).tap do |game|
        game.users.shuffle.first(SPIES_COUNT[game.users.length]).each do |user|
          user.identity = User::SPY_IDENTITY
        end

        5.times do |n| 
          game.missions.new(num_players: MISSION_PLAYERS_COUNT[game.users.length][n])
        end
      end
    end
  end
end
