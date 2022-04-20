getgenv().itemFarm = false;
getgenv().autoStand = false;
getgenv().useChargedArrows = false;
getgenv().standItemFarm = false;

--[[
    Stands:
    Aerosmith                       = Aerosmith
    Crazy Diamond                   = CrazyDiamond
    Cream                           = Cream
    Dirty Deeds Done Dirt Cheap     = D4C
    Diver Down                      = DiverDown
    Gold Experience                 = GE
    Hierophant Green                = HG
    Jotaro's Star Platinum          = JotarosStarPlatinum
    Killer Queen                    = KillerQueen
    King Crimson                    = KC
    Premier Macho                   = PM
    Purple Smoke                    = PurpleHaze
    Silver Chariot                  = SilverChariot
    Silver Chariot OVA              = SCOVA
    Star Platinum : Stone Ocean     = StarPlatinumStoneOcean
    Star Platinum                   = StarPlatinum
    Star Platinum OVA               = SPOVA
    Sticky Fingers                  = StickyFingers 
    Stone Free                      = StoneFree
    The Emperor                     = TheEmperor
    The Hand                        = TheHand
    The World                       = TheWorld
    The World OVA                   = TWOVA
    The World : Alternate Universe  = TWAU
    Tusk Act 1                      = TA1
    Whitesnake                      = WhiteSnake
    Dio's The World                 = DTW
]]
_G.stands = {
    "TA1",
    "DTW",
    "SPOVA",
    "JotarosStarPlatinum",
    "TWOVA",
}
--[[
    Attributes:
    Godly       =     Godly
    Manic       =     Manic
    Tragic      =     Tragic
    Daemon      =     Daemon
    Invincible  =     Invincible
]]
_G.attributes = {
    "Legendary",
    "Tragic",
    "Invincible",
    "Daemon",
}

--ts:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(1),{["CFrame"]=workspace.Items:FindFirstChild("Stand Arrow")})

--// Services
local TweenService = game:GetService("TweenService")

--// Variables

--// Functions

--/ Item Farm Function
function itemFarm()
    spawn(function()
        while wait() do
            if not getgenv().itemFarm then break end
            if #workspace.Items:GetChildren() ~= 0 then         --Check if size is not 0
                for i,v in pairs(workspace.Items:GetChildren()) do
                    if not getgenv().itemFarm then break end
                    repeat wait() until v.Parent == game.Players.LocalPlayer.Character
                    wait(0.1)
                end 
            end
        end
    end)
end

--// Auto Stand Function
function autoStand()
    spawn(function()
        local used = false 
        local usedroka = false 
        local level = true
        if not getgenv().autoStand then return end 
        while wait(0.4) do
            level = true
            if game.Players.LocalPlayer.Data.Stand.Value == "None" then
                if not getgenv().autoStand then return end 
                if getgenv().useChargedArrows == true and not used then
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do    -- Check if already equipped
                        if v.Name == "Charged Arrow" and not used then
                            if not getgenv().autoStand then return end 
                            v.Use:FireServer()
                            used = true
                        end 
                    end
                    if not used and game.Players.LocalPlayer.Backpack:FindFirstChild("Charged Arrow") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Charged Arrow").Parent = game.Players.LocalPlayer.Character
                        wait(0.4)
                        if not getgenv().autoStand then return end
                        game.Players.LocalPlayer.Character:FindFirstChild("Charged Arrow").Use:FireServer();
                        used = true
                    end 
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do    -- Check if already equipped
                        if v.Name == "Charged Arrow" and not used then
                            warn("not enough level to use arrow!")
                            v.Parent = game.Players.LocalPlayer.Backpack
                            level = false
                        end 
                    end
                    if not used and not level then warn("no charged arrows!") end
                end 
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do   --Check if already equipped
                    if v.Name == "Stand Arrow" and not used then
                        if not getgenv().autoStand then return end 
                        game.Players.LocalPlayer:FindFirstChild("Stand Arrow").Use:FireServer()
                        used = true
                    end
                end
                if not used and game.Players.LocalPlayer.Backpack:FindFirstChild("Stand Arrow") then
                    game.Players.LocalPlayer.Backpack:FindFirstChild("Stand Arrow").Parent = game.Players.LocalPlayer.Character
                    wait(0.5)
                    if not getgenv().autoStand then return end 
                    game.Players.LocalPlayer.Character:FindFirstChild("Stand Arrow").Use:FireServer()
                    used = true
                end 
                if not used then warn("no stand arrows!") end 
                for i,v in pairs(_G.stands) do
                    if game.Players.LocalPlayer.Data.Stand.Value == v then
                        print("has selected stand!")
                        return 
                    end
                end 
                for i,v in pairs(_G.attributes) do 
                    if game.Players.LocalPlayer.Data.Attri.Value == v then
                        print("has selected attribute!")
                        return 
                    end 
                end 
                if not getgenv().autoStand then return end 
            else
                for i,v in pairs(_G.stands) do
                    if game.Players.LocalPlayer.Data.Stand.Value == v then
                        print("has selected stand!")
                        return 
                    end
                end 
                for i,v in pairs(_G.attributes) do 
                    if game.Players.LocalPlayer.Data.Attri.Value == v then
                        print("has selected attribute!")
                        return 
                    end 
                end 
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                    if v.Name == "Rokakaka" and not usedroka then
                        if not getgenv().autoStand then return end 
                        v.Use:FireServer()
                        usedroka = true
                    end 
                end 
                if not usedroka then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka") then 
                        if not getgenv().autoStand then return end 
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka").Parent = game.Players.LocalPlayer.Character 
                        wait(0.4)
                        if not getgenv().autoStand then return end 
                        game.Players.LocalPlayer.Character:FindFirstChild("Rokakaka").Use:FireServer();
                        usedroka = true
                    else
                        warn("no rokas!")
                        return
                    end 
                end 
                if not usedroka then 
                    warn("no rokas!") 
                    return 
                end
                usedroka = false
                used = false
                if not getgenv().autoStand then return end 
            end
        end
    end)
end

function standItemFarm()
    spawn(function()
        local standFarm = false
        local itemFarm = false
        local level = true
        local used = false
        while wait(0.4) do
            if not getgenv().standItemFarm then break end
            if #workspace.Items:GetChildren() ~= 0 and not standFarm then         --Check if size is not 0
                itemFarm = true
                for i,v in pairs(workspace.Items:GetChildren()) do
                    if not getgenv().standItemFarm then break end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Handle.Position + Vector3.new(0,12,0))
                    repeat wait() until v.Parent == game.Players.LocalPlayer.Character
                    wait(0.1)
                end 
                itemFarm = false
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                    if v:IsA("Tool") then v.Parent = game.Players.LocalPlayer.Backpack end 
                end 
                wait(0.5)
            end
            level = true
            if game.Players.LocalPlayer.Data.Stand.Value == "None" and not itemFarm then
                standFarm = true          --set standFarm to true
                if not getgenv().standItemFarm then return end 
                if getgenv().useChargedArrows == true and not used then
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do    -- Check if already equipped
                        if v.Name == "Charged Arrow" and not used then
                            if not getgenv().standItemFarm then return end 
                            v.Use:FireServer()
                            used = true
                        end 
                    end
                    if not used and game.Players.LocalPlayer.Backpack:FindFirstChild("Charged Arrow") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Charged Arrow").Parent = game.Players.LocalPlayer.Character
                        wait(0.4)
                        if not getgenv().standItemFarm then return end
                        game.Players.LocalPlayer.Character:FindFirstChild("Charged Arrow").Use:FireServer();
                        used = true
                    end 
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do    -- Check if already equipped
                        if v.Name == "Charged Arrow" and not used then
                            warn("not enough level to use arrow!")
                            v.Parent = game.Players.LocalPlayer.Backpack
                            level = false
                        end 
                    end
                    if not used and not level then warn("no charged arrows!") end
                end 
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do   --Check if already equipped
                    if v.Name == "Stand Arrow" and not used and standFarm then
                        if not getgenv().standItemFarm then return end 
                        game.Players.LocalPlayer:FindFirstChild("Stand Arrow").Use:FireServer()
                        used = true
                    end
                end
                if not used and game.Players.LocalPlayer.Backpack:FindFirstChild("Stand Arrow") and standFarm then
                    game.Players.LocalPlayer.Backpack:FindFirstChild("Stand Arrow").Parent = game.Players.LocalPlayer.Character
                    wait(0.5)
                    if not getgenv().standItemFarm then return end 
                    game.Players.LocalPlayer.Character:FindFirstChild("Stand Arrow").Use:FireServer()
                    used = true
                end 
                if not used then
                    warn("no stand arrows!") 
                    standFarm = false
                end 
                for i,v in pairs(_G.stands) do
                    if game.Players.LocalPlayer.Data.Stand.Value == v then
                        print("has selected stand!")
                        standFarm = false
                    end
                end 
                for i,v in pairs(_G.attributes) do 
                    if game.Players.LocalPlayer.Data.Attri.Value == v then
                        print("has selected attribute!")
                        standFarm = false
                    end 
                end 
                if not getgenv().standItemFarm then return end 
            else
                for i,v in pairs(_G.stands) do
                    if game.Players.LocalPlayer.Data.Stand.Value == v then
                        print("has selected stand!")
                        standFarm = false
                    end
                end 
                for i,v in pairs(_G.attributes) do 
                    if game.Players.LocalPlayer.Data.Attri.Value == v then
                        print("has selected attribute!")
                        standFarm = false
                    end 
                end 
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
                    if v.Name == "Rokakaka" and not usedroka and standFarm then
                        if not getgenv().standItemFarm then return end 
                        v.Use:FireServer()
                        usedroka = true
                    end 
                end 
                if not usedroka then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka") and standFarm then 
                        if not getgenv().standItemFarm then return end 
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka").Parent = game.Players.LocalPlayer.Character 
                        wait(0.4)
                        if not getgenv().standItemFarm then return end
                        game.Players.LocalPlayer.Character:FindFirstChild("Rokakaka").Use:FireServer();
                        usedroka = true
                    else
                        warn("no rokas!")
                        standFarm = false
                    end 
                end 
                if not usedroka then 
                    warn("no rokas!") 
                    standFarm = false
                end
                usedroka = false
                used = false
                if not getgenv().standItemFarm then return end 
            end
        end
    end)
end


--// Define colors of UI
local colors = {
    SchemeColor = Color3.fromRGB(64, 64, 64),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}
--// Get the Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
--// Create Windows
local Window = Library.CreateLib("Stand Upright: Rebooted", colors)
--// Create Tabs
local FarmTab = Window:NewTab("Auto Farm")
local LocalPlayerTab = Window:NewTab("Local Player")
--// Create Sections
local TeleportSection = LocalPlayerTab:NewSection("Teleport")
local MiscSection = LocalPlayerTab:NewSection("Misc")
local FarmSection1 = FarmTab:NewSection("Auto Farm")

--// Farm Section

FarmSection1:NewToggle("Toggle Stand-Item Farm", "Automatically Farm Items and if there are no items farm Stands", function(bool)
    getgenv().standItemFarm = bool
    print("Stand-Item Farm is: ", bool)
    if bool and not getgenv().itemFarm and not getgenv().autoStand then
        standItemFarm()
    end
end)

FarmSection1:NewToggle("Toggle Item Farm", "Activate/Deactivate Item Farm Feature", function(bool)
    getgenv().itemFarm = bool
    print("Item Farm is: ", bool)
    if bool and not getgenv().standItemFarm and not getgenv().autoStand then
        itemFarm()
    end
end)

FarmSection1:NewToggle("Toggle Auto Stand Farm", "Activate/Deactivate Auto Stand Feature", function(bool)
    getgenv().autoStand = bool
    print("Item Farm is: ", bool)
    if bool and not getgenv().itemFarm and not getgenv().standItemFarm then
        autoStand()
    end
end)

FarmSection1:NewToggle("Use Charged Arrows", "Enable/Disable using Charged Arrows", function(bool)
    getgenv().useChargedArrows = bool
    print("Use Charged Arrows is: ", bool)
end)


--// Misc Section

MiscSection:NewToggle("Disable Seats", "Disable/Enable Seats (Helpful for Item Farm)", function(bool)
    getgenv().seats = bool
    print("Seats are: ", bool)
    if bool then
        for i,v in pairs(workspace.Map.Model["Best Restruant"]:GetChildren()) do
            for ii,vv in pairs(v:GetChildren()) do
                if vv.Name == "Seat" then
                    vv.Disabled = true
                end
            end
        end

        for i,v in pairs(workspace.Map.Model["Picnic bench"]:GetChildren()) do
            if v.Name == "Seat" then
                v.Disabled = true
            end
        end
    else
        for i,v in pairs(workspace.Map.Model["Best Restruant"]:GetChildren()) do
            for ii,vv in pairs(v:GetChildren()) do
                if vv.Name == "Seat" then
                    vv.Disabled = false
                end
            end
        end

        for i,v in pairs(workspace.Map.Model["Picnic bench"]:GetChildren()) do
            if v.Name == "Seat" then
                v.Disabled = false
            end
        end
    end
end)