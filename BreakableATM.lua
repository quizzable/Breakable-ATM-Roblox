local ATM = script.Parent
local PunchCount = 0

ATM.Touched:Connect(function(hit)
  if hit.Parent:FindFirstChild("Humanoid") and hit.Parent:FindFirstChild("RightHand") then
    PunchCount += 1
    if PunchCount >= 5 then
      ATM.Transparency = 0
      local dropMoney = Instance.new("Part")
      dropMoney.Name = "Money"
      dropMoney.Size = Vector3.new(1,1,1)
      dropMoney.Anchored = true
      dropMoney.CanCollide = false
      dropMoney.CFrame = ATM.CFrame
      dropMoney.Parent = ATM
      dropMoney.Touched:Connect(function(hit)
        if hit.Parent:FindFirstChild("Humanoid") then
          local randomMoney = math.random(100, 200)
          hit.Parent.Player.Money.Value += randomMoney
          dropMoney:Destroy()
        end
      end)
    end
  end
end)

wait(500)
ATM.Transparency = 1
ATM.CanCollide = true
PunchCount = 0
