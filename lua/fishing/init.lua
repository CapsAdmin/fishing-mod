fishing = fishing or {} fishing.LineTension = 0   include("libraries/luadata.lua")-- net_*.lua were made by Python1320include("libraries/net_queue.lua")include("libraries/net_playervars.lua")include("utilities.lua")include("stats.lua")include("inventory.lua")include("restrictions.lua")    include("rod.lua")   if CLIENT then 	--include("client/hud.lua")	include("client/camera.lua") 	include("client/rod_screen.lua")end if SERVER then	include("server/spawning.lua")	include("server/inventory.lua")endinclude("base_entity.lua") include("base_bait.lua")include("base_fish.lua")include("seagulls.lua")function fishing.IncludeAllFiles(dir)	local files = file.Find("fishing/"..dir.."/*", "LUA")	for _, file_name in pairs(files) do		include("fishing/"..dir.."/" .. file_name)	endendfishing.IncludeAllFiles("bait")fishing.IncludeAllFiles("fish")if SERVER then	timer.Simple(3, function()		for k,ply in pairs(player.GetAll()) do 			ply:Give("weapon_fishing")			for name, count in pairs(fishing.GetPlayerInventory(ply)) do				fishing.SetPlayerItemCount(ply, name, 0)			end			fishing.SetPlayerItemCount(ply, "chinese", math.random(50))			fishing.SetPlayerItemCount(ply, "melon", math.random(50)) 			fishing.SetPlayerItemCount(ply, "hula flyer", math.random(50)) 			fishing.SetPlayerItemCount(ply, "tea", math.random(10)) 			fishing.SetPlayerItemCount(ply, "bottles", math.random(10)) 			fishing.SetPlayerItemCount(ply, "shampoo", math.random(10)) 			fishing.SetPlayerItemCount(ply, "batteries", math.random(10)) 			fishing.SetPlayerItemCount(ply, "gums", math.random(10)) 			fishing.SetPlayerItemCount(ply, "pots", math.random(10)) 			fishing.SetPlayerItemCount(ply, "drain pipes", math.random(10)) 			fishing.SetPlayerItemCount(ply, "cups", math.random(10)) 		end	end)end