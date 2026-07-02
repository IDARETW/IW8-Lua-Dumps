module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.InviterName)
	arg_1_0.InviterName:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	arg_1_0.InviterName:SetFontSize(23 * _1080p)
end

function SocialPartyInvitation(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p)

	var_2_0.id = "SocialPartyInvitation"
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

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "InviterName"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 360, _1080p * 5, _1080p * 27)
	var_2_0:addElement(var_2_6)

	var_2_0.InviterName = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "TimeSent"

	var_2_8:SetRGBFromTable(SWATCHES.loadoutButton.defaultText, 0)
	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 20, _1080p * 360, _1080p * -23, _1080p * -5)
	var_2_0:addElement(var_2_8)

	var_2_0.TimeSent = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "Accept"

	var_2_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("MENU/ACCEPT"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Right)
	var_2_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -322, _1080p * -10, _1080p * -11, _1080p * 11)
	var_2_0:addElement(var_2_10)

	var_2_0.Accept = var_2_10

	local function var_2_11()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_11

	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_12)

	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonOver", var_2_13)

	local function var_2_14()
		var_2_6:AnimateSequence("ButtonOver")
		var_2_8:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_14

	local var_2_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_15)

	local var_2_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUp", var_2_16)

	local function var_2_17()
		var_2_6:AnimateSequence("ButtonUp")
		var_2_8:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_17

	var_2_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SocialPartyInvitation", SocialPartyInvitation)
LockTable(_M)
