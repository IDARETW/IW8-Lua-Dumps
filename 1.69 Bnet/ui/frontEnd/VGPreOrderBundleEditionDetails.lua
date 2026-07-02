module(..., package.seeall)

local var_0_0 = {
	[STORE.VanguardUpgradeToUltimateID] = {
		title = "LUA_MENU/VANGUARD_BUNDLE_INCLUDE_TITLE_01",
		bulletPoints = {
			{
				trailingImage = "logo_activision",
				text = "LUA_MENU/VANGUARD_BUNDLE_INCLUDE_ORIGINAL_OPERATOR_PACK",
				trailingImageScale = 1
			},
			{
				trailingImage = "logo_activision",
				text = "LUA_MENU/VANGUARD_BUNDLE_FRONTLINE_WEAPON_PACK",
				trailingImageScale = 1
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_CROSSGEN_CONTENT"
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_BATTLEPASS_BUNDLE"
			},
			{
				text = "LUA_MENU/DOUBLE_XP"
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_BASE_GAME"
			}
		}
	},
	[STORE.VanguardUltimateID] = {
		title = "LUA_MENU/VANGUARD_BUNDLE_INCLUDE_TITLE_01",
		bulletPoints = {
			{
				trailingImage = "logo_activision",
				text = "LUA_MENU/VANGUARD_BUNDLE_INCLUDE_ORIGINAL_OPERATOR_PACK",
				trailingImageScale = 1
			},
			{
				trailingImage = "logo_activision",
				text = "LUA_MENU/VANGUARD_BUNDLE_FRONTLINE_WEAPON_PACK",
				trailingImageScale = 1
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_CROSSGEN_CONTENT"
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_BATTLEPASS_BUNDLE"
			},
			{
				text = "LUA_MENU/DOUBLE_XP"
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_BASE_GAME"
			}
		}
	},
	[STORE.VanguardCrossGenID] = {
		title = "LUA_MENU/VANGUARD_BUNDLE_INCLUDE_TITLE_02",
		bulletPoints = {
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_FRONTLINE_WEAPON_PACK",
				trailingImage = "logo_activision"
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_CROSSGEN_CONTENT"
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_BASE_GAME"
			}
		}
	},
	[STORE.VanguardStandardID] = {
		title = "LUA_MENU/VANGUARD_BUNDLE_INCLUDE_TITLE_03",
		bulletPoints = {
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_FRONTLINE_WEAPON_PACK",
				trailingImage = "logo_activision"
			},
			{
				text = "LUA_MENU/VANGUARD_BUNDLE_BASE_GAME"
			}
		}
	}
}

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.tabData
	local var_1_1 = arg_1_1.tabKey

	arg_1_0.Title:setText(Engine.CBBHFCGDIC(var_0_0[var_1_1].title))
	arg_1_0.OrderedList:SetupBullets(arg_1_0._controllerIndex, var_0_0[var_1_1].bulletPoints, false)

	if arg_1_0._sequences then
		ACTIONS.AnimateSequence(arg_1_0, var_1_0.animation)
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1

	arg_2_0:registerEventHandler("preorder_tab_switched", var_0_1)
end

function VGPreOrderBundleEditionDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 480 * _1080p, 0, 250 * _1080p)

	var_3_0.id = "VGPreOrderBundleEditionDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Babkground"

	var_3_4:SetRGBFromTable(SWATCHES.Tracer.blue, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Babkground = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Title"

	var_3_6:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_3_6:setText("VGPreOrderBundleEditionDetails", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetStartupDelay(1000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(150)
	var_3_6:SetAnimMoveSpeed(50)
	var_3_6:SetEndDelay(1000)
	var_3_6:SetCrossfadeTime(400)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 480, _1080p * 17, _1080p * 47)
	var_3_0:addElement(var_3_6)

	var_3_0.Title = var_3_6

	local var_3_7
	local var_3_8 = {
		fontSize = "24",
		bulletImage = "widg_circle_small",
		spacing = 8,
		textColor = "SWATCHES.Scoreboard.friendlyTeam",
		numericSeparator = "",
		separation = 10,
		listType = 1,
		bulletColor = "SWATCHES.Scoreboard.friendlyTeam",
		bulletScale = 0.7000001,
		controllerIndex = var_3_1
	}
	local var_3_9 = MenuBuilder.BuildRegisteredType("BulletList", var_3_8)

	var_3_9.id = "OrderedList"

	var_3_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 504, _1080p * 57, _1080p * 75)
	var_3_0:addElement(var_3_9)

	var_3_0.OrderedList = var_3_9

	local function var_3_10()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_10

	local var_3_11
	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_3_4:RegisterAnimationSequence("TabUltimateEdition", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("TabUltimateEdition")
	end

	var_3_0._sequences.TabUltimateEdition = var_3_13

	local var_3_14
	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -94
		}
	}

	var_3_4:RegisterAnimationSequence("TabCrossGenEdition", var_3_15)

	local function var_3_16()
		var_3_4:AnimateSequence("TabCrossGenEdition")
	end

	var_3_0._sequences.TabCrossGenEdition = var_3_16

	local var_3_17
	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -125
		}
	}

	var_3_4:RegisterAnimationSequence("TabStandardEdition", var_3_18)

	local function var_3_19()
		var_3_4:AnimateSequence("TabStandardEdition")
	end

	var_3_0._sequences.TabStandardEdition = var_3_19

	var_0_2(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("VGPreOrderBundleEditionDetails", VGPreOrderBundleEditionDetails)
LockTable(_M)
