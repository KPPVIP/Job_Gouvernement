ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


local open = false

RMenu.Add('gouv', 'GOUV', RageUI.CreateMenu("GOUV", "Undefined for using SetSubtitle"))
RMenu:Get('gouv', 'GOUV'):SetSubtitle("gouv GOUV menu")
RMenu:Get('gouv', 'GOUV'):DisplayGlare(true);



    open = false

function OpengouvGarageMenu()  
    if open then
        RageUI.Visible(RMenu:Get('gouv', 'GOUV'), false)
        open = false
        return
    end     
if ESX.PlayerData.job and ESX.PlayerData.job.name == 'gouv' then
    open = true
RageUI.Visible(RMenu:Get('gouv', 'GOUV'), true)
end

    Citizen.CreateThread(function()
        while open do
            RageUI.IsVisible(RMenu:Get('gouv', 'GOUV'), function()
                RageUI.Item.Separator("↓ Véhicule du Gouvernement ↓")
                for k,v in pairs(config.garage.vehs) do
                    RageUI.Item.Button(v.label, nil, { nil }, 5, {
                        onHovered = function()

                        end,
                        onSelected = function()
                            local pos = FoundClearSpawnPoint(config.garage.pos)
                            if pos ~= false then
                                LoadModel(v.veh)
                                if v.veh == "coach" then 
                                    pos = {
                                        pos = vector3(440.23098754883, -1020.7737426758, 29.483909606934),
                                        heading = 92.71851348877,
                                    }
                                end
                                local veh = CreateVehicle(GetHashKey(v.veh), pos.pos, pos.heading, true, false)
                                SetEntityAsMissionEntity(veh, 1, 1)
                                SetVehicleDirtLevel(veh, 0.0)
                                ShowLoadingMessage("Véhicule de service sortie.", 2, 2000)
                                TriggerServerEvent("keys:AddOwnedKey", GetVehicleNumberPlateText(veh))
                                Wait(350)
                            else
                                ShowNotification("Aucun point de sortie disponible")
                            end
                        end,
                        onActive = function()
                        end,
                    })
                end
            end)    
            Wait(1)
        end
    end)
end


function RangerVeh(vehicle)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local props = ESX.Game.GetVehicleProperties(vehicle)
    local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
    local engineHealth = GetVehicleEngineHealth(current)

    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
        if engineHealth < 890 then
            ESX.ShowNotification("Votre véhicule est trop abimé, vous ne pouvez pas le ranger.")
        else
            ESX.Game.DeleteVehicle(vehicle)
            TriggerServerEvent('esx_vehiclelock:deletekeyjobs', 'no', plate)
            ESX.ShowNotification("~g~Véhicule stocké.")
        end
    end
end

local possupprvehiculenehco = {
    {x = -488.55, y = -252.58, z = 35.68}
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(possupprvehiculenehco) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, possupprvehiculenehco[k].x, possupprvehiculenehco[k].y, possupprvehiculenehco[k].z)

            if dist <= 2.0 then
                attente = 1
                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger~s~ le véhicule")
                        if IsControlJustPressed(1,51) then 
                            RangerVeh(vehicle)
                        end
                        break
                    else
                        attente = 150 
                end
            end
        end
    end
end)



RMenu.Add('gouv', 'armurie', RageUI.CreateMenu("Armurie", "Undefined for using SetSubtitle"))
RMenu:Get('gouv', 'armurie'):SetSubtitle("gouv armurie menu")
RMenu:Get('gouv', 'armurie'):DisplayGlare(true);
RMenu:Get('gouv', 'armurie').Closed = function()
    open = false
end;

function OpengouvArmurieMenu()
    if open then
        RageUI.Visible(RMenu:Get('gouv', 'armurie'), false)
        open = false
        return
    end
    open = true
    RageUI.Visible(RMenu:Get('gouv', 'armurie'), true)

    Citizen.CreateThread(function()
        while open do
            RageUI.IsVisible(RMenu:Get('gouv', 'armurie'), function()
                RageUI.Item.Button("Déposer ses armes", nil, { RightLabel = "Déposer >" }, true, {
                    onSelected = function()
                        RemoveServiceWeapons()
                    end,
                }) 
                RageUI.Item.Separator("↓ Récupèrer un équipement ↓")
                for k,v in pairs(config.armurie) do
                    RageUI.Item.Button("Équipement ~b~"..v.grade, nil, { RightLabel = ">" }, true, {
                    --RageUI.Item.Button("Équipement ~b~"..v.grade, nil, { RightLabel = ">" }, v.grade == pGrade, {
                        onSelected = function()
                            local pPed = GetPlayerPed(-1)
                            for k,v in pairs(v.weapons) do
                                GiveWeaponToPed(pPed, GetHashKey(v), 255, 1, 0)
                            end
                            GiveArmoryWeaponToPed(GetHashKey(v.weapons[#v.weapons]))
                            ShowNotification("Armes de service récupérer.")
                        end,
                    }) 
                end 
            end)
            Wait(1)
        end
    end)
end
