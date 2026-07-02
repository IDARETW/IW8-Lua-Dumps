module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = VEHICLE.GetEquippedCamo(arg_1_1, arg_1_2.ref).name

	arg_1_0.SkinName:setText(Engine.CBBHFCGDIC(var_1_0))

	if arg_1_2.hideHornTab == 0 then
		ACTIONS.AnimateSequence(arg_1_0, "ShowAllCategories")

		local var_1_1 = VEHICLE.GetEquippedHornName(arg_1_1, arg_1_2.ref)

		arg_1_0.HornName:setText(Engine.CBBHFCGDIC(var_1_1))
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideHorn")
	end

	if arg_1_2.hideTrackTab == 0 then
		arg_1_0.TrackName:SetAlpha(1)
		arg_1_0.TrackText:SetAlpha(1)

		local var_1_2 = VEHICLE.GetEquippedTrack(arg_1_1, arg_1_2.ref)
		local var_1_3 = StringTable.DIFCHIGDFB(CSV.vehicleTracks.file, CSV.vehicleTracks.cols.index, var_1_2, CSV.vehicleTracks.cols.name)

		if var_1_3 == "" then
			var_1_3 = Engine.CBBHFCGDIC("MENU/NONE")
		end

		arg_1_0.TrackName:setText(Engine.CBBHFCGDIC(var_1_3))
	else
		arg_1_0.TrackName:SetAlpha(0)
		arg_1_0.TrackText:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupEquippedItems = var_0_0
end

function VehicleEquippedItems(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 400 * _1080p)

	var_3_0.id = "VehicleEquippedItems"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "EquippedText"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_3_4:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_4:SetStartupDelay(1250)
	var_3_4:SetLineHoldTime(400)
	var_3_4:SetAnimMoveTime(300)
	var_3_4:SetAnimMoveSpeed(50)
	var_3_4:SetEndDelay(1000)
	var_3_4:SetCrossfadeTime(500)
	var_3_4:SetFadeInTime(300)
	var_3_4:SetFadeOutTime(300)
	var_3_4:SetMaxVisibleLines(1)
	var_3_4:SetDecodeLetterLength(20)
	var_3_4:SetDecodeMaxRandChars(6)
	var_3_4:SetDecodeUpdatesPerLetter(4)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 422, _1080p * 10, _1080p * 40)
	var_3_0:addElement(var_3_4)

	var_3_0.EquippedText = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Line"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 250, _1080p * 40, _1080p * 41)
	var_3_0:addElement(var_3_6)

	var_3_0.Line = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "SkinText"

	var_3_8:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("VEHICLES/EQUIPPED_SKIN1"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 475, _1080p * 56, _1080p * 81)
	var_3_0:addElement(var_3_8)

	var_3_0.SkinText = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "HornText"

	var_3_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("VEHICLES/EQUIPPED_HORN1"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 475, _1080p * 143, _1080p * 170)
	var_3_0:addElement(var_3_10)

	var_3_0.HornText = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "TrackText"

	var_3_12:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_12:setText(Engine.CBBHFCGDIC("VEHICLES/EQUIPPED_BATTLE_TRACK"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 475, _1080p * 225, _1080p * 250)
	var_3_0:addElement(var_3_12)

	var_3_0.TrackText = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "SkinName"

	var_3_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 88, _1080p * 118)
	var_3_0:addElement(var_3_14)

	var_3_0.SkinName = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "HornName"

	var_3_16:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 170, _1080p * 200)
	var_3_0:addElement(var_3_16)

	var_3_0.HornName = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "TrackName"

	var_3_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_18:setText("", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 254, _1080p * 284)
	var_3_0:addElement(var_3_18)

	var_3_0.TrackName = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowAllCategories", var_3_21)

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 226
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 251
		}
	}

	var_3_12:RegisterAnimationSequence("ShowAllCategories", var_3_22)

	local var_3_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ShowAllCategories", var_3_23)

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 255
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 285
		}
	}

	var_3_18:RegisterAnimationSequence("ShowAllCategories", var_3_24)

	local function var_3_25()
		var_3_10:AnimateSequence("ShowAllCategories")
		var_3_12:AnimateSequence("ShowAllCategories")
		var_3_16:AnimateSequence("ShowAllCategories")
		var_3_18:AnimateSequence("ShowAllCategories")
	end

	var_3_0._sequences.ShowAllCategories = var_3_25

	local var_3_26
	local var_3_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("HideHorn", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 170
		}
	}

	var_3_12:RegisterAnimationSequence("HideHorn", var_3_28)

	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("HideHorn", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 174
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 204
		}
	}

	var_3_18:RegisterAnimationSequence("HideHorn", var_3_30)

	local function var_3_31()
		var_3_10:AnimateSequence("HideHorn")
		var_3_12:AnimateSequence("HideHorn")
		var_3_16:AnimateSequence("HideHorn")
		var_3_18:AnimateSequence("HideHorn")
	end

	var_3_0._sequences.HideHorn = var_3_31

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("VehicleEquippedItems", VehicleEquippedItems)
LockTable(_M)
