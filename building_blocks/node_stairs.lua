local S = homedecor_i18n.gettext

local function building_blocks_stairs(nodename, def)
	minetest.register_node(nodename, def)

	local mod, name = nodename:match("(.*):(.*)")
	for groupname,value in pairs(def.groups) do
		if	groupname ~= "cracky" and
			groupname ~= "choppy" and
			groupname ~="flammable" and
			groupname ~="crumbly" and
			groupname ~="snappy" 
		then
			def.groups.groupname = nil
		end
    end
	
	if minetest.get_modpath("moreblocks") then
		stairsplus:register_all(
			mod,
			name,
			nodename,
			{
				description = def.description,
				tiles = def.tiles,
				groups = def.groups,
				sounds = def.sounds,
			}
		)
	else
	
		bb_stairs = {}
		
		-- Node will be called stairs:stair_<subname>
		function bb_stairs.register_stair(subname, recipeitem, groups, images, description, sound)
			minetest.register_node("building_blocks:stair_" .. subname, {
				description = description,
				drawtype = "nodebox",
				tiles = images,
				paramtype = "light",
				paramtype2 = "facedir",
				is_ground_content = true,
				groups = groups,
				node_box = {
					type = "fixed",
					fixed = {
						{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
						{-0.5, 0, 0, 0.5, 0.5, 0.5},
					},
				},
				sounds = sound,
			})

			minetest.register_craft({
				output = 'building_blocks:stair_' .. subname .. ' 4',
				recipe = {
					{recipeitem, "", ""},
					{recipeitem, recipeitem, ""},
					{recipeitem, recipeitem, recipeitem},
				},
			})

			-- Flipped recipe for the silly minecrafters
			minetest.register_craft({
				output = 'building_blocks:stair_' .. subname .. ' 4',
				recipe = {
					{"", "", recipeitem},
					{"", recipeitem, recipeitem},
					{recipeitem, recipeitem, recipeitem},
				},
			})
		end

		-- Node will be called stairs:slab_<subname>
		function bb_stairs.register_slab(subname, recipeitem, groups, images, description, sound)
			minetest.register_node("building_blocks:slab_" .. subname, {
				description = description,
				drawtype = "nodebox",
				tiles = images,
				paramtype = "light",
				is_ground_content = true,
				groups = groups,
				node_box = {
					type = "fixed",
					fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				},
				selection_box = {
					type = "fixed",
					fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				},
				sounds = sound,
			})

			minetest.register_craft({
				output = 'building_blocks:slab_' .. subname .. ' 3',
				recipe = {
					{recipeitem, recipeitem, recipeitem},
				},
			})
		end

		-- Nodes will be called stairs:{stair,slab}_<subname>
		function bb_stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sound)
			bb_stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sound)
			bb_stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sound)
		end
	
		bb_stairs.register_stair_and_slab(name,nodename,
			def.groups,
			def.tiles,
			S("%s Stair"):format(S(def.description)),
			S("%s Slab"):format(S(def.description)),
			def.sounds
		)
		
	end
end
	
building_blocks_stairs("building_blocks:grate",{
		drawtype = "glasslike",
		description = S("Grate"),
		tiles = {"building_blocks_grate.png"},
		inventory_image = minetest.inventorycube("building_blocks_grate.png"),
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = true,
		groups = {cracky=1},
		sounds = default.node_sound_metal_defaults(),
})

building_blocks_stairs("building_blocks:Marble", {
	description = S("Marble"),
	tiles = {"building_blocks_marble.png"},
	is_ground_content = true,
	groups = {cracky=3, marble = 1},
	sounds = default.node_sound_stone_defaults(),
})

building_blocks_stairs("building_blocks:hardwood", {
	tiles = {"building_blocks_hardwood.png"},
	is_ground_content = true,
	description = S("Hardwood"),
	groups = {choppy=1,flammable=1},
	sounds = default.node_sound_wood_defaults(),
})

building_blocks_stairs("building_blocks:fakegrass", {
	tiles = {"default_grass.png", "default_dirt.png", "default_dirt.png^default_grass_side.png"},
	description = S("Fake Grass"),
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.4},
	}),
})

building_blocks_stairs("building_blocks:Tar", {
	description = S("Tar"),
	tiles = {"building_blocks_tar.png"},
	is_ground_content = true,
	groups = {crumbly=1, tar_block = 1},
	sounds = default.node_sound_stone_defaults(),
})

building_blocks_stairs("building_blocks:grate", {
	drawtype = "glasslike",
	description = S("Grate"),
	tiles = {"building_blocks_grate.png"},
	inventory_image = minetest.inventorycube("building_blocks_grate.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults(),
})

building_blocks_stairs("building_blocks:Adobe", {
	tiles = {"building_blocks_Adobe.png"},
	description = S("Adobe"),
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})

building_blocks_stairs("building_blocks:Roofing", {
	tiles = {"building_blocks_Roofing.png"},
	is_ground_content = true,
	description = S("Roof block"),
	groups = {snappy=3},
})

building_blocks_stairs("building_blocks:smoothglass", {
	drawtype = "glasslike",
	description = S("Streak Free Glass"),
	tiles = {"building_blocks_sglass.png"},
	inventory_image = minetest.inventorycube("building_blocks_sglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

building_blocks_stairs("building_blocks:woodglass", {
	drawtype = "glasslike",
	description = S("Wood Framed Glass"),
	tiles = {"building_blocks_wglass.png"},
	inventory_image = minetest.inventorycube("building_blocks_wglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})
