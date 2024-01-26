data = ...
kernel = data[1]
gui = data[2].gui

kernel:register("stats",function(arg)
	local run = game:GetService("RunService")
	local StatsG = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local Tick = Instance.new("TextLabel")
	local GC = Instance.new("TextLabel")
	local Uptime = Instance.new("TextLabel")
	local FPS = Instance.new("TextLabel")


	StatsG.Name = "ActiveGui"
	StatsG.Parent = gui
	StatsG.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	StatsG.BorderColor3 = Color3.fromRGB(0, 0, 0)
	StatsG.BorderSizePixel = 0
	StatsG.Size = UDim2.new(1, 0, 1, 0)
	StatsG.ZIndex = 254345

	TextLabel.Parent = StatsG
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0.100000001, 0)
	TextLabel.Size = UDim2.new(0, 100, 0, 25)
	TextLabel.Font = Enum.Font.Arial
	TextLabel.Text = "Server Stats"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true

	Tick.Name = "Tick"
	Tick.Parent = StatsG
	Tick.AnchorPoint = Vector2.new(0.5, 0.5)
	Tick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tick.BackgroundTransparency = 1.000
	Tick.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tick.BorderSizePixel = 0
	Tick.Position = UDim2.new(0, 75, 0.300000012, 0)
	Tick.Size = UDim2.new(0, 100, 0, 25)
	Tick.Font = Enum.Font.Arial
	Tick.Text = "Tick:"
	Tick.TextColor3 = Color3.fromRGB(255, 255, 255)
	Tick.TextScaled = true
	Tick.TextSize = 14.000
	Tick.TextWrapped = true

	GC.Name = "GC"
	GC.Parent = StatsG
	GC.AnchorPoint = Vector2.new(0.5, 0.5)
	GC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GC.BackgroundTransparency = 1.000
	GC.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GC.BorderSizePixel = 0
	GC.Position = UDim2.new(0, 75, 0.400000006, 0)
	GC.Size = UDim2.new(0, 100, 0, 25)
	GC.Font = Enum.Font.Arial
	GC.Text = "GCInfo:"
	GC.TextColor3 = Color3.fromRGB(255, 255, 255)
	GC.TextScaled = true
	GC.TextSize = 14.000
	GC.TextWrapped = true

	Uptime.Name = "Uptime"
	Uptime.Parent = StatsG
	Uptime.AnchorPoint = Vector2.new(0.5, 0.5)
	Uptime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Uptime.BackgroundTransparency = 1.000
	Uptime.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Uptime.BorderSizePixel = 0
	Uptime.Position = UDim2.new(0, 75, 0.5, 0)
	Uptime.Size = UDim2.new(0, 100, 0, 25)
	Uptime.Font = Enum.Font.Arial
	Uptime.Text = "Uptime:"
	Uptime.TextColor3 = Color3.fromRGB(255, 255, 255)
	Uptime.TextScaled = true
	Uptime.TextSize = 14.000
	Uptime.TextWrapped = true

	FPS.Name = "FPS"
	FPS.Parent = StatsG
	FPS.AnchorPoint = Vector2.new(0.5, 0.5)
	FPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FPS.BackgroundTransparency = 1.000
	FPS.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FPS.BorderSizePixel = 0
	FPS.Position = UDim2.new(0, 75, 0.600000024, 0)
	FPS.Size = UDim2.new(0, 100, 0, 25)
	FPS.Font = Enum.Font.Arial
	FPS.Text = "Uptime:"
	FPS.TextColor3 = Color3.fromRGB(255, 255, 255)
	FPS.TextScaled = true
	FPS.TextSize = 14.000
	FPS.TextWrapped = true

	for i,v in pairs(StatsG:GetChildren()) do
		if v.Name ~= "TextLabel" then
			v.TextScaled = false
			v.TextWrapped = false
			v.TextXAlignment = Enum.TextXAlignment.Left
			v.TextSize = 30
		end
	end

	local lastClock = tick()

	run.PostSimulation:Connect(function()
		if StatsG.Visible then
			Tick.Text = "Tick: "..tostring(tick() - lastClock)
			Uptime.Text = "Uptime: "..tostring(math.round(time()))
			GC.Text = "GCInfo: "..tostring(gcinfo())
      GC.TextColor3 = Color3.new(0,1,0):Lerp(Color3.new(1,0,0), gcinfo() / 700000) 

			lastClock = tick()
		end
	end)
	
	run.Heartbeat:Connect(function(dt)
		if StatsG.Visible then
			FPS.Text = "Server FPS: "..tostring(1 / dt)
      FPS.TextColor3 = Color3.new(1,0,0):Lerp(Color3.new(0,1,0), ((1 / dt)) / 62)
		end
	end)
end,"Shows server stats.")