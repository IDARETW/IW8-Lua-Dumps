module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function RegimentGridInfo(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 50 * _1080p)

	var_2_0.id = "RegimentGridInfo"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "Background"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "ClanInfo"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU/SWITCH_REGIMENT_INFO"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 50, _1080p * -44, _1080p * -13, _1080p * 15)
	var_2_0:addElement(var_2_6)

	var_2_0.ClanInfo = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "ActiveClan"

	var_2_8:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_8:SetAlpha(0, 0)
	var_2_8:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 14, _1080p * 36, _1080p * -10, _1080p * 12)
	var_2_0:addElement(var_2_8)

	var_2_0.ActiveClan = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "Owner"

	var_2_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_10:SetAlpha(0, 0)
	var_2_10:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_2_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -34, _1080p * -12, _1080p * -10, _1080p * 12)
	var_2_0:addElement(var_2_10)

	var_2_0.Owner = var_2_10

	local function var_2_11()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_11

	local var_2_12 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_12)

	local var_2_13 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonOver", var_2_13)

	local function var_2_14()
		var_2_6:AnimateSequence("ButtonOver")
		var_2_10:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_14

	local var_2_15 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_15)

	local var_2_16 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonUp", var_2_16)

	local function var_2_17()
		var_2_6:AnimateSequence("ButtonUp")
		var_2_10:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_17

	local var_2_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_18)

	local function var_2_19()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_19

	var_2_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("RegimentGridInfo", RegimentGridInfo)
LockTable(_M)
