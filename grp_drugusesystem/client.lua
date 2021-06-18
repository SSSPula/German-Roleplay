ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj)
	ESX = obj
end)
--SetPedMovementClipset(GetPlayerPed(-1), "move_m@quick", true)

RegisterNetEvent('kypo-drug-effect:onCoke')
AddEventHandler('kypo-drug-effect:onCoke', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
    RequestAnimSet("MOVE_M@QUICK") 
    while not HasAnimSetLoaded("MOVE_M@QUICK") do
      Citizen.Wait(0)
    end    
    exports['mythic_notify']:DoHudText('success', 'Du hast Koks geraucht, Lets go!')
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "MOVE_M@QUICK", true)
    SetPedIsDrunk(playerPed, true)
	SetPedMoveRateOverride(PlayerId(),10.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
    AnimpostfxPlay("DrugsMichaelAliensFight", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    Citizen.Wait(100000)
-- after wait stop all 
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('kypo-drug-effect:onWeed')
AddEventHandler('kypo-drug-effect:onWeed', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
      Citizen.Wait(0)
    end    
    
    exports['mythic_notify']:DoHudText('success', 'Du gönnst dir ne´ fette Lunte, legga!')
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator6")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(playerPed, true)
    AnimpostfxPlay("ChopVision", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)
	
    ----SetEntityHealth(GetPlayerPed(-1), 200)
    --SetPedArmour(PlayerPedId(), 1)
--vvvvvvvvvvvvvvvv
    Citizen.Wait(100000)
--^^^^^^^^^^^^^^^^
--Time of effect
--  after wait stop all effects
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('kypo-drug-effect:onHeroin')
AddEventHandler('kypo-drug-effect:onHeroin', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
    RequestAnimSet("move_m@hobo@a") 
    while not HasAnimSetLoaded("move_m@hobo@a") do
      Citizen.Wait(0)
    end    
    exports['mythic_notify']:DoHudText('success', 'Du hast Heroin zu dir genommen, alles ist so weich...!')
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator3")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hobo@a", true)
    SetPedIsDrunk(playerPed, true)
    AnimpostfxPlay("HeistCelebPass", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)
	
    SetEntityHealth(GetPlayerPed(-1), 150)
    --SetPedArmour(PlayerPedId(), 100)
--vvvvvvvvvvvvvvvv
    Citizen.Wait(100000)
--^^^^^^^^^^^^^^^^
--Time of effect
--  after wait stop all effects
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('kypo-drug-effect:onLsd')
AddEventHandler('kypo-drug-effect:onLsd', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
    RequestAnimSet("move_m@buzzed") 
    while not HasAnimSetLoaded("move_m@buzzed") do
      Citizen.Wait(0)
    end    
    exports['mythic_notify']:DoHudText('success', 'Du hast LSD konsumiert, die Reise beginnt!')
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@buzzed", true)
    SetPedIsDrunk(playerPed, true)
    SetTimecycleModifier("spectator5")
    AnimpostfxPlay("Rampage", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.5)
	
    ----SetEntityHealth(GetPlayerPed(-1), 200)
--vvvvvvvvvvvvvvvv
    Citizen.Wait(100000)
--^^^^^^^^^^^^^^^^
--Time of effect
--  after wait stop all effects
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('kypo-drug-effect:onMeth')
AddEventHandler('kypo-drug-effect:onMeth', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
    RequestAnimSet("move_m@drunk@slightlydrunk") 
    while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
      Citizen.Wait(0)
    end    
    exports['mythic_notify']:DoHudText('success', 'Du hast Meth konsumiert, Whoaaaaahhh!')
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
    SetPedIsDrunk(playerPed, true)
    SetTimecycleModifier("spectator5")
    AnimpostfxPlay("SuccessMichael", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.5)
	
    ----SetEntityHealth(GetPlayerPed(-1), 200)
--vvvvvvvvvvvvvvvv
    Citizen.Wait(100000)
--^^^^^^^^^^^^^^^^
--Time of effect
--  after wait stop all effects
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('kypo-drug-effect:oncroc')
AddEventHandler('kypo-drug-effect:oncroc', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
    RequestAnimSet("move_m@buzzed") 
    while not HasAnimSetLoaded("move_m@buzzed") do
      Citizen.Wait(0)
    end    
    exports['mythic_notify']:DoHudText('success', 'Du hast Croc zu dir genommen, abgefahren und eklig! Es riecht nach Benzin und Streckmitteln...')
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@buzzed", true)
    SetPedIsDrunk(playerPed, true)
    SetTimecycleModifier("spectator5")
    AnimpostfxPlay("Rampage", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.5)
	
    ----SetEntityHealth(GetPlayerPed(-1), 200)
--vvvvvvvvvvvvvvvv
    Citizen.Wait(100000)
--^^^^^^^^^^^^^^^^
--Time of effect
--  after wait stop all effects
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('kypo-drug-effect:onLsa')
AddEventHandler('kypo-drug-effect:onLsa', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
    RequestAnimSet("move_m@buzzed") 
    while not HasAnimSetLoaded("move_m@buzzed") do
      Citizen.Wait(0)
    end    
    exports['mythic_notify']:DoHudText('success', 'Du hast LSA zu dir genommen, Trippy!')
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@buzzed", true)
    SetPedIsDrunk(playerPed, true)
    SetTimecycleModifier("spectator5")
    AnimpostfxPlay("Rampage", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 1.5)
	
    ----SetEntityHealth(GetPlayerPed(-1), 200)
--vvvvvvvvvvvvvvvv
    Citizen.Wait(100000)
--^^^^^^^^^^^^^^^^
--Time of effect
--  after wait stop all effects
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)

RegisterNetEvent('kypo-drug-effect:onAlkohol')
AddEventHandler('kypo-drug-effect:onAlkohol', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
 RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
 while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
   Citizen.Wait(0)
 end    
  
  --exports['mythic_notify']:DoHudText('success', 'Du gönnst dir ne´ fette Lunte, legga!')
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  Citizen.Wait(3000)
  ClearPedTasksImmediately(playerPed)
  SetTimecycleModifier("spectator6")
  SetPedMotionBlur(playerPed, true)
  SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
  SetPedIsDrunk(playerPed, true)
  AnimpostfxPlay("ChopVision", 10000001, true)
  ShakeGameplayCam("DRUNK_SHAKE", 1.0)

  ----SetEntityHealth(GetPlayerPed(-1), 200)
  --SetPedArmour(PlayerPedId(), 1)
--vvvvvvvvvvvvvvvv
  Citizen.Wait(100000)
--^^^^^^^^^^^^^^^^
--Time of effect
--  after wait stop all effects
  SetPedMoveRateOverride(PlayerId(),1.0)
  SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
  SetPedIsDrunk(GetPlayerPed(-1), false)		
  SetPedMotionBlur(playerPed, false)
  ResetPedMovementClipset(GetPlayerPed(-1))
  AnimpostfxStopAll()
  ShakeGameplayCam("DRUNK_SHAKE", 0.0)
  SetTimecycleModifierStrength(0.0)
end)


RegisterNetEvent('kypo-drug-effect:onAlkoholKeineAnimationsbenoetigt')
AddEventHandler('kypo-drug-effect:onAlkoholKeineAnimationsbenoetigt', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
  
 RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
 while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
   Citizen.Wait(0)
 end    
  
  --exports['mythic_notify']:DoHudText('success', 'Du gönnst dir ne´ fette Lunte, legga!')
  --TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  Citizen.Wait(3000)
  ClearPedTasksImmediately(playerPed)
  SetTimecycleModifier("spectator6")
  SetPedMotionBlur(playerPed, true)
  SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
  SetPedIsDrunk(playerPed, true)
  AnimpostfxPlay("ChopVision", 10000001, true)
  ShakeGameplayCam("DRUNK_SHAKE", 1.0)

  ----SetEntityHealth(GetPlayerPed(-1), 200)
  --SetPedArmour(PlayerPedId(), 1)
--vvvvvvvvvvvvvvvv
  Citizen.Wait(100000)
--^^^^^^^^^^^^^^^^
--Time of effect
--  after wait stop all effects
  SetPedMoveRateOverride(PlayerId(),1.0)
  SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
  SetPedIsDrunk(GetPlayerPed(-1), false)		
  SetPedMotionBlur(playerPed, false)
  ResetPedMovementClipset(GetPlayerPed(-1))
  AnimpostfxStopAll()
  ShakeGameplayCam("DRUNK_SHAKE", 0.0)
  SetTimecycleModifierStrength(0.0)
end)