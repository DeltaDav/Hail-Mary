//Pastry is a food that is made from dough which is made from wheat or rye flour.
//This file contains pastries that don't fit any existing categories.
////////////////////////////////////////////DONUTS////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/donut
	name = "donut"
	desc = "Goes great with a cuppa joe."
	icon = 'icons/obj/food/donut.dmi'
	icon_state = "donut"
	bitesize = 5
	bonus_reagents = list(/datum/reagent/consumable/sugar = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/sugar = 2)
	filling_color = "#D2691E"
	tastes = list("donut" = 1)
	foodtype = JUNKFOOD | GRAIN | FRIED | SUGAR | BREAKFAST
	dunkable = TRUE
	var/decorated_icon = "donut_homer"
	var/is_decorated = FALSE
	var/extra_reagent = null
	var/decorated_adjective = "sprinkled"

/obj/item/reagent_containers/food/snacks/donut/Initialize()
	. = ..()
	if(prob(30))
		decorate_donut()

/obj/item/reagent_containers/food/snacks/donut/proc/decorate_donut()
	if(is_decorated || !decorated_icon)
		return
	is_decorated = TRUE
	name = "[decorated_adjective] [name]"
	icon_state = decorated_icon //delish~!
	reagents.add_reagent(/datum/reagent/consumable/sprinkles, 1)
	filling_color = "#FF69B4"
	return TRUE

/obj/item/reagent_containers/food/snacks/donut/checkLiked(fraction, mob/M)	//Sec officers always love donuts
	if(last_check_time + 50 < world.time)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(M.mind && HAS_TRAIT(M.mind, TRAIT_LAW_ENFORCEMENT_METABOLISM) && !HAS_TRAIT(H, TRAIT_AGEUSIA))
				to_chat(H,span_notice("I love this taste!"))
				H.adjust_disgust(-5 + -2.5 * fraction)
				SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "fav_food", /datum/mood_event/favorite_food)
				last_check_time = world.time
				return
	..()

/obj/item/reagent_containers/food/snacks/donut/plain
	//Use this donut ingame

/obj/item/reagent_containers/food/snacks/donut/chaos
	name = "chaos donut"
	desc = "Like life, it never quite tastes the same."
	icon_state = "donut_chaos"
	bitesize = 10
	tastes = list("donut" = 3, "chaos" = 1)

/obj/item/reagent_containers/food/snacks/donut/chaos/Initialize()
	. = ..()
	extra_reagent = pick(/datum/reagent/consumable/nutriment, /datum/reagent/consumable/capsaicin, /datum/reagent/consumable/frostoil,
					/datum/reagent/drug/krokodil, /datum/reagent/toxin/plasma, /datum/reagent/consumable/coco,
					/datum/reagent/toxin/slimejelly, /datum/reagent/consumable/banana, /datum/reagent/consumable/berryjuice,
					/datum/reagent/medicine/omnizine)
	reagents.add_reagent(extra_reagent, 3)

/obj/item/reagent_containers/food/snacks/donut/meat
	name = "meat donut"
	desc = "Tastes as gross as it looks."
	icon_state = "donut_meat"
	bonus_reagents = list(/datum/reagent/consumable/ketchup = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/ketchup = 2)
	tastes = list("meat" = 1)
	foodtype = JUNKFOOD | MEAT | GROSS | FRIED | BREAKFAST

/obj/item/reagent_containers/food/snacks/donut/berry
	name = "pink donut"
	desc = "Goes great with a soy latte."
	icon_state = "donut_pink"
	bonus_reagents = list(/datum/reagent/consumable/berryjuice = 3, /datum/reagent/consumable/sprinkles = 1) //Extra sprinkles to reward frosting
	filling_color = "#E57d9A"
	decorated_icon = "donut_homer"

/obj/item/reagent_containers/food/snacks/donut/trumpet
	name = "spaceman's donut"
	desc = "Goes great with a cold glass of milk."
	icon_state = "donut_purple"
	bonus_reagents = list(/datum/reagent/medicine/polypyr = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "violets" = 1)
	is_decorated = TRUE
	filling_color = "#8739BF"

/obj/item/reagent_containers/food/snacks/donut/apple
	name = "apple donut"
	desc = "Goes great with a shot of cinnamon schnapps."
	icon_state = "donut_green"
	bonus_reagents = list(/datum/reagent/consumable/applejuice = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "green apples" = 1)
	is_decorated = TRUE
	filling_color = "#6ABE30"

/obj/item/reagent_containers/food/snacks/donut/caramel
	name = "caramel donut"
	desc = "Goes great with a mug of hot coco."
	icon_state = "donut_beige"
	bonus_reagents = list(/datum/reagent/consumable/caramel = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "buttery sweetness" = 1)
	is_decorated = TRUE
	filling_color = "#D4AD5B"

/obj/item/reagent_containers/food/snacks/donut/choco
	name = "chocolate donut"
	desc = "Goes great with a glass of warm milk."
	icon_state = "donut_choc"
	bonus_reagents = list(/datum/reagent/consumable/hot_coco = 3, /datum/reagent/consumable/sprinkles = 1) //the coco reagent is just bitter.
	tastes = list("donut" = 4, "bitterness" = 1)
	decorated_icon = "donut_choc_sprinkles"
	filling_color = "#4F230D"

/obj/item/reagent_containers/food/snacks/donut/blumpkin
	name = "blumpkin donut"
	desc = "Goes great with a mug of soothing drunken blumpkin."
	icon_state = "donut_blue"
	bonus_reagents = list(/datum/reagent/consumable/blumpkinjuice = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 2, "blumpkin" = 1)
	is_decorated = TRUE
	filling_color = "#2788C4"

/obj/item/reagent_containers/food/snacks/donut/bungo
	name = "bungo donut"
	desc = "Goes great with a mason jar of hippie's delight."
	icon_state = "donut_yellow"
	bonus_reagents = list(/datum/reagent/consumable/bungojuice = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "tropical sweetness" = 1)
	is_decorated = TRUE
	filling_color = "#DEC128"

/obj/item/reagent_containers/food/snacks/donut/matcha
	name = "matcha donut"
	desc = "Goes great with a cup of tea."
	icon_state = "donut_olive"
	bonus_reagents = list(/datum/reagent/toxin/teapowder = 3, /datum/reagent/consumable/sprinkles = 1)
	tastes = list("donut" = 3, "matcha" = 1)
	is_decorated = TRUE
	filling_color = "#879630"

/obj/item/reagent_containers/food/snacks/donut/laugh
	name = "sweet pea donut"
	desc = "Goes great with a glass of Bastion Burbon!"
	icon_state = "donut_laugh"
	bonus_reagents = list(/datum/reagent/consumable/laughter = 3)
	tastes = list("donut" = 3, "fizzy tutti frutti" = 1,)
	is_decorated = TRUE
	filling_color = "#803280"

//////////////////////JELLY DONUTS/////////////////////////

/obj/item/reagent_containers/food/snacks/donut/jelly
	name = "jelly donut"
	desc = "You jelly?"
	icon_state = "jelly"
	decorated_icon = "jelly_homer"
	bonus_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	extra_reagent = /datum/reagent/consumable/berryjuice
	tastes = list("jelly" = 1, "donut" = 3)
	foodtype = JUNKFOOD | GRAIN | FRIED | FRUIT | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/donut/jelly/Initialize()
	. = ..()
	if(extra_reagent)
		reagents.add_reagent(extra_reagent, 3)

/obj/item/reagent_containers/food/snacks/donut/jelly/plain //use this ingame to avoid inheritance related crafting issues.

/obj/item/reagent_containers/food/snacks/donut/jelly/berry
	name = "pink jelly donut"
	desc = "Goes great with a soy latte."
	icon_state = "jelly_pink"
	bonus_reagents = list(/datum/reagent/consumable/berryjuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1) //Extra sprinkles to reward frosting.
	filling_color = "#E57d9A"
	decorated_icon = "jelly_homer"

/obj/item/reagent_containers/food/snacks/donut/jelly/trumpet
	name = "spaceman's jelly donut"
	desc = "Goes great with a cold glass of milk."
	icon_state = "jelly_purple"
	bonus_reagents = list(/datum/reagent/medicine/polypyr = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "violets" = 1)
	is_decorated = TRUE
	filling_color = "#8739BF"

/obj/item/reagent_containers/food/snacks/donut/jelly/apple
	name = "apple jelly donut"
	desc = "Goes great with a shot of cinnamon schnapps."
	icon_state = "jelly_green"
	bonus_reagents = list(/datum/reagent/consumable/applejuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "green apples" = 1)
	is_decorated = TRUE
	filling_color = "#6ABE30"

/obj/item/reagent_containers/food/snacks/donut/jelly/caramel
	name = "caramel jelly donut"
	desc = "Goes great with a mug of hot coco."
	icon_state = "jelly_beige"
	bonus_reagents = list(/datum/reagent/consumable/caramel = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "buttery sweetness" = 1)
	is_decorated = TRUE
	filling_color = "#D4AD5B"

/obj/item/reagent_containers/food/snacks/donut/jelly/choco
	name = "chocolate jelly donut"
	desc = "Goes great with a glass of warm milk."
	icon_state = "jelly_choco"
	bonus_reagents = list(/datum/reagent/consumable/hot_coco = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1) //the coco reagent is just bitter.
	tastes = list("jelly" = 1, "donut" = 4, "bitterness" = 1)
	decorated_icon = "jelly_choco_sprinkles"
	filling_color = "#4F230D"

/obj/item/reagent_containers/food/snacks/donut/jelly/blumpkin
	name = "blumpkin jelly donut"
	desc = "Goes great with a mug of soothing drunken blumpkin."
	icon_state = "jelly_blue"
	bonus_reagents = list(/datum/reagent/consumable/blumpkinjuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 2, "blumpkin" = 1)
	is_decorated = TRUE
	filling_color = "#2788C4"

/obj/item/reagent_containers/food/snacks/donut/jelly/bungo
	name = "bungo jelly donut"
	desc = "Goes great with a mason jar of hippie's delight."
	icon_state = "jelly_yellow"
	bonus_reagents = list(/datum/reagent/consumable/bungojuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "tropical sweetness" = 1)
	is_decorated = TRUE
	filling_color = "#DEC128"

/obj/item/reagent_containers/food/snacks/donut/jelly/matcha
	name = "matcha jelly donut"
	desc = "Goes great with a cup of tea."
	icon_state = "jelly_olive"
	bonus_reagents = list(/datum/reagent/toxin/teapowder = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "matcha" = 1)
	is_decorated = TRUE
	filling_color = "#879630"

/obj/item/reagent_containers/food/snacks/donut/jelly/laugh
	name = "sweet pea jelly donut"
	desc = "Goes great with a glass of Bastion Burbon!"
	icon_state = "jelly_laugh"
	bonus_reagents = list(/datum/reagent/consumable/laughter = 3)
	tastes = list("jelly" = 3, "donut" = 1, "fizzy tutti frutti" = 1)
	is_decorated = TRUE
	filling_color = "#803280"

//////////////////////////SLIME DONUTS/////////////////////////

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly
	name = "jelly donut"
	desc = "You jelly?"
	icon_state = "jelly"
	extra_reagent = /datum/reagent/toxin/slimejelly
	foodtype = JUNKFOOD | GRAIN | FRIED | TOXIC | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/plain

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/berry
	name = "pink jelly donut"
	desc = "Goes great with a soy latte."
	icon_state = "jelly_pink"
	bonus_reagents = list(/datum/reagent/consumable/berryjuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1) //Extra sprinkles to reward frosting
	filling_color = "#E57d9A"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/trumpet
	name = "spaceman's jelly donut"
	desc = "Goes great with a cold beaker of malk."
	icon_state = "jelly_purple"
	bonus_reagents = list(/datum/reagent/medicine/polypyr = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "violets" = 1)
	is_decorated = TRUE
	filling_color = "#8739BF"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/apple
	name = "apple jelly donut"
	desc = "Goes great with a shot of cinnamon schnapps."
	icon_state = "jelly_green"
	bonus_reagents = list(/datum/reagent/consumable/applejuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "green apples" = 1)
	is_decorated = TRUE
	filling_color = "#6ABE30"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/caramel
	name = "caramel jelly donut"
	desc = "Goes great with a mug of hot coco."
	icon_state = "jelly_beige"
	bonus_reagents = list(/datum/reagent/consumable/caramel = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "buttery sweetness" = 1)
	is_decorated = TRUE
	filling_color = "#D4AD5B"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/choco
	name = "chocolate jelly donut"
	desc = "Goes great with a glass of warm milk."
	icon_state = "jelly_choc"
	bonus_reagents = list(/datum/reagent/consumable/hot_coco = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1) //the coco reagent is just bitter.
	tastes = list("jelly" = 1, "donut" = 4, "bitterness" = 1)
	decorated_icon = "jelly_choc_sprinkles"
	filling_color = "#4F230D"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/blumpkin
	name = "blumpkin jelly donut"
	desc = "Goes great with a mug of soothing drunken blumpkin."
	icon_state = "jelly_blue"
	bonus_reagents = list(/datum/reagent/consumable/blumpkinjuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 2, "blumpkin" = 1)
	is_decorated = TRUE
	filling_color = "#2788C4"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/bungo
	name = "bungo jelly donut"
	desc = "Goes great with a mason jar of hippie's delight."
	icon_state = "jelly_yellow"
	bonus_reagents = list(/datum/reagent/consumable/bungojuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "tropical sweetness" = 1)
	is_decorated = TRUE
	filling_color = "#DEC128"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/matcha
	name = "matcha jelly donut"
	desc = "Goes great with a cup of tea."
	icon_state = "jelly_olive"
	bonus_reagents = list(/datum/reagent/toxin/teapowder = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("jelly" = 1, "donut" = 3, "matcha" = 1)
	is_decorated = TRUE
	filling_color = "#879630"

/obj/item/reagent_containers/food/snacks/donut/jelly/slimejelly/laugh
	name = "sweet pea jelly donut"
	desc = "Goes great with a glass of Bastion Burbon!"
	icon_state = "jelly_laugh"
	bonus_reagents = list(/datum/reagent/consumable/laughter = 3)
	tastes = list("jelly" = 3, "donut" = 1, "fizzy tutti frutti" = 1)
	is_decorated = TRUE
	filling_color = "#803280"

/obj/item/reagent_containers/food/snacks/donut/glaze
	name = "glazed donut"
	desc = "A sugar glazed donut."
	icon_state = "donut_glaze"
	bitesize = 10
	bonus_reagents = list(/datum/reagent/consumable/sugar = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 8)
	filling_color = "#FFFFFF"
	tastes = list("donut" = 1, "salt" = 3)
	foodtype = JUNKFOOD | GRAIN | FRIED | SUGAR

////////////////////////////////////////////MUFFINS////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/muffin
	name = "muffin"
	desc = "A delicious and spongy little cake."
	icon_state = "muffin"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	filling_color = "#F4A460"
	tastes = list("muffin" = 1)
	foodtype = GRAIN | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/muffin/berry
	name = "berry muffin"
	icon_state = "berrymuffin"
	desc = "A delicious and spongy little cake, with berries."
	tastes = list("muffin" = 3, "berry" = 1)
	foodtype = GRAIN | FRUIT | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/muffin/booberry
	name = "booberry muffin"
	icon_state = "berrymuffin"
	alpha = 125
	desc = "My stomach is a graveyard! No living being can quench my bloodthirst!"
	tastes = list("muffin" = 3, "spookiness" = 1)
	foodtype = GRAIN | FRUIT | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/muffin/poppy
	name = "poppy muffin"
	icon_state = "poppymuffin"
	desc = "A classic lemon poppy seed muffin. Do not consume prior to drug testing."
	tastes = list("muffin" = 3, "lemon" = 1, "seeds" = 1)
	foodtype = GRAIN | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/chawanmushi
	name = "chawanmushi"
	desc = "A legendary egg custard that makes friends out of enemies. Probably too hot for a cat to eat."
	icon_state = "chawanmushi"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	filling_color = "#FFE4E1"
	tastes = list("custard" = 1)
	foodtype = GRAIN | MEAT | VEGETABLES

////////////////////////////////////////////WAFFLES////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/waffles
	name = "waffles"
	desc = "Mmm, waffles."
	icon_state = "waffles"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#D2691E"
	tastes = list("waffles" = 1)
	foodtype = GRAIN | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/soylentgreen
	name = "\improper Soylent Green"
	desc = "Not made of people. Honest." //Totally people.
	icon_state = "soylent_green"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#9ACD32"
	tastes = list("waffles" = 7, "people" = 1)
	foodtype = GRAIN | MEAT

/obj/item/reagent_containers/food/snacks/soylenviridians
	name = "\improper Soylent Virdians"
	desc = "Not made of people. Honest." //Actually honest for once.
	icon_state = "soylent_yellow"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#9ACD32"
	tastes = list("waffles" = 7, "the colour green" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/rofflewaffles
	name = "roffle waffles"
	desc = "Waffles from Roffle. Co."
	icon_state = "rofflewaffles"
	bitesize = 4
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/drug/mushroomhallucinogen = 2, /datum/reagent/consumable/nutriment/vitamin = 2)
	filling_color = "#00BFFF"
	tastes = list("waffle" = 1, "mushrooms" = 1)
	foodtype = GRAIN | VEGETABLES | SUGAR | BREAKFAST

////////////////////////////////////////////OTHER////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/cookie
	name = "cookie"
	desc = "COOKIE!!!"
	icon_state = "COOKIE!!!"
	bitesize = 1
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	filling_color = "#F0E68C"
	tastes = list("cookie" = 1)
	foodtype = GRAIN | SUGAR
	dunkable = TRUE

/obj/item/reagent_containers/food/snacks/donkpocket
	name = "\improper hot-pocket"
	desc = "The food of choice for the seasoned wastelander."
	icon_state = "donkpocket"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	cooked_type = /obj/item/reagent_containers/food/snacks/donkpocket/warm
	filling_color = "#CD853F"
	tastes = list("meat" = 2, "dough" = 2, "laziness" = 1)
	foodtype = GRAIN
	var/list/cached_reagents_amount
	var/previous_typepath

/obj/item/reagent_containers/food/snacks/donkpocket/Initialize(mapload)
	. = ..()
	if(!cooked_type) //maploaded cooked donk pockets won't cool down anyway.
		desc += " This one will stay warm for a long time, great."

/obj/item/reagent_containers/food/snacks/donkpocket/initialize_cooked_food(obj/item/reagent_containers/food/snacks/donkpocket/S, cooking_efficiency = 1)
	. = ..()
	if(istype(S))
		S.desc = initial(S.desc) //reset the desc since will now cool down.
		for(var/R in S.bonus_reagents)
			LAZYSET(S.cached_reagents_amount, R, S.reagents.get_reagent_amount(R))
		S.previous_typepath = type
		addtimer(CALLBACK(S, PROC_REF(cool_down)), 7 MINUTES) //canonically they reverted back to normal after 7 minutes.

/obj/item/reagent_containers/food/snacks/donkpocket/proc/cool_down()
	if(!previous_typepath) //This shouldn't happen.
		qdel(src)
		return
	var/spoiled = FALSE
	for(var/R in cached_reagents_amount)
		var/amount = cached_reagents_amount[R]
		if(reagents.get_reagent_amount(R) < amount)
			spoiled = TRUE
		reagents.remove_reagent(R, amount) //no reagent duping please.
	var/obj/item/reagent_containers/food/snacks/donkpocket/D = new previous_typepath(drop_location())
	D.create_reagents(D.volume, reagent_flags, reagent_value)
	reagents.trans_to(D, reagents.total_volume)
	if(spoiled)
		D.cooked_type = null
		D.desc += " This one has gone cold and mushy, pretty unsuitable for cooking."
	qdel(src)

/obj/item/reagent_containers/food/snacks/donkpocket/warm
	name = "warm Donk-pocket"
	desc = "The heated food of choice for the seasoned traitor."
	bonus_reagents = list(/datum/reagent/medicine/omnizine = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/medicine/omnizine = 3)
	cooked_type = null
	tastes = list("meat" = 2, "dough" = 2, "laziness" = 1)
	foodtype = GRAIN | ANTITOXIC

/obj/item/reagent_containers/food/snacks/dankpocket
	name = "\improper Dank-pocket"
	desc = "The food of choice for the seasoned botanist."
	icon_state = "dankpocket"
	list_reagents = list(/datum/reagent/toxin/lipolicide = 3, /datum/reagent/drug/space_drugs = 3, /datum/reagent/consumable/nutriment = 4)
	filling_color = "#00FF00"
	tastes = list("meat" = 2, "dough" = 2)
	foodtype = GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/fortunecookie
	name = "fortune cookie"
	desc = "A true prophecy in each cookie!"
	icon_state = "fortune_cookie"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	filling_color = "#F4A460"
	tastes = list("cookie" = 1)
	foodtype = GRAIN | SUGAR

/obj/item/reagent_containers/food/snacks/poppypretzel
	name = "poppy pretzel"
	desc = "It's all twisted up!"
	icon_state = "poppypretzel"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	filling_color = "#F0E68C"
	tastes = list("pretzel" = 1)
	foodtype = GRAIN | SUGAR

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit
	name = "plump helmet biscuit"
	desc = "This is a finely-prepared plump helmet biscuit. The ingredients are exceptionally minced plump helmet, and well-minced dwarven wheat flour."
	icon_state = "phelmbiscuit"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	filling_color = "#F0E68C"
	tastes = list("mushroom" = 1, "biscuit" = 1)
	foodtype = GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit/Initialize()
	var/fey = prob(10)
	if(fey)
		name = "exceptional plump helmet biscuit"
		desc = "Microwave is taken by a fey mood! It has cooked an exceptional plump helmet biscuit!"
		bonus_reagents = list(/datum/reagent/medicine/omnizine = 5, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
		foodtype += ANTITOXIC
	. = ..()
	if(fey)
		reagents.add_reagent(/datum/reagent/medicine/omnizine, 5)
		foodtype += ANTITOXIC

/obj/item/reagent_containers/food/snacks/cracker
	name = "cracker"
	desc = "It's a salted cracker."
	icon_state = "cracker"
	bitesize = 1
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	filling_color = "#F0E68C"
	tastes = list("cracker" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/cracker/c_ration
	name = "army cracker"
	bitesize = 2
	icon_state = "c_ration_cracker"

/obj/item/reagent_containers/food/snacks/cracker/k_ration
	name = "ranger biscuit"
	bitesize = 2
	icon_state = "k_ration_cracker"
	tastes = list("biscuit" = 1, "brahmin butter" = 1)

/obj/item/reagent_containers/food/snacks/hotdog
	name = "hotdog"
	desc = "Fresh footlong ready to go down on."
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "hotdog"
	bitesize = 3
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/ketchup = 3, /datum/reagent/consumable/nutriment/vitamin = 3)
	filling_color = "#8B0000"
	tastes = list("bun" = 3, "meat" = 2)
	foodtype = GRAIN | MEAT | VEGETABLES

/obj/item/reagent_containers/food/snacks/meatbun
	name = "meat bun"
	desc = "Has the potential to not be Dog."
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "meatbun"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 2)
	filling_color = "#8B0000"
	tastes = list("bun" = 3, "meat" = 2)
	foodtype = GRAIN | MEAT | VEGETABLES

/obj/item/reagent_containers/food/snacks/khachapuri
	name = "khachapuri"
	desc = "Bread with egg and cheese?"
	icon_state = "khachapuri"
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 2)
	filling_color = "#FFFF4D"
	tastes = list("bread" = 1, "egg" = 1, "cheese" = 1)
	foodtype = GRAIN | MEAT | DAIRY

/obj/item/reagent_containers/food/snacks/sugarcookie
	name = "sugar cookie"
	desc = "Just like your little sister used to make."
	icon_state = "sugarcookie"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3)
	filling_color = "#CD853F"
	tastes = list("sweetness" = 1)
	foodtype = GRAIN | JUNKFOOD | SUGAR
	dunkable = TRUE

/obj/item/reagent_containers/food/snacks/chococornet
	name = "chocolate cornet"
	desc = "Which side's the head, the fat end or the thin end?"
	icon_state = "chococornet"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#FFE4C4"
	tastes = list("biscuit" = 3, "chocolate" = 1)
	foodtype = GRAIN | JUNKFOOD

/obj/item/reagent_containers/food/snacks/oatmealcookie
	name = "oatmeal cookie"
	desc = "The best of both cookie and oat."
	icon_state = "oatmealcookie"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#D2691E"
	tastes = list("cookie" = 2, "oat" = 1)
	foodtype = GRAIN
	dunkable = TRUE

/obj/item/reagent_containers/food/snacks/raisincookie
	name = "raisin cookie"
	desc = "Why would you put raisins on a cookie?"
	icon_state = "raisincookie"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#F0E68C"
	tastes = list("cookie" = 1, "raisins" = 1)
	foodtype = GRAIN | FRUIT
	dunkable = TRUE

/obj/item/reagent_containers/food/snacks/cherrycupcake
	name = "cherry cupcake"
	desc = "A sweet cupcake with cherry bits."
	icon_state = "cherrycupcake"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#F0E68C"
	tastes = list("cake" = 3, "cherry" = 1)
	foodtype = GRAIN | FRUIT | SUGAR

/obj/item/reagent_containers/food/snacks/bluecherrycupcake
	name = "blue cherry cupcake"
	desc = "Blue cherries inside a delicious cupcake."
	icon_state = "bluecherrycupcake"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#F0E68C"
	tastes = list("cake" = 3, "blue cherry" = 1)
	foodtype = GRAIN | FRUIT | SUGAR

/obj/item/reagent_containers/food/snacks/strawberrycupcake
	name = "strawberry cupcake"
	desc = "Strawberry inside a delicious cupcake."
	icon_state = "strawberrycupcake"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#F0E68C"
	tastes = list("cake" = 2, "strawberry" = 1)
	foodtype = GRAIN | FRUIT | SUGAR

/obj/item/reagent_containers/food/snacks/cannoli
	name = "cannoli"
	desc = "A sicilian treat that makes you into a wise guy."
	icon_state = "cannoli"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("pastry" = 1)
	foodtype = GRAIN | DAIRY | SUGAR
	w_class = WEIGHT_CLASS_TINY

/obj/item/reagent_containers/food/snacks/honeybun
	name = "honey bun"
	desc = "A sticky pastry bun glazed with honey."
	icon_state = "honeybun"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/honey = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/honey = 5)
	filling_color = "#F2CE91"
	tastes = list("pastry" = 1, "sweetness" = 1)
	foodtype = GRAIN | SUGAR

#define PANCAKE_MAX_STACK 10

/obj/item/reagent_containers/food/snacks/pancakes
	name = "pancake"
	desc = "A fluffy pancake. The softer, superior relative of the waffle."
	icon_state = "pancakes_1"
	item_state = "pancakes"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#D2691E"
	tastes = list("pancakes" = 1)
	foodtype = GRAIN | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/pancakes/blueberry
	name = "blueberry pancake"
	desc = "A fluffy and delicious blueberry pancake."
	icon_state = "bbpancakes_1"
	item_state = "bbpancakes"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("pancakes" = 1, "blueberries" = 1)

/obj/item/reagent_containers/food/snacks/pancakes/chocolatechip
	name = "chocolate chip pancake"
	desc = "A fluffy and delicious chocolate chip pancake."
	icon_state = "ccpancakes_1"
	item_state = "ccpancakes"
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("pancakes" = 1, "chocolate" = 1)

/obj/item/reagent_containers/food/snacks/pancakes/Initialize()
	. = ..()
	update_icon()

/obj/item/reagent_containers/food/snacks/pancakes/update_icon()
	if(contents.len)
		name = "stack of pancakes"
	else
		name = initial(name)
	if(contents.len < LAZYLEN(overlays))
		overlays-=overlays[overlays.len]

/obj/item/reagent_containers/food/snacks/pancakes/examine(mob/user)
	var/ingredients_listed = ""
	var/pancakeCount = contents.len
	switch(pancakeCount)
		if(0)
			desc = initial(desc)
		if(1 to 2)
			desc = "A stack of fluffy pancakes."
		if(3 to 6)
			desc = "A fat stack of fluffy pancakes!"
		if(7 to 9)
			desc = "A grand tower of fluffy, delicious pancakes!"
		if(PANCAKE_MAX_STACK to INFINITY)
			desc = "A massive towering spire of fluffy, delicious pancakes. It looks like it could tumble over!"
	var/originalBites = bitecount
	if (pancakeCount)
		var/obj/item/reagent_containers/food/snacks/S = contents[pancakeCount]
		bitecount = S.bitecount
	. = ..()
	if (pancakeCount)
		for(var/obj/item/reagent_containers/food/snacks/pancakes/ING in contents)
			ingredients_listed += "[ING.name], "
		. += "It contains [contents.len?"[ingredients_listed]":"no ingredient, "]on top of a [initial(name)]."
	bitecount = originalBites

/obj/item/reagent_containers/food/snacks/pancakes/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/reagent_containers/food/snacks/pancakes/))
		var/obj/item/reagent_containers/food/snacks/pancakes/P = I
		if((contents.len >= PANCAKE_MAX_STACK) || ((P.contents.len + contents.len) > PANCAKE_MAX_STACK) || (reagents.total_volume >= volume))
			to_chat(user, span_warning("You can't add that many pancakes to [src]!"))
		else
			if(!user.transferItemToLoc(I, src))
				return
			to_chat(user, span_notice("You add the [I] to the [name]."))
			P.name = initial(P.name)
			contents += P
			update_snack_overlays(P)
			if (P.contents.len)
				for(var/V in P.contents)
					P = V
					P.name = initial(P.name)
					contents += P
					update_snack_overlays(P)
			P = I
			clearlist(P.contents)
		return
	else if(contents.len)
		var/obj/O = contents[contents.len]
		return O.attackby(I, user, params)
	..()

/obj/item/reagent_containers/food/snacks/pancakes/update_snack_overlays(obj/item/reagent_containers/food/snacks/P)
	var/mutable_appearance/pancake = mutable_appearance(icon, "[P.item_state]_[rand(1,3)]")
	pancake.pixel_x = rand(-1,1)
	pancake.pixel_y = 3 * contents.len - 1
	add_overlay(pancake)
	update_icon()

/obj/item/reagent_containers/food/snacks/pancakes/attack(mob/M, mob/user, def_zone, stacked = TRUE)
	if(user.a_intent == INTENT_HARM || !contents.len || !stacked)
		return ..()
	var/obj/item/O = contents[contents.len]
	. = O.attack(M, user, def_zone, FALSE)
	update_icon()

#undef PANCAKE_MAX_STACK

/obj/item/reagent_containers/food/snacks/peanut_butter
	name = "peanut butter cookie"
	desc = "A tasty, chewy peanut butter cookie."
	icon_state = "peanut_butter_cookie"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/peanut_butter = 5)
	tastes = list("peanut butter" = 2, "cookie" = 1)
	foodtype = GRAIN | JUNKFOOD

/obj/item/reagent_containers/food/snacks/raw_brownie_batter
	name = "raw brownie batter"
	desc = "A sticky mixture of raw brownie batter, cook it in the oven!"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "raw_brownie_batter"
	cooked_type = /obj/item/reagent_containers/food/snacks/brownie_sheet
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("raw brownie batter" = 1)
	foodtype = GRAIN | JUNKFOOD | SUGAR | BREAKFAST

/obj/item/reagent_containers/food/snacks/brownie_sheet
	name = "brownie sheet"
	desc = "An uncut sheet of cooked brownie, use a knife to cut it!."
	icon = 'icons/obj/food/food.dmi'
	icon_state = "brownie_sheet"
	slice_path = /obj/item/reagent_containers/food/snacks/brownie
	slices_num = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/sugar = 12)
	tastes = list("brownie" = 1, "chocolatey goodness" = 1)
	foodtype = GRAIN | JUNKFOOD | SUGAR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/brownie
	name = "brownie"
	desc = "A square slice of delicious, chewy brownie. Often the target of potheads."
	icon = 'icons/obj/food/food.dmi'
	icon_state = "brownie"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/sugar = 3)
	tastes = list("brownie" = 1, "chocolatey goodness" = 1)
	foodtype = GRAIN | JUNKFOOD | SUGAR
	w_class = WEIGHT_CLASS_SMALL
