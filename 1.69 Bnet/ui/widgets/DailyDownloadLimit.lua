module(..., package.seeall)

local var_0_0 = 358
local var_0_1 = 660
local var_0_2 = 58
local var_0_3 = 6
local var_0_4 = SWATCHES.genericMenu.progressFill
local var_0_5 = SWATCHES.genericMenu.progressFill
local var_0_6 = FONTS.MainRegular.File
local var_0_7 = LUI.Alignment.Center
local var_0_8 = 361
local var_0_9 = 376

local function var_0_10(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LUI.UIImage.new()

	var_1_0.id = "Graph" .. arg_1_1

	var_1_0:SetRGBFromTable(var_0_4, 0)
	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * (arg_1_2 - var_0_2), _1080p * arg_1_2, _1080p * var_0_0, _1080p * var_0_0)
	var_1_0:addElementBefore(arg_1_0.Bar)

	return var_1_0
end

local function var_0_11(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = LUI.UIText.new()

	var_2_0.id = "Download" .. arg_2_1

	var_2_0:SetRGBFromTable(var_0_5, 0)
	var_2_0:SetFont(FONTS.GetFont(var_0_6))
	var_2_0:SetAlignment(var_0_7)
	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * (arg_2_2 - var_0_2), _1080p * arg_2_2, _1080p * var_0_8, _1080p * var_0_9)
	var_2_0:addElementBefore(arg_2_0.Bar)

	return var_2_0
end

local function var_0_12(arg_3_0)
	local var_3_0, var_3_1, var_3_2, var_3_3 = arg_3_0.DailyDownloadBackground:getLocalRect()
	local var_3_4, var_3_5, var_3_6, var_3_7 = arg_3_0.Bar:getLocalRect()
	local var_3_8 = var_3_5 - var_3_3

	arg_3_0._maxPercent = 1 + (var_3_1 - var_3_5) / var_3_8
	arg_3_0._topPosition = var_3_1
	arg_3_0._bottomPosition = var_3_3
	arg_3_0._height = var_3_3 - var_3_1
	arg_3_0._itemsArray = {}

	local var_3_9 = var_0_1

	for iter_3_0 = 1, 10 do
		local var_3_10 = {
			graph = arg_3_0:GenerateGraph(iter_3_0, var_3_9),
			label = arg_3_0:GenerateLabel(iter_3_0, var_3_9)
		}

		table.insert(arg_3_0._itemsArray, var_3_10)

		var_3_9 = var_3_9 - var_0_2 - var_0_3
	end
end

local function var_0_13(arg_4_0, arg_4_1)
	if arg_4_1 > arg_4_0._maxPercent then
		return arg_4_0._topPosition
	else
		return arg_4_0._bottomPosition - arg_4_0._height * arg_4_1 / arg_4_0._maxPercent
	end
end

local function var_0_14(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.GetTopPosition = var_0_13
	arg_5_0.Setup = var_0_12
	arg_5_0.GenerateGraph = var_0_10
	arg_5_0.GenerateLabel = var_0_11

	local var_5_0 = Engine.BECCFCBIAA("httpStreamLimitMBytes", arg_5_1)
	local var_5_1 = Engine.BECCFCBIAA("httpStreamUsageLimit", arg_5_1) == 1 or Engine.BECCFCBIAA("httpStreamLimitMBytes", arg_5_1) == 0

	if var_5_1 then
		var_5_0 = 1024

		ACTIONS.AnimateSequence(arg_5_0, "UnlimitedDailyDownloadSequence")
	else
		ACTIONS.AnimateSequence(arg_5_0, "DefaultSequence")
	end

	arg_5_0:Setup()

	local var_5_2 = Engine.BBCBBFHCJJ()

	if var_5_2 then
		local var_5_3 = 0
		local var_5_4 = 0
		local var_5_5 = 0

		for iter_5_0, iter_5_1 in ipairs(var_5_2) do
			local var_5_6 = 0
			local var_5_7 = ""

			if iter_5_1.value then
				var_5_6 = tonumber(iter_5_1.value)

				if var_5_6 > 0 then
					var_5_4 = var_5_4 + var_5_6
					var_5_3 = var_5_3 + 1

					if var_5_0 <= var_5_6 and not var_5_1 then
						var_5_5 = var_5_5 + 1
					end
				end

				var_5_7 = LUI.Round(var_5_6 / 1024, 2)
			end

			arg_5_0._itemsArray[iter_5_0].label:setText(var_5_7)
			arg_5_0._itemsArray[iter_5_0].graph:SetTop(arg_5_0:GetTopPosition(var_5_6 / var_5_0))
		end

		local var_5_8 = 0
		local var_5_9 = 0
		local var_5_10 = 0

		if var_5_3 > 0 then
			local var_5_11 = var_5_4 / var_5_3

			var_5_9 = LUI.Round(var_5_11 / 1024, 2)
			var_5_10 = var_5_1 and 0 or LUI.Round(var_5_11 / var_5_0 * 100, 2)
		end

		if var_5_1 then
			arg_5_0.DayHitDLLimit:setText("N/A")
			arg_5_0.AvPercentDLLimit:setText("N/A")
		else
			arg_5_0.DayHitDLLimit:setText(var_5_5, 0)
			arg_5_0.AvPercentDLLimit:setText(Engine.CBBHFCGDIC("LUA_MENU/DAILYDOWNLOADLIMIT_PERCENT", var_5_10), 0)
		end

		arg_5_0.AvDailyDL:setText(Engine.CBBHFCGDIC("LUA_MENU/DAILYDOWNLOADLIMIT_GIGABYTE", var_5_9), 0)
		arg_5_0.SmallDailyDL:setText(Engine.CBBHFCGDIC("LUA_MENU/DAILYDOWNLOADLIMIT_GIGABYTE", LUI.Round(var_5_0 / 1024, 2)), 0)
	end
end

function DailyDownloadLimit(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 792 * _1080p, 0, 424 * _1080p)

	var_6_0.id = "DailyDownloadLimit"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Background"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_4:SetAlpha(0.15, 0)
	var_6_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_6_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -30)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("DailyDownloadBackground", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "DailyDownloadBackground"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 663, _1080p * 208, _1080p * 358)
	var_6_0:addElement(var_6_6)

	var_6_0.DailyDownloadBackground = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "BarLeft"

	var_6_8:SetRGBFromTable(SWATCHES.CAC.streakSelected, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 23, _1080p * 243, _1080p * 249)
	var_6_0:addElement(var_6_8)

	var_6_0.BarLeft = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "AvDailyDLTitle"

	var_6_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_10:setText(Engine.CBBHFCGDIC("MENU/MENUTEXTURE_DOWNLOADLIMIT_AVG_DAILYDL"), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 521, _1080p * 21, _1080p * 43)
	var_6_0:addElement(var_6_10)

	var_6_0.AvDailyDLTitle = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIText.new()

	var_6_12.id = "AvDailyDL"

	var_6_12:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_6_12:setText(Engine.CBBHFCGDIC("LUA_MENU/DAILYDOWNLOADLIMIT_GIGABYTE"), 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetAlignment(LUI.Alignment.Left)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 521, _1080p * 44, _1080p * 68)
	var_6_0:addElement(var_6_12)

	var_6_0.AvDailyDL = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIText.new()

	var_6_14.id = "DayHitDLLimit"

	var_6_14:setText("1", 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_14:SetAlignment(LUI.Alignment.Left)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 93, _1080p * 105, _1080p * 129)
	var_6_0:addElement(var_6_14)

	var_6_0.DayHitDLLimit = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIText.new()

	var_6_16.id = "DayHitDLLimitTitle"

	var_6_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_16:setText(Engine.CBBHFCGDIC("MENU/TEXTURE_DOWNLOADLIMIT_DAYS_HIT"), 0)
	var_6_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_16:SetWordWrap(false)
	var_6_16:SetAlignment(LUI.Alignment.Left)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 388, _1080p * 82, _1080p * 104)
	var_6_0:addElement(var_6_16)

	var_6_0.DayHitDLLimitTitle = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIText.new()

	var_6_18.id = "AvPercentDLLimit"

	var_6_18:setText(Engine.CBBHFCGDIC("LUA_MENU/DAILYDOWNLOADLIMIT_PERCENT"), 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_18:SetAlignment(LUI.Alignment.Left)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 157, _1080p * 166, _1080p * 190)
	var_6_0:addElement(var_6_18)

	var_6_0.AvPercentDLLimit = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIText.new()

	var_6_20.id = "AvPercentDLLimitTitle"

	var_6_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_20:setText(Engine.CBBHFCGDIC("MENU/TEXTURE_DOWNLOADLIMIT_AVG_PERCENTAGE"), 0)
	var_6_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_20:SetWordWrap(false)
	var_6_20:SetAlignment(LUI.Alignment.Left)
	var_6_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 388, _1080p * 143, _1080p * 165)
	var_6_0:addElement(var_6_20)

	var_6_0.AvPercentDLLimitTitle = var_6_20

	local var_6_21
	local var_6_22 = LUI.UIText.new()

	var_6_22.id = "Today"

	var_6_22:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_22:setText(Engine.CBBHFCGDIC("MENU/TODAY"), 0)
	var_6_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_22:SetWordWrap(false)
	var_6_22:SetAlignment(LUI.Alignment.Center)
	var_6_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 602, _1080p * 660, _1080p * 186, _1080p * 200)
	var_6_0:addElement(var_6_22)

	var_6_0.Today = var_6_22

	local var_6_23
	local var_6_24 = LUI.UIImage.new()

	var_6_24.id = "BarRight"

	var_6_24:SetRGBFromTable(SWATCHES.CAC.streakSelected, 0)
	var_6_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 663, _1080p * 665, _1080p * 243, _1080p * 249)
	var_6_0:addElement(var_6_24)

	var_6_0.BarRight = var_6_24

	local var_6_25
	local var_6_26 = LUI.UIText.new()

	var_6_26.id = "DailyDLTag"

	var_6_26:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_26:setText(Engine.CBBHFCGDIC("MENU/TEXTURE_DOWNLOADLIMIT_DAILY_DL_LIMIT"), 0)
	var_6_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_26:SetWordWrap(false)
	var_6_26:SetAlignment(LUI.Alignment.Left)
	var_6_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 759, _1080p * 229, _1080p * 243)
	var_6_0:addElement(var_6_26)

	var_6_0.DailyDLTag = var_6_26

	local var_6_27
	local var_6_28 = LUI.UIText.new()

	var_6_28.id = "SmallDailyDL"

	var_6_28:setText(Engine.CBBHFCGDIC("LUA_MENU/DAILYDOWNLOADLIMIT_GIGABYTE"), 0)
	var_6_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_28:SetAlignment(LUI.Alignment.Left)
	var_6_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 767, _1080p * 243, _1080p * 267)
	var_6_0:addElement(var_6_28)

	var_6_0.SmallDailyDL = var_6_28

	local var_6_29
	local var_6_30 = LUI.UIImage.new()

	var_6_30.id = "Bar"

	var_6_30:SetRGBFromTable(SWATCHES.CAC.streakSelected, 0)
	var_6_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 663, _1080p * 245, _1080p * 247)
	var_6_0:addElement(var_6_30)

	var_6_0.Bar = var_6_30

	local var_6_31
	local var_6_32 = LUI.UIImage.new()

	var_6_32.id = "Over"

	var_6_32:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_32:SetAlpha(0.35, 0)
	var_6_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 663, _1080p * 208, _1080p * 245)
	var_6_0:addElement(var_6_32)

	var_6_0.Over = var_6_32

	local function var_6_33()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("UnlimitedDailyDownloadSequence", var_6_35)

	local var_6_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_24:RegisterAnimationSequence("UnlimitedDailyDownloadSequence", var_6_36)

	local var_6_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_26:RegisterAnimationSequence("UnlimitedDailyDownloadSequence", var_6_37)

	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 259
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_28:RegisterAnimationSequence("UnlimitedDailyDownloadSequence", var_6_38)

	local var_6_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_30:RegisterAnimationSequence("UnlimitedDailyDownloadSequence", var_6_39)

	local function var_6_40()
		var_6_8:AnimateSequence("UnlimitedDailyDownloadSequence")
		var_6_24:AnimateSequence("UnlimitedDailyDownloadSequence")
		var_6_26:AnimateSequence("UnlimitedDailyDownloadSequence")
		var_6_28:AnimateSequence("UnlimitedDailyDownloadSequence")
		var_6_30:AnimateSequence("UnlimitedDailyDownloadSequence")
	end

	var_6_0._sequences.UnlimitedDailyDownloadSequence = var_6_40

	var_0_14(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("DailyDownloadLimit", DailyDownloadLimit)
LockTable(_M)
