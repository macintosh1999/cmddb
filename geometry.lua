local data = ...
local kernel = data[1]
local gui = data[2].gui
local shapeIds = {
	["square"] = "rbxassetid://6884453656",
	["triangle"] = "rbxassetid://2866597030",
	["circle"] = "rbxassetid://12201347372",
	["bananacat"] = "rbxassetid://5009915795"
}
local currentshape = "square"
local img

kernel:register("geometry", function(arg)
	local Geometry = Instance.new("Frame")
	local Shape = Instance.new("ImageLabel")

	Geometry.Name = "ActiveGui"
	Geometry.Parent = gui
	Geometry.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	Geometry.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Geometry.BorderSizePixel = 0
	Geometry.Size = UDim2.new(1, 0, 1, 0)
	Geometry.ZIndex = 254345

	Shape.Name = "Shape"
	Shape.Parent = Geometry
	Shape.Active = true
	Shape.AnchorPoint = Vector2.new(0.5, 0.5)
	Shape.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Shape.BackgroundTransparency = 1.000
	Shape.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Shape.BorderSizePixel = 0
	Shape.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shape.Selectable = true
	Shape.Size = UDim2.new(0, 100, 0, 100)
	Shape.Image = shapeIds[currentshape]
	
	img = Shape
end,"Starts up the geometry package.")

kernel:register("change", function(arg)
	local str = string.lower(arg)

    print(shapeIds[str])
	
	if shapeIds[str] then
		img.Image = shapeIds[str]
	end
end,"Changes the image of the shape.")

kernel:register("rotate", function(arg)
	local deg = tonumber(arg)
	
	if deg then
		img.Rotation = deg
	end
end,"Rotates the shape a set amount of degrees.")