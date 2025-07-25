game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
game.Lighting.MainColorCorrection.Contrast = 10
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(250, 0, 0)})
TW:Play()
wait(5)

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Struggle",
    Model = "rbxassetid://136351530303753", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 135,
    MoveDelay = 0,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 60,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 20
    },
    Cycles = {
        Min = 2,
        Max = 3,
        Delay = 3
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 500
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You died to who called Smiler", "That one is very fast", "Try hide from it at any costs", "You can do it!", "Try better next times!"},
    IsCuriousLight = true
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned")
wait(3)
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(250, 0, 0)
game.Lighting.MainColorCorrection.Contrast = 10
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    print("Player has died")
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
