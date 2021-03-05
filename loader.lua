local skid_hub = Instance.new("ScreenGui")
local main_frame = Instance.new("Frame")
local topbar = Instance.new("Frame")
local title = Instance.new("TextLabel")
local container = Instance.new("Frame")
local uig = Instance.new("UIGridLayout")

skid_hub.Name = "skid_hub"
skid_hub.Parent = game.CoreGui
skid_hub.ResetOnSpawn = false

main_frame.Name = "main_frame"
main_frame.Parent = skid_hub
main_frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main_frame.BorderSizePixel = 0
main_frame.Position = UDim2.new(0.393, 0, 0.388, 0)
main_frame.Size = UDim2.new(0, 412, 0, 240)
main_frame.Active = true
main_frame.Draggable = true

topbar.Name = "topbar"
topbar.Parent = main_frame
topbar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
topbar.BorderSizePixel = 0
topbar.Size = UDim2.new(0, 412, 0, 30)

title.Name = "title"
title.Parent = topbar
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.BorderSizePixel = 0
title.Position = UDim2.new(0.024271844, 0, 0.100000001, 0)
title.Size = UDim2.new(0, 64, 0, 24)
title.Font = Enum.Font.Code
title.Text = "skid hub | ".. name()
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14.000
title.TextXAlignment = Enum.TextXAlignment.Left

container.Name = "container"
container.Parent = main_frame
container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
container.BackgroundTransparency = 1.000
container.BorderSizePixel = 0
container.Position = UDim2.new(0.0339805819, 0, 0.183333337, 0)
container.Size = UDim2.new(0, 384, 0, 182)

uig.Name = "uig"
uig.Parent = container
uig.HorizontalAlignment = Enum.HorizontalAlignment.Center
uig.SortOrder = Enum.SortOrder.LayoutOrder
uig.CellPadding = UDim2.new(0, 5, 0, 5)
uig.CellSize = UDim2.new(0, 124, 0, 25)

-- Drag

local UserInputService = game:GetService("UserInputService")
local gui = main_frame
local dragging
local dragInput
local dragStart
local startPos
local function update(input)
    local delta = input.Position - dragStart
    gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
gui.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = gui.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
gui.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

function create_btn(name, link)
	local example = Instance.new("TextButton")

	example.Name = "button"
	example.Parent = container
	example.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	example.BorderColor3 = Color3.fromRGB(70, 70, 70)
	example.Size = UDim2.new(0, 200, 0, 50)
	example.AutoButtonColor = false
	example.Font = Enum.Font.Code
	example.Text = name
	example.TextColor3 = Color3.fromRGB(255, 255, 255)
	example.TextSize = 14.000
	
	example.MouseButton1Click:Connect(function()
	    loadstring(game:HttpGet(tostring(link)))()
	end)
end

local uis = game:GetService("UserInputService")

uis.InputBegan:Connect(function(inp)
    if inp.KeyCode == Enum.KeyCode.Home then
        skid_hub:Destroy()
    end
end)
