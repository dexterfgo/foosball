json.extract! game, :id, :white_team, :black_team, :game_title, :created_at, :updated_at
json.url game_url(game, format: :json)
