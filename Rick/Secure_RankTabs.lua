local Players = game:GetService("Players")
function onPlayerAdded(player)
	print"1"
	while not(player.Character) do wait();print"2" end
	
	local function Interaction(touchedObject,bodyPart)
		if (touchedObject:IsA("BasePart")) and (touchedObject:FindFirstChild("Tag")) then
			print"3"
			player.Character.Torso:FindFirstChild("roblox").Texture = touchedObject.Tag.Texture
		end
	end
	player.Character.Humanoid.Touched:connect(Interaction)
end
 
game.Players.PlayerAdded:connect(function(player)
	print("Tag module loaded for "..player.Name)
	player.CharacterAdded:connect(onPlayerAdded(player))
end)

for _,player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
