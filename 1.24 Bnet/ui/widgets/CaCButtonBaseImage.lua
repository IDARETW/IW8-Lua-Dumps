module(..., package.seeall)

function CaCButtonBaseImage(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 335 * _1080p, 0, 173 * _1080p)

	var_1_0.id = "CaCButtonBaseImage"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericItemBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "GenericItemBackground"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.GenericItemBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "DropShadow"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:SetAlpha(0.3, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 4)
	var_1_0:addElement(var_1_6)

	var_1_0.DropShadow = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Image"

	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -128, _1080p * 128, _1080p * -132, _1080p * -4)
	var_1_0:addElement(var_1_8)

	var_1_0.Image = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "PrestigeBG"

	var_1_10:SetRGBFromInt(13421772, 0)
	var_1_10:SetAlpha(0, 0)
	var_1_10:setImage(RegisterMaterial("widg_disabled"), 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, 0)
	var_1_0:addElement(var_1_10)

	var_1_0.PrestigeBG = var_1_10

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("CaCButtonRectrictionOverlay", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "RectrictionOverlay"

	var_1_12:SetAlpha(0, 0)
	var_1_12:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, 0)
	var_1_0:addElement(var_1_12)

	var_1_0.RectrictionOverlay = var_1_12

	local var_1_13

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_14 = LUI.UIImage.new()

		var_1_14.id = "LevelBacker"

		var_1_14:SetRGBFromInt(0, 0)
		var_1_14:SetAlpha(0, 0)
		var_1_14:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 100, _1080p * -24, 0)
		var_1_0:addElement(var_1_14)

		var_1_0.LevelBacker = var_1_14
	end

	local var_1_15

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		var_1_15 = MenuBuilder.BuildRegisteredType("GenericBorderFrame", {
			controllerIndex = var_1_1
		})
		var_1_15.id = "LevelFrame"

		var_1_15:SetRGBFromTable(SWATCHES.CAC.greenLight, 0)
		var_1_15:SetAlpha(0, 0)
		var_1_15.Left:SetRight(0, 0)
		var_1_15.Right:SetLeft(_1080p * -1, 0)
		var_1_15.Top:SetBottom(_1080p * 1, 0)
		var_1_15.Bottom:SetTop(0, 0)
		var_1_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 91, _1080p * 101, _1080p * -25, _1080p * -15)
		var_1_0:addElement(var_1_15)

		var_1_0.LevelFrame = var_1_15
	end

	local var_1_16

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		var_1_16 = LUI.UIText.new()
		var_1_16.id = "Level"

		var_1_16:SetRGBFromTable(SWATCHES.CAC.greenLight, 0)
		var_1_16:SetAlpha(0, 0)
		var_1_16:setText("Level: 3", 0)
		var_1_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_1_16:SetAlignment(LUI.Alignment.Center)
		var_1_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 2.5, _1080p * 97.5, _1080p * -21.5, _1080p * -2.5)
		var_1_0:addElement(var_1_16)

		var_1_0.Level = var_1_16
	end

	local var_1_17
	local var_1_18 = MenuBuilder.BuildRegisteredType("CaCSelectedMessage", {
		controllerIndex = var_1_1
	})

	var_1_18.id = "Message"

	var_1_18:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -317, 0, _1080p * -20, 0)

	local function var_1_19()
		local var_2_0 = var_1_0:GetDataSource().DataSources.frontEnd.MP.CAC.perks.content.equipIconAlpha:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_18.EndCapRight:SetAlpha(var_2_0, 0)
		end
	end

	var_1_18:SubscribeToModelThroughElement(var_1_0, "DataSources.frontEnd.MP.CAC.perks.content.equipIconAlpha", var_1_19)
	var_1_0:addElement(var_1_18)

	var_1_0.Message = var_1_18

	local var_1_20
	local var_1_21 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_1_1
	})

	var_1_21.id = "NewItemNotification"

	var_1_21:SetAlpha(0, 0)
	var_1_21:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -32, _1080p * 32, _1080p * -56, _1080p * 8)
	var_1_0:addElement(var_1_21)

	var_1_0.NewItemNotification = var_1_21

	local var_1_22
	local var_1_23 = MenuBuilder.BuildRegisteredType("GenericButtonSelection", {
		controllerIndex = var_1_1
	})

	var_1_23.id = "GenericButtonSelection"

	var_1_23:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 24, 0)
	var_1_0:addElement(var_1_23)

	var_1_0.GenericButtonSelection = var_1_23

	local var_1_24
	local var_1_25 = MenuBuilder.BuildRegisteredType("GenericListButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_25.id = "TitleBackground"

	var_1_25.DropShadow:SetAlpha(0, 0)
	var_1_25:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_1_0:addElement(var_1_25)

	var_1_0.TitleBackground = var_1_25

	local var_1_26
	local var_1_27 = LUI.UIStyledText.new()

	var_1_27.id = "Name"

	var_1_27:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_27:setText("Item Name", 0)
	var_1_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_27:SetAlignment(LUI.Alignment.Left)
	var_1_27:SetStartupDelay(2000)
	var_1_27:SetLineHoldTime(400)
	var_1_27:SetAnimMoveTime(300)
	var_1_27:SetEndDelay(1500)
	var_1_27:SetCrossfadeTime(750)
	var_1_27:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_27:SetMaxVisibleLines(1)
	var_1_27:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 13, _1080p * -13, _1080p * 2.5, _1080p * 21.5)
	var_1_0:addElement(var_1_27)

	var_1_0.Name = var_1_27

	local function var_1_28()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_28

	local var_1_29 = {
		{
			value = 0.05,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_1_8:RegisterAnimationSequence("Rollover", var_1_29)

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_30 = {
			{
				value = 16777215,
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				child = var_1_0.LevelFrame.Right
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				child = var_1_0.LevelFrame.Top
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CAC.yellowLight
			}
		}

		var_1_15:RegisterAnimationSequence("Rollover", var_1_30)
	end

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_31 = {
			{
				value = 16777215,
				duration = 100,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_1_16:RegisterAnimationSequence("Rollover", var_1_31)
	end

	local var_1_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_27:RegisterAnimationSequence("Rollover", var_1_32)

	local function var_1_33()
		var_1_8:AnimateSequence("Rollover")

		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_15:AnimateSequence("Rollover")
		end

		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_16:AnimateSequence("Rollover")
		end

		var_1_27:AnimateSequence("Rollover")
	end

	var_1_0._sequences.Rollover = var_1_33

	local var_1_34 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_1_8:RegisterAnimationSequence("Rollout", var_1_34)

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_35 = {
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CAC.greenLight
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				child = var_1_0.LevelFrame.Top
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				child = var_1_0.LevelFrame.Right
			}
		}

		var_1_15:RegisterAnimationSequence("Rollout", var_1_35)
	end

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_36 = {
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CAC.greenLight
			}
		}

		var_1_16:RegisterAnimationSequence("Rollout", var_1_36)
	end

	local var_1_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_27:RegisterAnimationSequence("Rollout", var_1_37)

	local function var_1_38()
		var_1_8:AnimateSequence("Rollout")

		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_15:AnimateSequence("Rollout")
		end

		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_16:AnimateSequence("Rollout")
		end

		var_1_27:AnimateSequence("Rollout")
	end

	var_1_0._sequences.Rollout = var_1_38

	local var_1_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Locked", var_1_39)

	local var_1_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Locked", var_1_40)

	local function var_1_41()
		var_1_8:AnimateSequence("Locked")
		var_1_12:AnimateSequence("Locked")
	end

	var_1_0._sequences.Locked = var_1_41

	local var_1_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("Unlocked", var_1_42)

	local var_1_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Unlocked", var_1_43)

	local function var_1_44()
		var_1_8:AnimateSequence("Unlocked")
		var_1_12:AnimateSequence("Unlocked")
	end

	var_1_0._sequences.Unlocked = var_1_44

	local function var_1_45()
		return
	end

	var_1_0._sequences.Disabled = var_1_45

	local function var_1_46()
		return
	end

	var_1_0._sequences.Enabled = var_1_46

	local function var_1_47()
		return
	end

	var_1_0._sequences.Pulse = var_1_47

	local function var_1_48()
		return
	end

	var_1_0._sequences.PulseStop = var_1_48

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_49 = {
			{
				value = 16777215,
				duration = 100,
				property = TWEEN_PROPERTY.RGB,
				child = var_1_0.LevelFrame.Right
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				child = var_1_0.LevelFrame.Top
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CAC.yellowLight
			}
		}

		var_1_15:RegisterAnimationSequence("Disabled_Rollover", var_1_49)
	end

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_50 = {
			{
				value = 16777215,
				duration = 100,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_1_16:RegisterAnimationSequence("Disabled_Rollover", var_1_50)
	end

	local var_1_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_27:RegisterAnimationSequence("Disabled_Rollover", var_1_51)

	local function var_1_52()
		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_15:AnimateSequence("Disabled_Rollover")
		end

		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_16:AnimateSequence("Disabled_Rollover")
		end

		var_1_27:AnimateSequence("Disabled_Rollover")
	end

	var_1_0._sequences.Disabled_Rollover = var_1_52

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_53 = {
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CAC.greenLight
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				child = var_1_0.LevelFrame.Top
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				child = var_1_0.LevelFrame.Right
			}
		}

		var_1_15:RegisterAnimationSequence("Disabled_Rollout", var_1_53)
	end

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_54 = {
			{
				duration = 200,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CAC.greenLight
			}
		}

		var_1_16:RegisterAnimationSequence("Disabled_Rollout", var_1_54)
	end

	local var_1_55 = {
		{
			value = 12566463,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_27:RegisterAnimationSequence("Disabled_Rollout", var_1_55)

	local function var_1_56()
		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_15:AnimateSequence("Disabled_Rollout")
		end

		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_16:AnimateSequence("Disabled_Rollout")
		end

		var_1_27:AnimateSequence("Disabled_Rollout")
	end

	var_1_0._sequences.Disabled_Rollout = var_1_56

	local var_1_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_21:RegisterAnimationSequence("IsNew", var_1_57)

	local function var_1_58()
		var_1_21:AnimateSequence("IsNew")
	end

	var_1_0._sequences.IsNew = var_1_58

	local var_1_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_21:RegisterAnimationSequence("IsNotNew", var_1_59)

	local function var_1_60()
		var_1_21:AnimateSequence("IsNotNew")
	end

	var_1_0._sequences.IsNotNew = var_1_60

	var_1_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Rollover")
	end)
	var_1_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Rollout")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled_Rollout")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled_Rollover")
	end)

	return var_1_0
end

MenuBuilder.registerType("CaCButtonBaseImage", CaCButtonBaseImage)
LockTable(_M)
