local Teams = game.Teams:GetChildren();

	function CheckEligible(Team)
		local Group = (Team:FindFirstChild("ID"));
		local Rank = (Team:FindFirstChild("Rank"));
		
		local IsInGroup;
		local IsRanked;
		
		if Group then
			IsInGroup = game.Players.LocalPlayer:IsInGroup(Group.Value)
			
			if Rank then
			   IsRanked = (game.Players.LocalPlayer:GetRankInGroup(Group.Value)== Rank.Value)
			end
		end
		
		if (Group and Rank) then
			return IsRanked
		elseif (Group and not Rank) then
			return IsInGroup
		elseif (not Group) then
			return true
		else
			return false
		end
		
	end
for i = 1, #Teams do
	if Teams[i].Name ~= "Prison" then
		
	
	local Button = Instance.new("TextButton");
	Button.Size = UDim2.new(0.8,0,0,40)
	Button.AnchorPoint = Vector2.new(0.5,0);
	Button.Position = UDim2.new(0.5,0,0,i*50)
	
	Button.BorderSizePixel = 0
	Button.BackgroundTransparency = 0
	Button.BackgroundColor3 = Teams[i].TeamColor.Color


	Button.TextScaled = true
	Button.Text = Teams[i].Name
	Button.TextColor3 = Color3.new(1,1,1)
	
	if CheckEligible(Teams[i]) then
		Button.BackgroundTransparency = 0
		Button.Active = true
	else
		Button.BackgroundTransparency = 0.5
		Button.Active = false
		
		local Indicator = Instance.new("BoolValue")
		Indicator.Name = "NotElligable"
		Indicator.Parent = Button
		
		local NO = Instance.new("ImageLabel");
		NO.Position = UDim2.new(0.5,0,0.5,0)
		NO.BackgroundTransparency = 1
		NO.AnchorPoint = Vector2.new(0.5,0.5);
		NO.Size = UDim2.new(1,0,1,0);
		NO.SizeConstraint = 2 --ENUM
		NO.Image = "http://www.roblox.com/asset/?id=294186207"
		NO.Parent = Button
	end
	

	Button.MouseButton1Click:connect(function()
  		if CheckEligible(Teams[i])then			
			print "Requested to change team."
			game:GetService("ReplicatedStorage"):WaitForChild("TeamPlayer"):FireServer(Teams[i])
		end
	end)
	
	Button.Parent = script.Parent.HoldingFrame.LogoBar.TeamFrame.SF
	end
 
end

local Status = false 
