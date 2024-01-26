
local data = ...
local kernel = data[1]

kernel:warn("Commands:")
kernel:warn("announce")
kernel:warn("kill")

kernel:register("announce",function(arg)
	local tokick = arg

	for i,player in pairs(game.Players:GetChildren()) do
		if string.sub(player.Name,1,#tokick) == tokick then
			player.Character.Humanoid.Health = 0
		end
	end
end,"Kills a player.")

kernel:register("announce",function(arg)
	for i,v in pairs(game.Players:GetPlayers()) do
		local Announcement = Instance.new("ScreenGui")
		local Message = Instance.new("TextLabel")
		local UICorner = Instance.new("UICorner")

		Announcement.Name = "Announcement"
		Announcement.Parent = v.PlayerGui
		Announcement.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		Message.Name = "Message"
		Message.Parent = Announcement
		Message.AnchorPoint = Vector2.new(0.5, 0.5)
		Message.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
		Message.BackgroundTransparency = 0.500
		Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Message.BorderSizePixel = 0
		Message.Position = UDim2.new(0.5, 0, 0.078, 0)
		Message.Size = UDim2.new(0.800000072, 0, 0, 50)
		Message.Font = Enum.Font.SourceSans
		Message.Text = arg
		Message.TextColor3 = Color3.fromRGB(255, 255, 255)
		Message.TextScaled = true
		Message.TextSize = 14.000
		Message.TextWrapped = true

		UICorner.Parent = Message

		game.Debris:AddItem(Announcement,5)

    Message.MaxVisibleGraphemes = 1
		for i = 1,string.len(arg) do
			Message.MaxVisibleGraphemes += 1
			task.wait()
		end
	end
end,"Announces a message to the server.")