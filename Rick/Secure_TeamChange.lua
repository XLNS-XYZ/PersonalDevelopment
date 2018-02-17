local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Event = Instance.new("RemoteEvent", ReplicatedStorage)
Event.Name = "TeamPlayer"
----------------------------------------------------------------
local Reset = true
----------------------------------------------------------------	
local function onCreatePartFired(player,Team)
	
	player.Team = Team
	
	print ("Teamed "..(player.Name).." into "..Team.Name.. " successfully.")
	
	if Reset then
		player.Character.Humanoid.Health = 0	
		wait()
		player:LoadCharacter()
		
	end
end
 
Event.OnServerEvent:Connect(onCreatePartFired)
