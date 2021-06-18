show_your_name = false
enable_blips = true
enable_names = false
color_blip = 0 -- blue
sprite_blip = 1

-- name head
scaleY = 0.55
distance_from_head = 1.0
text_font = 0

enable_rank = true
-- Change letters according to your preference
-- d = days
-- m = month
-- y = year
date_format = "%d/%m/%y"

use_script_in_coordinates = true
range_use = 5.0
coordinates = {
    vector3(-1613.48,-1053.23,12.08)
}

commands = {
    crewmenu = "fraktion",
    joincrew = "joincrew",
    createcrew = '7ggd6334gsdfxh3',
    invitecrew = 'invitecrew',
    leftcrew = 'leftcrew',
    prove = 'provecrew',
	demote = 'degradieren',
    list = 'listcrew',
    kick = 'kickcrew',
    deletecrew = 'fraktionloeschen',
    ranking = 'rank'
}

translate = {
    TR_CREATE_CREW = "Du hast eine Fraktion erstellt.",
    TR_CANOT_NAME = "Es gibt bereits eine Fraktion mit diesem Namen.",
    TR_CANOT_CREATE = "Du bist bereits in einer Fraktion",
    TR_CANOT_CREATE2 = "Verlasse deine aktuelle Fraktion oder lösche Sie.",
    TR_NOT_PERMISSION = "Du hast dazu keine Berechtigung.",
    TR_NOT_FOUND = "Spieler nicht gefunden.",
    TR_HAS_CREW = "Dieser Spieler ist bereits in einer Fraktion.",
    TR_RECEIVE_INVITE = "Du hast eine Einladung zu einer Fraktion erhalten.",
    TR_RECEIVE_INVITE2 = "Du kannst die Einladung im HUB annehmen.",
    TR_SEND_INVITE = "Einladung gesendet",
    TR_HAS_CREW2 = "Du bist bereits in einer Fraktion!",
    TR_NOT_HAS = "Du bist in keiner Fraktion",
    TR_EXIT = 'Du hast deine Fraktion verlassen',
    TR_DONT_EXIT = "Du kannst keine Fraktion verlassen in der Du der Leiter bist.",
    TR_DONT_EXIT2 = "Du kannst deine Fraktion mit /fraktionloeschen löschen.",
    TR_NOTIFY_DELETE = "Deine Fraktion wurde gelöscht.",
    TR_NOT_PART = "Der Spieler ist in keiner Fraktion.", 
    TR_RECEIVE_PROVE = "Du hast jemanden befördert.",
    TR_RECEIVE_PROVE2 = "Du wurdest befördert.",
	TR_RECEIVE_DEMOTE = "The player was demoted",
    TR_RECEIVE_DEMOTE2 = "You received a demotion",
    TR_KICK = "Du hast einen Spieler aus deiner Fraktion geworfen.",
    TR_KICK2 = "Du wurdest aus deiner Fraktion geworfen",

    TR_CREWNAME = "Fraktion",
    TR_KILLS = "Kills",
    TR_CREATEDAT = "Erstellt",
    TR_RANKMEMBERS = "Mitglieder",

    TR_NOT_COORDINATE = "Du musst Dich im HUB befinden.",

    TR_CREATE = "Erstellen",
    TR_CREATE2 = "Fraktion erstellen",
    TR_JOIN = "Beitreten",
    TR_JOIN2 = "Einladung annehmen",
    TR_INVITE = "Einladen",
    TR_INVITE2 = "Jemanden einladen",
    TR_LEAVE = "Verlassen",
    TR_LEAVE2 = "Fraktion verlassen",
    TR_PROMOTE = "Befördern",
    TR_PROMOTE2 = "Mitglied befördern",
    TR_DEMOTE = "Demote",
    TR_DEMOTE2 = "Demote a member",
    TR_LIST = "Liste",
    TR_LIST2 = "Mitgliederliste",
    TR_KICK_MENU = "Rauswerfen",
    TR_KICK_MENU2 = "Mitglied rauswerfen",
    TR_RANK = "Rangliste",
    TR_RANK2 = "Die Server-Rangliste"
}