class GameBuilder
  SPIES_COUNT = {
    5 => 2,
    6 => 2,
    7 => 3,
    8 => 3,
    9 => 3,
    10 => 4
  }

  class << self
    def build(game_params)
      Game.new(game_params).tap do |game|
        game.users.shuffle.first(SPIES_COUNT[game.users.length]).each do |user|
          user.identity = User::SPY_IDENTITY
        end
      end
    end
  end
end
