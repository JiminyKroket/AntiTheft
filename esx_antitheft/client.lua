	ESX                    = nil
local PlayerData    = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local ped = GetPlayerPed(-1)
        PlayerData = ESX.GetPlayerData()
        
        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), false), GetHashKey('firetruk')) then
            if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' then
                TriggerEvent('esx:showNotification', "~r~You are not allowed to drive Fire Trucks.")
                TaskLeaveVehicle(ped,vehicle,0)
            end
		else
		
			if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), false), GetHashKey('ambulance')) then
				if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' then
					TriggerEvent('esx:showNotification', "~r~You are not allowed to drive an Ambulance.")
					TaskLeaveVehicle(ped,vehicle,0)
				end
			end
		end
	end
end)