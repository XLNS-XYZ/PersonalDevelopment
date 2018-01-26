local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Event = Instance.new("RemoteEvent", ReplicatedStorage)
Event.Name = "TeamPlayer"

local Reset = true
 
local function onCreatePartFired(player,Team)
	print ("Teamed "..(player.Name).." into "..Team.Name)
	
	if Reset then
		player.Character.Humanoid.Health = 0	
	end
	
	player.Team = Team
end
 
Event.OnServerEvent:Connect(onCreatePartFired)
