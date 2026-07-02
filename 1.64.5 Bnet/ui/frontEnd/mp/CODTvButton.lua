module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.vid_type = MLGContent.BGCACJDGCA()

	return arg_1_0.vid_type
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.channelIndex = -1
	arg_2_0.vid_type = -1
	arg_2_0.tabChanged = false

	local function var_2_0()
		local var_3_0 = arg_2_0.channelIndex

		arg_2_0.channelIndex = arg_2_0:GetDataSource().index:GetValue(arg_2_1)

		MLGContent.CJBCHGJBAG(var_3_0, arg_2_0.channelIndex)

		local var_3_1 = arg_2_0:GetDataSource().name:GetValue(arg_2_1)

		if var_3_1 ~= nil then
			arg_2_0.Name:setText(tostring(var_3_1))
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "name", var_2_0)

	local function var_2_1()
		local var_4_0 = arg_2_0:GetDataSource().subtitle:GetValue(arg_2_1)

		if var_4_0 ~= nil then
			arg_2_0.Subtitle:setText(tostring(var_4_0))
		end
	end

	arg_2_0.Subtitle:SubscribeToModelThroughElement(arg_2_0, "subtitle", var_2_1)

	arg_2_0.channel_ID = -1

	local function var_2_2()
		local var_5_0 = arg_2_0:GetDataSource().channel_id:GetValue(arg_2_1)

		if var_5_0 ~= nil then
			arg_2_0.channel_ID = var_5_0
		else
			arg_2_0.channel_ID = -1
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "channel_id", var_2_2)
	arg_2_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		if arg_2_0.channel_ID ~= -1 then
			MLGContent.BIFBFHCJJ(arg_2_0.vid_type, arg_2_0.channel_ID)
			arg_2_0:dispatchEventToRoot({
				name = "codtv_video_selected",
				immediate = true,
				controller = arg_2_1,
				video_type = arg_2_0.vid_type,
				index = arg_2_0.channel_ID
			})
		end
	end)

	local function var_2_3()
		local var_7_0 = arg_2_0:GetDataSource().image:GetValue(arg_2_1)

		if var_7_0 ~= nil and var_7_0 ~= -1 then
			arg_2_0.Image:setImage(RegisterMaterial("mlg_channel_viewer" .. tostring(var_7_0)), 0)
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "image", var_2_3)

	local function var_2_4()
		local var_8_0 = var_0_0(arg_2_0, arg_2_1)
		local var_8_1 = arg_2_0:GetDataSource().viewers:GetValue(arg_2_1)

		if var_8_1 ~= nil then
			if arg_2_0.vid_type == CODTV.VIDEO_TYPE.STREAM then
				arg_2_0.ViewsLabel:setText("")
			elseif var_8_1 > 0 then
				arg_2_0.ViewsLabel:setText(Engine.CBBHFCGDIC("CODTV/VIEWS", var_8_1))
			else
				arg_2_0.ViewsLabel:setText(Engine.CBBHFCGDIC(""))
			end
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "viewers", var_2_4)

	local function var_2_5()
		local var_9_0 = arg_2_0:GetDataSource().last_updated:GetValue(arg_2_1)

		if var_9_0 ~= nil then
			arg_2_0.DateLabel:setText(var_9_0)
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "last_updated", var_2_5)

	local function var_2_6()
		local var_10_0 = arg_2_0:GetDataSource().length:GetValue(arg_2_1)
		local var_10_1 = var_0_0(arg_2_0, arg_2_1)

		if var_10_0 ~= nil and var_10_1 == CODTV.VIDEO_TYPE.VOD then
			arg_2_0.DurationBG:SetAlpha(0.6)
			arg_2_0.DurationLabel:SetAlpha(1)
			arg_2_0.DurationLabel:setText(var_10_0)
		else
			arg_2_0.DurationBG:SetAlpha(0)
			arg_2_0.DurationLabel:SetAlpha(0)
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "length", var_2_6)

	local function var_2_7()
		local var_11_0 = var_0_0(arg_2_0, arg_2_1)

		if arg_2_0.vid_type == CODTV.VIDEO_TYPE.STREAM then
			if arg_2_0:GetDataSource().status:GetValue(arg_2_1) == 1 then
				arg_2_0.LiveLabel:setText(Engine.CBBHFCGDIC("CODTV/LIVE"), 0)
				arg_2_0.LiveIcon:SetRGBFromInt(16318464, 0)
			else
				arg_2_0.LiveIcon:SetRGBFromInt(16776960, 0)
				arg_2_0.LiveLabel:setText(Engine.CBBHFCGDIC("CODTV/REBROADCAST"), 0)
			end
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "status", var_2_7)
	arg_2_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.controller or arg_2_1
		local var_12_1 = var_0_0(arg_2_0, var_12_0)

		if arg_2_0.vid_type == CODTV.VIDEO_TYPE.STREAM then
			ACTIONS.AnimateSequence(arg_2_0, "ButtonOverStream")
		else
			ACTIONS.AnimateSequence(arg_2_0, "ButtonOverVOD")
		end

		arg_2_0.tabChanged = false
	end)
	arg_2_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = arg_2_1
		end

		if arg_2_0.vid_type == CODTV.VIDEO_TYPE.STREAM then
			if arg_2_0.tabChanged then
				ACTIONS.AnimateSequence(arg_2_0, "ButtonResetStream")
			else
				ACTIONS.AnimateSequence(arg_2_0, "ButtonUpStream")
			end
		else
			if arg_2_0.tabChanged then
				ACTIONS.AnimateSequence(arg_2_0, "ButtonResetVOD")
			else
				ACTIONS.AnimateSequence(arg_2_0, "ButtonUpVOD")
			end

			arg_2_0.tabChanged = false
		end
	end)
	arg_2_0:addEventHandler("codtv_tab_changed", function(arg_14_0, arg_14_1)
		arg_2_0.channelIndex = -1
		arg_2_0.tabChanged = true
	end)
end

function CODTvButton(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIButton.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 145 * _1080p)

	var_15_0.id = "CODTvButton"
	var_15_0._animationSets = {}
	var_15_0._sequences = {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("GenericItemBackground", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "GenericItemBackground"

	var_15_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.GenericItemBackground = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "DropShadow"

	var_15_6:SetRGBFromInt(0, 0)
	var_15_6:SetAlpha(0.3, 0)
	var_15_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 4)
	var_15_0:addElement(var_15_6)

	var_15_0.DropShadow = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIImage.new()

	var_15_8.id = "Image"

	var_15_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 208, _1080p * 28, _1080p * 145)
	var_15_0:addElement(var_15_8)

	var_15_0.Image = var_15_8

	local var_15_9
	local var_15_10 = MenuBuilder.BuildRegisteredType("GenericButtonSelection", {
		controllerIndex = var_15_1
	})

	var_15_10.id = "GenericButtonSelection"

	var_15_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2)
	var_15_0:addElement(var_15_10)

	var_15_0.GenericButtonSelection = var_15_10

	local var_15_11
	local var_15_12 = MenuBuilder.BuildRegisteredType("GenericListButtonBackground", {
		controllerIndex = var_15_1
	})

	var_15_12.id = "TitleBackground"

	var_15_12.DropShadow:SetAlpha(0, 0)
	var_15_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_15_0:addElement(var_15_12)

	var_15_0.TitleBackground = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIStyledText.new()

	var_15_14.id = "Name"

	var_15_14:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_15_14:setText("Item Name", 0)
	var_15_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_14:SetAlignment(LUI.Alignment.Right)
	var_15_14:SetStartupDelay(2000)
	var_15_14:SetLineHoldTime(400)
	var_15_14:SetAnimMoveTime(300)
	var_15_14:SetEndDelay(1500)
	var_15_14:SetCrossfadeTime(750)
	var_15_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_14:SetMaxVisibleLines(1)
	var_15_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -287, _1080p * -13, _1080p * 2.5, _1080p * 21.5)
	var_15_0:addElement(var_15_14)

	var_15_0.Name = var_15_14

	local var_15_15
	local var_15_16 = LUI.UIImage.new()

	var_15_16.id = "SubtitleBG"

	var_15_16:SetAlpha(0, 0)
	var_15_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 43.5, _1080p * 64.5)
	var_15_0:addElement(var_15_16)

	var_15_0.SubtitleBG = var_15_16

	local var_15_17
	local var_15_18 = LUI.UIStyledText.new()

	var_15_18.id = "Subtitle"

	var_15_18:SetRGBFromInt(0, 0)
	var_15_18:SetAlpha(0, 0)
	var_15_18:setText("STREAMER NAME", 0)
	var_15_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_18:SetAlignment(LUI.Alignment.Left)
	var_15_18:SetStartupDelay(2000)
	var_15_18:SetLineHoldTime(400)
	var_15_18:SetAnimMoveTime(300)
	var_15_18:SetEndDelay(1500)
	var_15_18:SetCrossfadeTime(750)
	var_15_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_18:SetMaxVisibleLines(1)
	var_15_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 267.76, _1080p * 466.5, _1080p * 44, _1080p * 62)
	var_15_0:addElement(var_15_18)

	var_15_0.Subtitle = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIImage.new()

	var_15_20.id = "SubtitleInfoCap"

	var_15_20:SetRGBFromInt(14277081, 0)
	var_15_20:SetAlpha(0, 0)
	var_15_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 255, _1080p * 258, _1080p * 43.5, _1080p * 72.5)
	var_15_0:addElement(var_15_20)

	var_15_0.SubtitleInfoCap = var_15_20

	local var_15_21
	local var_15_22 = LUI.UIText.new()

	var_15_22.id = "ViewsLabel"

	var_15_22:SetAlpha(0, 0)
	var_15_22:setText(Engine.CBBHFCGDIC("CODTV/VIEWERS"), 0)
	var_15_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_22:SetAlignment(LUI.Alignment.Left)
	var_15_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 262.19, _1080p * 476.5, _1080p * 95, _1080p * 113)
	var_15_0:addElement(var_15_22)

	var_15_0.ViewsLabel = var_15_22

	local var_15_23
	local var_15_24 = LUI.UIImage.new()

	var_15_24.id = "LiveIcon"

	var_15_24:SetRGBFromInt(16318464, 0)
	var_15_24:SetAlpha(0, 0)
	var_15_24:setImage(RegisterMaterial("widg_circle_small"), 0)
	var_15_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 262.19, _1080p * 270.19, _1080p * 77.5, _1080p * 85.5)
	var_15_0:addElement(var_15_24)

	var_15_0.LiveIcon = var_15_24

	local var_15_25
	local var_15_26 = LUI.UIText.new()

	var_15_26.id = "LiveLabel"

	var_15_26:SetAlpha(0, 0)
	var_15_26:setText(Engine.CBBHFCGDIC("CODTV/LIVE"), 0)
	var_15_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_26:SetAlignment(LUI.Alignment.Left)
	var_15_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 275, _1080p * 476.5, _1080p * 72.5, _1080p * 90.5)
	var_15_0:addElement(var_15_26)

	var_15_0.LiveLabel = var_15_26

	local var_15_27
	local var_15_28 = LUI.UIText.new()

	var_15_28.id = "DateLabel"

	var_15_28:SetRGBFromInt(0, 0)
	var_15_28:SetAlpha(0, 0)
	var_15_28:setText("", 0)
	var_15_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_28:SetAlignment(LUI.Alignment.Left)
	var_15_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 267.76, _1080p * 466.5, _1080p * 44, _1080p * 62)
	var_15_0:addElement(var_15_28)

	var_15_0.DateLabel = var_15_28

	local var_15_29
	local var_15_30 = LUI.UIImage.new()

	var_15_30.id = "DurationBG"

	var_15_30:SetRGBFromInt(0, 0)
	var_15_30:SetAlpha(0, 0)
	var_15_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 149, _1080p * 208, _1080p * 122, _1080p * 145)
	var_15_0:addElement(var_15_30)

	var_15_0.DurationBG = var_15_30

	local var_15_31
	local var_15_32 = LUI.UIText.new()

	var_15_32.id = "DurationLabel"

	var_15_32:SetAlpha(0, 0)
	var_15_32:setText("09:52:10", 0)
	var_15_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_32:SetAlignment(LUI.Alignment.Center)
	var_15_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 156.5, _1080p * 200.5, _1080p * 125.5, _1080p * 141.5)
	var_15_0:addElement(var_15_32)

	var_15_0.DurationLabel = var_15_32

	local function var_15_33()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_33

	local var_15_34 = {
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
			value = _1080p * 24
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
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonOverStream", var_15_34)

	local var_15_35 = {
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
			value = _1080p * 4
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
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOverStream", var_15_35)

	local var_15_36 = {
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
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
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
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOverStream", var_15_36)

	local var_15_37 = {
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
			value = _1080p * 24
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonOverStream", var_15_37)

	local var_15_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 187
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonOverStream", var_15_38)

	local var_15_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 266.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonOverStream", var_15_39)

	local var_15_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonOverStream", var_15_40)

	local var_15_41 = {
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

	var_15_20:RegisterAnimationSequence("ButtonOverStream", var_15_41)

	local var_15_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
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
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonOverStream", var_15_42)

	local var_15_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("ButtonOverStream", var_15_43)

	local var_15_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_26:RegisterAnimationSequence("ButtonOverStream", var_15_44)

	local function var_15_45()
		var_15_4:AnimateSequence("ButtonOverStream")
		var_15_6:AnimateSequence("ButtonOverStream")
		var_15_10:AnimateSequence("ButtonOverStream")
		var_15_12:AnimateSequence("ButtonOverStream")
		var_15_14:AnimateSequence("ButtonOverStream")
		var_15_16:AnimateSequence("ButtonOverStream")
		var_15_18:AnimateSequence("ButtonOverStream")
		var_15_20:AnimateSequence("ButtonOverStream")
		var_15_22:AnimateSequence("ButtonOverStream")
		var_15_24:AnimateSequence("ButtonOverStream")
		var_15_26:AnimateSequence("ButtonOverStream")
	end

	var_15_0._sequences.ButtonOverStream = var_15_45

	local var_15_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
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
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonUpStream", var_15_46)

	local var_15_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
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
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUpStream", var_15_47)

	local var_15_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
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
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUpStream", var_15_48)

	local var_15_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonUpStream", var_15_49)

	local var_15_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 187
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonUpStream", var_15_50)

	local var_15_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonUpStream", var_15_51)

	local var_15_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonUpStream", var_15_52)

	local var_15_53 = {
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

	var_15_20:RegisterAnimationSequence("ButtonUpStream", var_15_53)

	local var_15_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
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
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonUpStream", var_15_54)

	local var_15_55 = {
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

	var_15_24:RegisterAnimationSequence("ButtonUpStream", var_15_55)

	local var_15_56 = {
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

	var_15_26:RegisterAnimationSequence("ButtonUpStream", var_15_56)

	local var_15_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("ButtonUpStream", var_15_57)

	local function var_15_58()
		var_15_4:AnimateSequence("ButtonUpStream")
		var_15_6:AnimateSequence("ButtonUpStream")
		var_15_10:AnimateSequence("ButtonUpStream")
		var_15_12:AnimateSequence("ButtonUpStream")
		var_15_14:AnimateSequence("ButtonUpStream")
		var_15_16:AnimateSequence("ButtonUpStream")
		var_15_18:AnimateSequence("ButtonUpStream")
		var_15_20:AnimateSequence("ButtonUpStream")
		var_15_22:AnimateSequence("ButtonUpStream")
		var_15_24:AnimateSequence("ButtonUpStream")
		var_15_26:AnimateSequence("ButtonUpStream")
		var_15_28:AnimateSequence("ButtonUpStream")
	end

	var_15_0._sequences.ButtonUpStream = var_15_58

	local var_15_59 = {
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
			value = _1080p * 24
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
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonOverVOD", var_15_59)

	local var_15_60 = {
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
			value = _1080p * 4
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
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOverVOD", var_15_60)

	local var_15_61 = {
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
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
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
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOverVOD", var_15_61)

	local var_15_62 = {
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
			value = _1080p * 24
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonOverVOD", var_15_62)

	local var_15_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 187
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonOverVOD", var_15_63)

	local var_15_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 266.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonOverVOD", var_15_64)

	local var_15_65 = {
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

	var_15_20:RegisterAnimationSequence("ButtonOverVOD", var_15_65)

	local var_15_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 72.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90.5
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 72.5
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonOverVOD", var_15_66)

	local var_15_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("ButtonOverVOD", var_15_67)

	local function var_15_68()
		var_15_4:AnimateSequence("ButtonOverVOD")
		var_15_6:AnimateSequence("ButtonOverVOD")
		var_15_10:AnimateSequence("ButtonOverVOD")
		var_15_12:AnimateSequence("ButtonOverVOD")
		var_15_14:AnimateSequence("ButtonOverVOD")
		var_15_16:AnimateSequence("ButtonOverVOD")
		var_15_20:AnimateSequence("ButtonOverVOD")
		var_15_22:AnimateSequence("ButtonOverVOD")
		var_15_28:AnimateSequence("ButtonOverVOD")
	end

	var_15_0._sequences.ButtonOverVOD = var_15_68

	local var_15_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
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
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonUpVOD", var_15_69)

	local var_15_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
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
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 4
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUpVOD", var_15_70)

	local var_15_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
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
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUpVOD", var_15_71)

	local var_15_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 200
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonUpVOD", var_15_72)

	local var_15_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 187
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonUpVOD", var_15_73)

	local var_15_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonUpVOD", var_15_74)

	local var_15_75 = {
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

	var_15_20:RegisterAnimationSequence("ButtonUpVOD", var_15_75)

	local var_15_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 476.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 72.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90.5
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
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonUpVOD", var_15_76)

	local var_15_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("ButtonUpVOD", var_15_77)

	local var_15_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_26:RegisterAnimationSequence("ButtonUpVOD", var_15_78)

	local var_15_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("ButtonUpVOD", var_15_79)

	local function var_15_80()
		var_15_4:AnimateSequence("ButtonUpVOD")
		var_15_6:AnimateSequence("ButtonUpVOD")
		var_15_10:AnimateSequence("ButtonUpVOD")
		var_15_12:AnimateSequence("ButtonUpVOD")
		var_15_14:AnimateSequence("ButtonUpVOD")
		var_15_16:AnimateSequence("ButtonUpVOD")
		var_15_20:AnimateSequence("ButtonUpVOD")
		var_15_22:AnimateSequence("ButtonUpVOD")
		var_15_24:AnimateSequence("ButtonUpVOD")
		var_15_26:AnimateSequence("ButtonUpVOD")
		var_15_28:AnimateSequence("ButtonUpVOD")
	end

	var_15_0._sequences.ButtonUpVOD = var_15_80

	local var_15_81 = {
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
			value = _1080p * 24
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
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonResetVOD", var_15_81)

	local var_15_82 = {
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
			value = _1080p * 4
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
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonResetVOD", var_15_82)

	local var_15_83 = {
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
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
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
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonResetVOD", var_15_83)

	local var_15_84 = {
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
			value = _1080p * 24
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonResetVOD", var_15_84)

	local var_15_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonResetVOD", var_15_85)

	local var_15_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_15_16:RegisterAnimationSequence("ButtonResetVOD", var_15_86)

	local var_15_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonResetVOD", var_15_87)

	local var_15_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("ButtonResetVOD", var_15_88)

	local var_15_89 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonResetVOD", var_15_89)

	local var_15_90 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("ButtonResetVOD", var_15_90)

	local var_15_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_26:RegisterAnimationSequence("ButtonResetVOD", var_15_91)

	local var_15_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("ButtonResetVOD", var_15_92)

	local function var_15_93()
		var_15_4:AnimateSequence("ButtonResetVOD")
		var_15_6:AnimateSequence("ButtonResetVOD")
		var_15_10:AnimateSequence("ButtonResetVOD")
		var_15_12:AnimateSequence("ButtonResetVOD")
		var_15_14:AnimateSequence("ButtonResetVOD")
		var_15_16:AnimateSequence("ButtonResetVOD")
		var_15_18:AnimateSequence("ButtonResetVOD")
		var_15_20:AnimateSequence("ButtonResetVOD")
		var_15_22:AnimateSequence("ButtonResetVOD")
		var_15_24:AnimateSequence("ButtonResetVOD")
		var_15_26:AnimateSequence("ButtonResetVOD")
		var_15_28:AnimateSequence("ButtonResetVOD")
	end

	var_15_0._sequences.ButtonResetVOD = var_15_93

	local var_15_94 = {
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
			value = _1080p * 24
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
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonResetStream", var_15_94)

	local var_15_95 = {
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
			value = _1080p * 4
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
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonResetStream", var_15_95)

	local var_15_96 = {
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
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2
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
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonResetStream", var_15_96)

	local var_15_97 = {
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
			value = _1080p * 24
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonResetStream", var_15_97)

	local var_15_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -287
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonResetStream", var_15_98)

	local var_15_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 262.19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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

	var_15_16:RegisterAnimationSequence("ButtonResetStream", var_15_99)

	local var_15_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonResetStream", var_15_100)

	local var_15_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("ButtonResetStream", var_15_101)

	local var_15_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonResetStream", var_15_102)

	local var_15_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("ButtonResetStream", var_15_103)

	local var_15_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_26:RegisterAnimationSequence("ButtonResetStream", var_15_104)

	local var_15_105 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("ButtonResetStream", var_15_105)

	local function var_15_106()
		var_15_4:AnimateSequence("ButtonResetStream")
		var_15_6:AnimateSequence("ButtonResetStream")
		var_15_10:AnimateSequence("ButtonResetStream")
		var_15_12:AnimateSequence("ButtonResetStream")
		var_15_14:AnimateSequence("ButtonResetStream")
		var_15_16:AnimateSequence("ButtonResetStream")
		var_15_18:AnimateSequence("ButtonResetStream")
		var_15_20:AnimateSequence("ButtonResetStream")
		var_15_22:AnimateSequence("ButtonResetStream")
		var_15_24:AnimateSequence("ButtonResetStream")
		var_15_26:AnimateSequence("ButtonResetStream")
		var_15_28:AnimateSequence("ButtonResetStream")
	end

	var_15_0._sequences.ButtonResetStream = var_15_106

	var_0_1(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("CODTvButton", CODTvButton)
LockTable(_M)
