local Players = game:GetService("Players")
 
function onPlayerAdded(player)
	
	local function Interaction(touchedObject,bodyPart)
		if (touchedObject:IsA("BasePart")) and (touchedObject:FindFirstChild("Tag")) then
			player.Character.Torso:FindFirstChild("roblox").Texture = touchedObject.Tag.Texture
		end
	end
	while (not player.Character) do wait() end
	player.Character.Humanoid.Touched:connect(Interaction)
	
     print(player.Name .. " has entered the game")
end
 
 game.Players.PlayerAdded:connect(function(player)
	player.CharacterAdded:connect(onPlayerAdded)
 end)
--Call onPlayerAdded for each player already in the game
for _,player in pairs(Players:GetPlayers()) do
     onPlayerAdded(player)
end
