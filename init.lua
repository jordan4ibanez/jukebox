--idea: juke boxes emit different color note particles while playing based on the cd inside, 
--Juke boxes help you feel more immersed in the game
--play music and particles to only people who right click the juke box
music = {}
function jukebox_music_logic(pos)
	local meta = minetest.get_meta(pos)
	local record = meta:get_string("record")
	local makeparts = false

	--do this so you can turn music on and off - this is a basic logic gate
	if meta:get_string("playing") == "0" or meta:get_string("playing") == "" then
		--print("starting")
		meta:set_string("playing", 1)
	elseif meta:get_string("playing") == "1" then
		--print("stopping")
		meta:set_string("playing", 0)
	end
	-- don't play if not playing
	if meta:get_string("playing") == "0" then
		--print("STOP THIS NOW!")
		--stop the current song if playing
		if meta:get_string("current") ~= nil and meta:get_string("current") ~= "" then
			minetest.sound_stop(meta:get_string("current"))
		end
		return -- return so that it doesn't play the song
	end
	--the records -- probably put this mess in a table
	if record == "static" then
		local new_song = minetest.sound_play("static", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "clouds" then
		local new_song = minetest.sound_play("clouds", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "cosmic_tingles" then
		local new_song = minetest.sound_play("cosmic_tingles", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "euphoria" then
		local new_song = minetest.sound_play("euphoria", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "happy_clouds" then
		local new_song = minetest.sound_play("happy_clouds", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "moon_fight" then
		local new_song = minetest.sound_play("moon_fight", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "mountain" then
		local new_song = minetest.sound_play("mountain", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "ochanomizu" then
		local new_song = minetest.sound_play("ochanomizu", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "sleep_trance" then
		local new_song = minetest.sound_play("sleep_trance", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "treppe" then
		local new_song = minetest.sound_play("treppe", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	elseif record == "wet_ashtray" then
		local new_song = minetest.sound_play("wet_ashtray", {
			pos = pos,
			max_hear_distance = 30,
			gain = 1,
		})
		meta:set_string("current", new_song)
		--makeparts = true
	end
	--figure out a way to make this not break other particle spawners
	--[[
	if makeparts == true then
		local particle = minetest.add_particlespawner({
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
		meta:set_string("particle", particle)
		print(particle)
	end
	]]--
end

minetest.register_node("jukebox:jukebox", {
	description = "Jukebox",
	tiles = {"default_wood.png^jukebox_slot.png^[transformFXR90","default_wood.png","default_wood.png^note.png","default_wood.png^note.png","default_wood.png^note.png","default_wood.png^note.png",},
	groups = {cracky=3, stone=1},
	
	--Make it so that the particles are set whenever a player starts the song

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)

		--try to insert record, or, play the music
		if itemstack:to_table() ~= nil then
			--set the string to the record info
			local meta = minetest.get_meta(pos)
			if minetest.get_item_group(itemstack:to_table().name, "record") == 1 and meta:get_string("record") == "" then
				--Record meta setting and whatnot -- probably put this disaster in a table or something
				if itemstack:to_table().name == "jukebox:blank_record" then
					meta:set_string("record", "static")
					meta:set_string("infotext", "Blank Record Inserted")

				elseif itemstack:to_table().name == "jukebox:clouds_record" then
					meta:set_string("record", "clouds")
					meta:set_string("infotext", "Clouds Inserted")

				elseif itemstack:to_table().name == "jukebox:cosmic_tingles_record" then
					meta:set_string("record", "cosmic_tingles")
					meta:set_string("infotext", "Cosmic Tingles Inserted")

				elseif itemstack:to_table().name == "jukebox:euphoria_record" then
					meta:set_string("record", "euphoria")
					meta:set_string("infotext", "Euphoria Inserted")

				elseif itemstack:to_table().name == "jukebox:happy_clouds_record" then
					meta:set_string("record", "happy_clouds")
					meta:set_string("infotext", "Happy Clouds Inserted")

				elseif itemstack:to_table().name == "jukebox:moon_fight_record" then
					meta:set_string("record", "moon_fight")
					meta:set_string("infotext", "Moon Fight Inserted")

				elseif itemstack:to_table().name == "jukebox:mountain_record" then
					meta:set_string("record", "mountain")
					meta:set_string("infotext", "Mountain Inserted")

				elseif itemstack:to_table().name == "jukebox:ochanomizu_record" then
					meta:set_string("record", "ochanomizu")
					meta:set_string("infotext", "Ochanomizu Inserted")

				elseif itemstack:to_table().name == "jukebox:sleep_trance_record" then
					meta:set_string("record", "sleep_trance")
					meta:set_string("infotext", "Sleep Trance Inserted")

				elseif itemstack:to_table().name == "jukebox:treppe_record" then
					meta:set_string("record", "treppe")
					meta:set_string("infotext", "Treppe Inserted")

				elseif itemstack:to_table().name == "jukebox:wet_ashtray_record" then
					meta:set_string("record", "wet_ashtray")
					meta:set_string("infotext", "Wet Ashtray Inserted")
				end

				--remove record
				itemstack:take_item()
			--if it's not a record, do logic
			elseif minetest.get_item_group(itemstack:to_table().name, "record") == 0 then
				jukebox_music_logic(pos)
			end
		-- the player's hand, do logic
		else
			jukebox_music_logic(pos)
		end
		
		return(itemstack)
	end,


	on_punch = function(pos)
		--print("remove record and stop song")
		local meta = minetest.get_meta(pos)
		local record = meta:get_string("record")
		--stop the current song if playing
		if meta:get_string("current") ~= nil and meta:get_string("current") ~= "" then
			minetest.sound_stop(meta:get_string("current"))
		end
		--shoot up the record that's inside 
		if record == "static" then
			local item = minetest.add_item(pos, "jukebox:blank_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "clouds" then
			local item = minetest.add_item(pos, "jukebox:clouds_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "cosmic_tingles" then
			local item = minetest.add_item(pos, "jukebox:cosmic_tingles_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "euphoria" then
			local item = minetest.add_item(pos, "jukebox:euphoria_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "happy_clouds" then
			local item = minetest.add_item(pos, "jukebox:happy_clouds_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "moon_fight" then
			local item = minetest.add_item(pos, "jukebox:moon_fight_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "mountain" then
			local item = minetest.add_item(pos, "jukebox:mountain_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "ochanomizu" then
			local item = minetest.add_item(pos, "jukebox:ochanomizu_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "sleep_trance" then
			local item = minetest.add_item(pos, "jukebox:sleep_trance_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})
		elseif record == "treppe" then
			local item = minetest.add_item(pos, "jukebox:treppe_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "wet_ashtray" then
			local item = minetest.add_item(pos, "jukebox:wet_ashtray_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		end
		--remove metadata
		meta:set_string("record", nil)
		meta:set_string("infotext", nil)

	end,

	on_destruct = function(pos)
		--print("remove record and stop song")
		local meta = minetest.get_meta(pos)
		local record = meta:get_string("record")
		--stop the current song if playing
		if meta:get_string("current") ~= nil and meta:get_string("current") ~= "" then
			minetest.sound_stop(meta:get_string("current"))
		end
		--shoot up the record that's inside 
		if record == "static" then
			local item = minetest.add_item(pos, "jukebox:blank_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "clouds" then
			local item = minetest.add_item(pos, "jukebox:clouds_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "cosmic_tingles" then
			local item = minetest.add_item(pos, "jukebox:cosmic_tingles_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "euphoria" then
			local item = minetest.add_item(pos, "jukebox:euphoria_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "happy_clouds" then
			local item = minetest.add_item(pos, "jukebox:happy_clouds_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "moon_fight" then
			local item = minetest.add_item(pos, "jukebox:moon_fight_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "mountain" then
			local item = minetest.add_item(pos, "jukebox:mountain_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "ochanomizu" then
			local item = minetest.add_item(pos, "jukebox:ochanomizu_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "sleep_trance" then
			local item = minetest.add_item(pos, "jukebox:sleep_trance_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})
		elseif record == "treppe" then
			local item = minetest.add_item(pos, "jukebox:treppe_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		elseif record == "wet_ashtray" then
			local item = minetest.add_item(pos, "jukebox:wet_ashtray_record")
			local entity = item:get_luaentity()
			item:setvelocity({x=math.random() + math.random(-1,1),y=6,z=math.random() + math.random(-1,1)})

		end
		--remove metadata
		meta:set_string("record", nil)
		meta:set_string("infotext", nil)
	end,

})

--The blank record
minetest.register_craftitem("jukebox:blank_record", {
	description = "Blank Record",
	inventory_image = "record.png",
	groups = {record=1},
})

--These names are severely shortened because I don't want to deal with complex variable names
minetest.register_craftitem("jukebox:clouds_record", {
	description = "Clouds",
	inventory_image = "clouds_record.png",
	groups = {record=1},
})

minetest.register_craftitem("jukebox:euphoria_record", {
	description = "Euphoria",
	inventory_image = "euphoria_record.png",
	groups = {record=1},
})

minetest.register_craftitem("jukebox:happy_clouds_record", {
	description = "Happy Clouds",
	inventory_image = "happy_clouds_record.png",
	groups = {record=1},
})

minetest.register_craftitem("jukebox:moon_fight_record", {
	description = "Moon Fight",
	inventory_image = "moon_fight_record.png",
	groups = {record=1},
})

minetest.register_craftitem("jukebox:mountain_record", {
	description = "Mountain",
	inventory_image = "mountain_record.png",
	groups = {record=1},
})

minetest.register_craftitem("jukebox:ochanomizu_record", {
	description = "Ochanomizu",
	inventory_image = "ochanomizu_record.png",
	groups = {record=1},
})

minetest.register_craftitem("jukebox:sleep_trance_record", {
	description = "Sleep Trance",
	inventory_image = "sleep_trance_record.png",
	groups = {record=1},
})

minetest.register_craftitem("jukebox:treppe_record", {
	description = "Treppe",
	inventory_image = "treppe_record.png",
	groups = {record=1},
})

minetest.register_craftitem("jukebox:wet_ashtray_record", {
	description = "Wet Ashtray",
	inventory_image = "wet_ashtray_record.png",
	groups = {record=1},
})





