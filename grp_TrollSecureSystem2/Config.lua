Config = {}

Config.NewbieExpire = 120 -- Minutes

Config.IdentifierToWorkWith = 'license' -- License/Steam Reset The data.json to [] when you change this Config 

Config.TrustCommand = {
    Enabled = true,
    Command = 'noobschutzaufheben'
}

Config.TimePlayCommand = {
    Enabled = true,
    Command = 'spielzeit'
}

Config.DisablePlayerFiringForNewbies = true -- Disable Firing with a Gun for Newbie Players

Config.KeysToDisableForNewbie = -- if you want to disable specific Keys like F1 or F2, put them here.  Full Key list : https://docs.fivem.net/docs/game-references/controls/
{
   37, -- Gun Wheel
    24, -- ATTACK 
    45, -- R 
    140, -- R 
    263, -- R 
}

Config.Text1 = "Noobschutz ist aktiviert, da Du unter 2 Stunden Spielzeit hast."

Config.Text2 = "Drücke [ALT] zum Interagieren (nicht E). Mehr Infos unter /noobschutz"


--[[
Config.NewbieTag =
    { -- Show Specific Tag Above Players that are tagged as newbie
        Enabled = false,
        Color = {r = 235, g = 9, b = 77, a = 200},
        Height = 1.0, -- Height above their head.
        Size = 0.60,
        DistanceToShow = 15,
        ShowInVehicle = false,
        ShowWithOnlyClearLos = true, -- If Player does not have Clear LOS ( Line of Sight ) to the target, he will not see their newbie tag (if they are newbie)
        ShowForHimSelf = true, -- Show newbie Tag Above Himself if he is tagged as newbie.
        NewbieTag = 'Neuling'
}
]]



