resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/ui.html"

files {
	"nui/ui.html",
    "nui/slides/slide1.jpg",
    "nui/slides/slide2.jpg",
    "nui/slides/slide3.jpg",
    "nui/slides/slide4.jpg",
    "nui/slides/slide5.jpg",
   	"nui/ui.js", 
   	"nui/slider.js",
   	"nui/gothicb.ttf",
   	"nui/signpainter.ttf",
   	"nui/bootstrap.min.js",
   	"nui/bootstrap.min.css",
   	"nui/tutorial_config.js",
   	"nui/btn-right.png",
   	"nui/btn-right-hover.png",
   	"nui/btn-left-hover.png",
   	"nui/spawn.png",
   	"nui/spawn-hover.png",
   	"nui/responsive.css",
	"nui/btn-left.png"
}
client_scripts {
    '@es_extended/locale.lua',
	'locales/de.lua',
	'click.lua',
	'client.lua'
}

server_script 'server.lua'