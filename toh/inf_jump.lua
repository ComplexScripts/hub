local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

_G.Enabled = false

_G.JumpHeight = 50
 
function Action(Object, Function) if Object ~= nil then Function(Object) end end
 
uis.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        if _G.Enabled == true then
            Action(plr.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, _G.JumpHeight, 0)
                    end)
                end
            end)
        else
            return false
        end
    end
end)
