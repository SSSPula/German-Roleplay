Config = {}

Config.Marker = {
    color = {r = 0, g = 0, b = 255},
    size = {x = 1.0, y = 1.0, z = 1.0},
    type = 1
}

Config.VehicleLicensesOnly = false -- this includes ["dmv", "drive", "drive_bike", "drive_truck", "drive...."] anything with drive..

Config.Locations = {
    LSPD = vector3(441.54745483398,-996.57940673828,33.970149993896),
}

Config.Discord = {
    WebhookUserName = "",
    Webhook = "",
    ServerName = ""
}

Language = {
    ['success_add'] = "Lizenz erfolgreich verteilt.",
    ['success_revoke'] = "Lizenz erfolgreich entfernt.",
    ['add_license'] = 'Du hast eine %s bekommen!',
    ['remove_license'] = 'Deine %s wurde entzogen!',
    ['no_access'] = "Du hast keinen Zugriff da drauf!",
    ['open_menu_help'] = "Drücke ~INPUT_CONTEXT~ um Interpol zu öffnen"
}