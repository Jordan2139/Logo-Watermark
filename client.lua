-----------------------------------------------------------------
-- Logo Watermark- A Simple FiveM Script, Made By Jordan.#2139 --
-----------------------------------------------------------------

----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT NOTHING --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------
local isUiOpen = false 
local userTurnedOff = false

Citizen.CreateThread(function()
  if NetworkIsSessionStarted() then
    TriggerEvent("chat:addSuggestion", "/togglewm", "help text", {
      { name='togglewm', help='Toggle the watermark' }
    })
    return
  end
end)

AddEventHandler('onClientMapStart', function ()
  Citizen.CreateThread(function ()
    isUiOpen = true
    TriggerEvent('DisplayWM', true) 
  end)
end)

RegisterNetEvent('DisplayWM', function (status)
  if status then 
    SendNUIMessage({displayWindow = 'true'})
    isUiOpen = true
    userTurnedOff = false
    print(isUiOpen)
    print(userTurnedOff)
  else
    SendNUIMessage({displayWindow = 'false'})
    isUiOpen = false
    userTurnedOff = true
    print(isUiOpen)
    print(userTurnedOff)
  end
end)

RegisterCommand('togglewm', function()
  if config.allowoff then
    if not isUiOpen then
      TriggerEvent('DisplayWM', true)
    else
      TriggerEvent('DisplayWM', false) 
    end
  else 
    TriggerEvent('chat:addMessage', 255,0,0, false, "^1This server has disabled the option for you to toggle the watermark!")
  end
end)