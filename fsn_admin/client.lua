RegisterNetEvent('fsn_admin:requestXYZ')
AddEventHandler('fsn_admin:requestXYZ', function(sendto)
  local coords = {x=GetEntityCoords(GetPlayerPed(-1)).x, y=GetEntityCoords(GetPlayerPed(-1)).y, z=GetEntityCoords(GetPlayerPed(-1)).z}
  TriggerServerEvent('fsn_admin:sendXYZ', sendto, coords)
end)

RegisterNetEvent('fsn_admin:recieveXYZ')
AddEventHandler('fsn_admin:recieveXYZ', function(xyz)
  SetEntityCoords(GetPlayerPed(-1), xyz.x, xyz.y, xyz.z, 1, 0, 0, 1)
end)

local frozen = false
RegisterNetEvent('fsn_admin:FreezeMe')
AddEventHandler('fsn_admin:FreezeMe', function(adminID)
  if frozen then
    TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:fsn_admin:^r^0 You have been unfrozen by admin: '..GetPlayerName(adminID))
    frozen = false
  else
    TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:fsn_admin:^r^0 You have been frozen by admin: '..GetPlayerName(adminID))
    frozen = true
  end
end)
