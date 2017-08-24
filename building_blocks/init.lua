local modpath = minetest.get_modpath("building_blocks")

dofile(modpath.."/alias.lua")
dofile(modpath.."/node_stairs.lua")
-- Node is not stairs, craft items, tool		
dofile(modpath.."/other.lua")
-- Craft, cooking, fuel	
dofile(modpath.."/recipes.lua")	