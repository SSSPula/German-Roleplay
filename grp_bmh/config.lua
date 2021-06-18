Config = {}

-- To enable discord logs go to line 2 of the server.lua and paste your discord webhook between the quotes.
Config.admin_groups = {"admin","superadmin"} -- groups that can use admin commands

Config.popassistformat = "%s braucht Hilfe!\nDrücke <span class='text-success'>[BILD HOCH]</span> zum Annehmen! Oder <span class='text-danger'>[BILD RUNTER]</span> zum Ablehnen" -- popup assist message format
Config.chatassistformat = "%s braucht Hilfe!\nDrücke ^2[BILD HOCH]^7 zum Annehmen! Oder ^1[BILD RUNTER]^7 zum Ablehnen\n^4Grund^7: %s" -- chat assist message format
Config.assist_keys = {enable=true,accept=10,decline=11} -- keys for accepting/declining assist messages (default = page up, page down) - https://docs.fivem.net/game-references/controls/

Config.page_element_limit = 250
