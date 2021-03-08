local c = 1 

function num(x)
   return math.acos(math.cos(x * math.pi)) / math.pi
end

game:GetService("RunService").RenderStepped:Connect(function()
    for i, v in pairs(workspace.Camera.Arms:GetDescendants()) do
        if v:IsA("MeshPart") then
            v.Material = Enum.Material.ForceField
            v.Color = Color3.fromHSV(num(c), 1, 1)
            c = c + 0.0001
        end
    end
end)
