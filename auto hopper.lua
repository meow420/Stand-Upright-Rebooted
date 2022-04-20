local Player = game:GetService("Players").LocalPlayer
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local button = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MenuGUI").Play
local RS = game:GetService("RunService")
RS.Heartbeat:Connect(function()
    if #workspace.Items:GetChildren() == 0 then
        game:GetService("TeleportService"):Teleport(8540168650, game:GetService("Players").LocalPlayer)
        return
    end
end)
repeat
    wait()
    local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
    for i,v in pairs(events) do
        for i,v in pairs(getconnections(button[v])) do
            v:Fire()
        end
    end
until game.Players.LocalPlayer.PressedPlay.Value == true

function itemFarm()
    spawn(function()
        while wait() do
            if #workspace.Items:GetChildren() ~= 0 then         --Check if size is not 0
                for i,v in pairs(workspace.Items:GetChildren()) do
                    local a = v.Handle.Position
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Handle.Position + Vector3.new(0,12,0))
                    repeat wait() until v.Parent == game.Players.LocalPlayer.Character
                    wait(0.1)
                end 
            end
        end
    end)
end

spawn(function()
    UIS.WindowFocused:Connect(function()
        if getgenv().DisableRendering == true then
            RS:Set3dRenderingEnabled(true)
        end)
    end
    UIS.WindowFocusReleased:Connect(function()
        RS:Set3dRenderingEnabled(false)
    end)
end 
wait(1)
itemFarm()