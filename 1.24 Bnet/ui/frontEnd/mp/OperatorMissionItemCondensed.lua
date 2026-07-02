module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.CheckBox:SetValue(arg_1_2, true)
	ACTIONS.AnimateSequence(arg_1_0, arg_1_1 and "SetActive" or "SetInactive")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_2.name and #arg_2_2.name > 0 then
		arg_2_0.Title:setText(Engine.CBBHFCGDIC(arg_2_2.name))
	else
		arg_2_0.Title:setText("")
	end

	var_0_0(arg_2_0, arg_2_2.isActive, arg_2_2.complete)

	if arg_2_2.objectives and arg_2_2.numObjectivesComplete then
		local var_2_0 = #arg_2_2.objectives
		local var_2_1 = math.min(arg_2_2.numObjectivesComplete + 1, var_2_0)

		if arg_2_2.isBattlePassLocked then
			arg_2_0.ProgressDesc:setText(Engine.CBBHFCGDIC("CHALLENGE/LOCKED_BATTLEPASS_MISSION", Engine.JCBDICCAH(arg_2_2.battlePassLevelToUnlock)))
		else
			arg_2_0.ProgressDesc:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", var_2_1, var_2_0))
		end
	end

	if not arg_2_1._menuHandlesChallengePress and not arg_2_2.isBattlePassLocked then
		arg_2_0:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
			if arg_3_0._challenge.complete and not arg_2_0._isActive or arg_3_0._challenge.isBattlePassLocked or not arg_3_0._challenge.unlocked then
				return
			end

			if arg_3_0._menu and not arg_2_0._isActive then
				arg_3_0._menu:processEvent({
					name = "challenges_mission_activation",
					index = arg_3_0._index
				})
			end
		end)
	end

	arg_2_0:SetButtonDisabled(arg_2_2.isBattlePassLocked or not arg_2_2.unlocked)
	arg_2_0:CustomLoseFocus()

	local var_2_2 = arg_2_2.rewards

	if var_2_2 and #var_2_2 > 0 then
		local var_2_3 = var_2_2[#var_2_2]

		arg_2_0.RarityImage:setImage(RegisterMaterial(var_2_3.rarityImage))
		arg_2_0.RarityImage:SetRGBFromTable(var_2_3.rarityColor)
	else
		arg_2_0.RarityImage:SetAlpha(0)
	end

	arg_2_0._challenge = arg_2_2
	arg_2_0._isActive = arg_2_2.isActive
	arg_2_0._menu = arg_2_1
	arg_2_0._index = arg_2_3
end

local function var_0_2(arg_4_0)
	arg_4_0:setFocus(false)

	if arg_4_0.disabled then
		if arg_4_0.isActive then
			arg_4_0:processEvent({
				snap = true,
				name = "button_disable_active"
			})
		else
			arg_4_0:processEvent({
				snap = true,
				name = "button_disable"
			})
		end
	elseif arg_4_0.isActive then
		arg_4_0:processEvent({
			snap = true,
			name = "button_active"
		})
	else
		arg_4_0:processEvent({
			snap = true,
			name = "button_up"
		})
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.keepFocus = true
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.Setup = var_0_1
	arg_6_0._isActive = false
	arg_6_0.CustomLoseFocus = var_0_2

	function arg_6_0.MouseLeave(arg_7_0, arg_7_1)
		return
	end

	function arg_6_0.LoseFocus(arg_8_0, arg_8_1)
		return
	end

	arg_6_0:addEventHandler("gain_focus", function(arg_9_0, arg_9_1)
		arg_6_0:getParent():processEvent({
			name = "new_mission_focused",
			newFocusedElement = arg_9_0
		})
	end)
	arg_6_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if arg_10_0._menu then
			arg_10_0._menu:processEvent({
				name = "challenges_update_mission_details",
				index = arg_10_0._index
			})
		end

		arg_10_0._isOver = true

		ACTIONS.AnimateSequence(arg_10_0, "ButtonOverCheckbox")
	end)
	arg_6_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		arg_11_0._isOver = false

		ACTIONS.AnimateSequence(arg_11_0, "ButtonUpCheckbox")
	end)
	arg_6_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		if arg_12_0._menu then
			arg_12_0._menu:processEvent({
				name = "challenges_update_mission_details",
				index = arg_12_0._index
			})
		end
	end)
end

function OperatorMissionItemCondensed(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIButton.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 68 * _1080p)

	var_13_0.id = "OperatorMissionItemCondensed"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)
	var_0_3(var_13_0, var_13_1, arg_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "Background"

	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "CheckBox"

	var_13_6:SetAlpha(0.5, 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 51, _1080p * 14, _1080p * 50)
	var_13_0:addElement(var_13_6)

	var_13_0.CheckBox = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIStyledText.new()

	var_13_8.id = "Title"

	var_13_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_13_8:setText("Mission Name", 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_8:SetAlignment(LUI.Alignment.Left)
	var_13_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_8:SetStartupDelay(2000)
	var_13_8:SetLineHoldTime(400)
	var_13_8:SetAnimMoveTime(2000)
	var_13_8:SetAnimMoveSpeed(150)
	var_13_8:SetEndDelay(2000)
	var_13_8:SetCrossfadeTime(250)
	var_13_8:SetFadeInTime(300)
	var_13_8:SetFadeOutTime(300)
	var_13_8:SetMaxVisibleLines(1)
	var_13_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 62, _1080p * -76, _1080p * 10, _1080p * 34)
	var_13_0:addElement(var_13_8)

	var_13_0.Title = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIStyledText.new()

	var_13_10.id = "ProgressDesc"

	var_13_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_13_10:SetAlpha(0.5, 0)
	var_13_10:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N"), 0)
	var_13_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_10:SetAlignment(LUI.Alignment.Left)
	var_13_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_10:SetStartupDelay(2000)
	var_13_10:SetLineHoldTime(400)
	var_13_10:SetAnimMoveTime(2000)
	var_13_10:SetAnimMoveSpeed(150)
	var_13_10:SetEndDelay(2000)
	var_13_10:SetCrossfadeTime(250)
	var_13_10:SetFadeInTime(300)
	var_13_10:SetFadeOutTime(300)
	var_13_10:SetMaxVisibleLines(1)
	var_13_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 524, _1080p * 36, _1080p * 58)
	var_13_0:addElement(var_13_10)

	var_13_0.ProgressDesc = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "NewItemSmallIcon"

	var_13_12:SetAlpha(0, 0)
	var_13_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -16, _1080p * -8, _1080p * 9, _1080p * 17)
	var_13_0:addElement(var_13_12)

	var_13_0.NewItemSmallIcon = var_13_12

	local var_13_13
	local var_13_14 = LUI.UIImage.new()

	var_13_14.id = "LockIcon"

	var_13_14:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_13_14:SetAlpha(0, 0)
	var_13_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_13_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 48, _1080p * 17, _1080p * 47)
	var_13_0:addElement(var_13_14)

	var_13_0.LockIcon = var_13_14

	local var_13_15
	local var_13_16 = LUI.UIImage.new()

	var_13_16.id = "RarityImage"

	var_13_16:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_13_16:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_13_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 243, _1080p * 277, _1080p * -17, _1080p * 17)
	var_13_0:addElement(var_13_16)

	var_13_0.RarityImage = var_13_16

	local function var_13_17()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_17

	local function var_13_18()
		return
	end

	var_13_0._sequences.SetActive = var_13_18

	local function var_13_19()
		return
	end

	var_13_0._sequences.SetInactive = var_13_19

	local var_13_20
	local var_13_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOver", var_13_21)

	local var_13_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonOver", var_13_22)

	local var_13_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOver", var_13_23)

	local function var_13_24()
		var_13_8:AnimateSequence("ButtonOver")
		var_13_10:AnimateSequence("ButtonOver")
		var_13_14:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_24

	local var_13_25
	local var_13_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUp", var_13_26)

	local var_13_27 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ButtonUp", var_13_27)

	local var_13_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUp", var_13_28)

	local function var_13_29()
		var_13_8:AnimateSequence("ButtonUp")
		var_13_10:AnimateSequence("ButtonUp")
		var_13_14:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_29

	local var_13_30
	local var_13_31 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverCheckbox", var_13_31)

	local function var_13_32()
		var_13_6:AnimateSequence("ButtonOverCheckbox")
	end

	var_13_0._sequences.ButtonOverCheckbox = var_13_32

	local var_13_33
	local var_13_34 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpCheckbox", var_13_34)

	local function var_13_35()
		var_13_6:AnimateSequence("ButtonUpCheckbox")
	end

	var_13_0._sequences.ButtonUpCheckbox = var_13_35

	local var_13_36
	local var_13_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpDisabled", var_13_37)

	local var_13_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpDisabled", var_13_38)

	local var_13_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUpDisabled", var_13_39)

	local function var_13_40()
		var_13_6:AnimateSequence("ButtonUpDisabled")
		var_13_8:AnimateSequence("ButtonUpDisabled")
		var_13_14:AnimateSequence("ButtonUpDisabled")
	end

	var_13_0._sequences.ButtonUpDisabled = var_13_40

	local var_13_41
	local var_13_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverDisabled", var_13_42)

	local var_13_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverDisabled", var_13_43)

	local var_13_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOverDisabled", var_13_44)

	local function var_13_45()
		var_13_6:AnimateSequence("ButtonOverDisabled")
		var_13_8:AnimateSequence("ButtonOverDisabled")
		var_13_14:AnimateSequence("ButtonOverDisabled")
	end

	var_13_0._sequences.ButtonOverDisabled = var_13_45

	var_13_0:addEventHandler("button_over", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonOver")
	end)
	var_13_0:addEventHandler("disable", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonUpDisabled")
	end)
	var_13_0:addEventHandler("button_over_disable", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonOverDisabled")
	end)
	var_13_0:addEventHandler("button_disable", function(arg_26_0, arg_26_1)
		if not arg_26_1.controller then
			local var_26_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonUpDisabled")
	end)
	var_0_4(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("OperatorMissionItemCondensed", OperatorMissionItemCondensed)
LockTable(_M)
