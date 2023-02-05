---@diagnostic disable: undefined-global
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(900)
  end

  ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Open Menu
function SetDisplay(bool)
    local data2 = ""..Pain..""
    local data3 = ""..Water..""
    local data4 = ""..Phone..""
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        numberP = data2,
        numberW = data3,
        numberPh = data4,
    })
end


local display = false

RegisterCommand("azdazdqsdqsdqsdqsd", function(source, args)
    SetDisplay(not display)
end)

RegisterCommand("qsdqfqsgeqsgqeg", function(source, args)
    SetDisplay(display)
    evReset2()
end)








---- Js
Pain = 0
Water = 0
Phone = 0





RegisterNUICallback('addB', function(data)
    Pain = Pain + 1
    print(Pain)
    ExecuteCommand('azdazdqsdqsdqsdqsd')
    ESX.ShowNotification("~g~ 1 Pain ajouté au panier !")
end)

RegisterNUICallback('addW', function(data)
    Water = Water + 1
    print(Water)
    ExecuteCommand('azdazdqsdqsdqsdqsd')
    ESX.ShowNotification("~g~ 1 Eau ajoutée au panier !")
end)

RegisterNUICallback('addP', function(data)
    Phone = Phone + 1
    print(Phone)
    ExecuteCommand('azdazdqsdqsdqsdqsd')
    ESX.ShowNotification("~g~ 1 Téléphone ajouté au panier !")
end)

RegisterNUICallback('paid', function()
    print("ok")
    local price = (Config.PainPrix*Pain)+(Config.WaterPrix*Water)+(Config.PhonePrix*Phone)
    TriggerServerEvent('ev:paid2', Pain, Water, Phone, price)
end)
RegisterNUICallback('resetCli', function()
    evReset()
    ExecuteCommand('azdazdqsdqsdqsdqsd')
end)

RegisterNUICallback('evCloseAll', function(data)
    ExecuteCommand('qsdqfqsgeqsgqeg')
end)


RegisterNetEvent('ev:Close')
AddEventHandler('ev:Close', function()
    ExecuteCommand('qsdqfqsgeqsgqeg')
    evReset2()
end)

function evReset()
    Pain = 0
    Water = 0
    Phone = 0
    Citizen.Wait(50)
    ESX.ShowNotification("~y~Votre panier a été remis à 0 !")
end

function evReset2()
    Pain = 0
    Water = 0
    Phone = 0
end


------------------Keyboard INPUT


KeyboardInput = function(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end






Citizen.CreateThread(function()
    while true do
		local wait = 750

				for _,v in pairs(Config.positionshop) do
				local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

				if #(plyCoords - v.position) <= 6 then
					wait = 0
					DrawMarker(29, v.position, 0.0, 0.0, 0.0, 90, 0.0, 0.0, 0.7, 0.5, 0.7, 53, 154, 71, 170, 0, 1, 2, 0, nil, nil, 0)  
				end

				if #(plyCoords - v.position) <= 1.5 then
					wait = 0
					
					AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accéder au shop")
                    DisplayHelpTextThisFrame("HELP", false)
					if IsControlJustPressed(1,51) then
						ExecuteCommand('azdazdqsdqsdqsdqsd')
					end
				end

		end
    Citizen.Wait(wait)
    end
end)







----------------- BLIPS

CreateThread(function()

    for _, info in pairs(Config.blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
        end
    end)

