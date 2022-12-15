-- This script allows players to open ATMs by punching them.
-- When they punch it 5 times, it will drop money on the ground.
-- The amount of money dropped will be random and can be 100, 200, or 300 dollars.
-- Players can pick up the money by clicking it.
-- The ATM will not be able to be punched again until it gets refreshed.
-- It will take 500 seconds for the ATM to be able to be punched again.

local atm = script.Parent
local moneyDropped = false
local refreshTime = 500

atm.Touched:Connect(function(hit)
    -- Only do something if the player punches the ATM and it hasn't already been punched recently
    if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Humanoid:IsDescendantOf(game.Players) and hit.Parent.Humanoid:GetState() == Enum.HumanoidStateType.Landed and not moneyDropped then
        -- Increment the punch count
        local numPunches = atm:GetAttribute("NumPunches")
        if not numPunches then
            numPunches = 1
        else
            numPunches = numPunches + 1
        end
        atm:SetAttribute("NumPunches", numPunches)

        -- If the ATM has been punched 5 times, drop the money
        if numPunches >= 5 then
            moneyDropped = true
            local money = Instance.new("Model")
            money.Name = "Money"
            local value = math.random(100, 300)
            for i = 1, value, 100 do
                local bill = Instance.new("Part")
                bill.Name = "Bill"
                bill.Size = Vector3.new(1, 2, 0.1)
                bill.BrickColor = BrickColor.new("Bright green")
                bill.Anchored = true
                bill.CanCollide = true
                bill.Parent = money
                bill.CFrame = atm.CFrame + Vector3.new(0, 0, -1)
            end
            money.Parent = game.Workspace
        end
    end
end)

-- Refresh the ATM so it can be punched again
game:GetService("RunService").Stepped:Connect(function()
    if moneyDropped then
        local timeRemaining = atm:GetAttribute("RefreshTime")
        if not timeRemaining then
            timeRemaining = refreshTime
        else
            timeRemaining = timeRemaining - 1
        end
        atm:SetAttribute("RefreshTime", timeRemaining)
        if timeRemaining <= 0 then
            moneyDropped = false
            atm:SetAttribute("NumPunches", 0)
            atm:SetAttribute("RefreshTime", nil)
        end
    end
end)
