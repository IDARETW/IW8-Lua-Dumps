module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = {}

	if not Engine.DDJFBBJAIG() and CONDITIONS.InKillCam(arg_1_0) then
		local var_1_1 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id"):GetValue(arg_1_0)

		var_1_0._rank = Game.BAJEAFFCGG(var_1_1)
		var_1_0._rankPct = 0
		var_1_0._rankIcon = Game.HGEFIIJID(var_1_1)
	else
		local var_1_2 = PROGRESSION.GetPlayerProgressionData({
			_controllerIndex = arg_1_0
		})

		var_1_0._rank = var_1_2._rank + 1
		var_1_0._rankPct = var_1_2._rankPercentage
		var_1_0._rankIcon = var_1_2._rankIcon
	end

	return var_1_0
end

local function var_0_1(arg_2_0)
	local var_2_0 = RegisterMaterial(arg_2_0._rankIcon)

	arg_2_0.RankIcon:setImage(var_2_0)

	local var_2_1 = LUI.clamp(tonumber(arg_2_0._rankPct), 0, 1)

	arg_2_0.RankProgress:SetImmediateProgress(var_2_1)

	if arg_2_0._rankStringLen == 1 then
		ACTIONS.AnimateSequence(arg_2_0, "OneDigit")
	elseif arg_2_0._rankStringLen == 2 then
		ACTIONS.AnimateSequence(arg_2_0, "TwoDigits")
	elseif arg_2_0._rankStringLen == 3 then
		ACTIONS.AnimateSequence(arg_2_0, "ThreeDigits")
	else
		ACTIONS.AnimateSequence(arg_2_0, "FourDigits")
	end

	arg_2_0.GridLayoutRankDigits:RefreshContent()
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = var_0_0(arg_3_1)

	if arg_3_0._rank ~= var_3_0._rank or arg_3_0._rankPct ~= var_3_0._rankPct then
		arg_3_0._rank = var_3_0._rank
		arg_3_0._rankPct = var_3_0._rankPct
		arg_3_0._rankIcon = var_3_0._rankIcon
		arg_3_0._rankString = tostring(arg_3_0._rank)
		arg_3_0._rankStringLen = string.len(arg_3_0._rankString)

		var_0_1(arg_3_0)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.RankProgress)
	assert(arg_4_0.RankIcon)

	local var_4_0 = {
		digit = SWATCHES.splashNotifications.Green,
		base = SWATCHES.Reticles.BrightGreen
	}

	arg_4_0.GridLayoutRankDigits:SetNumChildren(4)
	arg_4_0.GridLayoutRankDigits:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 ~= nil then
			arg_5_0.Setup(arg_5_0, "glow")

			local var_5_0

			if arg_5_1 < arg_4_0._rankStringLen then
				var_5_0 = tonumber(string.sub(arg_4_0._rankString, arg_5_1 + 1, arg_5_1 + 1))
			end

			arg_5_0.SetGlowDigit(arg_5_0, var_5_0, nil, var_4_0)
		end
	end)
	var_0_2(arg_4_0, arg_4_1)

	local var_4_1 = 15000

	arg_4_0._updateTimer = LUI.UITimer.new({
		event = "watch_rank_check",
		interval = var_4_1
	})

	arg_4_0:addElement(arg_4_0._updateTimer)
	arg_4_0:registerEventHandler("watch_rank_check", function(arg_6_0)
		var_0_2(arg_6_0, arg_4_1)
	end)
	arg_4_0:addEventHandler("player_ranked_up", function(arg_7_0)
		var_0_2(arg_7_0, arg_4_1)
		Engine.BJDBIAGIDA("watch_rank_up")
	end)
end

function WatchRankHolo(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_8_0.id = "WatchRankHolo"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "RankProgress"

	var_8_4:SetRGBFromTable(SWATCHES.Tracer.green, 0)
	var_8_4.DialogueBackground:SetAlpha(1, 0)
	var_8_4.Fill:SetRGBFromTable(SWATCHES.Tracer.green, 0)
	var_8_4.Frame:SetRGBFromTable(SWATCHES.Tracer.green, 0)
	var_8_4.Cap:SetRGBFromTable(SWATCHES.Tracer.green, 0)
	var_8_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 334, _1080p * 308)
	var_8_0:addElement(var_8_4)

	var_8_0.RankProgress = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "RankIcon"

	var_8_6:SetRGBFromInt(65280, 0)
	var_8_6:SetAlpha(0.5, 0)
	var_8_6:setImage(RegisterMaterial("icon_t9_rank_35"), 0)
	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -76, _1080p * 52)
	var_8_0:addElement(var_8_6)

	var_8_0.RankIcon = var_8_6

	local var_8_7
	local var_8_8 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WatchDigit", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 128,
		rowHeight = _1080p * 128,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_9 = LUI.UIGrid.new(var_8_8)

	var_8_9.id = "GridLayoutRankDigits"

	var_8_9:SetScale(-0.75, 0)
	var_8_9:setUseStencil(true)
	var_8_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -4, _1080p * 516, _1080p * 291, _1080p * 419)
	var_8_0:addElement(var_8_9)

	var_8_0.GridLayoutRankDigits = var_8_9

	local function var_8_10()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_10

	local var_8_11
	local var_8_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 564
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 291
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 419
		}
	}

	var_8_9:RegisterAnimationSequence("OneDigit", var_8_12)

	local function var_8_13()
		var_8_9:AnimateSequence("OneDigit")
	end

	var_8_0._sequences.OneDigit = var_8_13

	local var_8_14
	local var_8_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 545
		}
	}

	var_8_9:RegisterAnimationSequence("TwoDigits", var_8_15)

	local function var_8_16()
		var_8_9:AnimateSequence("TwoDigits")
	end

	var_8_0._sequences.TwoDigits = var_8_16

	local var_8_17
	local var_8_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 291
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 531
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 419
		}
	}

	var_8_9:RegisterAnimationSequence("ThreeDigits", var_8_18)

	local function var_8_19()
		var_8_9:AnimateSequence("ThreeDigits")
	end

	var_8_0._sequences.ThreeDigits = var_8_19

	local var_8_20
	local var_8_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("FourDigits", var_8_21)

	local var_8_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 516
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 418
		}
	}

	var_8_9:RegisterAnimationSequence("FourDigits", var_8_22)

	local function var_8_23()
		var_8_6:AnimateSequence("FourDigits")
		var_8_9:AnimateSequence("FourDigits")
	end

	var_8_0._sequences.FourDigits = var_8_23

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WatchRankHolo", WatchRankHolo)
LockTable(_M)
