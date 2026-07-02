module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.clanID)

	arg_1_0._clanID = arg_1_2.clanID
	arg_1_0._selectedHour = Clans.CBJDIGCAED(arg_1_1, arg_1_0._clanID).happyHour or 0
	arg_1_0._selectedMinutes = Clans.CBJDIGCAED(arg_1_1, arg_1_0._clanID).happyMinutes or 0

	local var_1_0 = {}

	if IsLanguageEnglish() then
		local var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/TIME_PERIOD_AM")
		local var_1_2 = Engine.CBBHFCGDIC("LUA_MENU/TIME_PERIOD_PM")

		var_1_0 = {
			"12 " .. var_1_1,
			"1 " .. var_1_1,
			"2 " .. var_1_1,
			"3 " .. var_1_1,
			"4 " .. var_1_1,
			"5 " .. var_1_1,
			"6 " .. var_1_1,
			"7 " .. var_1_1,
			"8 " .. var_1_1,
			"9 " .. var_1_1,
			"10 " .. var_1_1,
			"11 " .. var_1_1,
			"12 " .. var_1_2,
			"1 " .. var_1_2,
			"2 " .. var_1_2,
			"3 " .. var_1_2,
			"4 " .. var_1_2,
			"5 " .. var_1_2,
			"6 " .. var_1_2,
			"7 " .. var_1_2,
			"8 " .. var_1_2,
			"9 " .. var_1_2,
			"10 " .. var_1_2,
			"11 " .. var_1_2
		}
	else
		for iter_1_0 = 0, 23 do
			table.insert(var_1_0, string.format("%02d", iter_1_0))
		end
	end

	local var_1_3 = {
		wrapAround = true,
		labels = var_1_0,
		action = function(arg_2_0)
			arg_1_0._selectedHour = arg_2_0 - 1
		end,
		defaultValue = arg_1_0._selectedHour + 1
	}

	LUI.AddUIArrowTextButtonLogic(arg_1_0.HourButton, arg_1_1, var_1_3)

	local var_1_4 = {
		wrapAround = true,
		labels = {
			"00",
			"05",
			"10",
			"15",
			"20",
			"25",
			"30",
			"35",
			"40",
			"45",
			"50",
			"55"
		},
		action = function(arg_3_0)
			arg_1_0._selectedMinutes = (arg_3_0 - 1) * 5
		end,
		defaultValue = math.floor(arg_1_0._selectedMinutes / 5) + 1
	}

	LUI.AddUIArrowTextButtonLogic(arg_1_0.MinutesButton, arg_1_1, var_1_4)
	arg_1_0.OKButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		Clans.BGJDIAAACD(arg_1_1, arg_1_0._clanID, arg_1_0._selectedHour, arg_1_0._selectedMinutes)
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function RegimentsHappyHourMenu(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0.id = "RegimentsHappyHourMenu"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.8, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericPopupWindow"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 856, _1080p * -202, _1080p * 234)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericPopupWindow = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "SetHappyHour"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SET_HAPPY_HOUR")), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 296, _1080p * -148, _1080p * -88)
	var_5_0:addElement(var_5_8)

	var_5_0.SetHappyHour = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Image"

	var_5_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_10:SetAlpha(0.6, 0)
	var_5_10:setImage(RegisterMaterial("icon_regiments_happyhour"), 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -775, _1080p * -413, _1080p * -165, _1080p * 197)
	var_5_0:addElement(var_5_10)

	var_5_0.Image = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "ButtonHelperBar"

	var_5_12.Background:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 240, _1080p * 300)
	var_5_0:addElement(var_5_12)

	var_5_0.ButtonHelperBar = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "HourButton"

	var_5_14.Title:setText(Engine.CBBHFCGDIC("MENU/HOURS"), 0)
	var_5_14.Text:setText("", 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 626, _1080p * 1256, _1080p * 565, _1080p * 605)
	var_5_0:addElement(var_5_14)

	var_5_0.HourButton = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "MinutesButton"

	var_5_16.Title:setText(Engine.CBBHFCGDIC("MENU/MINUTES"), 0)
	var_5_16.Text:setText("", 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 626, _1080p * 1256, _1080p * 613, _1080p * 653)
	var_5_0:addElement(var_5_16)

	var_5_0.MinutesButton = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "OKButton"

	var_5_18.Text:SetLeft(_1080p * 20, 0)
	var_5_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"), 0)
	var_5_18.Text:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 656, _1080p * 1256, _1080p * 661, _1080p * 699)
	var_5_0:addElement(var_5_18)

	var_5_0.OKButton = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIText.new()

	var_5_20.id = "HappyHourDesc"

	var_5_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_20:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_DESC"), 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 780, _1080p * -80, _1080p * -56)
	var_5_0:addElement(var_5_20)

	var_5_0.HappyHourDesc = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIText.new()

	var_5_22.id = "HappyHourRestriction"

	var_5_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_22:setText(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_RESTRICTION"), 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_22:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 780, _1080p * 181, _1080p * 205)
	var_5_0:addElement(var_5_22)

	var_5_0.HappyHourRestriction = var_5_22

	function var_5_0.addButtonHelperFunction(arg_6_0, arg_6_1)
		arg_6_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_6_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_5_0:addEventHandler("menu_create", var_5_0.addButtonHelperFunction)

	local var_5_23 = LUI.UIBindButton.new()

	var_5_23.id = "selfBindButton"

	var_5_0:addElement(var_5_23)

	var_5_0.bindButton = var_5_23

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("RegimentsHappyHourMenu", RegimentsHappyHourMenu)
LockTable(_M)
