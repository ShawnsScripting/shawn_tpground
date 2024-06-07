function textUI(text)
    lib.showTextUI('[E] - Teleport to ground', {
        position = "top-center",
        icon = 'hand',
        style = {
            borderRadius = 0,
            backgroundColor = '#48BB78',
            color = 'white'
        }
    })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        
        local playerPed = PlayerPedId()

        local playerPos = GetEntityCoords(playerPed)

        
        if playerPos.z < 95.0 then
            
            textUI("Press ~INPUT_CONTEXT~ to teleport to the ground")

            if IsControlJustReleased(1, 51) then
                
                local groundZ = 0.0
                local foundGround, groundZ = GetGroundZFor_3dCoord(playerPos.x, playerPos.y, playerPos.z + 100.0, 0)

                if foundGround then
                    
                    SetEntityCoords(playerPed, playerPos.x, playerPos.y, groundZ, false, false, false, true)
                else
                    SetEntityCoords(playerPed, playerPos.x, playerPos.y, playerPos.z + 30.0, false, false, false, true)
                end
            end
        end

        if playerPos.z < 95.0 then
            SetEntityInvincible(playerPed, true)
        else
            SetEntityInvincible(playerPed, false)
            lib.hideTextUI()
        end
    end
end)
