-- CRED IllusiveTea / sadboilogan

local RouletteWords = {
    "TREASURE",
    "FREECASH",
    "$$LOAF$$",
    "HELLOOOO",
    "HOWRYOU?"
}

local ScaleformLabel = function(label)
    BeginTextCommandScaleformString(label)
    EndTextCommandScaleformString()
end

local scaleform = nil
local lives = 5
local ClickReturn
local SorF = false
local Hacking = false
local UsingComputer = false

local SetSpeed = function(scaleform, min, max)
    for i = 0, 7 do
        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(i)
        PushScaleformMovieFunctionParameterInt(math.random(min, max or min))
        PopScaleformMovieFunctionVoid()
    end
end

local Initialize = function(scaleform)
    local scaleform = RequestScaleformMovieInteractive(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end
    
    local CAT = "hack"
    local CurrentSlot = 0
    while HasAdditionalTextLoaded(CurrentSlot) and not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
        Wait(0)
        CurrentSlot = CurrentSlot + 1
    end
    
    if not HasThisAdditionalTextLoaded(CAT, CurrentSlot) then
        ClearAdditionalText(CurrentSlot, true)
        RequestAdditionalText(CAT, CurrentSlot)
        while not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
            Wait(0)
        end
    end

    PushScaleformMovieFunction(scaleform, "SET_LABELS")
    for i = 1, 6 do
        ScaleformLabel("H_ICON_"..i)
    end
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND")
    PushScaleformMovieFunctionParameterInt(4)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
    PushScaleformMovieFunctionParameterFloat(1.0)
    PushScaleformMovieFunctionParameterFloat(4.0)
    PushScaleformMovieFunctionParameterString("My Computer")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
    PushScaleformMovieFunctionParameterFloat(1.0)
    PushScaleformMovieFunctionParameterFloat(4.0)
    PushScaleformMovieFunctionParameterString("My Computer")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
    PushScaleformMovieFunctionParameterFloat(6.0)
    PushScaleformMovieFunctionParameterFloat(6.0)
    PushScaleformMovieFunctionParameterString("Power Off")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_LIVES")
    PushScaleformMovieFunctionParameterInt(lives)
    PushScaleformMovieFunctionParameterInt(5)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_LIVES")
    PushScaleformMovieFunctionParameterInt(lives)
    PushScaleformMovieFunctionParameterInt(5)
    PopScaleformMovieFunctionVoid()

    SetSpeed(scaleform, 200, 250)

    return scaleform
end

-- idk maybe not best solution
local IgnoreKeys = {1, 2, 4, 6, 12, 13, 66, 67, 95, 98, 220, 221, 239, 240, 270, 271, 272, 273, 282, 283, 284, 285, 286, 287, 290, 291, 332, 333}
local oldIgnore = IgnoreKeys
IgnoreKeys = {}
for k, v in pairs(oldIgnore) do
    IgnoreKeys[tostring(v)] = true
end

Citizen.CreateThread(function()
    while true do
        Wait(500)

        while UsingComputer do
            Wait(0)

            if not HasScaleformMovieLoaded(scaleform) then
                scaleform = Initialize("HACKING_PC")

                while not HasScaleformMovieLoaded(scaleform) do
                    Wait(0)
                end
            end

            DisableAllControlActions(0)
            DisableAllControlActions(1)
            DisableAllControlActions(2)

            EnableControlAction(0, 239)
            EnableControlAction(0, 240)

            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            PushScaleformMovieFunction(scaleform, "SET_CURSOR")
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 239))
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 240))
            PopScaleformMovieFunctionVoid()
            if IsDisabledControlJustPressed(0,24) and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_SELECT")
                ClickReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 25) and not Hacking and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_BACK")
                PopScaleformMovieFunctionVoid()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            end
        end
    end
end)

WaitForKeypress = function()
    Wait(500)
    while true do
        Wait(0)
        local early = false
        for i = 1, 370 do
            if IsDisabledControlJustReleased(0, i) and not IgnoreKeys[tostring(i)] then
                return i
            end
        end
    end
end

Hack = function(bank)
    local success = false
    UsingComputer = true

    lives = Config.Banks[bank].Hacking.Attempts or 5
    SorF = false

    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end

    local speed = Config.Banks[bank].Hacking.Speed
    if speed then
        SetSpeed(scaleform, speed.min, speed.max)
    end

    local timer = 10000000
    
    while UsingComputer do
        Wait(0)
        if GetScaleformMovieFunctionReturnBool(ClickReturn) then
            ProgramID = GetScaleformMovieFunctionReturnInt(ClickReturn)

            if ProgramID == 83 and not Hacking then                
                PushScaleformMovieFunction(scaleform, "SET_LIVES")
                PushScaleformMovieFunctionParameterInt(lives)
                PushScaleformMovieFunctionParameterInt(5)
                PopScaleformMovieFunctionVoid()

                PushScaleformMovieFunction(scaleform, "OPEN_APP")
                PushScaleformMovieFunctionParameterFloat(1.0)
                PopScaleformMovieFunctionVoid()
                
                PushScaleformMovieFunction(scaleform, "SET_ROULETTE_WORD")
                PushScaleformMovieFunctionParameterString(RouletteWords[math.random(#RouletteWords)])
                PopScaleformMovieFunctionVoid()

                timer = GetGameTimer() + Config.Banks[bank].Hacking.Time

                Hacking = true
            elseif ProgramID == 82 and not Hacking then
                PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
            elseif Hacking and ProgramID == 87 then
                lives = lives - 1
                PushScaleformMovieFunction(scaleform, "SET_LIVES")
                PushScaleformMovieFunctionParameterInt(lives)
                PushScaleformMovieFunctionParameterInt(5)
                PopScaleformMovieFunctionVoid()
                PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
            elseif Hacking and ProgramID == 92 then
                PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
            elseif Hacking and ProgramID == 86 then
                SorF = true
                PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                PushScaleformMovieFunctionParameterBool(true)
                ScaleformLabel("WINBRUTE")
                PopScaleformMovieFunctionVoid()
                WaitForKeypress()
                PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                PopScaleformMovieFunctionVoid()
                Hacking = false
                SorF = false
                success = true
            elseif ProgramID == 6 then
                UsingComputer = false
                SetScaleformMovieAsNoLongerNeeded(scaleform)
            end
        end

        if Hacking then
            local timeleft = timer - GetGameTimer()
            local minutes = math.floor(timeleft/(60*1000))
            local seconds = math.floor((timeleft-(minutes*60*1000))/1000)
            local millisec = math.floor(timeleft - (seconds * 1000) - (minutes * 60 * 1000))

            PushScaleformMovieFunction(scaleform, "SET_COUNTDOWN")
            PushScaleformMovieFunctionParameterInt(minutes)
            PushScaleformMovieFunctionParameterInt(seconds)
            PushScaleformMovieFunctionParameterInt(millisec)
            PopScaleformMovieFunctionVoid()

            PushScaleformMovieFunction(scaleform, "SHOW_LIVES")
            PushScaleformMovieFunctionParameterBool(true)
            PopScaleformMovieFunctionVoid()

            if lives <= 0 or timeleft <= 0 then
                SorF = true
                PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                PushScaleformMovieFunctionParameterBool(false)
                ScaleformLabel("LOSEBRUTE")
                PopScaleformMovieFunctionVoid()
                WaitForKeypress()
                PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                PopScaleformMovieFunctionVoid()
                Hacking = false
                SorF = false
                UsingComputer = false
            end
        end
    end

    return success
end