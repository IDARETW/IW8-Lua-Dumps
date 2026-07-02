module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1.lootID)
	local var_1_1 = arg_1_1.lootType

	if not var_1_0 or not var_1_1 then
		return
	end

	arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = arg_1_0.Prompts
	})

	if arg_1_1.lootType == LOOT.itemTypes.PLAYERCARD then
		ACTIONS.AnimateSequence(arg_1_0, "ConfigPlayercard")
	end

	local var_1_2 = LOOT.GetItemRef(var_1_1, var_1_0)

	assert(var_1_2)

	if not var_1_2 or #var_1_2 <= 0 then
		return
	end

	local var_1_3 = LOOT.GetItemImage(var_1_1, var_1_2, var_1_0)

	if var_1_3 and #var_1_3 > 0 then
		arg_1_0.ForegroundImage:setImage(RegisterMaterial(var_1_3))
		arg_1_0.BackgroundImage:setImage(RegisterMaterial(var_1_3))
	end

	local var_1_4 = LOOT.GetItemName(var_1_1, var_1_2)

	if var_1_4 and #var_1_4 > 0 then
		arg_1_0.ItemName:setText(ToUpperCase(var_1_4))
	end

	local var_1_5 = LOOT.GetItemClassName(var_1_1, var_1_2)

	if var_1_5 and #var_1_5 > 0 then
		arg_1_0.ItemType:setText(var_1_5)
	end

	local var_1_6 = LOOT.GetItemQuality(var_1_1, var_1_2)

	assert(var_1_6)

	if not var_1_6 then
		return
	end

	local var_1_7 = LOOT.GetRarityImage(var_1_6)

	if var_1_7 and #var_1_7 > 0 then
		arg_1_0.RarityImage:setImage(RegisterMaterial(var_1_7))
	else
		arg_1_0.RarityImage:SetAlpha(0)
	end

	local var_1_8 = LOOT.GetRarityColor(var_1_6) or LOOT.GetDarkRarityColor(var_1_6)

	if var_1_8 then
		arg_1_0.ItemName:SetRGBFromTable(var_1_8)
		arg_1_0.RarityImage:SetRGBFromTable(var_1_8)
		arg_1_0.Gradient:SetRGBFromTable(var_1_8)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_2.lootID)
	assert(arg_2_2.lootType)
	arg_2_0.BackgroundImage:SetMask(arg_2_0.Mask)
	var_0_0(arg_2_0, arg_2_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
end

function ClassifiedChallengePopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "ClassifiedChallengePopup"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	var_3_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})
	var_3_0.HelperBar.id = "HelperBar"

	var_3_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_3_0.HelperBar:setPriority(10)
	var_3_0:addElement(var_3_0.HelperBar)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Darkener"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_4:SetAlpha(0.97, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Darkener = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_3_0) then
		var_3_6.Label:setText("Select/Back", 0)
	end

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -730, _1080p * 350, _1080p * 381)
	var_3_0:addElement(var_3_6)

	var_3_0.Prompts = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "GenericPopupWindow"

	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * 860, _1080p * -340, _1080p * 340)
	var_3_0:addElement(var_3_8)

	var_3_0.GenericPopupWindow = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "BackgroundImage"

	var_3_10:SetAlpha(0.1, 0)
	var_3_10:SetScale(1, 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128)
	var_3_0:addElement(var_3_10)

	var_3_0.BackgroundImage = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Gradient"

	var_3_12:SetAlpha(0.25, 0)
	var_3_12:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 130, _1080p * -130, _1080p * -96, _1080p * 96)
	var_3_0:addElement(var_3_12)

	var_3_0.Gradient = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "ForegroundImage"

	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128)
	var_3_0:addElement(var_3_14)

	var_3_0.ForegroundImage = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "RarityImage"

	var_3_16:SetRGBFromTable(SWATCHES.itemRarity.qualityBase, 0)
	var_3_16:setImage(RegisterMaterial("icon_rarity_1"), 0)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * 153, _1080p * 217)
	var_3_0:addElement(var_3_16)

	var_3_0.RarityImage = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "ItemName"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_3_18:setText("", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_18:SetWordWrap(false)
	var_3_18:SetAlignment(LUI.Alignment.Center)
	var_3_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_18:SetStartupDelay(2000)
	var_3_18:SetLineHoldTime(400)
	var_3_18:SetAnimMoveTime(2000)
	var_3_18:SetAnimMoveSpeed(150)
	var_3_18:SetEndDelay(2000)
	var_3_18:SetCrossfadeTime(250)
	var_3_18:SetFadeInTime(300)
	var_3_18:SetFadeOutTime(300)
	var_3_18:SetMaxVisibleLines(1)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * 227, _1080p * 277)
	var_3_0:addElement(var_3_18)

	var_3_0.ItemName = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIStyledText.new()

	var_3_20.id = "ItemType"

	var_3_20:SetRGBFromTable(SWATCHES.Store.DupeFillUnavailable, 0)
	var_3_20:SetAlpha(0.75, 0)
	var_3_20:setText("", 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetWordWrap(false)
	var_3_20:SetTracking(1 * _1080p, 0)
	var_3_20:SetAlignment(LUI.Alignment.Center)
	var_3_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_20:SetStartupDelay(2000)
	var_3_20:SetLineHoldTime(400)
	var_3_20:SetAnimMoveTime(2000)
	var_3_20:SetAnimMoveSpeed(150)
	var_3_20:SetEndDelay(2000)
	var_3_20:SetCrossfadeTime(1000)
	var_3_20:SetFadeInTime(300)
	var_3_20:SetFadeOutTime(300)
	var_3_20:SetMaxVisibleLines(1)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * 277, _1080p * 305)
	var_3_0:addElement(var_3_20)

	var_3_0.ItemType = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "Title"

	var_3_22:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_22:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/CLASSIFIED_CHALLENGE")), 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_22:SetAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -324, _1080p * -264)
	var_3_0:addElement(var_3_22)

	var_3_0.Title = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIImage.new()

	var_3_24.id = "Mask"

	var_3_24:setImage(RegisterMaterial("stencil_mask"), 0)
	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -341, _1080p * 341)
	var_3_0:addElement(var_3_24)

	var_3_0.Mask = var_3_24

	local function var_3_25()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_25

	local var_3_26
	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			value = 4.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ConfigPlayercard", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_14:RegisterAnimationSequence("ConfigPlayercard", var_3_28)

	local function var_3_29()
		var_3_10:AnimateSequence("ConfigPlayercard")
		var_3_14:AnimateSequence("ConfigPlayercard")
	end

	var_3_0._sequences.ConfigPlayercard = var_3_29

	local var_3_30 = LUI.UIBindButton.new()

	var_3_30.id = "selfBindButton"

	var_3_0:addElement(var_3_30)

	var_3_0.bindButton = var_3_30

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ClassifiedChallengePopup", ClassifiedChallengePopup)
LockTable(_M)
