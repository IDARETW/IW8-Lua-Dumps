module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CODTvMenu", {
	"codtv"
})
FrontEndScene.RegisterScene("CODTvMenu", "mlg.tv")

local var_0_0 = "frontEnd.streams"
local var_0_1 = "mlgcontent.streams"
local var_0_2

local function var_0_3()
	local var_1_0 = LiveStreaming.CCHAGAICI()

	MLGContent.DIEIHCBFF(false)
	MLGContent.CBDJCFEFEF()

	return var_1_0
end

local function var_0_4(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UITimer.new({
		interval = 3000,
		stopped = false,
		broadcastToRoot = false,
		event = "hideButtonHelperAction",
		disposable = false,
		controllerIndex = arg_2_1
	})

	arg_2_0:addElement(var_2_0)

	arg_2_0.timer = var_2_0
end

local function var_0_5(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UITimer.new({
		interval = 200,
		stopped = false,
		broadcastToRoot = false,
		event = "leaveCODTVMenuAction",
		disposable = false,
		controllerIndex = arg_3_1
	})

	arg_3_0:addElement(var_3_0)

	arg_3_0.leaveMenuTimer = var_3_0
end

local function var_0_6(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UITimer.new({
		interval = 3000,
		stopped = false,
		broadcastToRoot = false,
		event = "hideVideosInfos",
		disposable = false,
		controllerIndex = arg_4_1
	})

	arg_4_0:addElement(var_4_0)

	arg_4_0.videosInfosDisplayTimer = var_4_0
end

local function var_0_7(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_2 == CODTV.VIDEO_STATUS.LOADING then
		ACTIONS.AnimateSequence(arg_5_0, "ShowSpinner")
		arg_5_0.CODTvStatusWidget:SetAlpha(0)
		arg_5_0.WatermarkHeader:SetAlpha(0)
	elseif arg_5_2 == CODTV.VIDEO_STATUS.PLAYING then
		ACTIONS.AnimateSequence(arg_5_0, "HideSpinner")

		if arg_5_0._isFullScreen then
			if arg_5_0._isButtonListVisible then
				ACTIONS.AnimateSequence(arg_5_0, "HideButtonList")
				ACTIONS.LoseFocus(arg_5_0, "ButtonList", arg_5_1)
				var_0_4(arg_5_0, arg_5_1)

				arg_5_0._isButtonListVisible = false
			end

			ACTIONS.AnimateSequence(arg_5_0, "ShowFullScreenVideosInfos")
			var_0_6(arg_5_0, arg_5_1)
		end
	elseif arg_5_2 == CODTV.VIDEO_STATUS.ERROR then
		arg_5_0.WatermarkHeader:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_5_0, "HideSpinner")
		ACTIONS.AnimateSequence(arg_5_0, "ShowStatus")
	elseif arg_5_2 == CODTV.VIDEO_STATUS.FINISHED and arg_5_0._currentStatus == CODTV.VIDEO_STATUS.PLAYING then
		arg_5_0.CODTvStatusWidget:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_5_0, "ShowWatermark")
	end

	arg_5_0._currentStatus = arg_5_2
end

local function var_0_8(arg_6_0)
	if arg_6_0.timer ~= nil then
		arg_6_0.timer:closeTree()

		arg_6_0.timer = nil
	end
end

local function var_0_9(arg_7_0, arg_7_1)
	if arg_7_0._buttonHelperVisible then
		ACTIONS.AnimateSequence(arg_7_0, "HideButtonHelper")
		var_0_8(arg_7_0)

		arg_7_0._buttonHelperVisible = false
	end
end

local function var_0_10(arg_8_0)
	if not arg_8_0._buttonHelperVisible then
		ACTIONS.AnimateSequence(arg_8_0, "ShowButtonHelper")

		arg_8_0._buttonHelperVisible = true
	end
end

local function var_0_11(arg_9_0, arg_9_1)
	ACTIONS.AnimateSequence(arg_9_0, "Fullscreen")
	ACTIONS.AnimateSequence(arg_9_0, "HideButtonList")

	arg_9_0._isFullScreen = true

	ACTIONS.LoseFocus(arg_9_0, "ButtonList", arg_9_1)
	arg_9_0:AddButtonHelperTextToElement(arg_9_0.ButtonHelperBar, {
		clickable = true,
		side = "left",
		priority = 1000,
		button_ref = "button_left_trigger",
		helper_text = Engine.CBBHFCGDIC("CODTV/SHOW_MENU")
	})
	var_0_4(arg_9_0, arg_9_1)
end

local function var_0_12(arg_10_0, arg_10_1)
	ACTIONS.AnimateSequence(arg_10_0, "NonFullScreen")

	if arg_10_0.timer == nil then
		var_0_10(arg_10_0)
	end

	var_0_8(arg_10_0)

	arg_10_0._isFullScreen = false
	arg_10_0._isButtonListVisible = true

	arg_10_0:RemoveButtonHelperTextFromElement(arg_10_0.ButtonHelperBar, "button_left_trigger", "left")

	if arg_10_0.videosInfosDisplayTimer ~= nil then
		arg_10_0.videosInfosDisplayTimer:closeTree()

		arg_10_0.videosInfosDisplayTimer = nil
	end
end

local function var_0_13(arg_11_0, arg_11_1)
	if arg_11_0._isFullScreen then
		if arg_11_0._isButtonListVisible then
			arg_11_0._isButtonListVisible = false

			var_0_4(arg_11_0, arg_11_1)
		else
			arg_11_0._isButtonListVisible = true

			if arg_11_0.timer == nil then
				var_0_10(arg_11_0)
			end

			var_0_8(arg_11_0)
		end
	end
end

local function var_0_14(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UITimer.new({
		interval = 2000,
		stopped = false,
		broadcastToRoot = false,
		event = "enterMenuTimerDone",
		disposable = false,
		controllerIndex = arg_12_1
	})

	arg_12_0:addElement(var_12_0)

	arg_12_0.enterMenuTimer = var_12_0
	arg_12_0.disableAllInputForMenu = true
end

local function var_0_15()
	if var_0_2 ~= true then
		var_0_3()
	end

	WipeGlobalModelsAtPath(var_0_0)
end

local function var_0_16(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = tonumber(Engine.DCJHCAFIIA())

	PlayerData.BFFBGAJGD(arg_14_1, CoD.StatsGroup.Ranked).lastViewedCODTV:set(var_14_0)
	var_0_14(arg_14_0, arg_14_1)

	var_0_2 = false

	ACTIONS.AnimateSequence(arg_14_0, "DefaultSequence")

	arg_14_0._buttonHelperVisible = true

	MLGContent.DIEIHCBFF(true)
	MLGContent.BHGIADIBGD()
	Engine.EBCGADABJ()
	Streaming.BDDBGGIC(false)
	Engine.BEFHEEBHIA()
	arg_14_0:addEventHandler("menu_close", function(arg_15_0, arg_15_1)
		ACTIONS.UploadStats(arg_15_0, arg_14_1)
	end)

	local var_14_1 = LUI.DataSourceInGlobalModel.new("mlgcontent.connected")

	local function var_14_2()
		if var_14_1:GetValue(arg_14_1) then
			MLGContent.DIEIHCBFF(true)
			MLGContent.BHGIADIBGD()
		else
			MLGContent.DIEIHCBFF(false)
			MLGContent.CBDJCFEFEF()
		end
	end

	arg_14_0:SubscribeToModel(var_14_1:GetModel(arg_14_1), var_14_2)

	local var_14_3 = {
		{
			name = "CODTV/LIVE",
			modelRootPath = var_0_1,
			modelType = CODTV.VIDEO_TYPE.STREAM
		},
		{
			name = "CODTV/VOD",
			modelRootPath = VODModelPath,
			modelType = CODTV.VIDEO_TYPE.VOD
		}
	}
	local var_14_4 = {}
	local var_14_5 = 2

	for iter_14_0 = 1, 2 do
		local var_14_6 = var_14_3[iter_14_0].name

		var_14_4[#var_14_4 + 1] = {
			name = Engine.CBBHFCGDIC(var_14_6),
			modelType = var_14_3[iter_14_0].modelType,
			modelRootPath = var_14_3[iter_14_0].modelRootPath
		}
	end

	local var_14_7 = LUI.DataSourceInGlobalModel.new("mlgcontent.video.status")

	local function var_14_8()
		local var_17_0 = var_14_7:GetValue(arg_14_1)

		if var_17_0 ~= nil then
			var_0_7(arg_14_0, arg_14_1, var_17_0)
		end
	end

	arg_14_0:SubscribeToModel(var_14_7:GetModel(arg_14_1), var_14_8)

	local var_14_9 = MLGContent.BGCACJDGCA()

	arg_14_0.playingVideoType = var_14_9

	MLGContent.BIFBFHCJJ(var_14_9, 0)
	arg_14_0.bindButton:addEventHandler("button_alt1", function(arg_18_0, arg_18_1)
		if arg_14_0._isFullScreen then
			var_0_12(arg_14_0, arg_14_1)
		else
			var_0_11(arg_14_0, arg_14_1)
		end
	end)
	arg_14_0.bindButton:addEventHandler("button_left_trigger", function(arg_19_0, arg_19_1)
		var_0_13(arg_14_0, arg_14_1)
	end)
	arg_14_0.bindButton:addEventHandler("button_secondary", function(arg_20_0, arg_20_1)
		if arg_14_0._isFullScreen then
			var_0_12(arg_14_0, arg_14_1)
		else
			var_0_2 = var_0_3()

			var_0_5(arg_14_0, arg_14_1)
		end
	end)
	arg_14_0:addEventHandler("gamepad_button", function(arg_21_0, arg_21_1)
		if arg_14_0.leaveMenuTimer ~= nil or arg_14_0.disableAllInputForMenu then
			return true
		elseif not arg_14_0._buttonHelperVisible then
			var_0_10(arg_14_0)
			var_0_4(arg_14_0, arg_14_1)

			return true
		elseif arg_14_0._isButtonListVisible then
			return false
		elseif arg_14_0._isFullScreen then
			return arg_21_1.button ~= "alt1" and arg_21_1.button ~= "left_trigger" and arg_21_1.button ~= "secondary" and arg_21_1.button ~= "alt2" and arg_21_1.button ~= "button_right" and arg_21_1.button ~= "button_left"
		end
	end)

	arg_14_0._isFullScreen = false
	arg_14_0._isButtonListVisible = true

	arg_14_0:registerEventHandler("hideButtonHelperAction", var_0_9)

	local var_14_10 = 0

	arg_14_0:registerEventHandler("leaveCODTVMenuAction", function()
		if arg_14_0.leaveMenuTimer ~= nil then
			arg_14_0.leaveMenuTimer:closeTree()

			arg_14_0.leaveMenuTimer = nil
		end

		if var_0_2 then
			ACTIONS.LeaveMenu(arg_14_0)

			return
		end

		var_0_2 = var_0_3()
		var_14_10 = var_14_10 + 1

		if var_14_10 < 10 then
			var_0_5(arg_14_0, arg_14_1)
		else
			ACTIONS.LeaveMenu(arg_14_0)
		end
	end)
	arg_14_0:registerEventHandler("enterMenuTimerDone", function()
		arg_14_0.disableAllInputForMenu = false

		if arg_14_0.enterMenuTimer ~= nil then
			arg_14_0.enterMenuTimer:closeTree()

			arg_14_0.enterMenuTimer = nil
		end
	end)
end

function CODTvMenu(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIElement.new()

	var_24_0.id = "CODTvMenu"
	var_24_0._animationSets = var_24_0._animationSets or {}
	var_24_0._sequences = var_24_0._sequences or {}

	local var_24_1 = arg_24_1 and arg_24_1.controllerIndex

	if not var_24_1 and not Engine.DDJFBBJAIG() then
		var_24_1 = var_24_0:getRootController()
	end

	assert(var_24_1)

	local var_24_2 = var_24_0
	local var_24_3
	local var_24_4 = LUI.UIImage.new()

	var_24_4.id = "Background"

	var_24_4:SetRGBFromInt(10987431, 0)
	var_24_4:setImage(RegisterMaterial("image_motd_main"), 0)
	var_24_0:addElement(var_24_4)

	var_24_0.Background = var_24_4

	local var_24_5
	local var_24_6 = LUI.UIImage.new()

	var_24_6.id = "Darkener"

	var_24_6:SetRGBFromInt(0, 0)
	var_24_6:SetAlpha(0.5, 0)
	var_24_0:addElement(var_24_6)

	var_24_0.Darkener = var_24_6

	local var_24_7
	local var_24_8 = LUI.UIImage.new()

	var_24_8.id = "StreamBG"

	var_24_8:SetRGBFromInt(4605510, 0)
	var_24_8:SetAlpha(0.8, 0)
	var_24_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 416, _1080p * 1504, _1080p * 206, _1080p * 817)
	var_24_0:addElement(var_24_8)

	var_24_0.StreamBG = var_24_8

	local var_24_9
	local var_24_10 = LUI.UIImage.new()

	var_24_10.id = "StreamImageBG"

	var_24_10:SetRGBFromInt(0, 0)
	var_24_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 36, _1080p * 1884, _1080p * 18, _1080p * 1058)
	var_24_0:addElement(var_24_10)

	var_24_0.StreamImageBG = var_24_10

	local var_24_11
	local var_24_12 = {
		mp4 = true,
		controllerIndex = var_24_1
	}
	local var_24_13 = MenuBuilder.BuildRegisteredType("Cinematic", var_24_12)

	var_24_13.id = "StreamImage"

	var_24_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 36, _1080p * 1884, _1080p * 18, _1080p * 1058)
	var_24_0:addElement(var_24_13)

	var_24_0.StreamImage = var_24_13

	local var_24_14
	local var_24_15 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_24_1
	})

	var_24_15.id = "ButtonHelperBar"

	var_24_15:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_24_0:addElement(var_24_15)

	var_24_0.ButtonHelperBar = var_24_15

	local var_24_16
	local var_24_17 = MenuBuilder.BuildRegisteredType("CODTvStatusWidget", {
		controllerIndex = var_24_1
	})

	var_24_17.id = "CODTvStatusWidget"

	var_24_17:SetAlpha(0, 0)
	var_24_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 636, _1080p * 1336, _1080p * 446, _1080p * 634)
	var_24_0:addElement(var_24_17)

	var_24_0.CODTvStatusWidget = var_24_17

	local var_24_18
	local var_24_19 = MenuBuilder.BuildRegisteredType("Spinner", {
		controllerIndex = var_24_1
	})

	var_24_19.id = "Spinner"

	var_24_19:SetAlpha(0, 0)
	var_24_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 896, _1080p * 1024, _1080p * 485, _1080p * 613)
	var_24_0:addElement(var_24_19)

	var_24_0.Spinner = var_24_19

	local var_24_20
	local var_24_21 = LUI.UIText.new()

	var_24_21.id = "WatermarkHeader"

	var_24_21:SetAlpha(0, 0)
	var_24_21:setText(Engine.CBBHFCGDIC("CODTV/MLGTV_LOGO"), 0)
	var_24_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_24_21:SetAlignment(LUI.Alignment.Center)
	var_24_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 736, _1080p * 1236, _1080p * 485, _1080p * 538)
	var_24_0:addElement(var_24_21)

	var_24_0.WatermarkHeader = var_24_21

	local function var_24_22()
		return
	end

	var_24_0._sequences.DefaultSequence = var_24_22

	local var_24_23
	local var_24_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1884
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1058
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_24_8:RegisterAnimationSequence("Fullscreen", var_24_24)

	local var_24_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -22
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_24_10:RegisterAnimationSequence("Fullscreen", var_24_25)

	local var_24_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -22
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_24_13:RegisterAnimationSequence("Fullscreen", var_24_26)

	local function var_24_27()
		var_24_8:AnimateSequence("Fullscreen")
		var_24_10:AnimateSequence("Fullscreen")
		var_24_13:AnimateSequence("Fullscreen")
	end

	var_24_0._sequences.Fullscreen = var_24_27

	local var_24_28
	local var_24_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1884
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 1058
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0.8,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_8:RegisterAnimationSequence("NonFullScreen", var_24_29)

	local var_24_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -36
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -22
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_24_10:RegisterAnimationSequence("NonFullScreen", var_24_30)

	local var_24_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 36
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -36
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -22
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_24_13:RegisterAnimationSequence("NonFullScreen", var_24_31)

	local function var_24_32()
		var_24_8:AnimateSequence("NonFullScreen")
		var_24_10:AnimateSequence("NonFullScreen")
		var_24_13:AnimateSequence("NonFullScreen")
	end

	var_24_0._sequences.NonFullScreen = var_24_32

	local function var_24_33()
		return
	end

	var_24_0._sequences.HideButtonList = var_24_33

	local var_24_34
	local var_24_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_19:RegisterAnimationSequence("ShowSpinner", var_24_35)

	local function var_24_36()
		var_24_19:AnimateSequence("ShowSpinner")
	end

	var_24_0._sequences.ShowSpinner = var_24_36

	local var_24_37
	local var_24_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_19:RegisterAnimationSequence("HideSpinner", var_24_38)

	local function var_24_39()
		var_24_19:AnimateSequence("HideSpinner")
	end

	var_24_0._sequences.HideSpinner = var_24_39

	local var_24_40
	local var_24_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -85
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_24_15:RegisterAnimationSequence("HideButtonHelper", var_24_41)

	local function var_24_42()
		var_24_15:AnimateSequence("HideButtonHelper")
	end

	var_24_0._sequences.HideButtonHelper = var_24_42

	local var_24_43
	local var_24_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 250,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -85
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 250,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_24_15:RegisterAnimationSequence("ShowButtonHelper", var_24_44)

	local function var_24_45()
		var_24_15:AnimateSequence("ShowButtonHelper")
	end

	var_24_0._sequences.ShowButtonHelper = var_24_45

	local function var_24_46()
		return
	end

	var_24_0._sequences.NoStreamsAvailable = var_24_46

	local var_24_47
	local var_24_48 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_17:RegisterAnimationSequence("ShowStatus", var_24_48)

	local var_24_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_21:RegisterAnimationSequence("ShowStatus", var_24_49)

	local function var_24_50()
		var_24_17:AnimateSequence("ShowStatus")
		var_24_21:AnimateSequence("ShowStatus")
	end

	var_24_0._sequences.ShowStatus = var_24_50

	local var_24_51
	local var_24_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_17:RegisterAnimationSequence("ShowWatermark", var_24_52)

	local var_24_53 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_21:RegisterAnimationSequence("ShowWatermark", var_24_53)

	local function var_24_54()
		var_24_17:AnimateSequence("ShowWatermark")
		var_24_21:AnimateSequence("ShowWatermark")
	end

	var_24_0._sequences.ShowWatermark = var_24_54

	local function var_24_55()
		return
	end

	var_24_0._sequences.HideFullScreenVideoInfos = var_24_55

	function var_24_0.addButtonHelperFunction(arg_37_0, arg_37_1)
		arg_37_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_37_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
		arg_37_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_alt1",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("CODTV/FULLSCREEN_TOGGLE")
		})
	end

	var_24_0:addEventHandler("menu_create", var_24_0.addButtonHelperFunction)

	local var_24_56 = LUI.UIBindButton.new()

	var_24_56.id = "selfBindButton"

	var_24_0:addElement(var_24_56)

	var_24_0.bindButton = var_24_56

	var_0_16(var_24_0, var_24_1, arg_24_1)

	return var_24_0
end

MenuBuilder.registerType("CODTvMenu", CODTvMenu)
LUI.FlowManager.RegisterStackPopBehaviour("CODTvMenu", var_0_15)
LockTable(_M)
