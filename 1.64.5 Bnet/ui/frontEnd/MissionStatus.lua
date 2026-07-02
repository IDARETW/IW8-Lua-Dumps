module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.CheckBox:SetValue(arg_1_2, true)
	ACTIONS.AnimateSequence(arg_1_0, arg_1_1 and "SetActive" or "SetInactive")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = 1

	var_0_0(arg_2_0, arg_2_1.isActive, arg_2_1.complete)

	if arg_2_1.objectives and arg_2_1.numObjectivesComplete then
		local var_2_1 = #arg_2_1.objectives

		var_2_0 = math.min(arg_2_1.numObjectivesComplete + 1, var_2_1)

		arg_2_0.ProgressDesc:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", var_2_0, var_2_1)))

		if arg_2_1.isBattlePassLocked then
			arg_2_0.ProgressDesc:setText(Engine.CBBHFCGDIC("CHALLENGE/LOCKED_BATTLEPASS_MISSION", Engine.JCBDICCAH(arg_2_1.battlePassLevelToUnlock)))
			ACTIONS.AnimateSequence(arg_2_0, "HideProgress")
		else
			ACTIONS.AnimateSequence(arg_2_0, "ShowProgress")
			arg_2_0.BarracksChallengeMissionDetailsPips:SetActive(true)
			arg_2_0.BarracksChallengeMissionDetailsPips:Setup(var_2_1, arg_2_1.numObjectivesComplete)
		end
	end

	if arg_2_1.name and #arg_2_1.name > 0 then
		arg_2_0.Title:setText(Engine.CBBHFCGDIC(arg_2_1.name))
	elseif arg_2_1.desc and #arg_2_1.desc > 0 and arg_2_1.objectives and arg_2_1.numObjectivesComplete then
		arg_2_0.Title:setText(Engine.CBBHFCGDIC(arg_2_1.desc, arg_2_1.objectives[var_2_0].amountNeeded))
	else
		arg_2_0.Title:setText("")
	end

	if arg_2_1.rewards and #arg_2_1.rewards > 0 then
		local var_2_2 = arg_2_1.rewards[Challenge.Reward.LOOT] or arg_2_1.rewards[Challenge.Reward.XP]

		if var_2_2.rarityImage ~= nil then
			arg_2_0.RarityImage:setImage(RegisterMaterial(var_2_2.rarityImage))
		end

		LOOT.ApplyRarityIconColoring(arg_2_0.RarityImage, var_2_2.rarity)
	else
		arg_2_0.RarityImage:SetAlpha(0)
	end

	arg_2_0.RestartToActivateOverlay:UpdateOverlay(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_1

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_3_0, "WZSetup")
	end
end

function MissionStatus(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 68 * _1080p)

	var_4_0.id = "MissionStatus"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "CheckBox"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 54, _1080p * 13, _1080p * 62)
	var_4_0:addElement(var_4_4)

	var_4_0.CheckBox = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Title"

	var_4_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_6:setText("Mission Name", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_6:SetStartupDelay(2000)
	var_4_6:SetLineHoldTime(400)
	var_4_6:SetAnimMoveTime(2000)
	var_4_6:SetAnimMoveSpeed(150)
	var_4_6:SetEndDelay(2000)
	var_4_6:SetCrossfadeTime(250)
	var_4_6:SetFadeInTime(300)
	var_4_6:SetFadeOutTime(300)
	var_4_6:SetMaxVisibleLines(1)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 390, _1080p * 14, _1080p * 38)
	var_4_0:addElement(var_4_6)

	var_4_0.Title = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "ProgressDesc"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_8:SetAlpha(0.5, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_8:SetStartupDelay(2000)
	var_4_8:SetLineHoldTime(400)
	var_4_8:SetAnimMoveTime(2000)
	var_4_8:SetAnimMoveSpeed(150)
	var_4_8:SetEndDelay(2000)
	var_4_8:SetCrossfadeTime(250)
	var_4_8:SetFadeInTime(300)
	var_4_8:SetFadeOutTime(300)
	var_4_8:SetMaxVisibleLines(1)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 390, _1080p * 40, _1080p * 62)
	var_4_0:addElement(var_4_8)

	var_4_0.ProgressDesc = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Equip"

	var_4_10:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_4_10:SetAlpha(0, 0)
	var_4_10:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 571, _1080p * 591, _1080p * 10, _1080p * 30)
	var_4_0:addElement(var_4_10)

	var_4_0.Equip = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "NewItemSmallIcon"

	var_4_12:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 584, _1080p * 592, _1080p * 9, _1080p * 17)
	var_4_0:addElement(var_4_12)

	var_4_0.NewItemSmallIcon = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "LockIcon"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_4_14:SetAlpha(0, 0)
	var_4_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 51, _1080p * 16, _1080p * 59)
	var_4_0:addElement(var_4_14)

	var_4_0.LockIcon = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "RarityImage"

	var_4_16:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_4_16:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 399, _1080p * 433, _1080p * 19, _1080p * 53)
	var_4_0:addElement(var_4_16)

	var_4_0.RarityImage = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetailsPips", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "BarracksChallengeMissionDetailsPips"

	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 186, _1080p * 201, _1080p * 53, _1080p * 59)
	var_4_0:addElement(var_4_18)

	var_4_0.BarracksChallengeMissionDetailsPips = var_4_18

	local var_4_19
	local var_4_20 = MenuBuilder.BuildRegisteredType("RestartToActivateOverlay", {
		controllerIndex = var_4_1
	})

	var_4_20.id = "RestartToActivateOverlay"

	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 68)
	var_4_0:addElement(var_4_20)

	var_4_0.RestartToActivateOverlay = var_4_20

	local function var_4_21()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("HideProgress", var_4_23)

	local var_4_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("HideProgress", var_4_24)

	local function var_4_25()
		var_4_14:AnimateSequence("HideProgress")
		var_4_18:AnimateSequence("HideProgress")
	end

	var_4_0._sequences.HideProgress = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ShowProgress", var_4_27)

	local var_4_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("ShowProgress", var_4_28)

	local function var_4_29()
		var_4_14:AnimateSequence("ShowProgress")
		var_4_18:AnimateSequence("ShowProgress")
	end

	var_4_0._sequences.ShowProgress = var_4_29

	local var_4_30
	local var_4_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZProgressBar,
			child = var_4_0.CheckBox.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight,
			child = var_4_0.CheckBox.Frame
		}
	}

	var_4_4:RegisterAnimationSequence("WZSetup", var_4_31)

	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_4_6:RegisterAnimationSequence("WZSetup", var_4_32)

	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_4_8:RegisterAnimationSequence("WZSetup", var_4_33)

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_4_18:RegisterAnimationSequence("WZSetup", var_4_34)

	local function var_4_35()
		var_4_4:AnimateSequence("WZSetup")
		var_4_6:AnimateSequence("WZSetup")
		var_4_8:AnimateSequence("WZSetup")
		var_4_18:AnimateSequence("WZSetup")
	end

	var_4_0._sequences.WZSetup = var_4_35

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MissionStatus", MissionStatus)
LockTable(_M)
