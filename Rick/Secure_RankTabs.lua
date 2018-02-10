local Players = game:GetService("Players")
function onPlayerAdded(player)
	while not(player.Character) do wait(); end
	
	local function Interaction(touchedObject,bodyPart)
		if (touchedObject:IsA("BasePart")) and (touchedObject:FindFirstChild("Tag")) then
			player.Character.Torso:FindFirstChild("roblox").Texture = touchedObject.Tag.Texture
		end
	end
	player.Character.Humanoid.Touched:connect(Interaction)
end
 
game.Players.PlayerAdded:connect(function(player)
	player.CharacterAdded:connect(onPlayerAdded(player))
end)

for _,player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
