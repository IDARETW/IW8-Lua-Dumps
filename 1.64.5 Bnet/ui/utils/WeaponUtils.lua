WEAPON = WEAPON or {}
WEAPON.CamoNoneValue = "none"
WEAPON.ReticleNoneValue = "none"
WEAPON.CharmNoneValue = "none"
WEAPON.StickerNoneValue = "none"
WEAPON.NoneValue = "iw8_gunless"
WEAPON.GunsmithTestIndexWeapon = "iw8_ar_akilo47"
WEAPON.FrontEndRiotShield = "iw8_me_riotshield_mp_frontend"
WEAPON.RiotShield = "iw8_me_riotshield_mp"
WEAPON.FrontEndRiotShield_V2 = "iw8_me_riotshield_mpv2_frontend"
WEAPON.RiotShield_V2 = "iw8_me_riotshield_mpv2"
WEAPON.FrontEndRiotShield_V3 = "iw8_me_riotshield_mpv3_frontend"
WEAPON.RiotShield_V3 = "iw8_me_riotshield_mpv3"
WEAPON.FrontEndRiotShield_V4 = "iw8_me_riotshield_mpv4_frontend"
WEAPON.RiotShield_V4 = "iw8_me_riotshield_mpv4"
WEAPON.FrontEndRiotShield_V5 = "iw8_me_riotshield_mpv5_frontend"
WEAPON.RiotShield_V5 = "iw8_me_riotshield_mpv5"
WEAPON.FrontEndRiotShield_V6 = "iw8_me_riotshield_mpv6_frontend"
WEAPON.RiotShield_V6 = "iw8_me_riotshield_mpv6"
WEAPON.FrontEndRiotShield_V7 = "iw8_me_riotshield_mpv7_frontend"
WEAPON.RiotShield_V7 = "iw8_me_riotshield_mpv7"
WEAPON.Knife = "iw8_knife_mp"
WEAPON.MasterKnifeRef = "me_knife"
WEAPON.KaliSticks = "iw8_me_akimboblunt"
WEAPON.Swords = "iw8_me_akimboblades"
WEAPON.SledgeHammer = "iw8_me_t9sledgehammer"
WEAPON.Wakizashi = "iw8_me_t9wakizashi"
WEAPON.ETool = "iw8_me_t9etool"
WEAPON.MacheteT9 = "iw8_me_t9machete"
WEAPON.BatT9 = "iw8_me_t9bat"
WEAPON.MaceT9 = "iw8_me_t9mace"
WEAPON.CaneT9 = "iw8_me_t9cane"
WEAPON.SaiT9 = "iw8_me_t9sai"
WEAPON.BattleAxeT9 = "iw8_me_t9battleaxe"
WEAPON.KATANA = "s4_me_katana"
WEAPON.AXE = "s4_me_axe"
WEAPON.ICEPICK = "s4_me_icepick"
WEAPON.SCYTHE = "iw8_me_t9scythe"
WEAPON.SAWTOOTH = "s4_me_leiomano"
WEAPON.SledgehammerS4 = "s4_me_sledgehammer"
WEAPON.DefaultPrimary = "iw8_ar_kilo433"
WEAPON.DefaultPrimaryID = 20
WEAPON.DefaultSecondary = "iw8_pi_mike1911"
WEAPON.DefaultSecondaryID = 4
WEAPON.PrimarySlot = 0
WEAPON.SecondarySlot = 1
WEAPON.SandbagShort = 0
WEAPON.SandbagMedium = 1
WEAPON.SandbagLong = 2
WEAPON.ARClass = "weapon_assault"
WEAPON.LMGClass = "weapon_lmg"
WEAPON.sniperClass = "weapon_sniper"
WEAPON.DMRClass = "weapon_dmr"
WEAPON.pistolClass = "weapon_pistol"
WEAPON.SMGClass = "weapon_smg"
WEAPON.SHOTGUNClass = "weapon_shotgun"
WEAPON.LAUNCHERClass = "weapon_projectile"
WEAPON.MELEEClass = "weapon_melee"
WEAPON.MELEEClass2 = "weapon_melee2"
WEAPON.tacticalClass = "weapon_tactical"
WEAPON.baseVariant = 0
WEAPON.goldCamoIDOffset = 2000100
WEAPON.clientWeaponPrimary = 0
WEAPON.clientWeaponSecondary = 1
WEAPON.clientWeaponPreview = 2
WEAPON.clientWeaponWatch = 3
WEAPON.maxLoadoutWeapons = 2
WEAPON.maxAttachmentsPerWeapon = 10
WEAPON.maxStickersPerWeapon = 4
WEAPON.emptyCustomizeSlotIcon = "customization_empty_slot"
WEAPON.dismembermentAmmoSuffix = "_HEI"
WEAPON.dismembermentWeaponSuffix = "_mpdmb"
WEAPON.JavelinStateType = {
	Hold = 2,
	Fire = 3,
	Scanning = 1,
	Off = 0,
	TooClose = 4
}
WEAPON.BinocularsStateType = {
	MarkingTarget = 1,
	Idle = 0,
	MarkResistant = 2
}
WEAPON.WeaponClassInC = {
	PISTOL = 5,
	ROCKETLAUNCHER = 7,
	SPREAD = 4,
	THROWINGKNIFE = 9,
	NON_PLAYER = 10,
	TURRET = 8,
	SNIPER = 1,
	NONE = 14,
	SMG = 3,
	RIFLE = 0,
	BALL = 13,
	ITEM = 11,
	MG = 2,
	GRENADE = 6,
	BEAM = 12
}
WEAPON.WeaponVariantMap = {
	optic = CSV.weaponVariants.cols.attachments.optic,
	magazine = CSV.weaponVariants.cols.attachments.mag,
	gunperk = CSV.weaponVariants.cols.attachments.perk,
	muzzle = CSV.weaponVariants.cols.attachments.muzzle,
	reargrip = CSV.weaponVariants.cols.attachments.rearGrip,
	undermount = CSV.weaponVariants.cols.attachments.underBarrel,
	extra = CSV.weaponVariants.cols.attachments.extra,
	frontpiece = CSV.weaponVariants.cols.attachments.barrel,
	backpiece = CSV.weaponVariants.cols.attachments.stock,
	trigger = CSV.weaponVariants.cols.attachments.trigger,
	other = CSV.weaponVariants.cols.attachments.other,
	extrapstl = CSV.weaponVariants.cols.attachments.extra
}
WEAPON.UltimateChallengeCounts = {
	MAX = 306,
	MIN = 16
}
WEAPON.UltimateChallengeItemId = 171217
WEAPON.SpecialAttribute = {
	red = {
		name = "WEAPON/TRACER_RED",
		icon = "icon_attribute_tracer",
		ref = "red",
		color = SWATCHES.Tracer.red
	},
	blue = {
		name = "WEAPON/TRACER_BLUE",
		icon = "icon_attribute_tracer",
		ref = "blue",
		color = SWATCHES.Tracer.blue
	},
	pink = {
		name = "WEAPON/TRACER_PINK",
		icon = "icon_attribute_tracer",
		ref = "pink",
		color = SWATCHES.Tracer.pink
	},
	green = {
		name = "WEAPON/TRACER_GREEN",
		icon = "icon_attribute_tracer",
		ref = "green",
		color = SWATCHES.Tracer.green
	},
	purple = {
		name = "WEAPON/TRACER_PURPLE",
		icon = "icon_attribute_tracer",
		ref = "purple",
		color = SWATCHES.Tracer.purple
	},
	orange = {
		name = "WEAPON/TRACER_ORANGE",
		icon = "icon_attribute_tracer",
		ref = "orange",
		color = SWATCHES.Tracer.orange
	},
	yellow = {
		name = "WEAPON/TRACER_YELLOW",
		icon = "icon_attribute_tracer",
		ref = "yellow",
		color = SWATCHES.Tracer.yellow
	},
	freedom = {
		atlas = "loot_card_overlay_tracer_freedom",
		name = "WEAPON/TRACER_FREEDOM",
		ref = "freedom",
		icon = "icon_attribute_tracer_freedom",
		color = SWATCHES.Tracer.freedom
	},
	shadow = {
		name = "WEAPON/TRACER_SHADOW",
		icon = "icon_attribute_tracer",
		ref = "shadow",
		color = SWATCHES.Tracer.shadow
	},
	gold = {
		name = "WEAPON/TRACER_GOLD",
		icon = "icon_attribute_tracer",
		ref = "gold",
		color = SWATCHES.Tracer.gold
	},
	morte = {
		atlas = "loot_card_overlay_tracer_morte",
		name = "WEAPON/TRACER_MORTE",
		ref = "morte",
		icon = "icon_attribute_tracer_morte",
		color = SWATCHES.Tracer.morte
	},
	tesla = {
		atlas = "loot_card_overlay_tracer_tesla",
		name = "WEAPON/TRACER_TESLA",
		ref = "tesla",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.tesla
	},
	sixteenBit = {
		atlas = "loot_card_overlay_tracer_16bit",
		name = "WEAPON/TRACER_16BIT",
		ref = "sixteenBit",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.sixteenBit
	},
	dark = {
		atlas = "loot_card_overlay_tracer_dark",
		name = "WEAPON/TRACER_DARK",
		ref = "dark",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.dark,
		blendMode = BLEND_MODE.blend
	},
	light = {
		name = "WEAPON/TRACER_LIGHT",
		icon = "icon_attribute_tracer",
		ref = "light",
		color = SWATCHES.Tracer.white
	},
	soul = {
		name = "WEAPON/TRACER_SOUL",
		icon = "icon_attribute_tracer",
		ref = "soul",
		color = SWATCHES.Tracer.soul
	},
	crimsonGold = {
		atlas = "loot_card_overlay_tracer_crimsonGold",
		name = "WEAPON/TRACER_CRIMSON_GOLD",
		ref = "crimsonGold",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.crimsonGold
	},
	emerald = {
		name = "WEAPON/TRACER_EMERALD",
		icon = "icon_attribute_tracer",
		ref = "emerald",
		color = SWATCHES.Tracer.emerald
	},
	amethyst = {
		name = "WEAPON/TRACER_AMETHYST",
		icon = "icon_attribute_tracer",
		ref = "amethyst",
		color = SWATCHES.Tracer.amethyst
	},
	purpleGreen = {
		atlas = "loot_card_overlay_tracer_green_purple",
		name = "WEAPON/TRACER_PURPLE_GREEN",
		ref = "purpleGreen",
		icon = "icon_attribute_tracer_purple_green",
		color = SWATCHES.Tracer.purple
	},
	cherryBlossom = {
		atlas = "loot_card_overlay_tracer_cherryBlossom",
		name = "WEAPON/TRACER_CHERRY_BLOSSOM",
		ref = "cherryBlossom",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.cherryBlossom
	},
	ice = {
		atlas = "loot_card_overlay_tracer_ice",
		name = "WEAPON/TRACER_ICE",
		ref = "ice",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.ice
	},
	rainbow = {
		atlas = "loot_card_overlay_tracer_rainbow",
		name = "WEAPON/TRACER_RAINBOW",
		ref = "rainbow",
		icon = "icon_attribute_tracer_rainbow",
		color = SWATCHES.Tracer.white
	},
	black = {
		atlas = "loot_card_overlay_tracer_blacklight",
		name = "WEAPON/TRACER_BLACK",
		ref = "black",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.black,
		blendMode = BLEND_MODE.blend
	},
	crimsonRonin = {
		atlas = "loot_card_overlay_tracer_crimsonRonin",
		name = "WEAPON/TRACER_CRIMSON_RONIN",
		ref = "crimsonRonin",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.crimsonRonin
	},
	acid = {
		atlas = "loot_card_overlay_tracer_acid",
		name = "WEAPON/TRACER_ACID",
		ref = "acid",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.acid,
		blendMode = BLEND_MODE.blend
	},
	goldPurple = {
		atlas = "loot_card_overlay_tracer_gold_purple",
		name = "WEAPON/TRACER_GOLD_PURPLE",
		ref = "goldPurple",
		icon = "icon_attribute_tracer_gold_purple",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	bluePurple = {
		atlas = "loot_card_overlay_tracer_blue_purple",
		name = "WEAPON/TRACER_BLUE_PURPLE",
		ref = "bluePurple",
		icon = "icon_attribute_tracer_blue_purple",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	yellowGreen = {
		atlas = "loot_card_overlay_tracer_yellow_green",
		name = "WEAPON/TRACER_YELLOW_GREEN",
		ref = "yellowGreen",
		icon = "icon_attribute_tracer_yellow_green",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	orangeGreen = {
		atlas = "loot_card_overlay_tracer_orange_green",
		name = "WEAPON/TRACER_ORANGE_GREEN",
		ref = "orangeGreen",
		icon = "icon_attribute_tracer_orange_green",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	whitepink = {
		atlas = "loot_card_overlay_tracer_white_pink",
		name = "WEAPON/TRACER_WHITE_PINK",
		ref = "whitepink",
		icon = "icon_attribute_tracer_white_pink",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	paintball = {
		atlas = "loot_card_overlay_tracer_paintball",
		name = "WEAPON/TRACER_PAINTBALL",
		ref = "paintball",
		icon = "icon_attribute_tracer_paintball",
		color = SWATCHES.Tracer.gold,
		blendMode = BLEND_MODE.blend
	},
	cyan = {
		atlas = "loot_card_overlay_tracer_cyan",
		name = "WEAPON/TRACER_CYAN",
		ref = "cyan",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.cyan
	},
	purplecyan = {
		atlas = "loot_card_overlay_tracer_cyan_purple",
		name = "WEAPON/TRACER_PURPLE_CYAN",
		ref = "purplecyan",
		icon = "icon_attribute_tracer_purple_cyan",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	bluered = {
		atlas = "loot_card_overlay_tracer_blue_red",
		name = "WEAPON/TRACER_BLUE_RED",
		ref = "bluered",
		icon = "icon_attribute_tracer_blue_red",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	greengold = {
		atlas = "loot_card_overlay_tracer_green_gold",
		name = "WEAPON/TRACER_GREEN_GOLD",
		ref = "greengold",
		icon = "icon_attribute_tracer_green_gold",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	numbers = {
		atlas = "loot_card_overlay_tracer_numbers",
		name = "WEAPON/TRACER_NUMBERS",
		ref = "numbers",
		icon = "icon_attribute_tracer_numbers",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	paintballalt01 = {
		atlas = "loot_card_overlay_tracer_paintball_alt_01",
		name = "WEAPON/TRACER_PAINTBALL_ALT_01",
		ref = "paintballalt01",
		icon = "icon_attribute_tracer_paintball_alt_01",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	paintballalt02 = {
		atlas = "loot_card_overlay_tracer_paintball_alt_02",
		name = "WEAPON/TRACER_PAINTBALL_ALT_02",
		ref = "paintballalt02",
		icon = "icon_attribute_tracer_paintball_alt_02",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	electricgold = {
		atlas = "loot_card_overlay_tracer_electricgold",
		name = "WEAPON/TRACER_ELECTRIC_GOLD",
		ref = "electricgold",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.gold,
		blendMode = BLEND_MODE.blend
	},
	lazer = {
		atlas = "loot_card_overlay_tracer_cyan",
		name = "WEAPON/TRACER_LAZER",
		ref = "lazer",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.cyan
	},
	redwhite = {
		atlas = "loot_card_overlay_tracer_red_white",
		name = "WEAPON/TRACER_RED_WHITE",
		ref = "redwhite",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.red
	},
	orangepurple = {
		atlas = "loot_card_overlay_tracer_orange_purple",
		name = "WEAPON/TRACER_ORANGE_PURPLE",
		ref = "orangepurple",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.purple
	},
	goldwhite = {
		atlas = "loot_card_overlay_tracer_gold_white",
		name = "WEAPON/TRACER_GOLD_WHITE",
		ref = "goldwhite",
		icon = "icon_attribute_tracer_gold_white",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.gold,
		blendMode = BLEND_MODE.blend
	},
	redgreen = {
		atlas = "loot_card_overlay_tracer_red_green",
		name = "WEAPON/TRACER_RED_GREEN",
		ref = "redgreen",
		icon = "icon_attribute_tracer_red_green",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	smoke = {
		atlas = "loot_card_overlay_tracer_smoke",
		name = "WEAPON/TRACER_SMOKE",
		ref = "smoke",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	goldarrow = {
		atlas = "loot_card_overlay_tracer_gold_arrow",
		name = "WEAPON/TRACER_GOLDARROW",
		ref = "goldarrow",
		icon = "icon_attribute_tracer_gold_arrow",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.gold,
		blendMode = BLEND_MODE.blend
	},
	shamrock = {
		atlas = "loot_card_overlay_tracer_shamrock",
		name = "WEAPON/TRACER_SHAMROCK",
		ref = "shamrock",
		icon = "icon_attribute_tracer_shamrock",
		color = SWATCHES.Tracer.gold,
		attributeColor = SWATCHES.Tracer.gold,
		blendMode = BLEND_MODE.blend
	},
	greenpurpleyellow = {
		atlas = "loot_card_overlay_tracer_green_purple_yellow",
		name = "WEAPON/TRACER_GREENPURPLEYELLOW",
		ref = "greenpurpleyellow",
		icon = "icon_attribute_tracer_green_purple_yellow",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.gold,
		blendMode = BLEND_MODE.blend
	},
	greenWeed = {
		atlas = "loot_card_overlay_tracer_weed",
		name = "WEAPON/TRACER_WEED",
		ref = "greenWeed",
		icon = "icon_attribute_tracer_weed",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.emerald,
		blendMode = BLEND_MODE.blend
	},
	cobalt = {
		atlas = "loot_card_overlay_tracer_cobalt",
		name = "WEAPON/TRACER_COBALT",
		ref = "cobalt",
		icon = "icon_attribute_tracer_cobalt",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	greensparks = {
		atlas = "loot_card_overlay_tracer_greensparks",
		name = "WEAPON/TRACER_GREENSPARKS",
		ref = "greensparks",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.green,
		blendMode = BLEND_MODE.blend
	},
	pacificblack = {
		atlas = "loot_card_overlay_tracer_pacificblack",
		name = "WEAPON/TRACER_PACIFICBLACK",
		ref = "pacificblack",
		icon = "icon_attribute_tracer_pacificblack",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.blue,
		blendMode = BLEND_MODE.blend
	},
	gorillaGreen = {
		name = "WEAPON/TRACER_GORILLAGREEN",
		ref = "gorillaGreen",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.green,
		attributeColor = SWATCHES.Tracer.green
	},
	hologreen = {
		atlas = "loot_card_overlay_tracer_hologreen",
		name = "WEAPON/TRACER_HOLOGREEN",
		ref = "hologreen",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.green,
		blendMode = BLEND_MODE.blend
	},
	darkaetherred = {
		atlas = "loot_card_overlay_tracer_darkaetherred",
		name = "WEAPON/TRACER_DARKAETHERRED",
		ref = "darkaetherred",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.red,
		attributeColor = SWATCHES.Tracer.red,
		blendMode = BLEND_MODE.blend
	},
	paintyellow = {
		atlas = "loot_card_overlay_tracer_paintyellow",
		name = "WEAPON/TRACER_PAINTYELLOW",
		ref = "paintyellow",
		icon = "icon_attribute_tracer_gold_white",
		color = SWATCHES.Tracer.yellow,
		attributeColor = SWATCHES.Tracer.yellow,
		blendMode = BLEND_MODE.blend
	},
	fieryorange = {
		atlas = "loot_card_overlay_tracer_fieryorange",
		name = "WEAPON/TRACER_FIERYORANGE",
		ref = "fieryorange",
		icon = "icon_attribute_tracer_fieryorange",
		color = SWATCHES.Tracer.orange,
		attributeColor = SWATCHES.Tracer.orange,
		blendMode = BLEND_MODE.blend
	},
	radiogreen = {
		atlas = "loot_card_overlay_tracer_radiogreen",
		name = "WEAPON/TRACER_RADIOGREEN",
		ref = "radiogreen",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.green,
		attributeColor = SWATCHES.Tracer.green,
		blendMode = BLEND_MODE.blend
	},
	lightning = {
		atlas = "loot_card_overlay_tracer_lightning",
		name = "WEAPON/TRACER_LIGHTNING",
		ref = "lightning",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.blue,
		blendMode = BLEND_MODE.blend
	},
	radioactiveGreen = {
		atlas = "loot_card_overlay_tracer_radioactivegreen",
		name = "WEAPON/TRACER_RADIOACTIVE_GREEN",
		ref = "radioactiveGreen",
		icon = "icon_attribute_tracer_radioactivegreen",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	goldGreen = {
		atlas = "loot_card_overlay_tracer_goldgreen",
		name = "WEAPON/TRACER_GOLD_GREEN",
		ref = "goldGreen",
		icon = "icon_attribute_tracer_yellow_green",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	quicksandYellow = {
		atlas = "loot_card_overlay_tracer_quicksand",
		name = "WEAPON/TRACER_QUICKSAND",
		ref = "quicksandYellow",
		icon = "icon_attribute_tracer_pacificblack",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.yellow,
		blendMode = BLEND_MODE.blend
	},
	redBlueWhite = {
		atlas = "loot_card_overlay_tracer_freedom_sparkler",
		name = "WEAPON/TRACER_FREEDOM_SPARKLER",
		ref = "redBlueWhite",
		icon = "icon_attribute_tracer_freedom",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	neonpurple = {
		atlas = "loot_card_overlay_tracer_neon_purple",
		name = "WEAPON/TRACER_NEON_PURPLE",
		ref = "neonpurple",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.purple,
		blendMode = BLEND_MODE.blend
	},
	prismaticPurple = {
		atlas = "loot_card_overlay_tracer_prismatic_purple",
		name = "WEAPON/TRACER_PRISMATIC_PURPLE",
		ref = "prismaticPurple",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.purple,
		blendMode = BLEND_MODE.blend
	},
	greenOrange = {
		atlas = "loot_card_overlay_tracer_green_orange",
		name = "WEAPON/TRACER_GREEN_ORANGE",
		ref = "greenOrange",
		icon = "icon_attribute_tracer_orange_green",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	plasmaPurple = {
		atlas = "loot_card_overlay_tracer_prismatic_purple",
		name = "WEAPON/TRACER_PLASMA_PURPLE",
		ref = "plasmaPurple",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.purple,
		blendMode = BLEND_MODE.blend
	},
	pinkRedAqua = {
		atlas = "loot_card_overlay_tracer_pink_red_aqua",
		name = "WEAPON/TRACER_PINK_RED_AQUA",
		ref = "pinkRedAqua",
		icon = "icon_attribute_tracer_pink_red_aqua",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	cyanLED = {
		atlas = "loot_card_overlay_tracer_cyanled",
		name = "WEAPON/TRACER_CYAN_LED",
		ref = "cyanLED",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.cyan,
		blendMode = BLEND_MODE.blend
	},
	white = {
		atlas = "loot_card_overlay_tracer_white",
		name = "WEAPON/TRACER_WHITE",
		ref = "white",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	soulessen = {
		atlas = "loot_card_overlay_tracer_soulessen",
		name = "WEAPON/TRACER_SOULESSEN",
		ref = "soulessen",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.cyan,
		blendMode = BLEND_MODE.blend
	},
	pinkblue = {
		atlas = "loot_card_overlay_tracer_pinkblue",
		name = "WEAPON/TRACER_PINK_BLUE",
		ref = "pinkblue",
		icon = "icon_attribute_tracer_blue_purple",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	dna = {
		atlas = "loot_card_overlay_tracer_dna",
		name = "WEAPON/TRACER_DNA",
		ref = "dna",
		icon = "icon_attribute_tracer_dna",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	pixel = {
		atlas = "loot_card_overlay_tracer_pixel",
		name = "WEAPON/TRACER_PIXEL",
		ref = "pixel",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	nitrousGreen = {
		atlas = "loot_card_overlay_tracer_nitrousgreen",
		name = "WEAPON/TRACER_NITROUSGREEN",
		ref = "nitrousGreen",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.green,
		blendMode = BLEND_MODE.blend
	},
	particleBeam = {
		atlas = "loot_card_overlay_tracer_particlebeam",
		name = "WEAPON/TRACER_PARTICLEBEAM",
		ref = "particleBeam",
		icon = "icon_attribute_tracer_fieryorange",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	greenPhlegm = {
		atlas = "loot_card_overlay_tracer_greenphlegm",
		name = "WEAPON/TRACER_GREENPHLEGM",
		ref = "greenPhlegm",
		icon = "icon_attribute_tracer_weed",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	egyptianBlue = {
		atlas = "loot_card_overlay_tracer_egyptianblue",
		name = "WEAPON/TRACER_EGYPTIANBLUE",
		ref = "egyptianBlue",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.white,
		attributeColor = SWATCHES.Tracer.blue,
		blendMode = BLEND_MODE.blend
	},
	bubblegunPink = {
		atlas = "loot_card_overlay_tracer_white_pink",
		name = "WEAPON/TRACER_BUBBLEGUN",
		ref = "bubblegunPink",
		icon = "icon_attribute_tracer_white_pink",
		color = SWATCHES.Tracer.white,
		blendMode = BLEND_MODE.blend
	},
	moeMagenta = {
		atlas = "loot_card_overlay_tracer_white_pink",
		name = "WEAPON/TRACER_MOEMAGENTA",
		ref = "moeMagenta",
		icon = "icon_attribute_tracer",
		color = SWATCHES.Tracer.pink,
		blendMode = BLEND_MODE.blend
	},
	standardDis = {
		name = "WEAPON/DISMEMBERMENT",
		icon = "icon_attribute_dismemberment",
		ref = "standardDis",
		color = SWATCHES.Dismemberment.standard
	},
	cryoDis = {
		name = "WEAPON/CRYO_DISMEMBERMENT",
		icon = "icon_attribute_dismemberment_cryo",
		ref = "cryoDis",
		color = SWATCHES.Dismemberment.cryo
	},
	goldDis = {
		name = "WEAPON/DISMEMBERMENT_GOLD",
		icon = "icon_attribute_dismemberment_gold",
		ref = "goldDis",
		color = SWATCHES.Dismemberment.gold
	},
	electricDis = {
		name = "WEAPON/DISMEMBERMENT_ELECTRIC",
		icon = "icon_attribute_dismemberment_electric",
		ref = "electricDis",
		color = SWATCHES.Dismemberment.electric
	},
	acidDis = {
		name = "WEAPON/DISMEMBERMENT_ACID",
		icon = "icon_attribute_dismemberment_acid",
		ref = "acidDis",
		color = SWATCHES.Dismemberment.acid
	},
	runicDis = {
		name = "WEAPON/DISMEMBERMENT_RUNIC",
		icon = "icon_attribute_dismemberment_runic",
		ref = "runicDis",
		color = SWATCHES.Dismemberment.runic
	},
	shatterBlast = {
		name = "WEAPON/DISMEMBERMENT_SHATTERBLAST",
		icon = "icon_attribute_dismemberment_shatter_blast",
		ref = "shatterBlast",
		color = SWATCHES.Dismemberment.shatterblast
	},
	radioactive = {
		name = "WEAPON/DISMEMBERMENT_RADIOACTIVE",
		icon = "icon_attribute_dismemberment_radioactive",
		ref = "radioactive",
		color = SWATCHES.Dismemberment.radioactive
	},
	fire = {
		name = "WEAPON/DISMEMBERMENT_FIRE",
		icon = "icon_attribute_dismemberment_fire",
		ref = "fire",
		color = SWATCHES.Dismemberment.fire
	},
	fireworkDis = {
		name = "WEAPON/DISMEMBERMENT_FIREWORK",
		icon = "icon_attribute_dismemberment_firework",
		ref = "fireworkDis",
		color = SWATCHES.Dismemberment.firework
	},
	sunburstDis = {
		name = "WEAPON/DISMEMBERMENT_SUNBURST",
		icon = "icon_attribute_dismemberment_sunburst",
		ref = "sunburstDis",
		color = SWATCHES.Dismemberment.fire
	},
	beerDis = {
		name = "WEAPON/DISMEMBERMENT_BEER",
		icon = "icon_attribute_dismemberment_beer",
		ref = "beerDis",
		color = SWATCHES.Dismemberment.standard
	},
	electricgoldDis = {
		name = "WEAPON/DISMEMBERMENT_ELECTRIC_GOLD",
		icon = "icon_attribute_dismemberment_gold_electric",
		ref = "electricgoldDis",
		color = SWATCHES.Dismemberment.gold
	},
	numbersdDis = {
		name = "WEAPON/DISMEMBERMENT_NUMBERS",
		icon = "icon_attribute_dismemberment_numbers",
		ref = "numbersDis",
		color = SWATCHES.Dismemberment.shatterblast
	},
	purpleelectricDis = {
		name = "WEAPON/DISMEMBERMENT_PURPLE_ELECTRIC",
		icon = "icon_attribute_dismemberment_purple_electric",
		ref = "purpleelectricDis",
		color = SWATCHES.Dismemberment.electric
	},
	radioactiveblueDis = {
		name = "WEAPON/DISMEMBERMENT_RACIOACTIVE_BLUE",
		icon = "icon_attribute_dismemberment_radioactive_blue",
		ref = "radioactiveblueDis",
		color = SWATCHES.Dismemberment.firework
	},
	deatheffectDis = {
		name = "WEAPON/DISMEMBERMENT_DEATHEFFECT",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deatheffectDis",
		color = SWATCHES.Dismemberment.standard
	},
	deathSmoke = {
		name = "WEAPON/DISMEMBERMENT_SMOKE",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathSmoke",
		color = SWATCHES.Dismemberment.standard
	},
	deathBlueFire = {
		name = "WEAPON/DISMEMBERMENT_BLUEFIRE",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathBlueFire",
		color = SWATCHES.Dismemberment.standard
	},
	deathRedFire = {
		name = "WEAPON/DISMEMBERMENT_REDFIRE",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathRedFire",
		color = SWATCHES.Dismemberment.standard
	},
	deathRockSlab = {
		name = "WEAPON/DISMEMBERMENT_ROCKSLAB",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathRockSlab",
		color = SWATCHES.Dismemberment.standard
	},
	deathPhotonScream = {
		name = "WEAPON/DISMEMBERMENT_PHOTONSCREAM",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathPhotonScream",
		color = SWATCHES.Dismemberment.standard
	},
	deathHeatRay = {
		name = "WEAPON/DISMEMBERMENT_HEATRAY",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathHeatRay",
		color = SWATCHES.Dismemberment.standard
	},
	deathFire = {
		name = "WEAPON/DISMEMBERMENT_FIRE",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathFire",
		color = SWATCHES.Dismemberment.standard
	},
	deathElectrical = {
		name = "WEAPON/DISMEMBERMENT_ELECTRIC",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathElectrical",
		color = SWATCHES.Dismemberment.standard
	},
	deathVolcanic = {
		name = "WEAPON/DISMEMBERMENT_VOLCANIC",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathVolcanic",
		color = SWATCHES.Dismemberment.standard
	},
	deathRadiation = {
		name = "WEAPON/DISMEMBERMENT_RADIATION",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathRadiation",
		color = SWATCHES.Dismemberment.standard
	},
	deathDesiccation = {
		name = "WEAPON/DISMEMBERMENT_DESICCATION",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathDesiccation",
		color = SWATCHES.Dismemberment.standard
	},
	deathFirework = {
		name = "WEAPON/DISMEMBERMENT_FIREWORK",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathFirework",
		color = SWATCHES.Dismemberment.standard
	},
	deathLightShow = {
		name = "WEAPON/DISMEMBERMENT_LIGHT_SHOW",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathLightShow",
		color = SWATCHES.Dismemberment.standard
	},
	deathJudgement = {
		name = "WEAPON/DISMEMBERMENT_JUDGEMENT",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathJudgement",
		color = SWATCHES.Dismemberment.standard
	},
	deathRetroBlast = {
		name = "WEAPON/DISMEMBERMENT_RETRO_BLAST",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathRetroBlast",
		color = SWATCHES.Dismemberment.standard
	},
	deathHex = {
		name = "WEAPON/DISMEMBERMENT_HEX",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathHex",
		color = SWATCHES.Dismemberment.standard
	},
	deathVirulent = {
		name = "WEAPON/DISMEMBERMENT_VIRULENT",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathVirulent",
		color = SWATCHES.Dismemberment.standard
	},
	deathSpace = {
		name = "WEAPON/DISMEMBERMENT_SPACE",
		icon = "icon_attribute_dismemberment_deatheffect",
		ref = "deathSpace",
		color = SWATCHES.Dismemberment.standard
	}
}

function WEAPON.NotifyWeaponDataError(arg_1_0, arg_1_1)
	if Dvar.IBEGCHEFE("ui_killswitch_baddata_notification_weapondata") then
		return
	end

	if arg_1_0 then
		local var_1_0 = "Bad data error on weapon data: " .. tostring(arg_1_0) .. ", " .. arg_1_1

		DebugPrint(var_1_0)

		if not CONDITIONS.IsQABotSkipActive() then
			LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("MENU/ERROR"), var_1_0)
		end
	end
end

function WEAPON.NotifyWeaponCamoDataError(arg_2_0, arg_2_1)
	if Dvar.IBEGCHEFE("ui_killswitch_baddata_notification_weapondata") then
		return
	end

	if arg_2_0 then
		local var_2_0 = "Bad data error on weapon camo data, for camoID: " .. tostring(arg_2_0) .. ", " .. arg_2_1

		DebugPrint(var_2_0)

		if not CONDITIONS.IsQABotSkipActive() then
			LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("MENU/ERROR"), var_2_0)
		end
	end
end

function WEAPON.StripSuffix(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0
	local var_3_1 = string.len(arg_3_0)

	if string.sub(arg_3_0, var_3_1 - 2) == arg_3_1 then
		var_3_0 = string.sub(arg_3_0, 0, var_3_1 - 3)
	end

	return var_3_0
end

function WEAPON.GetClassSlot(arg_4_0)
	local var_4_0 = StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, arg_4_0, CSV.weaponClasses.cols.slot)

	if not var_4_0 or #var_4_0 == 0 then
		return WEAPON.PrimarySlot
	else
		return tonumber(var_4_0) - 1
	end
end

function WEAPON.GetSlotFromRef(arg_5_0)
	local var_5_0 = WEAPON.GetWeaponClass(arg_5_0)

	return (WEAPON.GetClassSlot(var_5_0))
end

function WEAPON.GetWeaponSandbagPlacementIndex(arg_6_0)
	local var_6_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.asset, arg_6_0, CSV.weapons.cols.menuClass)
	local var_6_1 = WEAPON.SandbagShort

	if var_6_0 == WEAPON.ARClass or var_6_0 == WEAPON.LMGClass or var_6_0 == WEAPON.tacticalClass then
		var_6_1 = WEAPON.SandbagMedium
	elseif var_6_0 == WEAPON.sniperClass then
		var_6_1 = WEAPON.SandbagLong
	end

	return var_6_1
end

function WEAPON.GetWeaponClass(arg_7_0, arg_7_1)
	local var_7_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_7_0, CSV.weapons.cols.menuClass)

	if CONDITIONS.IsThirdGameMode() and var_7_0 == "weapon_classic_s" then
		var_7_0 = "weapon_classic_p"
	end

	if arg_7_1 and var_7_0 == WEAPON.MELEEClass2 then
		return WEAPON.MELEEClass
	else
		return var_7_0
	end
end

function WEAPON.GetWeaponClassName(arg_8_0)
	local var_8_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_8_0, CSV.weapons.cols.menuClass)

	if var_8_0 and #var_8_0 > 0 then
		return StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, var_8_0, CSV.weaponClasses.cols.name)
	end
end

function WEAPON.GetWeaponAmmoClass(arg_9_0, arg_9_1)
	local var_9_0 = WEAPON.StripSuffix(arg_9_0, "_mp")
	local var_9_1 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, var_9_0, CSV.weapons.cols.ammoOverride)

	if var_9_1 ~= "" then
		return var_9_1
	else
		return WEAPON.GetWeaponClass(var_9_0, arg_9_1)
	end
end

function WEAPON.IsWeaponALargeWeapon(arg_10_0)
	local var_10_0 = {
		"weapon_shotgun",
		"weapon_lmg",
		"weapon_sniper"
	}
	local var_10_1 = "_mp"
	local var_10_2 = WEAPON.GetWeaponClass(WEAPON.StripSuffix(arg_10_0, var_10_1))
	local var_10_3 = false

	for iter_10_0 = 1, #var_10_0 do
		if var_10_0[iter_10_0] == var_10_2 then
			var_10_3 = true

			break
		end
	end

	return var_10_3
end

function WEAPON.GetWeaponDetailsFromModel(arg_11_0)
	local var_11_0 = "+"
	local var_11_1 = LUI.Split(arg_11_0, var_11_0)[1]
	local var_11_2
	local var_11_3 = LUI.FindLast(var_11_1, "_mp")
	local var_11_4 = string.sub(var_11_1, 0, var_11_3 + 2)
	local var_11_5 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, var_11_4, CSV.MPWeapons.cols.class)
	local var_11_6 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, var_11_4, CSV.MPWeapons.cols.ref)

	return {
		weaponAsset = var_11_4,
		weaponClass = var_11_5,
		weaponRef = var_11_6
	}
end

function WEAPON.GetChallengeUnlockRow(arg_12_0)
	return StringTable.BJJBBCJGEJ(CSV.gunChallenges.file, CSV.gunChallenges.cols.loot, arg_12_0)
end

function WEAPON.GetWeaponClassAttachUnlockTablePrefix(arg_13_0)
	return StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, arg_13_0, CSV.weaponClasses.cols.unlockTablePrefix)
end

function WEAPON.GetClassName(arg_14_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, arg_14_0, CSV.weaponClasses.cols.name))
end

function WEAPON.GetName(arg_15_0, arg_15_1)
	local var_15_0 = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_15_0, CSV.weapons.cols.name))

	if not arg_15_1 or not arg_15_1.dataTable then
		return var_15_0
	end

	local var_15_1 = arg_15_1.dataTable

	if var_15_1.lootName or var_15_1.isCustom then
		DebugPrint("Weapon Preview Film: blueprint name: " .. tostring(var_15_1.blueprintName))
		DebugPrint("Weapon Preview Film: loot name: " .. tostring(var_15_1.lootName))

		return var_15_1.blueprintName ~= "" and GUNSMITH.GetCustomModName(var_15_1.blueprintName) or var_15_1.lootName
	else
		DebugPrint("Weapon Preview Film: variant ID: " .. tostring(var_15_1.variantID))
	end

	return var_15_0
end

function WEAPON.GetGame(arg_16_0)
	local var_16_0 = LOOT.GetBaseWeaponItemID(arg_16_0)

	return (LOOT.GetGameSourceIDFromItemID(var_16_0))
end

function WEAPON.GetDisplayOrder(arg_17_0)
	return tonumber(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_17_0, CSV.weapons.cols.displayOrder))
end

function WEAPON.GetNameFromAsset(arg_18_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.asset, arg_18_0, CSV.weapons.cols.name))
end

function WEAPON.GetCategory(arg_19_0)
	local var_19_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_19_0, CSV.weapons.cols.category)

	if not var_19_0 or not (#var_19_0 > 0) then
		var_19_0 = "CAS/DEFAULT_WEAPON_CATEGORY"
	end

	return Engine.CBBHFCGDIC(var_19_0)
end

function WEAPON.GetDesc(arg_20_0)
	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_20_0, CSV.weapons.cols.desc))
end

function WEAPON.GetImage(arg_21_0)
	local var_21_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_21_0, CSV.weapons.cols.image)

	return var_21_0 == "" and "white" or var_21_0
end

function WEAPON.GetProgressionImage(arg_22_0)
	local var_22_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_22_0, CSV.weapons.cols.progressionImage)

	return var_22_0 == "" and "white" or var_22_0
end

function WEAPON.GetBWImage(arg_23_0)
	local var_23_0 = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_23_0, CSV.weapons.cols.BWImage)

	return var_23_0 == "" and "white" or var_23_0
end

function WEAPON.GetShowcaseImage(arg_24_0)
	return WEAPON.GetImage(arg_24_0)
end

function WEAPON.GetModificationsByWeaponWithBaseWeapon(arg_25_0)
	local var_25_0 = WEAPON.GetModificationsByWeapon(arg_25_0)

	for iter_25_0, iter_25_1 in pairs(var_25_0) do
		table.insert(iter_25_1, 1, {
			name = "",
			weapon = iter_25_0,
			attachments = {}
		})
	end

	return var_25_0
end

function WEAPON.GetModificationsByWeapon(arg_26_0, arg_26_1)
	local var_26_0 = WEAPON.GetModifications(arg_26_0, arg_26_1)
	local var_26_1 = {}

	for iter_26_0, iter_26_1 in ipairs(var_26_0) do
		if not var_26_1[iter_26_1.weapon] then
			var_26_1[iter_26_1.weapon] = {}
		end

		table.insert(var_26_1[iter_26_1.weapon], iter_26_1)
	end

	return var_26_1
end

function WEAPON.GetArmoryWeaponsByClass(arg_27_0, arg_27_1)
	local var_27_0 = WEAPON.GetModifications(arg_27_0, arg_27_1)
	local var_27_1 = {}

	for iter_27_0, iter_27_1 in ipairs(var_27_0) do
		local var_27_2 = WEAPON.GetWeaponClass(iter_27_1.weapon, true)

		if not var_27_1[var_27_2] then
			var_27_1[var_27_2] = {}
		end

		table.insert(var_27_1[var_27_2], iter_27_1)
	end

	return var_27_1
end

function WEAPON.GetVariantFile(arg_28_0)
	if string.sub(arg_28_0, 1, 3) == "s4_" then
		return CSV.weaponVariants:GetFile(arg_28_0)
	end

	local var_28_0 = string.sub(arg_28_0, 5)

	return CSV.weaponVariants:GetFile(var_28_0)
end

function WEAPON.GetVariantRef(arg_29_0)
	return StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_29_0, CSV.weaponIDs.cols.variantRef)
end

function WEAPON.GetVariantBaseRef(arg_30_0)
	return StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_30_0, CSV.weaponIDs.cols.baseRef)
end

function WEAPON.GetLootWeaponName(arg_31_0, arg_31_1)
	local var_31_0 = WEAPON.GetVariantFile(arg_31_0)
	local var_31_1 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_31_1, CSV.weaponIDs.cols.variantRef)

	return Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(var_31_0, CSV.weaponVariants.cols.ref, var_31_1, CSV.weaponVariants.cols.name))
end

function WEAPON.GetLootWeaponRef(arg_32_0, arg_32_1)
	local var_32_0 = WEAPON.GetVariantFile(arg_32_0)

	return StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_32_1, CSV.weaponIDs.cols.variantRef)
end

function WEAPON.IsVariant(arg_33_0, arg_33_1)
	return WEAPON.GenerateWeaponTableFromID(arg_33_0, arg_33_1).variantID > 0
end

function WEAPON.DisplaySnipeIconByWeaponRef(arg_34_0, arg_34_1, arg_34_2)
	assert(arg_34_0.SnipeIcon, "The element, " .. arg_34_0.id .. ", is missing a SnipeIcon asset of type WZWeaponButtonSnipe. Please add it to this widget via the UI Editor.")
	assert(arg_34_1, "You must provide a weapon ref.")

	local var_34_0 = WEAPON.GetGame(arg_34_1)
	local var_34_1 = arg_34_2 and arg_34_2.useArabicPrefix and "AR" or ""
	local var_34_2 = LUI.GetAnimForGameSource(var_34_0)

	ACTIONS.AnimateSequence(arg_34_0.SnipeIcon, var_34_2)

	if arg_34_2 and arg_34_2.setSnipeAnimOnElement and arg_34_0._sequences[var_34_2] then
		ACTIONS.AnimateSequence(arg_34_0, var_34_2 .. var_34_1)
	end
end

WEAPON.allLootMods = {}

function WEAPON.PopulateLootMods()
	local var_35_0 = Engine.CIEGIACHAE()
	local var_35_1 = Engine.BAHIIBFDDG()
	local var_35_2 = Engine.CGABICJHAI()

	for iter_35_0 = 0, StringTable.BFHCAIIDA(CSV.weaponIDs.file) - 1 do
		local var_35_3 = CSV.ReadRow(CSV.weaponIDs, iter_35_0)

		if tonumber(var_35_3.quality) > 0 then
			if not WEAPON.allLootMods[var_35_3.baseRef] then
				WEAPON.allLootMods[var_35_3.baseRef] = {}
			end

			local var_35_4 = true

			if LOOT.IsT9Item({
				itemID = var_35_3.index
			}) and not Dvar.IBEGCHEFE("disable_platform_exclusive_filtering") then
				local var_35_5 = var_35_3.variantRef:sub(-#"_sy") == "_sy"
				local var_35_6 = var_35_3.variantRef:sub(-#"_ms") == "_ms"
				local var_35_7 = var_35_3.variantRef:sub(-#"_pc") == "_pc"

				if var_35_5 and not var_35_0 or var_35_6 and not var_35_1 or var_35_7 and not var_35_2 then
					var_35_4 = false
				end
			end

			if LOOT.IsS4Item({
				itemID = var_35_3.index
			}) and not Dvar.IBEGCHEFE("disable_platform_exclusive_filtering") then
				local var_35_8 = var_35_3.variantRef:sub(-#"_sony") == "_sony"
				local var_35_9 = var_35_3.variantRef:sub(-#"_ms") == "_ms"
				local var_35_10 = var_35_3.variantRef:sub(-#"_pc") == "_pc"

				if var_35_8 and not var_35_0 or var_35_9 and not var_35_1 or var_35_10 and not var_35_2 then
					var_35_4 = false
				end
			end

			if var_35_4 then
				local var_35_11 = WEAPON.GetVariantFile(var_35_3.baseRef)
				local var_35_12 = StringTable.BJJBBCJGEJ(var_35_11, CSV.weaponVariants.cols.ref, var_35_3.variantRef)
				local var_35_13 = CSV.ReadRowWithFile(CSV.weaponVariants, var_35_11, var_35_12)
				local var_35_14 = {
					weaponData = var_35_3,
					variantData = var_35_13
				}

				table.insert(WEAPON.allLootMods[var_35_3.baseRef], var_35_14)
			end
		end
	end
end

function WEAPON.GetLootModTable(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	local var_36_0 = {}

	var_36_0.blueprintName = ""
	var_36_0.lootName = Engine.CBBHFCGDIC(arg_36_3.name)
	var_36_0.weapon = arg_36_1
	var_36_0.attachments = {}
	var_36_0.lootID = tonumber(arg_36_2)
	var_36_0.variantID = tonumber(arg_36_3.variantID)

	for iter_36_0, iter_36_1 in pairs(arg_36_3.attachments) do
		if iter_36_1 and #iter_36_1 > 0 then
			local var_36_1 = {}
			local var_36_2, var_36_3 = ATTACHMENT.GetRefAndVariantID(iter_36_1)

			var_36_1.ref = var_36_2
			var_36_1.variantID = tonumber(var_36_3) or ATTACHMENT.baseVariant

			table.insert(var_36_0.attachments, var_36_1)
		end
	end

	var_36_0.isCustom = false
	var_36_0.isBase = var_36_0.variantID == WEAPON.baseVariant
	var_36_0.displayOrder = WEAPON.GetDisplayOrder(arg_36_1)

	return var_36_0
end

function WEAPON.GetModifications(arg_37_0, arg_37_1)
	if not WEAPON.allLootMods[WEAPON.GunsmithTestIndexWeapon] then
		WEAPON.PopulateLootMods()
	end

	arg_37_1 = arg_37_1 or {}

	local var_37_0 = {}
	local var_37_1 = arg_37_1.includeBundleItems or arg_37_1.exclusiveBundleItems

	if var_37_1 and Engine.CJJAFGIFAC(arg_37_0) then
		var_37_0 = WEAPON.GetPriorityVariants(arg_37_0)
		var_37_0 = WEAPON.GetAllVariantsInStore(arg_37_0, {
			variantsTable = var_37_0
		})
	end

	if arg_37_1.checkOwnership == nil then
		arg_37_1.checkOwnership = true
	end

	local var_37_2 = {}

	if not arg_37_1.forceCustom then
		for iter_37_0, iter_37_1 in pairs(WEAPON.allLootMods) do
			local var_37_3 = arg_37_1.byWeapons and not arg_37_1.byWeapons[iter_37_0]

			if arg_37_1.includeBaseWeapons and not var_37_3 then
				local var_37_4 = LOOT.GetBaseWeaponItemID(iter_37_0)

				if not arg_37_1.checkOwnership or LOOT.IsUnlockedWithID(arg_37_0, var_37_4) then
					local var_37_5 = WEAPON.GetLootModTable(arg_37_0, iter_37_0, Cac.BaseLootID, {
						name = StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, iter_37_0, CSV.weapons.cols.name),
						variantID = WEAPON.baseVariant,
						attachments = {}
					})

					var_37_5.rarity = 0

					table.insert(var_37_2, var_37_5)
				end
			end

			for iter_37_2, iter_37_3 in ipairs(iter_37_1) do
				local var_37_6 = iter_37_3.weaponData
				local var_37_7 = iter_37_3.variantData
				local var_37_8 = arg_37_1.byWeapons and not arg_37_1.byWeapons[iter_37_0]
				local var_37_9 = not arg_37_1.checkOwnership or LOOT.IsUnlockedWithID(arg_37_0, var_37_6.index)
				local var_37_10 = var_37_0[tonumber(var_37_6.index)]
				local var_37_11 = var_37_9 or var_37_10 and var_37_1
				local var_37_12 = var_37_10 and not var_37_9 or not arg_37_1.exclusiveBundleItems

				if not var_37_8 and var_37_11 and var_37_12 then
					local var_37_13 = WEAPON.GetLootModTable(arg_37_0, iter_37_0, iter_37_3.weaponData.index, iter_37_3.variantData)

					var_37_13.rarity = tonumber(var_37_6.quality)
					var_37_13.fromBundle = var_37_10 and not var_37_9
					var_37_13.bundleID = var_37_10 and var_37_1 and var_37_0[tonumber(var_37_6.index)].bundleID

					table.insert(var_37_2, var_37_13)
				end
			end
		end
	end

	if not arg_37_1.forceLoot then
		GUNSMITH.GetAllCustomMods(arg_37_0, var_37_2, arg_37_1)
	end

	return var_37_2
end

function WEAPON.GetModification(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = {
		[arg_38_1] = true
	}
	local var_38_1 = WEAPON.GetModifications(arg_38_0, {
		forceLoot = true,
		checkOwnership = false,
		byWeapons = var_38_0
	})
	local var_38_2 = {}
	local var_38_3

	for iter_38_0, iter_38_1 in ipairs(var_38_1) do
		if iter_38_1.lootID == arg_38_2 then
			var_38_3 = iter_38_1

			break
		end
	end

	assert(var_38_3)

	if not var_38_3 then
		return WEAPON.GenerateWeaponTableFromRef(arg_38_1)
	else
		return var_38_3
	end
end

function WEAPON.GetModificationAttachments(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = {
		[arg_39_1] = true
	}
	local var_39_1 = WEAPON.GetModifications(arg_39_0, {
		forceLoot = true,
		checkOwnership = false,
		byWeapons = var_39_0
	})
	local var_39_2 = {}
	local var_39_3

	for iter_39_0, iter_39_1 in ipairs(var_39_1) do
		if iter_39_1.lootID == arg_39_2 then
			var_39_3 = iter_39_1

			break
		end
	end

	if not var_39_3 then
		return var_39_2
	end

	for iter_39_2, iter_39_3 in ipairs(var_39_3.attachments) do
		var_39_2[iter_39_3.ref] = var_39_2[iter_39_3.ref] or {}
		var_39_2[iter_39_3.ref] = iter_39_3.variantID or ATTACHMENT.baseVariant
	end

	return var_39_2
end

function WEAPON.GetAttachVariants(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = CSV.attachmentIDs.GetFile(arg_40_2)
	local var_40_1 = StringTable.BJJBBCJGEJ(var_40_0, CSV.attachmentIDs.cols.index, arg_40_1)
	local var_40_2 = CSV.ReadRowWithFile(CSV.attachmentIDs, var_40_0, var_40_1)
	local var_40_3 = var_40_2.ref
	local var_40_4 = {}
	local var_40_5 = {
		variantID = ATTACHMENT.baseVariant,
		lootID = LOOT.emptyID,
		baseRef = var_40_3
	}

	table.insert(var_40_4, var_40_5)

	local var_40_6 = 0

	while var_40_2.variantLootID and #var_40_2.variantLootID > 0 do
		if LOOT.IsUnlockedWithID(arg_40_0, var_40_2.variantLootID) then
			local var_40_7 = {
				variantID = tonumber(var_40_2.variantID),
				lootID = tonumber(var_40_2.variantLootID),
				baseRef = var_40_3
			}

			table.insert(var_40_4, var_40_7)
		end

		var_40_6 = var_40_6 + 1

		local var_40_8 = CSV.attachmentIDs.variantOffset * var_40_6
		local var_40_9 = {
			variantID = CSV.attachmentIDs.cols.variantID + var_40_8,
			variantLootID = CSV.attachmentIDs.cols.variantLootID + var_40_8
		}

		var_40_2 = CSV.ReadRowWithFileAndColumns(var_40_0, var_40_1, var_40_9)
	end

	return var_40_4
end

function WEAPON.GetWeaponsWithModifications(arg_41_0, arg_41_1)
	local var_41_0 = WEAPON.GetModifications(arg_41_0, arg_41_1)
	local var_41_1 = {}
	local var_41_2 = {}

	for iter_41_0, iter_41_1 in ipairs(var_41_0) do
		local var_41_3 = iter_41_1.weapon

		if not var_41_2[var_41_3] then
			var_41_2[var_41_3] = true

			table.insert(var_41_1, var_41_3)
		end
	end

	return var_41_1
end

function WEAPON.HasModifications(arg_42_0, arg_42_1)
	return #WEAPON.GetModifications(arg_42_0, {
		byWeapon = arg_42_1
	}) > 0
end

function WEAPON.GetStatsForWeapon(arg_43_0)
	local var_43_0 = StringTable.BJJBBCJGEJ(CSV.weapons.file, CSV.weapons.cols.ref, arg_43_0)

	return (CSV.ReadRow(CSV.weapons, var_43_0))
end

function WEAPON.GetEquippedCamo(arg_44_0)
	return arg_44_0.camo:get()
end

function WEAPON.SetEquippedCamo(arg_45_0, arg_45_1)
	return arg_45_0.camo:set(arg_45_1)
end

function WEAPON.GetCamoName(arg_46_0)
	return StringTable.DIFCHIGDFB(CSV.camoTable.file, CSV.camoTable.cols.ref, arg_46_0, CSV.camoTable.cols.name)
end

function WEAPON.GetCamoImage(arg_47_0)
	return StringTable.DIFCHIGDFB(CSV.camoTable.file, CSV.camoTable.cols.ref, arg_47_0, CSV.camoTable.cols.image)
end

function WEAPON.GetCamoSeason(arg_48_0)
	return StringTable.DIFCHIGDFB(CSV.camoTable.file, CSV.camoTable.cols.ref, arg_48_0, CSV.camoTable.cols.season)
end

function WEAPON.GetCamoCategory(arg_49_0)
	return StringTable.DIFCHIGDFB(CSV.camoTable.file, CSV.camoTable.cols.ref, arg_49_0, CSV.camoTable.cols.category)
end

function WEAPON.GetEquippedReticle(arg_50_0)
	return arg_50_0.reticle:get()
end

function WEAPON.SetEquippedReticle(arg_51_0, arg_51_1)
	return arg_51_0.reticle:set(arg_51_1)
end

function WEAPON.GetReticleName(arg_52_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_52_0, CSV.reticles.cols.name)
end

function WEAPON.GetReticleImage(arg_53_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_53_0, CSV.reticles.cols.image)
end

function WEAPON.GetReticleBattlepassImage(arg_54_0)
	local var_54_0 = StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_54_0, CSV.reticles.cols.battlepassImage)

	if not var_54_0 or var_54_0 == "" then
		var_54_0 = StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_54_0, CSV.reticles.cols.image)
	end

	return var_54_0
end

function WEAPON.GetReticleSeason(arg_55_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_55_0, CSV.reticles.cols.season)
end

function WEAPON.GetReticleDesc(arg_56_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_56_0, CSV.reticles.cols.desc)
end

function WEAPON.GetReticleType(arg_57_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_57_0, CSV.reticles.cols.type)
end

function WEAPON.GetReticleCategory(arg_58_0)
	return StringTable.DIFCHIGDFB(CSV.reticles.file, CSV.reticles.cols.ref, arg_58_0, CSV.reticles.cols.category)
end

function WEAPON.GetReticleCategoryName(arg_59_0)
	return StringTable.DIFCHIGDFB(CSV.reticleCategoryTable.file, CSV.reticleCategoryTable.cols.categoryRef, arg_59_0, CSV.reticleCategoryTable.cols.categoryName)
end

function WEAPON.SupportsOptics(arg_60_0)
	return StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_60_0, CSV.weapons.cols.canUseOptics) == "1"
end

function WEAPON.GetEquippedCharm(arg_61_0)
	return arg_61_0.cosmeticAttachment:get()
end

function WEAPON.SetEquippedCharm(arg_62_0, arg_62_1)
	return arg_62_0.cosmeticAttachment:set(arg_62_1)
end

function WEAPON.GetCharmName(arg_63_0)
	return StringTable.DIFCHIGDFB(CSV.charms.file, CSV.charms.cols.ref, arg_63_0, CSV.charms.cols.name)
end

function WEAPON.GetCharmImage(arg_64_0)
	return StringTable.DIFCHIGDFB(CSV.charms.file, CSV.charms.cols.ref, arg_64_0, CSV.charms.cols.image)
end

function WEAPON.GetCharmSeason(arg_65_0)
	return StringTable.DIFCHIGDFB(CSV.charms.file, CSV.charms.cols.ref, arg_65_0, CSV.charms.cols.season)
end

function WEAPON.GetCharmCategory(arg_66_0)
	return StringTable.DIFCHIGDFB(CSV.charms.file, CSV.charms.cols.ref, arg_66_0, CSV.charms.cols.category)
end

function WEAPON.SupportsCosmetics(arg_67_0)
	return StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_67_0, CSV.weapons.cols.canUseCosmetic) == "1"
end

function WEAPON.GetEquippedStickers(arg_68_0)
	local var_68_0 = {}

	for iter_68_0 = 1, #arg_68_0.sticker do
		var_68_0[iter_68_0] = WEAPON.GetEquippedStickerForIndex(arg_68_0, iter_68_0)
	end

	return var_68_0
end

function WEAPON.GetEquippedStickerForIndex(arg_69_0, arg_69_1)
	return arg_69_0.sticker[arg_69_1 - 1]:get()
end

function WEAPON.SetEquippedStickerForIndex(arg_70_0, arg_70_1, arg_70_2)
	return arg_70_0.sticker[arg_70_1 - 1]:set(arg_70_2)
end

function WEAPON.GetStickerIDFromRef(arg_71_0)
	return Engine.BDFGIICEGA("i/" .. arg_71_0)
end

function WEAPON.GetStickerName(arg_72_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_72_0, CSV.stickers.cols.name)
end

function WEAPON.GetStickerImage(arg_73_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_73_0, CSV.stickers.cols.image)
end

function WEAPON.GetStickerSeason(arg_74_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_74_0, CSV.stickers.cols.season)
end

function WEAPON.GetStickerCategory(arg_75_0)
	return StringTable.DIFCHIGDFB(CSV.stickers.file, CSV.stickers.cols.ref, arg_75_0, CSV.stickers.cols.category)
end

function WEAPON.GetMaxStickerSlotsForWeapon(arg_76_0)
	local var_76_0 = tonumber(StringTable.DIFCHIGDFB(CSV.weapons.file, CSV.weapons.cols.ref, arg_76_0, CSV.weapons.cols.stickerSlots))

	return var_76_0 ~= nil and var_76_0 or 0
end

function WEAPON.ForceWideSecondaryCamera(arg_77_0)
	return arg_77_0 == WEAPON.KATANA or arg_77_0 == WEAPON.KaliSticks or arg_77_0 == WEAPON.Swords or arg_77_0 == WEAPON.SledgeHammer or arg_77_0 == WEAPON.Wakizashi or arg_77_0 == WEAPON.ETool or arg_77_0 == WEAPON.MacheteT9 or arg_77_0 == WEAPON.BatT9 or arg_77_0 == WEAPON.MaceT9 or arg_77_0 == WEAPON.CaneT9 or arg_77_0 == WEAPON.SaiT9 or arg_77_0 == WEAPON.BattleAxeT9 or arg_77_0 == WEAPON.AXE or arg_77_0 == WEAPON.SCYTHE or arg_77_0 == WEAPON.ICEPICK or arg_77_0 == WEAPON.SAWTOOTH or arg_77_0 == WEAPON.SledgehammerS4
end

function WEAPON.GetCosmeticConfigString(arg_78_0)
	local var_78_0 = ""
	local var_78_1 = arg_78_0.camo
	local var_78_2 = arg_78_0.reticle
	local var_78_3 = arg_78_0.cosmeticAttachment
	local var_78_4 = arg_78_0.stickers

	if var_78_1 then
		var_78_0 = var_78_0 .. "+" .. var_78_1
	end

	if var_78_2 then
		var_78_0 = var_78_0 .. "+" .. var_78_2
	end

	if var_78_3 then
		var_78_0 = var_78_0 .. "+" .. var_78_3
	end

	if var_78_4 then
		for iter_78_0 = 1, #var_78_4 do
			local var_78_5 = var_78_4[iter_78_0]

			if var_78_5 then
				var_78_0 = var_78_0 .. "+" .. var_78_5
			end
		end
	end

	if #var_78_0 > 0 then
		var_78_0 = string.sub(var_78_0, 2)
	end

	return var_78_0
end

function WEAPON.IsWeaponNoneValue(arg_79_0)
	return not arg_79_0 or arg_79_0 == "" or arg_79_0 == "iw8_fists_mp" or arg_79_0 == "iw8_fists" or arg_79_0 == "none" or arg_79_0 == WEAPON.NoneValue or arg_79_0 == WEAPON.NoneValue .. "_infil" or CONDITIONS.IsMagmaGameMode() and BRLOOT.IsWeaponNoneValue(arg_79_0)
end

function WEAPON.ClearWeaponCosmetics(arg_80_0)
	arg_80_0.camo:set(WEAPON.CamoNoneValue)
	arg_80_0.reticle:set(WEAPON.ReticleNoneValue)
	arg_80_0.cosmeticAttachment:set(WEAPON.CharmNoneValue)

	for iter_80_0 = 0, #arg_80_0.sticker - 1 do
		arg_80_0.sticker[iter_80_0]:set(WEAPON.StickerNoneValue)
	end
end

function WEAPON.WipeWeaponSetup(arg_81_0)
	ATTACHMENT.ClearAllAttachments(arg_81_0)
	WEAPON.ClearWeaponCosmetics(arg_81_0)
	arg_81_0.variantID:set(Cac.BaseVariantID)
	arg_81_0.lootItemID:set(Cac.BaseLootID)
	arg_81_0.blueprintName:set("")
end

WEAPON._cachedAttComboBaseNames = nil

function WEAPON.ApplyAttachmentComboOverrides(arg_82_0)
	local var_82_0 = {}

	if next(arg_82_0) == nil then
		return var_82_0
	end

	if not WEAPON._cachedAttComboBaseNames then
		WEAPON._cachedAttComboBaseNames = StringTable.DADFFBJADD(CSV.attachmentComboOverridesTable.file, 0)
	end

	local var_82_1 = {}

	for iter_82_0, iter_82_1 in pairs(arg_82_0) do
		local var_82_2 = StringTable.BJJBBCJGEJ(CSV.attachmentComboOverridesTable.file, 0, iter_82_1)

		if var_82_2 > 0 then
			local var_82_3 = StringTable.DADFFBJADD(CSV.attachmentComboOverridesTable.file, var_82_2)

			for iter_82_2, iter_82_3 in ipairs(WEAPON._cachedAttComboBaseNames) do
				if iter_82_2 > 1 then
					local var_82_4 = var_82_3[iter_82_2]

					if var_82_4 ~= "" and var_82_4 ~= ATTACHMENT.none then
						var_82_1[iter_82_3] = var_82_4
					end
				end
			end
		end
	end

	for iter_82_4, iter_82_5 in pairs(arg_82_0) do
		local var_82_5 = var_82_1[iter_82_4]

		if var_82_5 ~= nil then
			var_82_0[iter_82_4] = var_82_5
		else
			var_82_0[iter_82_4] = iter_82_5
		end
	end

	return var_82_0
end

function WEAPON.GetWeaponModelNameFromPlayerData(arg_83_0, arg_83_1, arg_83_2)
	return WEAPON.GetWeaponModelName(arg_83_0, WEAPON.GenerateWeaponTable(arg_83_1), arg_83_2)
end

function WEAPON.GetWeaponModelNameFromRef(arg_84_0, arg_84_1)
	return WEAPON.GetWeaponModelName(arg_84_0, WEAPON.GenerateWeaponTableFromRef(arg_84_0), arg_84_1)
end

function WEAPON.GetWeaponModelName(arg_85_0, arg_85_1, arg_85_2)
	arg_85_2 = arg_85_2 or {}

	if arg_85_2.includeAttachments == nil then
		arg_85_2.includeAttachments = false
	end

	if arg_85_2.includeCamos == nil then
		arg_85_2.includeCamo = false
	end

	if arg_85_2.includeStickers == nil then
		arg_85_2.includeStickers = false
	end

	if arg_85_2.useOperatorOverride == nil then
		arg_85_2.useOperatorOverride = false
	end

	if not arg_85_2.useOperatorOverride and arg_85_2.useGuntableOverride == nil then
		arg_85_2.useGuntableOverride = true
	else
		arg_85_2.useGuntableOverride = false
	end

	if arg_85_2.isDefault == nil then
		arg_85_2.isDefault = false
	end

	local var_85_0

	if not arg_85_2.keepAkimbo then
		for iter_85_0, iter_85_1 in ipairs(arg_85_1.attachments) do
			if ATTACHMENT.GetBaseRef(iter_85_1.ref) == ATTACHMENT.akimbo then
				var_85_0 = iter_85_0
			end
		end
	end

	local var_85_1 = StringTable.BJJBBCJGEJ(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_85_0)
	local var_85_2 = ""

	if arg_85_2.useOperatorOverride then
		var_85_2 = StringTable.CBGJCDIHCE(CSV.MPWeapons.file, var_85_1, CSV.MPWeapons.cols.operatorOverrideAsset)
	elseif arg_85_2.useGuntableOverride then
		var_85_2 = StringTable.CBGJCDIHCE(CSV.MPWeapons.file, var_85_1, CSV.MPWeapons.cols.gunTableOverrideAsset)
	end

	local var_85_3

	if #var_85_2 > 0 then
		var_85_3 = var_85_2
	else
		var_85_3 = StringTable.CBGJCDIHCE(CSV.MPWeapons.file, var_85_1, CSV.MPWeapons.cols.asset)
	end

	local var_85_4 = {}
	local var_85_5 = StringTable.CBGJCDIHCE(CSV.MPWeapons.file, var_85_1, CSV.MPWeapons.cols.defaultAttachments)

	if var_85_5 and #var_85_5 > 0 then
		var_85_4 = LUI.Split(var_85_5, " ")
	end

	local var_85_6 = {}
	local var_85_7 = ""

	if arg_85_1.lootID and tonumber(arg_85_1.lootID) ~= LOOT.emptyID then
		local var_85_8 = {}
		local var_85_9 = WEAPON.GetVariantFile(arg_85_0)
		local var_85_10 = StringTable.BJJBBCJGEJ(var_85_9, CSV.weaponVariants.cols.variantID, arg_85_1.variantID)
		local var_85_11 = StringTable.CBGJCDIHCE(var_85_9, var_85_10, CSV.weaponVariants.cols.defaultAttachmentOverrides)

		var_85_7 = StringTable.CBGJCDIHCE(var_85_9, var_85_10, CSV.weaponVariants.cols.assetOverride)

		if arg_85_2.useOperatorOverride then
			var_85_2 = StringTable.CBGJCDIHCE(var_85_9, var_85_10, CSV.weaponVariants.cols.operatorOverrideAsset)
		elseif arg_85_2.useGuntableOverride then
			var_85_2 = StringTable.CBGJCDIHCE(var_85_9, var_85_10, CSV.weaponVariants.cols.gunTableOverrideAsset)
		end

		if #var_85_2 > 0 then
			var_85_3 = var_85_2
		end

		if var_85_11 and #var_85_11 > 0 then
			var_85_8 = LUI.Split(var_85_11, " ")
		end

		for iter_85_2, iter_85_3 in ipairs(var_85_8) do
			local var_85_12, var_85_13 = ATTACHMENT.GetRefAndVariantID(iter_85_3)

			var_85_6[var_85_12] = tonumber(var_85_13)

			if not LUI.IsItemInArray(var_85_4, var_85_12) then
				table.insert(var_85_4, var_85_12)
			end
		end
	end

	local var_85_14

	if var_85_7 and #var_85_7 > 0 then
		var_85_14 = arg_85_0
		arg_85_0 = var_85_7

		if #var_85_2 <= 0 then
			var_85_3 = var_85_7
		end
	end

	local var_85_15 = WEAPON.GetWeaponClass(var_85_14 or arg_85_0)
	local var_85_16 = {}

	if arg_85_2.includeAttachments then
		for iter_85_4, iter_85_5 in ipairs(var_85_4) do
			table.insert(var_85_16, iter_85_5)
		end

		local var_85_17
		local var_85_18

		if arg_85_1.lootID and tonumber(arg_85_1.lootID) ~= LOOT.emptyID then
			local var_85_19 = WEAPON.GetVariantFile(var_85_14 or arg_85_0)
			local var_85_20 = StringTable.DIFCHIGDFB(var_85_19, CSV.weaponVariants.cols.variantID, arg_85_1.variantID, CSV.weaponVariants.cols.extraToID)

			if var_85_20 and #var_85_20 > 0 then
				local var_85_21 = ATTACHMENT.GetRefAndVariantID(var_85_20)
			end
		end

		for iter_85_6 = 1, #arg_85_1.attachments do
			if iter_85_6 ~= var_85_0 then
				local var_85_22 = arg_85_1.attachments[iter_85_6].variantID
				local var_85_23 = arg_85_2.isDefault and arg_85_1.attachments[iter_85_6] or arg_85_1.attachments[iter_85_6].ref

				if var_85_23 and var_85_23 ~= ATTACHMENT.none then
					table.insert(var_85_16, var_85_23)

					local var_85_24 = ATTACHMENT.GetRef(var_85_23, arg_85_0, var_85_15)

					if var_85_24 and var_85_24 ~= ATTACHMENT.none then
						local var_85_25 = ATTACHMENT.GetAttachmentAddition(var_85_24)

						if var_85_25 and #var_85_25 > 0 and var_85_25 ~= ATTACHMENT.none then
							table.insert(var_85_16, var_85_25)

							if var_85_22 and var_85_22 >= 0 then
								var_85_6[var_85_25] = var_85_22
							end
						end
					end
				end

				if var_85_22 and var_85_22 > 0 then
					var_85_6[var_85_23] = tonumber(var_85_22)
				end
			end
		end

		var_85_16 = WEAPON.FilterAttachments(var_85_14 or arg_85_0, var_85_16)
	else
		var_85_16 = var_85_4
	end

	if arg_85_1.cosmeticAttachment then
		table.insert(var_85_16, arg_85_1.cosmeticAttachment)
	end

	local var_85_26 = {}

	for iter_85_7, iter_85_8 in ipairs(var_85_16) do
		var_85_26[iter_85_8] = ATTACHMENT.GetRef(iter_85_8, arg_85_0, var_85_15)
	end

	local var_85_27 = WEAPON.ApplyAttachmentComboOverrides(var_85_26)

	for iter_85_9, iter_85_10 in pairs(var_85_27) do
		if iter_85_10 and iter_85_10 ~= "" and iter_85_10 ~= ATTACHMENT.none then
			var_85_3 = var_85_3 .. "+" .. iter_85_10

			if var_85_6[iter_85_9] then
				var_85_3 = var_85_3 .. "|" .. var_85_6[iter_85_9]
			end
		end
	end

	if arg_85_2.includeCamos and arg_85_1.camo ~= nil then
		local var_85_28 = arg_85_1.camo

		if var_85_28 and var_85_28 ~= WEAPON.CamoNoneValue then
			var_85_3 = var_85_3 .. "+camo|" .. var_85_28
		end
	end

	if arg_85_2.includeStickers and arg_85_1.stickers ~= nil then
		local var_85_29 = arg_85_1.stickers

		for iter_85_11 = 1, #var_85_29 do
			if var_85_29[iter_85_11] ~= WEAPON.StickerNoneValue then
				local var_85_30 = WEAPON.GetStickerIDFromRef(var_85_29[iter_85_11])

				if var_85_30 ~= nil and var_85_30 ~= "" then
					var_85_3 = var_85_3 .. "+sticker" .. iter_85_11 - 1 .. "|" .. var_85_30
				end
			end
		end
	end

	return var_85_3
end

WEAPON.HaveValidatedAttachmentComboTable = false

function WEAPON.ValidateAttachmentComboTableSpecific(arg_86_0)
	local var_86_0 = StringTable.DADFFBJADD(arg_86_0, 0)
	local var_86_1 = StringTable.HCDABCEFB(arg_86_0, 0)

	if #var_86_1 ~= #var_86_0 then
		DebugPrint("ERROR: " .. arg_86_0 .. " is not square. columns = " .. tostring(#var_86_1) .. ", rows = " .. tostring(#var_86_0))
		assert(#var_86_1 == #var_86_0)
	end

	for iter_86_0 = 1, #var_86_1 do
		if var_86_1[iter_86_0] ~= var_86_0[iter_86_0] then
			DebugPrint("ERROR:" .. arg_86_0 .. " headers don't match. index = " .. tostring(iter_86_0) .. ", column = " .. var_86_1[iter_86_0] .. ", row = " .. var_86_0[iter_86_0])
			assert(var_86_1[iter_86_0] == var_86_0[iter_86_0])
		end
	end

	for iter_86_1 = 1, #var_86_1 do
		for iter_86_2 = iter_86_1 + 1, #var_86_1 do
			local var_86_2 = StringTable.BFCIGBHEFD(arg_86_0, iter_86_1 - 1, iter_86_2 - 1)
			local var_86_3 = StringTable.BFCIGBHEFD(arg_86_0, iter_86_2 - 1, iter_86_1 - 1)

			if var_86_2 ~= var_86_3 then
				DebugPrint(string.format("ERROR: %s row/column doesn't match. [row %d( %s ), col %d( %s )] = '%s', [row %d( %s ), col %d( %s )] = '%s'", arg_86_0, iter_86_1, var_86_0[iter_86_1], iter_86_2, var_86_0[iter_86_2], var_86_2, iter_86_2, var_86_0[iter_86_2], iter_86_1, var_86_0[iter_86_1], var_86_3))
				assert(var_86_2 == var_86_3)
			end
		end
	end
end

function WEAPON.ValidateAttachmentComboTable()
	WEAPON.HaveValidatedAttachmentComboTable = true

	if not Engine.BHICADFIHA() then
		return
	end

	DebugPrint("Validating attachment combo table")

	for iter_87_0, iter_87_1 in pairs(CSV.attachmentComboTables) do
		WEAPON.ValidateAttachmentComboTableSpecific(iter_87_1.file)
	end
end

function WEAPON.FilterAttachments(arg_88_0, arg_88_1)
	arg_88_1 = arg_88_1 or {}

	if #arg_88_1 <= 0 then
		return arg_88_1
	end

	if not WEAPON.HaveValidatedAttachmentComboTable then
		WEAPON.ValidateAttachmentComboTable()
	end

	local var_88_0 = WEAPON.GetAttachmentComboTableForWeapon(arg_88_0)
	local var_88_1 = {}

	for iter_88_0, iter_88_1 in ipairs(arg_88_1) do
		local var_88_2 = true

		for iter_88_2, iter_88_3 in ipairs(var_88_1) do
			if iter_88_1 == var_88_1[iter_88_2] then
				var_88_2 = false

				break
			end

			local var_88_3 = WEAPON.CheckAttachmentConflict(var_88_0, iter_88_1, iter_88_3)

			if var_88_3 ~= ATTACHMENT.none then
				var_88_2 = false

				table.remove(var_88_1, iter_88_2)

				local var_88_4 = LUI.Split(var_88_3, " ")

				for iter_88_4, iter_88_5 in ipairs(var_88_4) do
					table.insert(arg_88_1, iter_88_0 + iter_88_4, iter_88_5)
				end

				break
			end
		end

		if var_88_2 then
			table.insert(var_88_1, iter_88_1)
		end
	end

	return var_88_1
end

function WEAPON.GetAttachmentComboTableForWeapon(arg_89_0)
	local var_89_0 = WEAPON.GetGame(arg_89_0)

	for iter_89_0, iter_89_1 in pairs(CSV.attachmentComboTables) do
		if iter_89_0 == var_89_0 then
			return iter_89_1
		end
	end

	return CSV.attachmentComboTables.default
end

function WEAPON.CheckAttachmentConflict(arg_90_0, arg_90_1, arg_90_2)
	local var_90_0 = StringTable.BHHDFEHAHB(arg_90_0.file, arg_90_0.rows.ref, arg_90_2)

	if var_90_0 < 0 then
		return ATTACHMENT.none
	end

	if arg_90_1 == arg_90_2 then
		return arg_90_1
	else
		local var_90_1 = StringTable.DIFCHIGDFB(arg_90_0.file, arg_90_0.cols.ref, arg_90_1, var_90_0)

		if var_90_1 == "no" then
			return arg_90_1
		elseif var_90_1 ~= "" then
			return var_90_1
		end
	end

	return ATTACHMENT.none
end

function WEAPON.GetStatsTable(arg_91_0)
	local var_91_0 = {}
	local var_91_1 = PlayerData.BFFBGAJGD(arg_91_0, CoD.StatsGroup.Ranked).playerStats.weaponStats

	for iter_91_0 = 0, StringTable.BFHCAIIDA(CSV.MPWeapons.file) do
		local var_91_2 = CSV.ReadRow(CSV.MPWeapons, iter_91_0)

		if var_91_2 ~= nil and tonumber(var_91_2.displayOrder) ~= nil and tonumber(var_91_2.displayOrder) >= 0 then
			local var_91_3 = var_91_1[var_91_2.ref]

			if not var_91_3 then
				break
			end

			local var_91_4 = {
				ref = var_91_2.ref,
				name = var_91_2.name,
				image = WEAPON.GetProgressionImage(var_91_2.ref),
				deaths = var_91_3.deaths:get(),
				headShots = var_91_3.headShots:get(),
				hits = var_91_3.hits:get(),
				kills = var_91_3.kills:get(),
				shots = var_91_3.shots:get()
			}

			var_91_4.kdr = var_91_4.kills / (var_91_4.deaths ~= 0 and var_91_4.deaths or 1)
			var_91_4.accuracy = var_91_4.hits / (var_91_4.shots ~= 0 and var_91_4.shots or 1)

			table.insert(var_91_0, var_91_4)
		end
	end

	return var_91_0
end

function WEAPON.GetStatsTableForClass(arg_92_0, arg_92_1, arg_92_2)
	local var_92_0 = {}
	local var_92_1 = PlayerData.BFFBGAJGD(arg_92_0, CoD.StatsGroup.Ranked).playerStats.weaponStats

	for iter_92_0 = 0, StringTable.BFHCAIIDA(CSV.MPWeapons.file) do
		local var_92_2 = CSV.ReadRow(CSV.MPWeapons, iter_92_0)

		if var_92_2 ~= nil and tonumber(var_92_2.displayOrder) ~= nil and tonumber(var_92_2.displayOrder) >= 0 and var_92_2.class == arg_92_1 then
			local var_92_3 = var_92_1[var_92_2.ref]

			if not var_92_3 then
				break
			end

			if not (var_92_2.UIShowDvar ~= nil and #var_92_2.UIShowDvar > 0 and not Dvar.IBEGCHEFE(var_92_2.UIShowDvar)) and (arg_92_2 ~= true or WEAPON.GetGame(var_92_2.ref) == LUI.GAME_SOURCE_ID.MODERN_WARFARE) then
				local var_92_4 = {
					ref = var_92_2.ref,
					name = var_92_2.name,
					image = WEAPON.GetProgressionImage(var_92_2.ref),
					deaths = var_92_3.deaths:get(),
					headShots = var_92_3.headShots:get(),
					hits = var_92_3.hits:get(),
					kills = var_92_3.kills:get(),
					shots = var_92_3.shots:get(),
					displayOrder = tonumber(var_92_2.displayOrder)
				}

				var_92_4.kdr = var_92_4.kills / (var_92_4.deaths ~= 0 and var_92_4.deaths or 1)
				var_92_4.accuracy = var_92_4.hits / (var_92_4.shots ~= 0 and var_92_4.shots or 1)

				table.insert(var_92_0, var_92_4)
			end
		end
	end

	return var_92_0
end

function WEAPON.EquipBaseWeapon(arg_93_0, arg_93_1)
	if #arg_93_0.blueprintName:get() > 0 or arg_93_0.variantID:get() > 0 or arg_93_1 ~= arg_93_0.weapon:get() then
		arg_93_0.camo:set(WEAPON.CamoNoneValue)
		arg_93_0.reticle:set(WEAPON.ReticleNoneValue)
		arg_93_0.cosmeticAttachment:set(WEAPON.CharmNoneValue)
		arg_93_0.weapon:set(arg_93_1)
		arg_93_0.variantID:set(WEAPON.baseVariant)
		arg_93_0.blueprintName:set("")
		arg_93_0.lootItemID:set(LOOT.emptyID)

		for iter_93_0 = 0, #arg_93_0.attachmentSetup - 1 do
			arg_93_0.attachmentSetup[iter_93_0].attachment:set(ATTACHMENT.none)
			arg_93_0.attachmentSetup[iter_93_0].variantID:set(ATTACHMENT.baseVariant)
		end

		for iter_93_1 = 0, #arg_93_0.sticker - 1 do
			arg_93_0.sticker[iter_93_1]:set(WEAPON.StickerNoneValue)
		end
	end
end

function WEAPON.EquipModification(arg_94_0, arg_94_1)
	arg_94_0.camo:set(arg_94_1.camo or WEAPON.CamoNoneValue)
	arg_94_0.reticle:set(arg_94_1.reticle or WEAPON.ReticleNoneValue)
	arg_94_0.cosmeticAttachment:set(arg_94_1.cosmeticAttachment or WEAPON.CharmNoneValue)
	arg_94_0.weapon:set(arg_94_1.weapon)
	arg_94_0.lootItemID:set(arg_94_1.lootID)

	if arg_94_1.blueprintName then
		arg_94_0.blueprintName:set(arg_94_1.blueprintName)
	else
		arg_94_0.blueprintName:set("")
	end

	arg_94_0.variantID:set(arg_94_1.variantID)

	for iter_94_0 = 0, #arg_94_1.attachments - 1 do
		arg_94_0.attachmentSetup[iter_94_0].attachment:set(arg_94_1.attachments[iter_94_0 + 1].ref)
		arg_94_0.attachmentSetup[iter_94_0].variantID:set(arg_94_1.attachments[iter_94_0 + 1].variantID or ATTACHMENT.baseVariant)
	end

	for iter_94_1 = #arg_94_1.attachments, #arg_94_0.attachmentSetup - 1 do
		arg_94_0.attachmentSetup[iter_94_1].attachment:set(ATTACHMENT.none)
		arg_94_0.attachmentSetup[iter_94_1].variantID:set(ATTACHMENT.baseVariant)
	end

	for iter_94_2 = 0, #arg_94_0.sticker - 1 do
		arg_94_0.sticker[iter_94_2]:set(arg_94_1.stickers and arg_94_1.stickers[iter_94_2 + 1] or WEAPON.StickerNoneValue)
	end
end

function WEAPON.GenerateEmptyWeaponTable(arg_95_0)
	local var_95_0 = {
		weapon = arg_95_0.weapon:get(),
		variantID = arg_95_0.variantID:get(),
		attachments = {}
	}

	for iter_95_0 = 0, #arg_95_0.attachmentSetup - 1 do
		var_95_0.attachments[iter_95_0 + 1] = {}
		var_95_0.attachments[iter_95_0 + 1].ref = "none"
		var_95_0.attachments[iter_95_0 + 1].variantID = 0
	end

	var_95_0.stickers = WEAPON.GetEquippedStickers(arg_95_0)

	for iter_95_1, iter_95_2 in ipairs(var_95_0.stickers) do
		var_95_0.stickers[iter_95_1] = "none"
	end

	var_95_0.camo = "none"
	var_95_0.cosmeticAttachment = "none"
	var_95_0.reticle = "none"
	var_95_0.blueprintName = ""
	var_95_0.lootID = 0

	return var_95_0
end

function WEAPON.GenerateWeaponTable(arg_96_0)
	local var_96_0 = {
		weapon = arg_96_0.weapon:get(),
		variantID = arg_96_0.variantID:get(),
		attachments = {}
	}

	for iter_96_0 = 0, #arg_96_0.attachmentSetup - 1 do
		var_96_0.attachments[iter_96_0 + 1] = var_96_0.attachments[iter_96_0 + 1] or {}
		var_96_0.attachments[iter_96_0 + 1].ref = arg_96_0.attachmentSetup[iter_96_0].attachment:get()
		var_96_0.attachments[iter_96_0 + 1].variantID = arg_96_0.attachmentSetup[iter_96_0].variantID:get()
	end

	var_96_0.camo = arg_96_0.camo:get()
	var_96_0.cosmeticAttachment = arg_96_0.cosmeticAttachment:get()
	var_96_0.reticle = arg_96_0.reticle:get()
	var_96_0.stickers = WEAPON.GetEquippedStickers(arg_96_0)
	var_96_0.blueprintName = arg_96_0.blueprintName:get()
	var_96_0.lootID = arg_96_0.lootItemID:get()

	return var_96_0
end

function WEAPON.GenerateWeaponTableFromRef(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	local var_97_0 = {
		weapon = arg_97_0
	}

	var_97_0.variantID = 0
	var_97_0.attachments = {}
	var_97_0.camo = arg_97_1
	var_97_0.cosmeticAttachment = arg_97_2
	var_97_0.stickers = {}

	if arg_97_3 ~= nil then
		for iter_97_0 = 1, #arg_97_3 do
			var_97_0.stickers[iter_97_0] = arg_97_3[iter_97_0]
		end
	end

	var_97_0.blueprintName = ""
	var_97_0.lootID = LOOT.emptyID

	return var_97_0
end

function WEAPON.GenerateWeaponTableFromID(arg_98_0, arg_98_1)
	local var_98_0 = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, arg_98_1)

	if not var_98_0 or #var_98_0 <= 0 then
		return
	end

	local var_98_1 = WEAPON.GetVariantRef(arg_98_1)

	if not var_98_1 or #var_98_1 <= 0 then
		return
	end

	local var_98_2 = WEAPON.GetVariantFile(var_98_0)
	local var_98_3 = StringTable.BJJBBCJGEJ(var_98_2, CSV.weaponVariants.cols.ref, var_98_1)

	if var_98_3 < 0 then
		return
	end

	local var_98_4 = CSV.ReadRowWithFile(CSV.weaponVariants, var_98_2, var_98_3)

	if not var_98_4 then
		return
	end

	return WEAPON.GetLootModTable(arg_98_0, var_98_0, arg_98_1, var_98_4)
end

function WEAPON.SetSceneForWeaponSlot(arg_99_0)
	if Engine.DDJFBBJAIG() then
		if arg_99_0 == WEAPON.PrimarySlot then
			Engine.DHFCHIIJCA("loadout_showcase_p")
		else
			Engine.DHFCHIIJCA("loadout_showcase_s")
		end
	else
		Engine.DHFCHIIJCA("loadout_showcase")
	end
end

function WEAPON.SetPreviewSceneForWeapon(arg_100_0)
	local var_100_0 = WEAPON.GetWeaponClass(arg_100_0)
	local var_100_1 = StringTable.DIFCHIGDFB(CSV.weaponClasses.file, CSV.weaponClasses.cols.ref, var_100_0, CSV.weaponClasses.cols.previewScene)

	if not var_100_1 or #var_100_1 == 0 then
		var_100_1 = "loadout_showcase_preview"
	end

	Engine.DHFCHIIJCA(var_100_1)
end

function WEAPON.LoadAndSetModelFromName(arg_101_0, arg_101_1, arg_101_2, arg_101_3)
	FrontEndScene.RequestWeaponViewModels({
		arg_101_2
	}, arg_101_0)
	WEAPON.SetModelIfLoaded(arg_101_0, arg_101_1, arg_101_2, arg_101_3)
end

function WEAPON.LoadAndSetModelFromPlayerData(arg_102_0, arg_102_1, arg_102_2, arg_102_3)
	local var_102_0 = WEAPON.GenerateWeaponTable(arg_102_2)

	WEAPON.LoadAndSetModel(arg_102_0, arg_102_1, var_102_0, arg_102_3)
end

function WEAPON.LoadAndSetModel(arg_103_0, arg_103_1, arg_103_2, arg_103_3)
	local var_103_0 = WEAPON.GetWeaponModelName(arg_103_2.weapon, arg_103_2, {
		includeCamos = true,
		includeAttachments = true,
		includeStickers = true,
		controllerIndex = arg_103_0
	})

	FrontEndScene.RequestWeaponViewModels({
		var_103_0
	}, arg_103_0)

	arg_103_3 = arg_103_3 and arg_103_3 or {}
	arg_103_3.modelWeaponTable = arg_103_2

	WEAPON.SetModelIfLoaded(arg_103_0, arg_103_1, var_103_0, arg_103_3)
end

function WEAPON.SetModelIfLoaded(arg_104_0, arg_104_1, arg_104_2, arg_104_3)
	arg_104_3 = arg_104_3 or {}
	arg_104_1._nextWeaponModel = arg_104_2

	if Streaming.DACIGAEDAE({
		arg_104_1._nextWeaponModel
	}, arg_104_0) then
		arg_104_1:SetWeaponModel(arg_104_1._nextWeaponModel)
		FrontEndScene.SetReactiveCamo(arg_104_1, arg_104_3.modelWeaponTable)

		if arg_104_3.adjustSandbags then
			WEAPON.AdjustSandbags(arg_104_0, arg_104_1._nextWeaponModel)
		end

		arg_104_1._nextWeaponModel = nil

		if arg_104_3.callbackFunc then
			arg_104_3.callbackFunc()
		end
	else
		local var_104_0

		local function var_104_1()
			if arg_104_1._nextWeaponModel then
				if Streaming.DACIGAEDAE({
					arg_104_1._nextWeaponModel
				}, arg_104_0) then
					arg_104_1:SetWeaponModel(arg_104_1._nextWeaponModel)
					FrontEndScene.SetReactiveCamo(arg_104_1, arg_104_3.modelWeaponTable)

					if arg_104_3.adjustSandbags then
						WEAPON.AdjustSandbags(arg_104_0, arg_104_1._nextWeaponModel)
					end

					arg_104_1._nextWeaponModel = nil

					if arg_104_3.callbackFunc then
						arg_104_3.callbackFunc()
					end
				else
					arg_104_1:Wait(100, true).onComplete = var_104_1
				end
			end
		end

		var_104_1()
	end

	if arg_104_3.forceOffsetsAndRotations then
		arg_104_1:SetOffsetsAndRotations(arg_104_2)
	end
end

function WEAPON.AdjustSandbags(arg_106_0, arg_106_1)
	local var_106_0 = LUI.Split(arg_106_1, "+")[1]
	local var_106_1 = WEAPON.GetWeaponSandbagPlacementIndex(var_106_0)

	Engine.EBHIFJCGBH("primary_weapon_changed", var_106_1)
end

function WEAPON.GetDefaultOffsetFileForClientWeapon(arg_107_0)
	if arg_107_0 == FrontEndScene.ClientWeapons.GunTablePrimary then
		return CSV.weaponOffsets.gunTableFirstFile
	elseif arg_107_0 == FrontEndScene.ClientWeapons.GunTableSecondary then
		return CSV.weaponOffsets.gunTableSecondFile
	elseif arg_107_0 == FrontEndScene.ClientWeapons.Preview then
		return CSV.weaponOffsets.previewFile
	elseif arg_107_0 == FrontEndScene.ClientWeapons.Watch then
		return CSV.weaponOffsets.watchFile
	end
end

function WEAPON.GetWeaponModel(arg_108_0, arg_108_1, arg_108_2, arg_108_3)
	if arg_108_2 == nil then
		arg_108_2 = WEAPON.GetDefaultOffsetFileForClientWeapon(arg_108_1)
	end

	local var_108_0 = {
		0 * _1080p,
		-50 * _1080p
	}
	local var_108_1 = LUI.UIWeaponModel.new({
		controllerIndex = arg_108_0,
		clientWeaponIndex = arg_108_1,
		basePosition = var_108_0,
		dataCSVFile = arg_108_2,
		baseOffsets = arg_108_3
	})

	var_108_1:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -302, _1080p * 779, _1080p * 290, _1080p * 740, 0)

	var_108_1.id = "weaponModel"

	if arg_108_1 == FrontEndScene.ClientWeapons.GunTableSecondary then
		local var_108_2 = -0.4

		var_108_1:SetCollisionPlaneHeightOffset(var_108_2)
		ClientWeapon.CCAGDACGCC(arg_108_1, true)
	else
		ClientWeapon.CCAGDACGCC(arg_108_1, false)
	end

	return var_108_1
end

function WEAPON.GetSpecialAttributeName(arg_109_0)
	if not WEAPON.SpecialAttribute[arg_109_0] then
		WEAPON.NotifyWeaponDataError(arg_109_0, "WEAPON.GetSpecialAttributeName - Unsupported SpecialAttribute - " .. tostring(arg_109_0))

		return ""
	end

	return WEAPON.SpecialAttribute[arg_109_0].name
end

function WEAPON.GetSpecialAttributeIcon(arg_110_0)
	if not WEAPON.SpecialAttribute[arg_110_0] then
		WEAPON.NotifyWeaponDataError(arg_110_0, "WEAPON.GetSpecialAttributeIcon - Unsupported SpecialAttribute - " .. tostring(arg_110_0))

		return "white"
	end

	return WEAPON.SpecialAttribute[arg_110_0].icon
end

function WEAPON.GetSpecialAttributeColor(arg_111_0)
	if not WEAPON.SpecialAttribute[arg_111_0] then
		WEAPON.NotifyWeaponDataError(arg_111_0, "WEAPON.GetSpecialAttributeColor - Unsupported SpecialAttribute - " .. tostring(arg_111_0))

		return COLORS.white
	end

	return WEAPON.SpecialAttribute[arg_111_0].color
end

function WEAPON.GetSpecialAttributeIconColor(arg_112_0)
	if not WEAPON.SpecialAttribute[arg_112_0] then
		WEAPON.NotifyWeaponDataError(arg_112_0, "WEAPON.GetSpecialAttributeIconColor - Unsupported SpecialAttribute - " .. tostring(arg_112_0))

		return COLORS.white
	end

	local var_112_0 = WEAPON.SpecialAttribute[arg_112_0].attributeColor

	if var_112_0 then
		return var_112_0
	else
		return WEAPON.SpecialAttribute[arg_112_0].color
	end
end

function WEAPON.GetDismembermentType(arg_113_0)
	local var_113_0
	local var_113_1 = arg_113_0.weapon
	local var_113_2 = arg_113_0.lootID

	if var_113_2 > LOOT.emptyID then
		var_113_1 = LOOT.GetItemRef(LOOT.itemTypes.WEAPON, var_113_2)

		assert(var_113_1 and #var_113_1 > 0, "WEAPON.GetDismembermentType - Invalid weaponRef for lootID ==> " .. tostring(var_113_2))

		local var_113_3 = WEAPON.GetVariantFile(var_113_1)
		local var_113_4 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_113_2, CSV.weaponIDs.cols.variantRef)

		var_113_0 = StringTable.DIFCHIGDFB(var_113_3, CSV.weaponVariants.cols.ref, var_113_4, CSV.weaponVariants.cols.dismembermentEnabled)
	end

	if not var_113_0 or var_113_0 == "" then
		local var_113_5
		local var_113_6

		for iter_113_0 = 1, #arg_113_0.attachments do
			local var_113_7 = arg_113_0.attachments[iter_113_0]
			local var_113_8 = ATTACHMENT.GetRef(var_113_7.ref, var_113_1)

			var_113_0 = StringTable.DIFCHIGDFB(CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, var_113_8, CSV.MPAttachments.cols.dismembermentEnabled)

			if var_113_0 ~= "" then
				break
			else
				var_113_0 = false
			end
		end
	end

	return var_113_0 ~= "" and var_113_0 or false
end

function WEAPON.GetTracerType(arg_114_0)
	local var_114_0 = LOOT.GetTypeForID(arg_114_0)

	if var_114_0 ~= LOOT.itemTypes.WEAPON then
		return
	end

	local var_114_1 = LOOT.GetItemRef(var_114_0, arg_114_0)

	if #var_114_1 == 0 then
		return
	end

	local var_114_2 = WEAPON.GetVariantFile(var_114_1)
	local var_114_3 = WEAPON.GenerateWeaponTableFromID(controllerIndex, arg_114_0)
	local var_114_4 = StringTable.DIFCHIGDFB(var_114_2, CSV.weaponVariants.cols.variantID, var_114_3.variantID, CSV.weaponVariants.cols.tracerColor)

	return var_114_4 ~= "" and var_114_4 or false
end

function WEAPON.SetupCrosshair(arg_115_0, arg_115_1)
	local var_115_0 = LUI.DataSourceInControllerModel.new("cg.player.currentWeapon.crosshairAlpha"):GetModel(arg_115_1)

	arg_115_0:BindAlphaToModel(var_115_0)
end

function WEAPON.GetBaseRef(arg_116_0, arg_116_1)
	local var_116_0 = LUI.FindLast(arg_116_0, "_mp")

	if var_116_0 then
		local var_116_1 = arg_116_1 and var_116_0 + 2 or var_116_0 - 1

		arg_116_0 = string.sub(arg_116_0, 0, var_116_1)
	end

	return arg_116_0
end

function WEAPON.IsNonBulletWeapon(arg_117_0)
	return not WEAPON.IsBulletWeapon(arg_117_0)
end

function WEAPON.IsBulletWeapon(arg_118_0)
	return arg_118_0 and #arg_118_0 > 0 and arg_118_0 ~= "weapon_projectile" and arg_118_0 ~= "weapon_classic_s" and arg_118_0 ~= "weapon_melee2" and arg_118_0 ~= "weapon_melee" and arg_118_0 ~= "weapon_classic_p"
end

function WEAPON.IsCurrentBulletWeapon(arg_119_0, arg_119_1)
	local var_119_0 = Game.DEJBCHBCIH(arg_119_0, arg_119_1)
	local var_119_1 = WEAPON.GetBaseRef(var_119_0, false)
	local var_119_2 = WEAPON.GetWeaponClass(var_119_1)

	return WEAPON.IsBulletWeapon(var_119_2)
end

function WEAPON.GetDynamicWeaponAnimationSeq(arg_120_0)
	return StringTable.DIFCHIGDFB(CSV.DynamicWeaponTable.file, CSV.DynamicWeaponTable.cols.ref, arg_120_0, CSV.DynamicWeaponTable.cols.animateSeq)
end

function WEAPON.GetDynamicWeaponEnableValue(arg_121_0)
	local var_121_0 = tonumber(StringTable.DIFCHIGDFB(CSV.DynamicWeaponTable.file, CSV.DynamicWeaponTable.cols.ref, arg_121_0, CSV.DynamicWeaponTable.cols.enable))

	return var_121_0 and var_121_0 > 0
end

function WEAPON.StreamAllWeapons(arg_122_0)
	local var_122_0 = Streaming.DDFJHJEIBI()

	for iter_122_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_122_0) then
			local var_122_1 = {}
			local var_122_2 = {}
			local var_122_3 = LOADOUT.GetDefaultLoadouts(iter_122_0)
			local var_122_4 = PlayerData.BFFBGAJGD(iter_122_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

			for iter_122_1 = 0, 1 do
				for iter_122_2, iter_122_3 in ipairs(var_122_3) do
					local var_122_5 = iter_122_3.weapons[iter_122_1 + 1]
					local var_122_6 = WEAPON.GetWeaponModelNameFromRef(var_122_5.ref, {
						includeStickers = true,
						includeCamos = true,
						includeAttachments = true
					})

					table.insert(var_122_2, var_122_6)
				end

				for iter_122_4, iter_122_5 in ddlpairs(var_122_4) do
					local var_122_7 = iter_122_5.weaponSetups[iter_122_1]
					local var_122_8 = WEAPON.GenerateWeaponTable(var_122_7)
					local var_122_9 = WEAPON.GetWeaponModelName(var_122_8.weapon, var_122_8, {
						includeCamos = true,
						includeAttachments = true,
						includeStickers = true,
						controllerIndex = iter_122_0
					})

					table.insert(var_122_2, var_122_9)
				end
			end

			for iter_122_6 = 0, var_122_0 do
				table.insert(var_122_1, var_122_2[iter_122_6])
			end

			FrontEndScene.RequestWeaponViewModels(var_122_1, iter_122_0)
		end
	end
end

function WEAPON.LookUpTrialWeapon(arg_123_0, arg_123_1)
	return StringTable.DIFCHIGDFB(CSV.trialWeaponTable.file, CSV.trialWeaponTable.cols.trialID, arg_123_0, CSV.trialWeaponTable.cols.trialID + arg_123_1)
end

function WEAPON.LookUpTrialWeapons(arg_124_0)
	local var_124_0 = {}
	local var_124_1 = 1
	local var_124_2 = true

	while var_124_2 do
		local var_124_3 = WEAPON.LookUpTrialWeapon(arg_124_0, var_124_1)

		if var_124_3 ~= "" then
			table.insert(var_124_0, var_124_3)

			var_124_1 = var_124_1 + 1
		else
			var_124_2 = false
		end
	end

	return var_124_0
end

function WEAPON.StreamTrialWeapons(arg_125_0)
	local var_125_0 = WEAPON.LookUpTrialWeapons(arg_125_0)

	FrontEndScene.RequestWeaponWorldModels(var_125_0)

	return var_125_0
end

function WEAPON.GetSubClass(arg_126_0)
	local var_126_0 = WEAPON.GetWeaponClassName(arg_126_0)
	local var_126_1 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_126_0, CSV.MPWeapons.cols.subclassID)

	return (Engine.CBBHFCGDIC("WEAPON/SUBCLASS", var_126_0, var_126_1))
end

function WEAPON.GetSubClassIndex(arg_127_0)
	local var_127_0 = WEAPON.GetWeaponClassName(arg_127_0)
	local var_127_1 = StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, arg_127_0, CSV.MPWeapons.cols.subclassID)
	local var_127_2

	if var_127_1 and type(var_127_1) == "string" and var_127_1 ~= "" then
		local var_127_3 = string.match(var_127_1, "[^_]+$")

		assert(tonumber(var_127_3), "In WEAPON.GetSubClassIndex() subclassIndexString is not a number. subclassIndexString value : " .. var_127_3)

		var_127_2 = tonumber(var_127_3)
	end

	return var_127_2
end

function WEAPON.GetClassRefByID(arg_128_0)
	local var_128_0 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_128_0, CSV.weaponIDs.cols.baseRef)

	return (StringTable.DIFCHIGDFB(CSV.MPWeapons.file, CSV.MPWeapons.cols.ref, var_128_0, CSV.MPWeapons.cols.menuClass))
end

function WEAPON.GetNewWeaponIDsByClass(arg_129_0, arg_129_1, arg_129_2)
	local var_129_0 = {}
	local var_129_1 = Loot.BCBAGDEJAJ(arg_129_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])

	if var_129_1 and #var_129_1 > 0 then
		for iter_129_0, iter_129_1 in ipairs(var_129_1) do
			local var_129_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_129_1, CSV.weaponIDs.cols.quality)

			if WEAPON.GetClassRefByID(iter_129_1) == arg_129_1 then
				if arg_129_2 and arg_129_2.getBaseWeapon ~= nil then
					if arg_129_2.getBaseWeapon and tonumber(var_129_2) == LOOT.baseQuality or not arg_129_2.getBaseWeapon and tonumber(var_129_2) ~= LOOT.baseQuality then
						table.insert(var_129_0, iter_129_1)
					end
				else
					table.insert(var_129_0, iter_129_1)
				end
			end
		end
	end

	return var_129_0
end

function WEAPON.GetNewWeaponIDs(arg_130_0, arg_130_1)
	assert(arg_130_1.getBaseWeapon ~= nil)

	local var_130_0 = {}
	local var_130_1 = Loot.BCBAGDEJAJ(arg_130_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])

	if var_130_1 and #var_130_1 > 0 then
		for iter_130_0, iter_130_1 in ipairs(var_130_1) do
			local var_130_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_130_1, CSV.weaponIDs.cols.quality)

			if arg_130_1.getBaseWeapon and tonumber(var_130_2) == LOOT.baseQuality or not arg_130_1.getBaseWeapon and tonumber(var_130_2) ~= LOOT.baseQuality then
				table.insert(var_130_0, iter_130_1)
			end
		end
	end

	return var_130_0
end

function WEAPON.GetNewWeaponIDsBySlot(arg_131_0, arg_131_1)
	local var_131_0 = {}
	local var_131_1 = Loot.BCBAGDEJAJ(arg_131_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])

	if var_131_1 and #var_131_1 > 0 then
		for iter_131_0, iter_131_1 in ipairs(var_131_1) do
			local var_131_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_131_1, CSV.weaponIDs.cols.quality)
			local var_131_3 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_131_1, CSV.weaponIDs.cols.baseRef)
			local var_131_4 = WEAPON.GetSlotFromRef(var_131_3)

			if tonumber(var_131_2) == LOOT.baseQuality and var_131_4 == arg_131_1 then
				table.insert(var_131_0, iter_131_1)
			end
		end
	end

	return var_131_0
end

function WEAPON.GetNewArmoryIDsByWeapon(arg_132_0, arg_132_1)
	local var_132_0 = {}
	local var_132_1 = Loot.BCBAGDEJAJ(arg_132_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])

	if var_132_1 and #var_132_1 > 0 then
		for iter_132_0, iter_132_1 in ipairs(var_132_1) do
			local var_132_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_132_1, CSV.weaponIDs.cols.quality)
			local var_132_3 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, iter_132_1, CSV.weaponIDs.cols.baseRef)

			if tonumber(var_132_2) ~= LOOT.baseQuality and arg_132_1 == var_132_3 then
				table.insert(var_132_0, iter_132_1)
			end
		end
	end

	return var_132_0
end

function WEAPON.GetLootVariantImage(arg_133_0, arg_133_1)
	local var_133_0 = WEAPON.GetVariantFile(arg_133_0)
	local var_133_1 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, arg_133_1, CSV.weaponIDs.cols.variantRef)

	return (StringTable.DIFCHIGDFB(var_133_0, CSV.weaponVariants.cols.ref, var_133_1, CSV.weaponVariants.cols.image))
end

function WEAPON.GetGunTableSecondPositionScene(arg_134_0)
	if (WEAPON.GetWeaponClass(arg_134_0) == WEAPON.pistolClass or WEAPON.GetWeaponClass(arg_134_0) == WEAPON.MELEEClass2) and not WEAPON.ForceWideSecondaryCamera(arg_134_0) then
		return "loadout_showcase_s"
	else
		return "loadout_showcase_o"
	end
end

function WEAPON.GetVariantOverridenIcon(arg_135_0, arg_135_1)
	if arg_135_1 and arg_135_1 > 0 then
		local var_135_0 = WEAPON.GetVariantFile(arg_135_0)

		if var_135_0 and #var_135_0 > 0 then
			local var_135_1 = StringTable.DIFCHIGDFB(var_135_0, CSV.weaponVariants.cols.variantID, arg_135_1, CSV.weaponVariants.cols.overrideImage)

			if var_135_1 and #var_135_1 > 0 then
				return var_135_1
			end
		end
	end

	return nil
end

function WEAPON.GetCamoRef(arg_136_0)
	local var_136_0 = tonumber(arg_136_0)
	local var_136_1 = LOOT.GetLootItemRelatedWeapon(arg_136_0, LOOT.itemTypes.CAMO)

	if var_136_1 then
		local var_136_2 = StringTable.DIFCHIGDFB(CSV.weaponIDs.file, CSV.weaponIDs.cols.index, var_136_1, CSV.weaponIDs.cols.baseRef)

		if var_136_2 and var_136_2 ~= "" then
			local var_136_3 = LOOT.GetIDFileForType(LOOT.itemTypes.CAMO, {
				weaponRef = var_136_2
			})

			if var_136_3 and var_136_3 ~= "" then
				return StringTable.DIFCHIGDFB(var_136_3, CSV.camosIDs.cols.index, arg_136_0, CSV.camosIDs.cols.ref)
			else
				local var_136_4 = "Failed to find camoFile for camoWeaponRef: " .. var_136_2 .. ", for camoWeaponID: " .. var_136_1 .. ", likely missing in loot/weapon_ids.csv, look at: LOOT.GetIDFileForType" .. "."

				WEAPON.NotifyWeaponCamoDataError(arg_136_0, var_136_4)
			end
		else
			local var_136_5 = "Failed to find camoWeaponRef for camoWeaponID: " .. var_136_1 .. ", in loot/weapon_ids.csv" .. "."

			WEAPON.NotifyWeaponCamoDataError(arg_136_0, var_136_5)
		end
	else
		local var_136_6 = "Failed to find camoWeaponID, likely missing from mp/itemsourcetable.csv or mp/itemsourcetable_ch2.csv, look at LOOT.GetLootItemRelatedWeapon" .. "."

		WEAPON.NotifyWeaponCamoDataError(arg_136_0, var_136_6)
	end
end

function WEAPON.SetResetDynBones(arg_137_0)
	for iter_137_0 = 1, 2 do
		ClientWeapon.CCGIDAEHBC(arg_137_0[iter_137_0])
	end
end

function WEAPON.ClearBreadcrumbs(arg_138_0)
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.WATCH])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.STREAK])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.SUPER])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.VEHICLE_CAMO])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.VEHICLE_HORN])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.VEHICLE_TRACK])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.WEAPON])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.RETICLE])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.CHARM])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.PERK])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.EQUIPMENT])
	Loot.GADJEFJEA(arg_138_0, LOOT.typeNames[LOOT.itemTypes.STICKER])

	local var_138_0 = StringTable.BFHCAIIDA(CSV.lootMaster.file)

	for iter_138_0 = 0, var_138_0 - 1 do
		local var_138_1 = CSV.ReadRow(CSV.lootMaster, iter_138_0)

		if tonumber(var_138_1.typeValue) == LOOT.itemTypes.CAMO or tonumber(var_138_1.typeValue) == LOOT.itemTypes.ATTACHMENT then
			local var_138_2 = var_138_1.typeName

			Loot.GADJEFJEA(arg_138_0, var_138_2)
		end
	end

	ACTIONS.UploadStats(nil, arg_138_0)
end

function WEAPON.AddWeaponsInBundleToTable(arg_139_0, arg_139_1, arg_139_2, arg_139_3)
	arg_139_3 = arg_139_3 or {}
	arg_139_3.dupeCheckTable = arg_139_3.dupeCheckTable or {}

	local var_139_0 = {
		file = CSV.bundleIDs.file,
		cols = CSV.bundleIDs.cols
	}
	local var_139_1 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_139_1)
	local var_139_2 = CSV.ReadRow(var_139_0, var_139_1)

	for iter_139_0 = 1, CSV.bundleIDs.maxItems do
		local var_139_3 = tonumber(var_139_2["item" .. iter_139_0])

		if not var_139_3 then
			break
		end

		if LOOT.IsWeapon(var_139_3) and (not arg_139_3.excludeOwned or not LOOT.IsUnlockedWithID(arg_139_0, var_139_3)) then
			if arg_139_3.useBaseRefKeys and not arg_139_3.dupeCheckTable[var_139_3] then
				local var_139_4 = WEAPON.GetVariantBaseRef(var_139_3)

				arg_139_2[var_139_4] = arg_139_2[var_139_4] or {}

				table.insert(arg_139_2[var_139_4], {
					lootID = var_139_3,
					bundleID = arg_139_1
				})

				arg_139_3.dupeCheckTable[var_139_3] = true
			else
				arg_139_2[var_139_3] = {
					lootID = var_139_3,
					bundleID = arg_139_1
				}
			end
		end
	end
end

function WEAPON.GetPriorityVariants(arg_140_0, arg_140_1)
	arg_140_1 = arg_140_1 or {}

	local var_140_0 = arg_140_1.variantsTable or {}
	local var_140_1 = Engine.CFHBIHABCB(arg_140_0) and Dvar.DHEEJCCJBH("LRTKSQRKLR") or Dvar.DHEEJCCJBH("NQPKQKPTOQ") or ""
	local var_140_2 = split(var_140_1, ",")

	if var_140_2 then
		for iter_140_0, iter_140_1 in ipairs(var_140_2) do
			if STORE.BundleAvailable(arg_140_0, iter_140_1) then
				WEAPON.AddWeaponsInBundleToTable(arg_140_0, iter_140_1, var_140_0, arg_140_1)
			end
		end
	end

	return var_140_0
end

function WEAPON.GetAllVariantsInStore(arg_141_0, arg_141_1)
	assert(arg_141_0)

	arg_141_1 = arg_141_1 or {}
	arg_141_1.dupeCheckTable = {}

	if arg_141_1.useBaseRefKeys and arg_141_1.itemsTable then
		for iter_141_0, iter_141_1 in pairs(arg_141_1.itemsTable) do
			for iter_141_2, iter_141_3 in pairs(iter_141_1) do
				dupeCheckTable[iter_141_3.lootID] = true
			end
		end
	end

	arg_141_1.AddItemsFunction = WEAPON.AddWeaponsInBundleToTable

	return (STORE.GetAllItemsInStore(arg_141_0, arg_141_1))
end

function WEAPON.IsGoldCamoUnlocked(arg_142_0, arg_142_1)
	local var_142_0 = LOOT.GetBaseWeaponItemID(arg_142_1)

	if not var_142_0 then
		assert(false, "Missing weapon ID for " .. (arg_142_1 or "nil"))

		return false
	end

	local var_142_1 = var_142_0 * 1000 + WEAPON.goldCamoIDOffset

	return Loot.DEBEIFJEEG(arg_142_0, var_142_1) > 0
end

function WEAPON.GetMasterChallenges(arg_143_0, arg_143_1)
	local var_143_0 = {
		numComplete = 0,
		numChallenges = 0
	}
	local var_143_1 = -1
	local var_143_2 = {}
	local var_143_3 = WEAPON.GetMasterChallengeRefs(arg_143_1)
	local var_143_4 = #var_143_3

	for iter_143_0 = 1, var_143_4 do
		var_143_2[iter_143_0] = {}

		local var_143_5 = 0
		local var_143_6 = false

		if type(var_143_3[iter_143_0]) == "string" then
			var_143_5 = #LUI.Split(StringTable.DIFCHIGDFB(CSV.weaponMasterChallenges.file, CSV.weaponMasterChallenges.cols.ref, var_143_3[iter_143_0], CSV.weaponMasterChallenges.cols.amount), "|")
			var_143_6 = true
		elseif type(var_143_3[iter_143_0]) == "table" then
			var_143_5 = #var_143_3[iter_143_0]
		else
			assert(false, "unexpected mastery ref type")
		end

		for iter_143_1 = 1, var_143_5 do
			local var_143_7
			local var_143_8
			local var_143_9
			local var_143_10
			local var_143_11
			local var_143_12 = var_143_6 and var_143_3[iter_143_0] or var_143_3[iter_143_0][iter_143_1]
			local var_143_13 = StringTable.BJJBBCJGEJ(CSV.weaponMasterChallenges.file, CSV.weaponMasterChallenges.cols.ref, var_143_12)

			if var_143_13 >= 0 then
				local var_143_14 = CSV.ReadRowWithFile(CSV.weaponMasterChallenges, CSV.weaponMasterChallenges.file, var_143_13)

				if var_143_6 then
					var_143_7 = LUI.Split(var_143_14.name, "|")[iter_143_1]
					var_143_8 = LUI.Split(var_143_14.amount, "|")[iter_143_1]
					var_143_9 = LUI.Split(var_143_14.XPReward, "|")[iter_143_1]
					var_143_10 = LUI.Split(var_143_14.loot, "|")[iter_143_1]
					var_143_11 = LUI.Split(var_143_14.icon, "|")[iter_143_1]
				else
					var_143_7 = var_143_14.name
					var_143_8 = var_143_14.amount
					var_143_9 = var_143_14.XPReward
					var_143_10 = var_143_14.loot
					var_143_11 = var_143_14.icon
				end

				var_143_2[iter_143_0][iter_143_1] = {
					categoryName = Engine.CBBHFCGDIC(var_143_14.categoryName),
					name = Engine.CBBHFCGDIC(var_143_7),
					desc = Engine.CBBHFCGDIC(var_143_14.desc, var_143_8),
					amountEarned = Gunsmith.BICGDCCGCI(arg_143_0, var_143_14.id).progress,
					amountNeeded = tonumber(var_143_8),
					rewardXP = tonumber(var_143_9),
					rewardLoot = tonumber(var_143_10),
					icon = var_143_11,
					isUnlocked = iter_143_1 == 1
				}

				if var_143_6 and iter_143_1 > 1 then
					local var_143_15 = var_143_2[iter_143_0][iter_143_1].amountEarned
					local var_143_16 = var_143_2[iter_143_0][iter_143_1].amountNeeded
					local var_143_17 = var_143_2[iter_143_0][iter_143_1 - 1].amountNeeded

					if var_143_17 < var_143_15 then
						var_143_15 = var_143_15 - var_143_17
					else
						var_143_15 = 0
					end

					if var_143_17 < var_143_16 then
						var_143_16 = var_143_16 - var_143_17
					end

					var_143_2[iter_143_0][iter_143_1].amountEarned = var_143_15
					var_143_2[iter_143_0][iter_143_1].amountNeeded = var_143_16
					var_143_2[iter_143_0][iter_143_1].desc = Engine.CBBHFCGDIC(var_143_14.desc, var_143_16)
				end

				var_143_2[iter_143_0][iter_143_1].amountEarned = LUI.clamp(var_143_2[iter_143_0][iter_143_1].amountEarned, 0, var_143_2[iter_143_0][iter_143_1].amountNeeded)
				var_143_2[iter_143_0][iter_143_1].isComplete = var_143_2[iter_143_0][iter_143_1].amountEarned == var_143_2[iter_143_0][iter_143_1].amountNeeded

				if iter_143_1 > 1 then
					var_143_2[iter_143_0][iter_143_1].prevChallengeName = var_143_2[iter_143_0][iter_143_1 - 1].name
					var_143_2[iter_143_0][iter_143_1].isUnlocked = var_143_2[iter_143_0][iter_143_1 - 1].isComplete
				end

				var_143_0.numChallenges = var_143_0.numChallenges + 1

				if var_143_2[iter_143_0][iter_143_1].isComplete then
					var_143_0.numComplete = var_143_0.numComplete + 1
				end

				if var_143_2[iter_143_0][iter_143_1].amountNeeded > 0 then
					local var_143_18 = var_143_2[iter_143_0][iter_143_1].amountEarned / var_143_2[iter_143_0][iter_143_1].amountNeeded

					if var_143_18 < 1 and var_143_1 < var_143_18 then
						var_143_1 = var_143_18
						var_143_0.nearestComplete = var_143_2[iter_143_0][iter_143_1]
					end
				end
			end
		end
	end

	return var_143_2, var_143_0
end

function WEAPON.GetMasterChallengeRefs(arg_144_0)
	local var_144_0 = string.gsub(arg_144_0, "^iw8_", "")

	if var_144_0 == "knife" then
		var_144_0 = WEAPON.MasterKnifeRef
	end

	local var_144_1 = "ch_mastery_"

	return {
		var_144_1 .. var_144_0 .. "_card_kill",
		var_144_1 .. var_144_0 .. "_card_hs",
		{
			var_144_1 .. var_144_0 .. "_emblem_gold",
			var_144_1 .. var_144_0 .. "_emblem_platinum",
			var_144_1 .. var_144_0 .. "_emblem_damascus",
			var_144_1 .. var_144_0 .. "_emblem_obsidian"
		}
	}
end

function WEAPON.GetWeaponBlueprintString(arg_145_0, arg_145_1, arg_145_2)
	local var_145_0 = ""
	local var_145_1 = arg_145_1.weapon
	local var_145_2 = string.sub(arg_145_1.weapon, 5)
	local var_145_3 = split(arg_145_2, "+")
	local var_145_4 = {}

	for iter_145_0 = 1, #var_145_3 do
		local var_145_5 = split(var_145_3[iter_145_0], "|")

		if var_145_5 then
			local var_145_6 = var_145_5[1]

			if var_145_6 then
				local var_145_7 = StringTable.DIFCHIGDFB(CSV.attachments.file, CSV.attachments.cols.baseRef, var_145_6, CSV.attachments.cols.category)

				table.insert(var_145_4, var_145_7)
			end
		end
	end

	local var_145_8 = CSV.weaponVariants:GetFile(var_145_2)

	for iter_145_1 = 1, #var_145_4 do
		if var_145_4[iter_145_1] ~= "" then
			local var_145_9 = WEAPON.WeaponVariantMap[var_145_4[iter_145_1]]

			if var_145_9 then
				local var_145_10 = StringTable.DIFCHIGDFB(var_145_8, var_145_9, var_145_3[iter_145_1], CSV.weaponVariants.cols.name)

				var_145_10 = var_145_10 == "" and "WEAPON/DEFAULTWEAPON" or var_145_10
				var_145_0 = var_145_0 .. "|" .. var_145_10
			end
		end
	end

	if #var_145_0 > 0 then
		var_145_0 = string.sub(var_145_0, 2)
	end

	return var_145_0
end

function WEAPON.GetMasterChallengeCompletionCount(arg_146_0)
	local var_146_0 = CSV.weaponMasterChallenges
	local var_146_1 = StringTable.BFHCAIIDA(var_146_0.file)
	local var_146_2 = 0

	for iter_146_0 = 0, var_146_1 - 1 do
		local var_146_3 = CSV.ReadRow(var_146_0, iter_146_0)
		local var_146_4 = Gunsmith.BICGDCCGCI(arg_146_0, var_146_3.id).progress
		local var_146_5 = split(var_146_3.amount, "|")

		if var_146_5 and #var_146_5 > 0 and var_146_4 >= tonumber(var_146_5[#var_146_5]) then
			var_146_2 = var_146_2 + 1
		end
	end

	return var_146_2
end

function WEAPON.IsBaseWeaponDismemberment(arg_147_0, arg_147_1)
	return arg_147_1 and #arg_147_1 > 0 and string.match(arg_147_1, WEAPON.dismembermentWeaponSuffix)
end

function WEAPON.GetSpecialAttributeAtlas(arg_148_0)
	if not WEAPON.SpecialAttribute[arg_148_0] then
		WEAPON.NotifyWeaponDataError(arg_148_0, "WEAPON.GetSpecialAttributeAtlas - Unsupported SpecialAttribute - " .. tostring(arg_148_0))

		return "white"
	end

	local var_148_0 = WEAPON.SpecialAttribute[arg_148_0].atlas

	if not var_148_0 or not (#var_148_0 > 0) then
		var_148_0 = "loot_card_overlay_tracer_white"
	end

	return var_148_0
end

function WEAPON.GetSpecialAttributeBlendMode(arg_149_0)
	if not WEAPON.SpecialAttribute[arg_149_0] then
		WEAPON.NotifyWeaponDataError(arg_149_0, "WEAPON.GetSpecialAttributeBlendMode - Unsupported SpecialAttribute - " .. tostring(arg_149_0))

		return BLEND_MODE.blend
	end

	return WEAPON.SpecialAttribute[arg_149_0].blendMode or BLEND_MODE.addWithAlpha
end

function WEAPON.GetWeaponVariantID(arg_150_0, arg_150_1)
	local var_150_0 = "loot"

	if arg_150_1 and #arg_150_1 > 0 then
		local var_150_1, var_150_2 = string.find(arg_150_1, "+" .. var_150_0 .. "%d")

		if var_150_1 and var_150_2 and var_150_1 - 1 > 1 then
			local var_150_3 = WEAPON.GetBaseRef(arg_150_0)
			local var_150_4 = WEAPON.GetVariantFile(var_150_3)
			local var_150_5
			local var_150_6 = string.sub(arg_150_1, var_150_2 + 1, #arg_150_1)
			local var_150_7, var_150_8 = string.find(var_150_6, "+")

			if var_150_7 and var_150_8 then
				var_150_5 = string.sub(arg_150_1, var_150_2, var_150_2 + var_150_7 - 1)
			else
				var_150_5 = string.sub(arg_150_1, var_150_2, #arg_150_1)
			end

			return var_150_5
		end
	end

	return nil
end

function WEAPON.GetWeaponDisplayNameOverride(arg_151_0, arg_151_1)
	local var_151_0 = arg_151_1

	if arg_151_1 then
		if arg_151_1 == "WEAPON/KNIFE_V49" and not CONDITIONS.InFrontend() and not Engine.CIEGIACHAE() and CONDITIONS.InKillCam() then
			var_151_0 = "WEAPON/KNIFE_ONLY"
		end
	elseif DataSources.inGame.player.currentWeapon.name:GetValue(arg_151_0) == "iw8_knife_mpc+me_knifec+loot48" and not CONDITIONS.InFrontend() and not Engine.CIEGIACHAE() and CONDITIONS.InKillCam() then
		var_151_0 = Engine.CBBHFCGDIC("WEAPON/KNIFE_ONLY")
	end

	return var_151_0
end

function WEAPON.CheckWeaponsShouldBeEquipped(arg_152_0)
	if not Dvar.IBEGCHEFE("RRTLRKKTT") then
		return
	end

	DebugPrint("Weapon Ownership check started")

	local var_152_0 = WATCH.GetEquippedWatch(arg_152_0)

	if var_152_0 and #var_152_0 > 0 and var_152_0 ~= WATCH.WatchNoneValue and not LOOT.IsUnlocked(arg_152_0, LOOT.itemTypes.WATCH, var_152_0) then
		WATCH.SetEquippedWatch(arg_152_0, WATCH.WatchNoneValue)
		DebugPrint("Weapon Ownership check found unowned watch ref: " .. var_152_0)
	end

	for iter_152_0 = 0, LOADOUT.CustomClassCount - 1 do
		local var_152_1 = LOADOUT.GetLoadoutPlayerData(arg_152_0, iter_152_0)

		if var_152_1 then
			for iter_152_1 = 0, 1 do
				local var_152_2 = var_152_1.weaponSetups[iter_152_1]
				local var_152_3 = WEAPON.GenerateWeaponTable(var_152_2)

				if var_152_3.variantID > 0 and not LOOT.IsUnlockedWithID(arg_152_0, var_152_3.lootID) then
					WEAPON.EquipBaseWeapon(var_152_1.weaponSetups[iter_152_1], iter_152_1 == 0 and WEAPON.DefaultPrimary or WEAPON.DefaultSecondary)
					DebugPrint("Weapon Ownership check found unowned weapon variant of ID: " .. var_152_3.lootID)
				end

				if var_152_3.camo and #var_152_3.camo > 0 and var_152_3.camo ~= WEAPON.CamoNoneValue then
					local var_152_4 = LOOT.GetItemID(LOOT.itemTypes.CAMO, var_152_3.camo, {
						weaponRef = var_152_3.weapon
					})

					if var_152_4 then
						local var_152_5 = LOOT.IsUnlockedWithID(arg_152_0, var_152_4)

						if not var_152_5 then
							local var_152_6 = WEAPON.GetCamoRef(var_152_4)

							if var_152_6 and var_152_6 ~= "" then
								local var_152_7 = StringTable.DIFCHIGDFB(CSV.camoIds.file, CSV.camoIds.cols.ref, var_152_6, CSV.camoIds.cols.id)

								if var_152_7 and var_152_7 ~= "" then
									var_152_5 = LOOT.IsUnlockedWithID(arg_152_0, var_152_7)
								else
									local var_152_8 = "Failed to find globalCamoItemID in: " .. CSV.camoIds.file .. ", for camoRef: " .. var_152_6 .. ", for camoItemID: " .. var_152_4 .. ", for camo: " .. var_152_3.camo .. "."

									WEAPON.NotifyWeaponDataError(var_152_3.weapon, var_152_8)
								end
							else
								local var_152_9 = "Failed to find camoRef for camoItemID: " .. var_152_4 .. ", for camo: " .. var_152_3.camo .. "."

								WEAPON.NotifyWeaponDataError(var_152_3.weapon, var_152_9)
							end
						end

						if not var_152_5 then
							var_152_2.camo:set(WEAPON.CamoNoneValue)
							DebugPrint("Weapon Ownership check found unowned camo ref: " .. var_152_3.camo)
						end
					else
						local var_152_10 = "Failed to find camoItemID on camo: " .. var_152_3.camo .. "."

						WEAPON.NotifyWeaponDataError(var_152_3.weapon, var_152_10)
					end
				end

				if var_152_3.reticle and #var_152_3.reticle > 0 and var_152_3.reticle ~= WEAPON.ReticleNoneValue and not LOOT.IsUnlocked(arg_152_0, LOOT.itemTypes.RETICLE, var_152_3.reticle) then
					var_152_2.reticle:set(WEAPON.ReticleNoneValue)
					DebugPrint("Weapon Ownership check found unowned reticle ref: " .. var_152_3.reticle)
				end

				if var_152_3.cosmeticAttachment and #var_152_3.cosmeticAttachment > 0 and var_152_3.cosmeticAttachment ~= WEAPON.CharmNoneValue and not LOOT.IsUnlocked(arg_152_0, LOOT.itemTypes.CHARM, var_152_3.cosmeticAttachment) then
					var_152_2.cosmeticAttachment:set(WEAPON.CharmNoneValue)
					DebugPrint("Weapon Ownership check found unowned charm ref: " .. var_152_3.cosmeticAttachment)
				end

				for iter_152_2, iter_152_3 in ipairs(var_152_3.stickers) do
					if iter_152_3 and #iter_152_3 > 0 and iter_152_3 ~= WEAPON.StickerNoneValue and not LOOT.IsUnlocked(arg_152_0, LOOT.itemTypes.STICKER, iter_152_3) then
						var_152_2.sticker[iter_152_2 - 1]:set(WEAPON.StickerNoneValue)
						DebugPrint("Weapon Ownership check found unowned sticker ref: " .. iter_152_3)
					end
				end
			end
		end
	end
end

function WEAPON.GetNumbAttachments(arg_153_0, arg_153_1)
	local var_153_0 = 0

	if arg_153_0.customWeaponName then
		for iter_153_0 = 1, #arg_153_0.customWeaponAttachments do
			local var_153_1 = arg_153_0.customWeaponAttachments[iter_153_0]

			if ATTACHMENT.IsSelectableAttachment({
				ref = var_153_1
			}, arg_153_1) then
				var_153_0 = var_153_0 + 1
			end
		end
	elseif arg_153_0.numActiveAttachments then
		var_153_0 = arg_153_0.numActiveAttachments
	end

	local var_153_2 = 0

	if arg_153_0.maxNumAttachments then
		var_153_2 = arg_153_0.maxNumAttachments
	end

	return {
		numAttachments = var_153_0,
		maxNumAttachments = var_153_2
	}
end
