local c = 1

function num(x)
   return math.acos(math.cos(x * math.pi)) / math.pi
end

game:GetService("RunService").RenderStepped:Connect(function()
    for i, v in pairs(workspace.Camera:GetDescendants()) do
        if v.Name == "Left Arm" or v.Name == "Right Arm" then
            -- nope
        else
            for i, z in pairs(v:GetDescendants()) do
                if z:IsA("BasePart") then
                    z.Material = Enum.Material.ForceField
                    z.Color = Color3.fromHSV(num(c), 1, 1)
                    c = c + 0.0001
                end 
            end
        end
    end
end)
