RegisterServerEvent("DEN-robatm:succes")
AddEventHandler("DEN-robatm:succes", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = math.random(DEN.MinMoney, DEN.MaxMoney)

    xPlayer.addAccountMoney('black_money', money)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Succesvol de pinautomaat gehackt. Dit is de buit: €'.. money, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })

    -- Politie melding
    TriggerEvent('notifyPolice', 'DEN-robatm:connecting', source)
end)

-- Helaas geen tijd gehad om dit nog toe te voegen.
RegisterServerEvent('notifyPolice')
AddEventHandler('notifyPolice', function(eventName, source)
    TriggerClientEvent('police:notify', -1, 'Hacker gespot!', 'Iemand is een pinatuomaat aan het hacken. Event: ' .. eventName .. ' (Source: ' .. source .. ')')
end)

