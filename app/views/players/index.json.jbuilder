json.array!(@players) do |player|
  json.extract! player, :id, :name, :pos, :hometown, :latitude, :longitude, :team_id
  json.url player_url(player, format: :json)
end
