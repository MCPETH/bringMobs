local plr = game:GetService("Players").LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
getgenv().loop = true

game:GetService('RunService').Stepped:connect(function()
if loop then
plr.Character.Humanoid:ChangeState(11)
end
end)

local function warpmob(Onemob, Namemob)
    wait(.1)
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == Namemob then
            if (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <= 160 then
                v.HumanoidRootPart.CFrame = Onemob
            end
        end
    end
end

while loop do wait()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Bandit [Lv. 5]" then
            local countHealthmob = v.Humanoid.MaxHealth / 100 * 75
            v.HumanoidRootPart.Size = Vector3.new(35,35,35)
            v.HumanoidRootPart.Transparency = 0.8
            repeat wait()
                plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)

                VirtualUser:CaptureController()
                VirtualUser:ClickButton1(Vector2.new(828, 810), CFrame.new(Vector3.new(0, 0, 0)))
                if v.Humanoid.Health <= countHealthmob then
                    warpmob(v.HumanoidRootPart.CFrame, "Bandit [Lv. 5]")
                end
            until v.Humanoid.Health <= 0 or not loop
        end
    end
    end
