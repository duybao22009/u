local DiscordLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ginchao/Discord-Lib/main/Discord-Lib'))()   
   local win = DiscordLib:Window("[Khánh Ngọc] ".." ")   
local per = game:GetService("Players").LocalPlayer.Name
 DiscordLib:Notification("Premium Stars ⭐ Share","Hello! ".."⭐"..per..".                                              ".." Thanks For Buy Premium ","Ok") 

local serv = win:Server("Khánh Ngọc", "")
local drops = serv:Channel("Main")
local dis = nil
local aura = false

drops:Textbox("Distance aura", "type", true, function(v)
    dis = tonumber(v) -- Ensure distance is a number
end)

drops:Toggle("Kill Aura Humanoid", false, function(t)
    aura = t
    if not dis then
        DiscordLib:Notification("Warning", "Choose Distance for Kill Aura", "Ok")
        return
    end
   while aura do
        wait(0.1)
        for _, v in pairs(game:GetService.Workspace["NPC DAMAGE"]:GetDescendants()) do
            local humanoid = v:FindFirstChildOfClass("Humanoid")
            if humanoid and v.Name ~= game.Players.LocalPlayer.Name and humanoid.Health > 0 then
                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                if distance <= dis then
                    pcall(function()
                        repeat
                            wait()
                            humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until humanoid.Health <= 0 or not aura
                    end)
                end
            end
        end
    end
end)
