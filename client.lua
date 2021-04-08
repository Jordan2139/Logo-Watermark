-----------------------------------------------------------------
-- Logo Watermark- A Simple FiveM Script, Made By Jordan.#2139 --
-----------------------------------------------------------------

----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT NOTHING --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------
local isUiOpen = false 

Citizen.CreateThread(function()
  while true do
    Wait(1)
    if not IsPauseMenuActive() then
      if not isUiOpen then
      SendNUIMessage({displayWindow = 'true'})
      isUiOpen = true
      end
    else
      if isUiOpen then
      SendNUIMessage({displayWindow = 'false'})
      isUiOpen = false
      end
    end
  end
  if NetworkIsSessionStarted() then
    TriggerEvent("chat:addSuggestion", "/togglewm", "Toggle the watermark")
    return
  end
end)