local plr = game.Players.LocalPlayer

_G.Speed = 100
_G.Jump = 150

if _G.Speed and _G.Jump then
    while wait() do
        plr.Character.Humanoid.WalkSpeed = _G.Speed
        plr.Character.Humanoid.JumpPower = _G.Jump
    end
end
