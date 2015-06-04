--idea: juke boxes emit different color note particles while playing based on the cd inside, 
--Juke boxes help you feel more immersed in the game

minetest.register_node("jukebox:jukebox", {
	description = "Jukebox",
	tiles = {"default_stone.png"},
	groups = {cracky=3, stone=1},
	on_construct = function(pos)
		particle = minetest.add_particlespawner({
			amount = 1,
			time = 0,
			minpos = {x=pos.x, y=pos.y, z=pos.z},
			maxpos = {x=pos.x, y=pos.y, z=pos.z},
			minvel = {x=0, y=2, z=0},
			maxvel = {x=0, y=2, z=0},
			minacc = {x=0, y=0, z=0},
			maxacc = {x=0, y=0, z=0},
			minexptime = 1,
			maxexptime = 1,
			minsize = 5,
			maxsize = 5,
			collisiondetection = false,
			vertical = true,
			texture = "note.png",
		})
	end,
	
	--make this only play to the player who did it, also keep track of the sound_play and the particle spawner
	--also don't allow it to play if already playing, take away the record, and then pop one out on top if one is already inside
	--make a slot on the top in the texture, OR overlap the texture of the record holder thing with the record so it looks cool and like it's
	--actually playing it (if possible)

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		--print(dump(itemstack:to_table()))
		if minetest.get_item_group(itemstack:to_table().name, "record") == 1 then
			minetest.sound_play("SPCZ_-_09_-_Sky", {
				pos = pos,
				max_hear_distance = 20,
				gain = 1,
			})
		end
	end,


})

minetest.register_craftitem("jukebox:blank_record", {
	description = "Blank Record",
	inventory_image = "record.png",
	groups = {record=1},
})
