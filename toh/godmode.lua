local plr = game.Players.LocalPlayer.Character

if plr:FindFirstChild("KillScript") then
	plr.KillScript:Destroy() else return nil
end
