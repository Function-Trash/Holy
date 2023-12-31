function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        pcall(function()   
            tween = game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(Distance/328, Enum.EasingStyle.Linear),
                {CFrame = Pos}
            )
            if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
            tween:Play()
            if Distance <= 300 then
                tween:Cancel()  
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
            end
            _G.NoClip = true
            if _G.StopTween == true then
                _G.NoClip = false
                tween:Cancel()
            end
        end)
    end

function StopTween(Config)
        if not Config then
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.1, Enum.EasingStyle.Linear)
            tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
            tween:Play()
            _G.NoClip = false
            _G.StopTween = true
            if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(18)
            wait(.1)
            _G.StopTween = false
        end
    end

function BodyClip()
    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        local Noclip = Instance.new("BodyVelocity")
        Noclip.Name = "BodyClip"
        Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        Noclip.MaxForce = Vector3.new(100000,100000,100000)
        Noclip.Velocity = Vector3.new(0,0,0)
    end
end

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if _G.Noclip then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)



spawn(function()
    while wait() do
        pcall(function()
            if HolyTorch then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position- CFrame.new(10752.2783203125, 412.2037048339844, -9366.025390625).Position).Magnitude >= 5000 then
                        EquipWeapon("Holy Torch")
                        wait(1)
                        topos(CFrame.new(10752.2783203125, 412.2037048339844, -9366.025390625))
                        wait(1)
                        topos(CFrame.new(-11672.7392578125, 331.72320556640625, -9473.9453125))
                        wait(1)
                        topos(CFrame.new(-12133.474609375, 519.4494018554688, -10653.4150390625))
                        wait(1)
                        topos(CFrame.new(-13335.5390625, 484.8374938964844, -6983.00244140625))
                        wait(1)
                        topos(CFrame.new(-13487.16796875, 332.3781433105469, -7926.28857421875))
                    else
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(10752.2783203125, 412.2037048339844, -9366.025390625))
                    end
                end
            end
        end)
    end
end)
