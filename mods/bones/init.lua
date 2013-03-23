-- Minetest 0.4 mod: bones
-- See README.txt for licensing and other information. 

minetest.register_node("bones:bones", {
	description = "Bones",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"bones_front.png"
	},
	paramtype2 = "facedir",
	groups = {dig_immediate=2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.45},
	}),
	
})

minetest.register_on_dieplayer(function(player)
	local pos = player:getpos()
	pos.x = math.floor(pos.x+0.5)
	pos.y = math.floor(pos.y+0.5)
	pos.z = math.floor(pos.z+0.5)
	local param2 = minetest.dir_to_facedir(player:get_look_dir())
	
	local nn = minetest.env:get_node(pos).name
	if minetest.registered_nodes[nn].buildable_to then
		minetest.env:add_node(pos, {name="bones:bones", param2=param2})
		local meta = minetest.env:get_meta(pos)
		meta:set_string("infotext", player:get_player_name().."'s bones")
	end
end)

