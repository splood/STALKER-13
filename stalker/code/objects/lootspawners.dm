///////////////////////////////////////////////Одноразовый лутспавнер////////////////////////////////////////////////////////////////////////////////
/obj/effect/spawner/lootdrop/khabar_low
	name = "khabar loot spawner"
	lootdoubles = 1
	lootcount = 5

	loot = list(
				/obj/item/reagent_containers/hypospray/medipen/stalker/antirad = 20,
				/obj/item/storage/firstaid/stalker/civillian = 20,
				/obj/item/gun/ballistic/automatic/pistol/pm = 5,
				/obj/item/gun/ballistic/automatic/pistol/fort12 = 5,
				/obj/item/gun/ballistic/automatic/pistol/pb1s = 5,
				/obj/item/gun/ballistic/automatic/mp5 = 1,
				/obj/item/gun/ballistic/shotgun/bm16/sawnoff = 4,
				/obj/item/gun/ballistic/shotgun/bm16 = 3,
				/obj/item/ammo_box/stalker/b9x18 = 10,
				/obj/item/ammo_box/stalker/b9x18P = 10,
				/obj/item/ammo_box/stalker/b12x70 = 10,
				/obj/item/ammo_box/stalker/b12x70P = 10,
				/obj/item/ammo_box/stalker/b12x70D = 10,
				/obj/item/ammo_box/stalker/b9x19 = 10,
				/obj/item/ammo_box/stalker/b9x19P = 10,
				/obj/item/clothing/suit/hooded/kombez/mercenary = 1,
				/obj/item/clothing/suit/hooded/kombez/kombez_bandit = 1,
				/obj/item/clothing/suit/army = 1,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat = 2,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown = 2,
				/obj/item/clothing/mask/gas/stalker = 4,
				/obj/item/reagent_containers/food/snacks/stalker/tomaty = 18,
				/obj/item/reagent_containers/food/snacks/stalker/stew = 18,
				/obj/item/detector/blink = 4,
				/obj/nothing = 10
				)

/obj/effect/spawner/lootdrop/khabar_medium
	name = "khabar loot spawner"
	lootdoubles = 1
	lootcount = 4

	loot = list(
				/obj/structure/closet/crate/stalker/blue = 1,
				/obj/nothing = 11
				)

/obj/effect/spawner/lootdrop/khabar_high
	name = "khabar loot spawner"
	lootdoubles = 1
	lootcount = 3

	loot = list(
				/obj/structure/closet/crate/stalker/blue = 1,
				/obj/nothing = 11
				)

///////////////////////////////////////////////Лутспавнер с кулдауном и бесконечным сроком работы////////////////////////////////////////////////////

/obj/effect/spawner/lootdrop/stalker
	name = "stalker lootspawner"
	invisibility = 101
	lootcount = 2
	var/max_spawned = 3
	var/radius = 10 //Радиус разброса лута
	var/cooldown = 10000 //Кол-во минут * 1000 кд шитспавна
	var/list/spawned_loot = new()
	loot = list(/obj/item/stack/medical/gauze/bint = 75,
				/obj/item/trash/can = 25)

/obj/effect/spawner/lootdrop/stalker/weapon
	lootcount = 1
	loot = list(/obj/item/gun/ballistic/automatic/pistol/pm = 85,
				/obj/item/trash/can = 15)
/*
/obj/effect/spawner/lootdrop/stalker/New()
	SpawnLoot()

/obj/effect/spawner/lootdrop/stalker/proc/SpawnLoot(enable_cooldown = 1)
	if(!loot || !loot.len)
		return

	for(var/k = 0, k < lootcount, k++)

		if(!loot.len)
			return

		var/lootspawn = pickweight(loot)

		if(!lootspawn || lootspawn == /obj/nothing)
			continue

		spawned_loot.Add(lootspawn)

		var/turf/T = get_turf(src)
		var/obj/O = new lootspawn(T)

		RandomMove(O)
	////////////////////////////////////////////
	sleep(rand(cooldown, cooldown + cooldown/2))
	////////////////////////////////////////////
	SpawnLoot()
	return
*/
/obj/effect/spawner/lootdrop/stalker/proc/CanSpawn()
	var/count = 0

	for(var/I in spawned_loot)

		var/obj/O = I

		if(!(O.loc in range(7, src)))
			count++
		else
			spawned_loot.Remove(I)

	return CLAMP(lootcount - count, 0, lootcount)


/obj/effect/spawner/lootdrop/stalker/proc/RandomMove(spawned)
	if(spawned)
		var/turf/T = get_turf(src)
		var/obj/O = spawned
		var/new_x = T.x + rand(-radius, radius)
		var/new_y = T.y + rand(-radius, radius)
		O.Move(new_x, new_y, T.z)

	return spawned

/obj/effect/spawner/lootdrop/stalker/weapon/pistols
	name = "stalker pistols"
	loot = list(/obj/item/gun/ballistic/automatic/pistol/pm = 10,
				/obj/item/gun/ballistic/automatic/pistol/pb1s = 20,
				/obj/item/gun/ballistic/automatic/pistol/fort12 = 20,
				/obj/item/gun/ballistic/automatic/pistol/tt = 20,
				/obj/nothing = 30)

/obj/effect/spawner/lootdrop/stalker/weapon/pistolstier2
	name = "stalker pistols tier 2"
	loot = list(/obj/item/gun/ballistic/automatic/pistol/fort12/unique = 10,
				/obj/item/gun/ballistic/automatic/pistol/sip = 20,
				/obj/item/gun/ballistic/automatic/pistol/cora = 20,
				/obj/item/gun/ballistic/automatic/pistol/marta = 20,
				/obj/nothing = 30)

/obj/effect/spawner/lootdrop/stalker/weapon/pistolstier3
	name = "stalker pistols tier 3"
	loot = list(/obj/item/gun/ballistic/automatic/pistol/usp_match = 35,
				/obj/item/gun/ballistic/automatic/pistol/desert = 15,
				/obj/item/gun/ballistic/revolver/anaconda = 15,
				/obj/item/gun/ballistic/automatic/mac10 = 5,
				/obj/nothing = 30)

/obj/effect/spawner/lootdrop/stalker/weapon/rifles_and_shotguns
	name = "stalker rifles_and_shotguns"
	loot = list(/obj/item/gun/ballistic/shotgun/bm16 = 15,
				/obj/item/gun/ballistic/rifle/boltaction/enfield = 15,
				/obj/item/gun/ballistic/automatic/aksu74 = 10,
				/obj/item/gun/ballistic/automatic/berettam38 = 10,
				/obj/nothing = 50)

/obj/effect/spawner/lootdrop/stalker/weapon/rifles_and_shotgunstier2
	name = "stalker rifles_and_shotguns tier 2"
	loot = list(/obj/item/gun/ballistic/shotgun/bm16/toz34 = 15,
				/obj/item/gun/ballistic/automatic/ppsh = 15,
				/obj/item/gun/ballistic/automatic/ak74 = 10,
				/obj/item/gun/ballistic/automatic/abakan = 10,
				/obj/nothing = 50)

/obj/effect/spawner/lootdrop/stalker/weapon/rifles_and_shotgunstier3
	name = "stalker rifles_and_shotguns tier 3"
	loot = list(/obj/item/gun/ballistic/shotgun/ithaca = 15,
				/obj/item/gun/ballistic/automatic/tpc301 = 15,
				/obj/item/gun/ballistic/automatic/il86 = 10,
				/obj/item/gun/ballistic/shotgun/chaser = 10,
				/obj/nothing = 50)

/obj/effect/spawner/lootdrop/stalker/weapon/rifles_and_shotgunstier4
	name = "stalker rifles_and_shotguns tier 4"
	loot = list(/obj/item/gun/ballistic/automatic/groza = 15,
				/obj/item/gun/ballistic/automatic/val = 15,
				/obj/item/gun/ballistic/automatic/sigsg550 = 10,
				/obj/item/gun/ballistic/shotgun/spsa = 10,
				/obj/nothing = 50)

/obj/effect/spawner/lootdrop/stalker/weapon/rifles
	name = "stalker rifles_and_shotguns"
	loot = list(/obj/item/gun/ballistic/rifle/boltaction/enfield = 15,
				/obj/item/gun/ballistic/automatic/aksu74 = 15,
				/obj/item/gun/ballistic/automatic/berettam38 = 15,
				/obj/nothing = 55)

/obj/effect/spawner/lootdrop/stalker/weapon/riflestier2
	name = "stalker rifles_and_shotguns tier 2"
	loot = list(/obj/item/gun/ballistic/automatic/ppsh = 15,
				/obj/item/gun/ballistic/automatic/ak74 = 15,
				/obj/item/gun/ballistic/automatic/abakan = 15,
				/obj/nothing = 55)

/obj/effect/spawner/lootdrop/stalker/weapon/riflestier3
	name = "stalker rifles_and_shotguns tier 3"
	loot = list(/obj/item/gun/ballistic/automatic/groza = 15,
				/obj/item/gun/ballistic/automatic/tpc301 = 15,
				/obj/item/gun/ballistic/automatic/il86 = 15,
				/obj/nothing = 55)

/obj/effect/spawner/lootdrop/stalker/weapon/riflestier4
	name = "stalker rifles_and_shotguns tier 4"
	loot = list(/obj/item/gun/ballistic/automatic/gp37 = 15,
				/obj/item/gun/ballistic/automatic/fnf2000 = 15,
				/obj/item/gun/ballistic/automatic/vintorez = 15,
				/obj/nothing = 55)

/obj/effect/spawner/lootdrop/stalker/weapon/smgs
	name = "stalker smgs"
	loot = list(/obj/item/gun/ballistic/automatic/mp5 = 20,
				/obj/item/gun/ballistic/automatic/aksu74 = 20,
				/obj/item/gun/ballistic/automatic/kiparis = 10,
				/obj/nothing = 60)

/obj/effect/spawner/lootdrop/stalker/weapon/melee
	name = "stalker melee"
	loot = list(/obj/item/kitchen/knife = 20,
				/obj/item/kitchen/knife/butcher = 10,
				/obj/item/kitchen/knife/tourist = 10,
				/obj/item/melee/tireiron = 10,
				/obj/item/melee/tireiron2 = 10,
				/obj/item/melee/pipe = 10,
				/obj/item/melee/pipe2 = 10,
				/obj/nothing = 20)

/obj/effect/spawner/lootdrop/stalker/weapon/meleetier2
	name = "stalker melee"
	loot = list(/obj/item/kitchen/knife/bayonet = 20,
				/obj/item/kitchen/knife/ancienthatchet = 15,
				/obj/item/kitchen/knife/woodhatchet = 15,
				/obj/item/melee/halliganbar = 5,
				/obj/item/kitchen/knife/ancienthatchet = 10,
				/obj/item/melee/largewrench = 10,
				/obj/item/melee/redwrench = 10,
				/obj/nothing = 20)

/obj/effect/spawner/lootdrop/stalker/weapon/meleetier3
	name = "stalker melee"
	loot = list(/obj/item/kitchen/knife/machete	 = 20,
				/obj/item/kitchen/knife/throwing = 20,
				/obj/item/kitchen/knife/machete2 = 15,
				/obj/item/weapon/kitchen/knife/hunting = 15,
				/obj/item/weapon/kitchen/knife/m9 = 15,
				/obj/nothing = 20)

/obj/effect/spawner/lootdrop/stalker/weapon/meleetwohand
	name = "stalker melee tier 2"
	loot = list(/obj/item/twohanded/oldaxe = 20,
				/obj/item/twohanded/fireaxe = 20,
				/obj/item/twohanded/pitchfork = 20,
				/obj/item/twohanded/bostaff = 20,
				/obj/nothing = 20)

/obj/effect/spawner/lootdrop/stalker/medicine
	name = "stalker medicine"
	lootcount = 1
	loot = list(/obj/item/storage/firstaid/stalker/civillian = 30,
				/obj/item/storage/firstaid/stalker/military = 20,
				/obj/item/storage/firstaid/stalker/scientific = 10,
				/obj/nothing = 40)

/obj/effect/spawner/lootdrop/stalker/medicineguarentee
	name = "stalker medicine"
	lootcount = 1
	loot = list(/obj/item/storage/firstaid/stalker/civillian = 50,
				/obj/item/storage/firstaid/stalker/military = 30,
				/obj/item/storage/firstaid/stalker/scientific = 20)

/obj/effect/spawner/lootdrop/stalker/food
	name = "stalker food"
	lootcount = 1
	loot = list(/obj/item/reagent_containers/food/snacks/stalker/baton = 50,
				/obj/item/reagent_containers/food/snacks/stalker/kolbasa = 30,
				/obj/item/reagent_containers/food/snacks/stalker/konserva = 20)


/obj/effect/spawner/lootdrop/stalker/gravy
	name = "stalker gravity"
	radius = 3
	lootcount = 1
	cooldown = 4500
	loot = list(/obj/item/artifact/meduza = 12,
				/obj/item/artifact/stoneflower_depleted = 6,
				/obj/item/artifact/nightstar_depleted = 3,
				/obj/item/artifact/maminibusi = 1,
				/obj/nothing = 80)

/obj/effect/spawner/lootdrop/stalker/electra
	name = "stalker electra"
	radius = 3
	lootcount = 1
	cooldown =4500
	loot = list(/obj/item/artifact/flash = 12,
				/obj/item/artifact/moonlight = 6,
				/obj/item/artifact/battery = 1,
				/obj/item/artifact/pustishka = 1,
				/obj/nothing = 80)

/obj/effect/spawner/lootdrop/stalker/fire
	name = "stalker fire"
	radius = 3
	lootcount = 1
	cooldown = 4500
	loot = list(/obj/item/artifact/droplet = 13,
				/obj/item/artifact/fireball = 6,
				/obj/item/artifact/crystal = 3,
				/obj/nothing = 80)

/obj/nothing
	name = "nothing"
	invisibility = 101
/*
obj/nothing/New()
	qdel(src)
*/

/obj/effect/spawner/lootdrop/stalker/pornmag
	name = "stalker porn mags"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/trash/pornmagazine = 30,
				/obj/item/trash/pornmagazine/two = 30,
				/obj/item/trash/pornmagazine/three = 30,
				/obj/item/trash/pornmagazine/four = 30,
				/obj/item/trash/pornmagazine/five = 30,
				/obj/nothing = 70)

/obj/effect/spawner/lootdrop/stalker/junk
	name = "stalker junk items"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/trash/paintcan = 20,
				/obj/item/trash/teapot = 20,
				/obj/item/trash/pincers = 10,
				/obj/item/trash/oldkey = 20,
				/obj/item/trash/crossnecklace = 15,
				/obj/item/trash/oldvials = 5,
				/obj/item/trash/steelwire = 10,
				/obj/item/trash/steelwire1 = 10,
				/obj/item/trash/wire = 10,
				/obj/item/trash/duct_tape = 10,
				/obj/item/trash/oldcircuitboard = 15,
				/obj/item/trash/oldcircuitboard/alt = 15,
				/obj/item/c_tube = 25,
				/obj/item/newspaper = 20,
				/obj/item/trash/brokenpocketwatch = 10,
				/obj/item/trash/oldchembottle = 5,
				/obj/nothing = 80)

/obj/effect/spawner/lootdrop/stalker/flasks
	name = "stalker flasks"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/reagent_containers/food/drinks/flask/cylinder = 10,
				/obj/item/reagent_containers/food/drinks/flask/face = 10,
				/obj/item/reagent_containers/food/drinks/flask/russian = 10,
				/obj/item/reagent_containers/food/drinks/flask = 10,
				/obj/item/reagent_containers/food/drinks/flask/commie = 5,
				/obj/nothing = 80)

/obj/effect/spawner/lootdrop/stalker/cigarettes
	name = "stalker cigarettes"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/storage/fancy/cigarettes/cigpack_belomorkanal = 10,
					/obj/item/storage/fancy/cigarettes/cigpack_marlboro = 10,
					/obj/item/storage/fancy/cigarettes/cigpack_java = 10,
					/obj/item/storage/fancy/cigarettes/cigpack_midori = 10,
					/obj/item/storage/fancy/cigarettes/cigpack_laika = 10,
					/obj/item/storage/fancy/cigarettes/cigpack_marlborogold = 10,
				/obj/nothing = 40)

/obj/effect/spawner/lootdrop/stalker/vodka
	name = "stalker vodka"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/reagent_containers/food/drinks/bottle/vodka/stolichnaya = 10,
				/obj/item/reagent_containers/food/drinks/bottle/vodka/kazaki = 30,
				/obj/item/reagent_containers/food/drinks/bottle/vodka/blacklabelvodka = 10,
				/obj/item/reagent_containers/food/drinks/bottle/vodka = 20,
				/obj/item/reagent_containers/food/drinks/bottle/vodka/badminka = 10,
				/obj/nothing = 20)

/obj/effect/spawner/lootdrop/stalker/seeds
	name = "stalker seeds"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/seeds/potato = 30,
					/obj/item/seeds/tobacco = 30,
					/obj/item/seeds/cannabis = 10,
					/obj/item/seeds/cannabis/violetriot = 5,
					/obj/item/seeds/cannabis/neonpeon = 5,
					/obj/nothing = 20)

/obj/effect/spawner/lootdrop/stalker/bureaucracy
	name = "stalker bureaucracy"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/camera = 10,
					/obj/item/taperecorder = 10,
					/obj/item/clothing/accessory/pocketprotector/full = 10,
					/obj/item/clipboard = 10,
					/obj/item/flashlight/pen = 10,
					/obj/item/hand_labeler = 10,
					/obj/item/modular_computer/tablet/preset/cheap = 10,
					/obj/nothing = 30)

/obj/effect/spawner/lootdrop/stalker/books
	name = "stalker books"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/book/manual/allquietonthewesternfront = 10,
				/obj/item/book/manual/roadsidepicnic = 10,
				/obj/item/book/manual/solaris = 10,
				/obj/item/book/manual/metro2033 = 10,
				/obj/item/book/manual/crimeandpunishment = 10,
				/obj/item/book/manual/theprophetpain = 10,
				/obj/item/book/manual/theprophetdeath = 10,
				/obj/item/book/manual/theprophetfriendship = 10,
				/obj/nothing = 80)

/obj/effect/spawner/lootdrop/stalker/equipment
	name = "stalker equipment"
	lootcount = 1
	max_spawned = 1
	loot = list(/obj/item/flashlight/flare/torch = 10,
				/obj/item/flashlight/flare = 10,
				/obj/item/radio/off = 10,
				/obj/item/twohanded/binoculars = 10,
				/obj/item/flashlight = 10,
				/obj/item/restraints/handcuffs = 10,
				/obj/item/flashlight/lantern = 10,
				/obj/nothing = 80)

/obj/effect/spawner/lootdrop/stalker/weapon/armor
	name = "stalker armor"
	loot = list(/obj/item/clothing/suit/sixb2 = 15,
				/obj/item/clothing/suit/hooded/kombez = 15,
				/obj/item/clothing/suit/hooded/kozhanka/tancoat = 10,
				/obj/nothing = 50)

/obj/effect/spawner/lootdrop/stalker/weapon/armortier2
	name = "stalker armor tier 2"
	loot = list(/obj/item/clothing/suit/hooded/kozhanka/ghillie = 15,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown = 15,
				/obj/item/clothing/suit/d2 = 10,
				/obj/nothing = 50)

/obj/effect/spawner/lootdrop/stalker/weapon/helmet
	name = "stalker helmet"
	loot = list(/obj/item/clothing/head/ssh = 20,
				/obj/item/clothing/head/steel = 20,
				/obj/item/clothing/head/hardhat/tactical/light = 10,
				/obj/nothing = 50)

/obj/effect/spawner/lootdrop/stalker/weapon/stockparts
	name = "stalker stock parts"
	loot = list(/obj/item/stock_parts/manipulator = 15,
/obj/item/stock_parts/micro_laser = 15,
/obj/item/stock_parts/matter_bin = 15,
/obj/item/stock_parts/subspace/ansible = 15,
/obj/item/stock_parts/subspace/filter = 15,
/obj/item/stock_parts/subspace/amplifier = 15,
/obj/item/stock_parts/subspace/analyzer = 15,
/obj/item/stock_parts/rom1 = 15,
/obj/item/stock_parts/hdd1 = 15,
/obj/item/stock_parts/capacitor = 15,
/obj/item/stock_parts/scanning_module = 15)