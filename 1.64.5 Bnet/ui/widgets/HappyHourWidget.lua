module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.HappyHourTimerInfo:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = Clans.CBJDIGCAED(arg_2_0._controllerIndex, arg_2_1)

	if var_2_0 and var_2_0.happyHour then
		if var_2_0.secondsInHappyHour then
			local var_2_1 = var_2_0.secondsInHappyHour
			local var_2_2 = math.floor(var_2_1 / 60)
			local var_2_3 = var_2_1 - var_2_2 * 60

			var_0_0(arg_2_0, Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_ENDS", Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_ENDS_TIMER", var_2_2, var_2_3)))
			arg_2_0.ActiveTag:SetAlpha(1)
		else
			local var_2_4 = var_2_0.timeToHappyHour
			local var_2_5 = math.floor(var_2_4 / 3600)
			local var_2_6 = var_2_4 - var_2_5 * 3600
			local var_2_7 = math.floor(var_2_6 / 60)
			local var_2_8 = var_2_6 - var_2_7 * 60
			local var_2_9 = arg_2_0._hoursMapping[var_2_0.happyHour + 1]
			local var_2_10 = string.format("%02d", var_2_0.happyMinutes)
			local var_2_11

			if IsLanguageEnglish() then
				var_2_11 = Engine.CBBHFCGDIC(var_2_9[2], var_2_9[1], var_2_10)
			else
				var_2_11 = Engine.CBBHFCGDIC("LUA_MENU/FORMATTED_TIME", var_2_9, var_2_10)
			end

			var_0_0(arg_2_0, Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_AT", var_2_11, Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_STARTS_IN", var_2_5, var_2_7, var_2_8)))
			arg_2_0.ActiveTag:SetAlpha(0)
		end
	else
		var_0_0(arg_2_0, Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR_NOT_SET_DESC"))
		arg_2_0.ActiveTag:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.ActiveTag:SetupEventBanner(arg_3_1)
	local var_3_1 = 8 * _1080p
	local var_3_2 = arg_3_0:GetCurrentAnchorsAndPositions().right

	arg_3_0.ActiveTag:SetRight(var_3_2 - var_3_1)
	arg_3_0.ActiveTag:SetLeft(var_3_2 - var_3_1 - var_3_0)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupHappyHour = var_0_1
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0._hoursMapping = {}

	if IsLanguageEnglish() then
		local var_4_0 = "LUA_MENU/TIME_HOUR_AM"
		local var_4_1 = "LUA_MENU/TIME_HOUR_PM"

		arg_4_0._hoursMapping = {
			{
				"12",
				var_4_0
			},
			{
				"1",
				var_4_0
			},
			{
				"2",
				var_4_0
			},
			{
				"3",
				var_4_0
			},
			{
				"4",
				var_4_0
			},
			{
				"5",
				var_4_0
			},
			{
				"6",
				var_4_0
			},
			{
				"7",
				var_4_0
			},
			{
				"8",
				var_4_0
			},
			{
				"9",
				var_4_0
			},
			{
				"10",
				var_4_0
			},
			{
				"11",
				var_4_0
			},
			{
				"12",
				var_4_1
			},
			{
				"1",
				var_4_1
			},
			{
				"2",
				var_4_1
			},
			{
				"3",
				var_4_1
			},
			{
				"4",
				var_4_1
			},
			{
				"5",
				var_4_1
			},
			{
				"6",
				var_4_1
			},
			{
				"7",
				var_4_1
			},
			{
				"8",
				var_4_1
			},
			{
				"9",
				var_4_1
			},
			{
				"10",
				var_4_1
			},
			{
				"11",
				var_4_1
			}
		}
	else
		for iter_4_0 = 0, 23 do
			table.insert(arg_4_0._hoursMapping, string.format("%02d", iter_4_0))
		end
	end

	var_0_2(arg_4_0, Engine.CBBHFCGDIC("LUA_MENU/ACTIVE"))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function HappyHourWidget(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 530 * _1080p, 0, 138 * _1080p)

	var_5_0.id = "HappyHourWidget"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIStyledText.new()

	var_5_4.id = "HappyHourTimerInfo"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_4:setText("", 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 530, _1080p * 29, _1080p * 49)
	var_5_0:addElement(var_5_4)

	var_5_0.HappyHourTimerInfo = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "ActiveTag"

	var_5_6.Backer:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_6.Backer:SetAlpha(0.3, 0)
	var_5_6.Node:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 380, _1080p * 530, 0, _1080p * 22)
	var_5_0:addElement(var_5_6)

	var_5_0.ActiveTag = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "TokenImage"

	var_5_8:setImage(RegisterMaterial("icon_regiments_happyhour"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 29, _1080p * -5, _1080p * 21)
	var_5_0:addElement(var_5_8)

	var_5_0.TokenImage = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "Title"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_5_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/HAPPY_HOUR")), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 32, 0, _1080p * -3, _1080p * 19)
	var_5_0:addElement(var_5_10)

	var_5_0.Title = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Line"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 24, _1080p * 25)
	var_5_0:addElement(var_5_12)

	var_5_0.Line = var_5_12

	local function var_5_13()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_13

	local var_5_14
	local var_5_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = -5 * _1080p
		}
	}

	var_5_4:RegisterAnimationSequence("AR", var_5_15)

	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22
		}
	}

	var_5_10:RegisterAnimationSequence("AR", var_5_16)

	local function var_5_17()
		var_5_4:AnimateSequence("AR")
		var_5_10:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_17

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("HappyHourWidget", HappyHourWidget)
LockTable(_M)
