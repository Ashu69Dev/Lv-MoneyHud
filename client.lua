local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local hudVisible = true
local lastPayload = nil

local function getSafe(val, fallback)
    if val == nil then return fallback end
    return val
end

local function buildPayload()
    PlayerData = QBCore.Functions.GetPlayerData() or {}

    local money = getSafe(PlayerData.money, {})
    local cash = tonumber(money.cash or 0) or 0
    local bank = tonumber(money.bank or 0) or 0

    local job = getSafe(PlayerData.job, {})
    local jobLabel = job.label or job.name or 'Unemployed'
    local gradeLabel = (job.grade and (job.grade.name or job.grade.level)) and tostring(job.grade.name or job.grade.level) or nil
    local jobText = gradeLabel and (("%s • %s"):format(jobLabel, gradeLabel)) or jobLabel

    local serverId = GetPlayerServerId(PlayerId())

    return {
        cash = cash,
        bank = bank,
        job = jobText,
        id = serverId,
    }
end

local function sendInit()
    local payload = buildPayload()
    lastPayload = payload
    SendNUIMessage({
        action = 'init',
        data = {
            visible = hudVisible,
            showCash = Config.ShowCash,
            showBank = Config.ShowBank,
            showJob  = Config.ShowJob,
            showId   = Config.ShowId,
            position = Config.Position,
            scale    = Config.Scale,
            logoPath = Config.Logo,
            payload  = payload
        }
    })
end

local function sendUpdate(force)
    local payload = buildPayload()
    if force or json.encode(payload) ~= json.encode(lastPayload) then
        lastPayload = payload
        SendNUIMessage({
            action = 'update',
            data = payload
        })
    end
end

local function setVisible(state)
    hudVisible = state
    SendNUIMessage({
        action = 'visible',
        data = { visible = hudVisible }
    })
end

-- Command to toggle HUD
RegisterCommand(Config.ToggleCommand, function()
    setVisible(not hudVisible)
end)

-- Keymapping: open F7 to toggle
RegisterKeyMapping(Config.ToggleCommand, 'Toggle HUD (qb-hud-glass)', 'keyboard', 'F7')

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(500)
    setVisible(Config.VisibleByDefault)
    sendInit()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    setVisible(false)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    if not PlayerData then PlayerData = {} end
    PlayerData.job = job
    sendUpdate(true)
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(pdata)
    PlayerData = pdata or PlayerData
    sendUpdate(true)
end)

RegisterNetEvent('QBCore:Client:OnMoneyChange', function(_, _, _)
    sendUpdate(true)
end)

CreateThread(function()
    while true do
        if hudVisible then
            sendUpdate(false)
        end
        Wait(Config.RefreshIntervalMs)
    end
end)

-- Initial boot
CreateThread(function()
    Wait(1000)
    hudVisible = Config.VisibleByDefault
    sendInit()
end)
