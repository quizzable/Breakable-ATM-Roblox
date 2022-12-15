-- Read, ReadME.md to know how to set this up

local wallet = script.Parent

-- Set the initial value of the wallet to 0
wallet.Value = 0

-- Save the wallet value when the player leaves or dies
game.Players.PlayerRemoving:Connect(function(player)
    local wallet = player:FindFirstChild("Wallet")
    if wallet then
        wallet:SetAttribute("SavedValue", wallet.Value)
    end
end)
game.Players.PlayerAdded:Connect(function(player)
    local wallet = player:FindFirstChild("Wallet")
    if wallet then
        local savedValue = wallet:GetAttribute("SavedValue")
        if savedValue then
            wallet.Value = savedValue
        end
    end
end)
