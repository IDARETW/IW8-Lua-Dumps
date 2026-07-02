module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Name)
	assert(arg_1_0.Image)
	arg_1_0:registerEventHandler("update_combat_record", function(arg_2_0, arg_2_1)
		assert(arg_2_1.recordType)

		local var_2_0 = RECORDS.GetTopData(arg_1_1, arg_2_1.recordType)

		arg_1_0.Header.Text:setText(Engine.CBBHFCGDIC(var_2_0.category))

		local var_2_1 = var_2_0.isHardcore and Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", var_2_0.item) or Engine.CBBHFCGDIC(var_2_0.item)

		arg_1_0.Name:setText(var_2_1)
		arg_1_0.Stats:Setup(var_2_0.stats)

		local var_2_2 = RegisterMaterial(var_2_0.image)

		if Engine.DFEIGFBEH(var_2_2) > 1 then
			ACTIONS.AnimateSequence(arg_1_0, "Icon2x1")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Icon1x1")
		end

		arg_1_0.Image:setImage(var_2_2)
	end)
	arg_1_0:processEvent({
		name = "update_combat_record",
		recordType = RECORDS.Types.WEAPON
	})
end

function CombatRecord(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "CombatRecord"
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
	local var_3_4 = MenuBuilder.BuildRegisteredType("CombatRecordButtons", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Buttons"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 539)
	var_3_0:addElement(var_3_4)

	var_3_0.Buttons = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "DoubleNotchedBacker"

	var_3_6:SetAlpha(0.5, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 648, _1080p * 1207, _1080p * 216, _1080p * 555)
	var_3_0:addElement(var_3_6)

	var_3_0.DoubleNotchedBacker = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Image"

	var_3_8:setImage(RegisterMaterial("icon_cac_weapon_ar_akilo47"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 700, _1080p * 1156, _1080p * 316, _1080p * 544)
	var_3_0:addElement(var_3_8)

	var_3_0.Image = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("CombatRecordStatsGroup", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Stats"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1244, _1080p * 1824, _1080p * 216, _1080p * 736)
	var_3_0:addElement(var_3_10)

	var_3_0.Stats = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Name"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_12:SetWordWrap(false)
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_12:SetStartupDelay(1000)
	var_3_12:SetLineHoldTime(400)
	var_3_12:SetAnimMoveTime(150)
	var_3_12:SetAnimMoveSpeed(50)
	var_3_12:SetEndDelay(1000)
	var_3_12:SetCrossfadeTime(400)
	var_3_12:SetFadeInTime(300)
	var_3_12:SetFadeOutTime(300)
	var_3_12:SetMaxVisibleLines(1)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 1179, _1080p * 271, _1080p * 299)
	var_3_0:addElement(var_3_12)

	var_3_0.Name = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "Header"

	var_3_14.Text:setText("", 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 648, _1080p * 1123, _1080p * 216, _1080p * 263)
	var_3_0:addElement(var_3_14)

	var_3_0.Header = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 814
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1042
		}
	}

	var_3_8:RegisterAnimationSequence("Icon1x1", var_3_16)

	local function var_3_17()
		var_3_8:AnimateSequence("Icon1x1")
	end

	var_3_0._sequences.Icon1x1 = var_3_17

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 700
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1156
		}
	}

	var_3_8:RegisterAnimationSequence("Icon2x1", var_3_18)

	local function var_3_19()
		var_3_8:AnimateSequence("Icon2x1")
	end

	var_3_0._sequences.Icon2x1 = var_3_19

	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_3_20 = LUI.UIBindButton.new()

	var_3_20.id = "selfBindButton"

	var_3_0:addElement(var_3_20)

	var_3_0.bindButton = var_3_20

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CombatRecord", CombatRecord)
LockTable(_M)
