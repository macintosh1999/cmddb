local data = ...
local kernel = data[1]
local gui = data[2].gui
local vmObj = Instance.new("ImageLabel")
local run = game:GetService("RunService")
local updRemote = Instance.new("RemoteEvent",gui)
local receive = Instance.new("RemoteEvent",owner.Character)

receive.Name = "ReceiveGui"
updRemote.Name = "UpdateVMouse"

kernel:register("vminit", function(arg)
	vmObj.Name = "VMouse"
	vmObj.Size = UDim2.new(0,50,0,50)
	vmObj.BackgroundTransparency = 1
	vmObj.Image = "rbxassetid://442141180"
	vmObj.AnchorPoint = Vector2.new(0.5,0.5)
	vmObj.ZIndex = 25
	vmObj.Parent = gui


	receive:FireClient(owner,gui)

	updRemote.OnServerEvent:Connect(function(player,x,y)
		vmObj.Position = UDim2.new(0,x,0,y)
	end)

	NLS([[
	local gui
	local vm
	local run = game:GetService("RunService")
	local rm = owner.Character.ReceiveGui
	local upd
	local mouse = owner:GetMouse()
	local uis = game:GetService("UserInputService")

	rm.OnClientEvent:Connect(function(g)
		gui = g
		vm = gui.VMouse
		upd = gui.UpdateVMouse
	end)

	run.RenderStepped:Connect(function()
		if vm then
			upd:FireServer(mouse.X,mouse.Y)
		end
	end)
	]])
end,"Initializes the virtual mouse.")