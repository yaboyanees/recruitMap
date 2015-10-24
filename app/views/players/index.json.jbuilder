json.array!(@players) do |player|
  json.extract! player, :id, :name, :pos, :hometown, :city, :state, :latitude, :longitude, :team
  json.url player_url(player, format: :json)
end
