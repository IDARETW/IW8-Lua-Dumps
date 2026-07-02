module(..., package.seeall)

local var_0_0 = 60 * _1080p
local var_0_1 = 30 * _1080p
local var_0_2 = 3
local var_0_3 = {
	"LUA_MENU/1ST",
	"LUA_MENU/2ND",
	"LUA_MENU/3RD"
}

local function var_0_4(arg_1_0)
	arg_1_0._defaultFlag = RegisterMaterial("ui_playercard_272")
	arg_1_0._flags = {}
	arg_1_0._flags.USA = {
		material = "ui_playercard_277",
		isTemporary = true
	}
	arg_1_0._flags.SWE = {
		material = "ui_playercard_278",
		isTemporary = true
	}
	arg_1_0._flags.ESP = {
		material = "ui_playercard_279",
		isTemporary = true
	}
	arg_1_0._flags.SVK = {
		material = "ui_playercard_280",
		isTemporary = true
	}
	arg_1_0._flags.RUS = {
		material = "ui_playercard_281",
		isTemporary = true
	}
	arg_1_0._flags.PRT = {
		material = "ui_playercard_282",
		isTemporary = true
	}
	arg_1_0._flags.NLD = {
		material = "ui_playercard_283",
		isTemporary = true
	}
	arg_1_0._flags.JPN = {
		material = "ui_playercard_284",
		isTemporary = true
	}
	arg_1_0._flags.ITA = {
		material = "ui_playercard_285",
		isTemporary = true
	}
	arg_1_0._flags.IRL = {
		material = "ui_playercard_286",
		isTemporary = true
	}
	arg_1_0._flags.GBR = {
		material = "ui_playercard_287",
		isTemporary = true
	}
	arg_1_0._flags.DEU = {
		material = "ui_playercard_288",
		isTemporary = true
	}
	arg_1_0._flags.FRA = {
		material = "ui_playercard_289",
		isTemporary = true
	}
	arg_1_0._flags.COL = {
		material = "ui_playercard_291",
		isTemporary = true
	}
	arg_1_0._flags.CHN = {
		material = "ui_playercard_292",
		isTemporary = true
	}
	arg_1_0._flags.CAN = {
		material = "ui_playercard_293",
		isTemporary = true
	}
	arg_1_0._flags.BRA = {
		material = "ui_playercard_294",
		isTemporary = true
	}
	arg_1_0._flags.AUS = {
		material = "ui_playercard_295",
		isTemporary = true
	}
	arg_1_0._flags.ARG = {
		material = "ui_playercard_296",
		isTemporary = true
	}
	arg_1_0._flags.ALB = {
		material = "ui_playercard_926",
		isTemporary = true
	}
	arg_1_0._flags.ARM = {
		material = "ui_playercard_927",
		isTemporary = true
	}
	arg_1_0._flags.AUT = {
		material = "ui_playercard_928",
		isTemporary = true
	}
	arg_1_0._flags.BEL = {
		material = "ui_playercard_929",
		isTemporary = true
	}
	arg_1_0._flags.CHL = {
		material = "ui_playercard_930",
		isTemporary = true
	}
	arg_1_0._flags.CZE = {
		material = "ui_playercard_931",
		isTemporary = true
	}
	arg_1_0._flags.DNK = {
		material = "ui_playercard_932",
		isTemporary = true
	}
	arg_1_0._flags.FIN = {
		material = "ui_playercard_933",
		isTemporary = true
	}
	arg_1_0._flags.IND = {
		material = "ui_playercard_934",
		isTemporary = true
	}
	arg_1_0._flags.LVA = {
		material = "ui_playercard_935",
		isTemporary = true
	}
	arg_1_0._flags.NZL = {
		material = "ui_playercard_936",
		isTemporary = true
	}
	arg_1_0._flags.NOR = {
		material = "ui_playercard_937",
		isTemporary = true
	}
	arg_1_0._flags.PAK = {
		material = "ui_playercard_938",
		isTemporary = true
	}
	arg_1_0._flags.PER = {
		material = "ui_playercard_939",
		isTemporary = true
	}
	arg_1_0._flags.POL = {
		material = "ui_playercard_940",
		isTemporary = true
	}
	arg_1_0._flags.KOR = {
		material = "ui_playercard_942",
		isTemporary = true
	}
	arg_1_0._flags.VEN = {
		material = "ui_playercard_943",
		isTemporary = true
	}
	arg_1_0._flags.VNM = {
		material = "ui_playercard_944",
		isTemporary = true
	}
	arg_1_0._flags.MKD = {
		material = "ui_playercard_986",
		isTemporary = true
	}
end

local function var_0_5(arg_2_0, arg_2_1)
	local var_2_0
	local var_2_1 = arg_2_0._flags[arg_2_1]

	if var_2_1 and (not var_2_1.isTemporary or Engine.BHICADFIHA()) then
		var_2_0 = RegisterMaterial(var_2_1.material)
	end

	return var_2_0 or arg_2_0._defaultFlag
end

local function var_0_6(arg_3_0, arg_3_1)
	return arg_3_0._flags[arg_3_1] and arg_3_0._flags[arg_3_1].isTemporary
end

local function var_0_7(arg_4_0)
	if arg_4_0 > 3 then
		return Engine.CBBHFCGDIC("LUA_MENU/" .. arg_4_0 .. "TH")
	else
		return Engine.CBBHFCGDIC(var_0_3[arg_4_0])
	end
end

local function var_0_8(arg_5_0)
	return arg_5_0 <= var_0_2 and var_0_0 or var_0_1
end

local function var_0_9(arg_6_0, arg_6_1, arg_6_2)
	var_0_4(arg_6_0)

	local function var_6_0(arg_7_0)
		local var_7_0 = Dvar.DHEEJCCJBH("lui_trial_event_leaders_" .. arg_6_2.trialIndex)

		if var_7_0 and #var_7_0 <= 1 then
			var_7_0 = nil
		end

		if var_7_0 then
			return split(var_7_0, "_")
		end

		return nil
	end

	arg_6_0.Title:setText(Engine.CBBHFCGDIC("TRIALEVENT/LEADERBOARD_TITLE", ToUpperCase(Engine.CBBHFCGDIC(arg_6_2.trialTitle))))

	local var_6_1 = var_6_0(arg_6_2.trialIndex)

	if var_6_1 == nil then
		ACTIONS.AnimateSequence(arg_6_0, "NoData")
	end

	arg_6_0.Grid:SetRefreshChild(function(arg_8_0, arg_8_1, arg_8_2)
		arg_8_2 = arg_8_2 + 1

		local var_8_0 = false

		if var_6_1 then
			local var_8_1 = var_6_1[arg_8_2]

			if var_8_1 then
				local var_8_2 = split(var_8_1, ",")

				var_8_0 = #var_8_2 == 4

				if var_8_0 then
					var_8_2.material = var_0_5(arg_6_0, var_8_2[TRIALS.EventDvarColumns.COUNTRY_CODE])

					arg_8_0:FillData(var_8_2)

					if Engine.BHICADFIHA() and var_0_6(arg_6_0, var_8_2[TRIALS.EventDvarColumns.COUNTRY_CODE]) then
						arg_8_0:SetAsDebugFlag()
					end
				end
			end
		end

		if arg_8_2 > var_0_2 then
			arg_8_0:SetAsSmall()
		elseif not var_8_0 then
			arg_8_0:SetAsBigWithoutData()
		end

		arg_8_0:SetHeight(var_0_8(arg_8_2))
		arg_8_0:SetPositionField(var_0_7(arg_8_2))
	end)
	arg_6_0.Grid:SetMeasureRowFunction(function(arg_9_0)
		return var_0_8(arg_9_0 + 1)
	end)
	arg_6_0.Grid:SetNumChildren(15)
	arg_6_0.Grid:RefreshContent()
	arg_6_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		if not arg_6_0._preventLeavingMenu then
			LUI.FlowManager.RequestLeaveMenu(arg_6_0, true, true)
		end
	end)
	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)
	ACTIONS.ScaleFullscreen(arg_6_0.Background)
	ACTIONS.ScaleFullscreen(arg_6_0.Blur)
	arg_6_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
end

function TrialEventLeaderboard(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "TrialEventLeaderboard"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIBlur.new()

	var_11_4.id = "Blur"

	var_11_4:SetBlurStrength(0.75, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.Blur = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Background"

	var_11_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_6:SetAlpha(0.9, 0)
	var_11_0:addElement(var_11_6)

	var_11_0.Background = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIText.new()

	var_11_8.id = "Title"

	var_11_8:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_11_8:setText(Engine.CBBHFCGDIC("TRIALEVENT/LEADERBOARD_TITLE"), 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_8:SetAlignment(LUI.Alignment.Center)
	var_11_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 77, _1080p * 127)
	var_11_0:addElement(var_11_8)

	var_11_0.Title = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIText.new()

	var_11_10.id = "Description"

	var_11_10:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_11_10:setText(Engine.CBBHFCGDIC("TRIALEVENT/LEADERBOARD_DESCRIPTION"), 0)
	var_11_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_10:SetAlignment(LUI.Alignment.Center)
	var_11_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 127, _1080p * 155)
	var_11_0:addElement(var_11_10)

	var_11_0.Description = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "ButtonHelperBar"

	var_11_12.Background:SetAlpha(0.2, 0)
	var_11_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, _1080p * 2)
	var_11_0:addElement(var_11_12)

	var_11_0.ButtonHelperBar = var_11_12

	local var_11_13
	local var_11_14 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 15,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("TrialEventLeaderboardLine", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 1,
		spacingY = _1080p * 1,
		columnWidth = _1080p * 1024,
		rowHeight = _1080p * 60,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_15 = LUI.UIGrid.new(var_11_14)

	var_11_15.id = "Grid"

	var_11_15:setUseStencil(true)
	var_11_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * 216, _1080p * 962)
	var_11_0:addElement(var_11_15)

	var_11_0.Grid = var_11_15

	local var_11_16
	local var_11_17 = LUI.UIImage.new()

	var_11_17.id = "NoDataBG"

	var_11_17:SetRGBFromInt(0, 0)
	var_11_17:SetAlpha(0, 0)
	var_11_17:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -90, _1080p * 90)
	var_11_0:addElement(var_11_17)

	var_11_0.NoDataBG = var_11_17

	local var_11_18
	local var_11_19 = LUI.UIText.new()

	var_11_19.id = "NoDataLabel"

	var_11_19:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_11_19:SetAlpha(0, 0)
	var_11_19:setText(Engine.CBBHFCGDIC("TRIALEVENT/LEADERBOARD_NO_DATA"), 0)
	var_11_19:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_19:SetAlignment(LUI.Alignment.Center)
	var_11_19:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -35, _1080p * 35)
	var_11_0:addElement(var_11_19)

	var_11_0.NoDataLabel = var_11_19

	local var_11_20
	local var_11_21 = LUI.UIText.new()

	var_11_21.id = "RankColumn"

	var_11_21:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_11_21:setText("", 0)
	var_11_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_21:SetAlignment(LUI.Alignment.Left)
	var_11_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 448, _1080p * 721, _1080p * 170, _1080p * 200)
	var_11_0:addElement(var_11_21)

	var_11_0.RankColumn = var_11_21

	local var_11_22
	local var_11_23 = LUI.UIText.new()

	var_11_23.id = "RegionColumn"

	var_11_23:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_11_23:setText(Engine.CBBHFCGDIC("TRIALEVENT/LEADERBOARD_COL_REGION"), 0)
	var_11_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_23:SetAlignment(LUI.Alignment.Left)
	var_11_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 656, _1080p * 902, _1080p * 170, _1080p * 200)
	var_11_0:addElement(var_11_23)

	var_11_0.RegionColumn = var_11_23

	local var_11_24
	local var_11_25 = LUI.UIText.new()

	var_11_25.id = "TotalColumn"

	var_11_25:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_11_25:setText(Engine.CBBHFCGDIC("TRIALEVENT/LEADERBOARD_COL_TOTAL"), 0)
	var_11_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_25:SetAlignment(LUI.Alignment.Left)
	var_11_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1588, _1080p * 170, _1080p * 200)
	var_11_0:addElement(var_11_25)

	var_11_0.TotalColumn = var_11_25

	local function var_11_26()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_26

	local var_11_27
	local var_11_28 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_17:RegisterAnimationSequence("NoData", var_11_28)

	local var_11_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_19:RegisterAnimationSequence("NoData", var_11_29)

	local function var_11_30()
		var_11_17:AnimateSequence("NoData")
		var_11_19:AnimateSequence("NoData")
	end

	var_11_0._sequences.NoData = var_11_30

	function var_11_0.addButtonHelperFunction(arg_16_0, arg_16_1)
		arg_16_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_11_0:addEventHandler("menu_create", var_11_0.addButtonHelperFunction)

	local var_11_31 = LUI.UIBindButton.new()

	var_11_31.id = "selfBindButton"

	var_11_0:addElement(var_11_31)

	var_11_0.bindButton = var_11_31

	var_0_9(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("TrialEventLeaderboard", TrialEventLeaderboard)
LockTable(_M)
