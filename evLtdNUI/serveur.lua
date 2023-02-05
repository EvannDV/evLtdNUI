ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('ev:paid2')
AddEventHandler('ev:paid2', function(Pain, Water, Phone, price)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    if price == 0 then
        print("0 price")
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
    else
        local sousPly = xPlayer.getMoney()
        if sousPly >= price then
            xPlayer.removeMoney(price)

    if Pain == 0 then
        if Phone == 0 then
            if Water == 0 then
                TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
                TriggerClientEvent('ev:Close', source)
            else
                xPlayer.addInventoryItem("water", Water)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                TriggerClientEvent('ev:Close', source)
            end
        elseif Water == 0 then
            if Phone == 0 then
                TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
                TriggerClientEvent('ev:Close', source)
            else
                xPlayer.addInventoryItem("phone", Phone)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Phone.." téléphone(s)")
                TriggerClientEvent('ev:Close', source)
            end
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
            TriggerClientEvent('ev:Close', source)
        end
    elseif Water == 0 then
        if Phone == 0 then
            if Pain == 0 then
                TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
                TriggerClientEvent('ev:Close', source)
            else
                xPlayer.addInventoryItem("bread", Pain)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Pain.." pain(s)")
                TriggerClientEvent('ev:Close', source)
            end
        elseif Pain == 0 then
            if Phone == 0 then
                TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
                TriggerClientEvent('ev:Close', source)
            else
                xPlayer.addInventoryItem("phone", Phone)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Phone.." téléphone(s)")
                TriggerClientEvent('ev:Close', source)
            end
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
            TriggerClientEvent('ev:Close', source)
        end
    elseif Phone == 0 then
        if Water == 0 then
            if Pain == 0 then
                TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
                TriggerClientEvent('ev:Close', source)
            else
                xPlayer.addInventoryItem("bread", Pain)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Pain.." pain(s)")
                TriggerClientEvent('ev:Close', source)
            end
        elseif Pain == 0 then
            if Water == 0 then
                TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
                TriggerClientEvent('ev:Close', source)
            else
                xPlayer.addInventoryItem("water", Water)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                TriggerClientEvent('ev:Close', source)
            end
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez rien dans votre panier !")
            TriggerClientEvent('ev:Close', source)
        end
    else
        if Water ~= 0 then
            if Pain == 0 then
                if Phone == 0 then
                    xPlayer.addInventoryItem("water", Water)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                    TriggerClientEvent('ev:Close', source)
                else
                    xPlayer.addInventoryItem("phone", Phone)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Phone.." téléphone(s)")
                    xPlayer.addInventoryItem("water", Water)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                    TriggerClientEvent('ev:Close', source)
                end
            else
                xPlayer.addInventoryItem("bread", Pain)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Pain.." pain(s)")
                xPlayer.addInventoryItem("water", Water)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                TriggerClientEvent('ev:Close', source)
                if Phone ~= 0 then
                    xPlayer.addInventoryItem("phone", Phone)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Phone.." téléphone(s)")
                end
            end
        elseif Pain ~= 0 then
            if Phone == 0 then
                if Water == 0 then
                    xPlayer.addInventoryItem("bread", Pain)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Pain.." pain(s)")
                    TriggerClientEvent('ev:Close', source)
                else
                    xPlayer.addInventoryItem("bread", Pain)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Pain.." pain(s)")
                    xPlayer.addInventoryItem("water", Water)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                    TriggerClientEvent('ev:Close', source)
                end
            else
                xPlayer.addInventoryItem("phone", Phone)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Phone.." téléphone(s)")
                xPlayer.addInventoryItem("bread", Pain)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Pain.." pain(s)")
                TriggerClientEvent('ev:Close', source)
                if Water ~= 0 then
                    xPlayer.addInventoryItem("water", Water)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                end
            end
        elseif Phone ~= 0 then
            if Pain == 0 then
                if Water == 0 then
                    xPlayer.addInventoryItem("phone", Phone)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Phone.." téléphone(s)")
                    TriggerClientEvent('ev:Close', source)
                else
                    xPlayer.addInventoryItem("phone", Phone)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Phone.." téléphone(s)")
                    xPlayer.addInventoryItem("water", Water)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                    TriggerClientEvent('ev:Close', source)
                end
            else
                xPlayer.addInventoryItem("phone", Phone)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Phone.." téléphone(s)")
                xPlayer.addInventoryItem("bread", Pain)
                TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Pain.." pain(s)")
                TriggerClientEvent('ev:Close', source)
                if Water ~= 0 then
                    xPlayer.addInventoryItem("water", Water)
                    TriggerClientEvent('esx:showNotification', source, "Vous avez recu "..Water.." eau(x)")
                end
            end
        end
        
    end
else
    TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent !")
end
end


end)



