module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		arg_2_0:dispatchEventToCurrentMenu({
			name = "selection_changed",
			newSelection = arg_2_0
		})
	end)

	local function var_1_0()
		if arg_1_0:GetDataSource().isCompleted:GetValue(arg_1_1) then
			ACTIONS.AnimateSequence(arg_1_0, "Unlocked")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Locked")
		end

		local var_3_0 = arg_1_0:GetDataSource().isHiddenChallenge:GetValue(arg_1_1)

		if var_3_0 and var_3_0 ~= nil then
			ACTIONS.AnimateSequence(arg_1_0, "Hidden")
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "isCompleted", var_1_0)
end

function ChallengeInfo(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 294 * _1080p, 0, 171 * _1080p)

	var_4_0.id = "ChallengeInfo"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	local function var_4_3()
		local var_5_0 = var_4_0:GetDataSource().desc:GetValue(var_4_1)

		if var_5_0 ~= nil then
			var_4_0.buttonDescription = var_5_0
		end
	end

	var_4_0:SubscribeToModelThroughElement(var_4_0, "desc", var_4_3)

	local var_4_4
	local var_4_5 = LUI.UIBlur.new()

	var_4_5.id = "ListBlur"

	var_4_5:SetBlurStrength(1.5, 0)
	var_4_0:addElement(var_4_5)

	var_4_0.ListBlur = var_4_5

	local var_4_6
	local var_4_7 = LUI.UIImage.new()

	var_4_7.id = "GradientBackgroundInGameOnlyCopy0"

	var_4_7:SetRGBFromInt(0, 0)
	var_4_7:SetAlpha(0.75, 0)
	var_4_7:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -147, _1080p * 147, _1080p * -85.5, _1080p * 85.5)
	var_4_0:addElement(var_4_7)

	var_4_0.GradientBackgroundInGameOnlyCopy0 = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIImage.new()

	var_4_9.id = "GradientBackgroundInGameOnly"

	var_4_9:SetRGBFromInt(0, 0)
	var_4_9:SetAlpha(0.5, 0)
	var_4_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -147, _1080p * 147, _1080p * -60, _1080p * 57)
	var_4_0:addElement(var_4_9)

	var_4_0.GradientBackgroundInGameOnly = var_4_9

	local var_4_10
	local var_4_11 = LUI.UIText.new()

	var_4_11.id = "TierLabel"

	var_4_11:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_11:SetAlignment(LUI.Alignment.Right)
	var_4_11:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -142, _1080p * -7.98, _1080p * -23.75, _1080p * -4.75)

	local function var_4_12()
		local var_6_0 = var_4_0:GetDataSource().currentTierLabel:GetValue(var_4_1)

		if var_6_0 ~= nil then
			var_4_11:setText(var_6_0, 0)
		end
	end

	var_4_11:SubscribeToModelThroughElement(var_4_0, "currentTierLabel", var_4_12)
	var_4_0:addElement(var_4_11)

	var_4_0.TierLabel = var_4_11

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("ChallengeInfoProgressBar", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "ProgressBar"

	var_4_14:SetDataSourceThroughElement(var_4_0, nil)
	var_4_14.black:SetAlpha(0, 0)
	var_4_14:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 152, _1080p * -27.5, _1080p * -1)
	var_4_0:addElement(var_4_14)

	var_4_0.ProgressBar = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "Image"

	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 294, _1080p * 26, _1080p * 142)

	local function var_4_17()
		local var_7_0 = var_4_0:GetDataSource().image:GetValue(var_4_1)

		if var_7_0 ~= nil then
			var_4_16:setImage(RegisterMaterial(var_7_0), 0)
		end
	end

	var_4_16:SubscribeToModelThroughElement(var_4_0, "image", var_4_17)
	var_4_0:addElement(var_4_16)

	var_4_0.Image = var_4_16

	local var_4_18
	local var_4_19 = LUI.UIImage.new()

	var_4_19.id = "LockedBackground"

	var_4_19:SetAlpha(0, 0)
	var_4_19:setImage(RegisterMaterial("widg_disabled"), 0)
	var_4_19:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 23, _1080p * -29)
	var_4_0:addElement(var_4_19)

	var_4_0.LockedBackground = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIImage.new()

	var_4_21.id = "Darken"

	var_4_21:SetRGBFromInt(0, 0)
	var_4_21:SetAlpha(0, 0)
	var_4_21:setImage(RegisterMaterial("widg_disabled"), 0)
	var_4_21:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
	var_4_0:addElement(var_4_21)

	var_4_0.Darken = var_4_21

	local var_4_22

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		var_4_22 = MenuBuilder.BuildRegisteredType("GenericButtonSelection", {
			controllerIndex = var_4_1
		})
		var_4_22.id = "GenericButtonSelection"

		var_4_22:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 26, _1080p * -29)
		var_4_0:addElement(var_4_22)

		var_4_0.GenericButtonSelection = var_4_22
	end

	local var_4_23

	if not Engine.DDJFBBJAIG() then
		local var_4_24 = LUI.UIImage.new()

		var_4_24.id = "InGameBackground"

		var_4_24:SetRGBFromInt(0, 0)
		var_4_24:SetAlpha(0.8, 0)
		var_4_24:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
		var_4_0:addElement(var_4_24)

		var_4_0.InGameBackground = var_4_24
	end

	local var_4_25

	if Engine.DDJFBBJAIG() and not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_26 = MenuBuilder.BuildRegisteredType("GenericListButtonBackground", {
			controllerIndex = var_4_1
		})

		var_4_26.id = "Background"

		var_4_26.DropShadow:SetAlpha(0, 0)
		var_4_26:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
		var_4_0:addElement(var_4_26)

		var_4_0.Background = var_4_26
	end

	local var_4_27

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_28 = {
			borderThicknessLeft = _1080p * 1,
			borderThicknessRight = _1080p * 1,
			borderThicknessTop = _1080p * 1,
			borderThicknessBottom = _1080p * 1
		}

		var_4_27 = LUI.UIBorder.new(var_4_28)
		var_4_27.id = "BorderSelectedCP"

		var_4_27:SetAlpha(0.2, 0)
		var_4_0:addElement(var_4_27)

		var_4_0.BorderSelectedCP = var_4_27
	end

	local var_4_29

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		var_4_29 = LUI.UIStyledText.new()
		var_4_29.id = "Name"

		var_4_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_29:SetAlignment(LUI.Alignment.Left)
		var_4_29:SetStartupDelay(2000)
		var_4_29:SetLineHoldTime(500)
		var_4_29:SetAnimMoveTime(1000)
		var_4_29:SetEndDelay(1000)
		var_4_29:SetCrossfadeTime(500)
		var_4_29:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_4_29:SetMaxVisibleLines(1)
		var_4_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 286, _1080p * 2.5, _1080p * 21.5)

		local function var_4_30()
			local var_8_0 = var_4_0:GetDataSource().name:GetValue(var_4_1)

			if var_8_0 ~= nil then
				var_4_29:setText(LocalizeString(var_8_0), 0)
			end
		end

		var_4_29:SubscribeToModelThroughElement(var_4_0, "name", var_4_30)
		var_4_0:addElement(var_4_29)

		var_4_0.Name = var_4_29
	end

	local var_4_31

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		var_4_31 = LUI.UIStyledText.new()
		var_4_31.id = "NameCP"

		var_4_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_31:SetAlignment(LUI.Alignment.Center)
		var_4_31:SetStartupDelay(2000)
		var_4_31:SetLineHoldTime(500)
		var_4_31:SetAnimMoveTime(1000)
		var_4_31:SetEndDelay(1000)
		var_4_31:SetCrossfadeTime(500)
		var_4_31:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_4_31:SetMaxVisibleLines(1)
		var_4_31:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 2.5, _1080p * 21.5)

		local function var_4_32()
			local var_9_0 = var_4_0:GetDataSource().name:GetValue(var_4_1)

			if var_9_0 ~= nil then
				var_4_31:setText(ToUpperCase(LocalizeString(var_9_0)), 0)
			end
		end

		var_4_31:SubscribeToModelThroughElement(var_4_0, "name", var_4_32)
		var_4_0:addElement(var_4_31)

		var_4_0.NameCP = var_4_31
	end

	local var_4_33
	local var_4_34 = MenuBuilder.BuildRegisteredType("CaCButtonRectrictionOverlay", {
		controllerIndex = var_4_1
	})

	var_4_34.id = "RectrictionOverlay"

	var_4_34:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 25.5, _1080p * -28.5)
	var_4_0:addElement(var_4_34)

	var_4_0.RectrictionOverlay = var_4_34

	local var_4_35

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_36 = MenuBuilder.BuildRegisteredType("EmblemBoxLine", {
			controllerIndex = var_4_1
		})

		var_4_36.id = "Line"

		var_4_36:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 24.5, _1080p * 25.5)
		var_4_0:addElement(var_4_36)

		var_4_0.Line = var_4_36
	end

	local var_4_37

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_38 = MenuBuilder.BuildRegisteredType("EmblemBoxLine", {
			controllerIndex = var_4_1
		})

		var_4_38.id = "LineCopy1"

		var_4_38:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -28.5, _1080p * -27.5)
		var_4_0:addElement(var_4_38)

		var_4_0.LineCopy1 = var_4_38
	end

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_39 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_4_29:RegisterAnimationSequence("DefaultSequence", var_4_39)
	end

	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("DefaultSequence", var_4_40)

	local function var_4_41()
		if not CONDITIONS.IsThirdGameMode(var_4_0) then
			var_4_29:AnimateSequence("DefaultSequence")
		end

		var_4_34:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_41

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_42 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Left,
				value = _1080p * 3
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Right,
				value = _1080p * 3
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 23
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Bottom,
				value = _1080p * 3
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Zombies.menuHeader
			}
		}

		var_4_27:RegisterAnimationSequence("Selected", var_4_42)
	end

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_43 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_4_29:RegisterAnimationSequence("Selected", var_4_43)
	end

	local function var_4_44()
		if CONDITIONS.IsThirdGameMode(var_4_0) then
			var_4_27:AnimateSequence("Selected")
		end

		if not CONDITIONS.IsThirdGameMode(var_4_0) then
			var_4_29:AnimateSequence("Selected")
		end
	end

	var_4_0._sequences.Selected = var_4_44

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_45 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Left,
				value = _1080p * 1
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Right,
				value = _1080p * 1
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Top,
				value = _1080p * 1
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Border_Thickness_Bottom,
				value = _1080p * 1
			}
		}

		var_4_27:RegisterAnimationSequence("Deselect", var_4_45)
	end

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_46 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_4_29:RegisterAnimationSequence("Deselect", var_4_46)
	end

	local function var_4_47()
		if CONDITIONS.IsThirdGameMode(var_4_0) then
			var_4_27:AnimateSequence("Deselect")
		end

		if not CONDITIONS.IsThirdGameMode(var_4_0) then
			var_4_29:AnimateSequence("Deselect")
		end
	end

	var_4_0._sequences.Deselect = var_4_47

	local var_4_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Locked", var_4_48)

	local var_4_49 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Locked", var_4_49)

	local var_4_50 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Locked", var_4_50)

	local var_4_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("Locked", var_4_51)

	local function var_4_52()
		var_4_16:AnimateSequence("Locked")
		var_4_19:AnimateSequence("Locked")
		var_4_21:AnimateSequence("Locked")
		var_4_34:AnimateSequence("Locked")
	end

	var_4_0._sequences.Locked = var_4_52

	local var_4_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Unlocked", var_4_53)

	local var_4_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Unlocked", var_4_54)

	local var_4_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Unlocked", var_4_55)

	local var_4_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("Unlocked", var_4_56)

	local function var_4_57()
		var_4_16:AnimateSequence("Unlocked")
		var_4_19:AnimateSequence("Unlocked")
		var_4_21:AnimateSequence("Unlocked")
		var_4_34:AnimateSequence("Unlocked")
	end

	var_4_0._sequences.Unlocked = var_4_57

	local var_4_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_11:RegisterAnimationSequence("Hidden", var_4_58)

	local var_4_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Hidden", var_4_59)

	local var_4_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Hidden", var_4_60)

	local var_4_61 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Hidden", var_4_61)

	local var_4_62 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Hidden", var_4_62)

	local var_4_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("Hidden", var_4_63)

	local function var_4_64()
		var_4_11:AnimateSequence("Hidden")
		var_4_14:AnimateSequence("Hidden")
		var_4_16:AnimateSequence("Hidden")
		var_4_19:AnimateSequence("Hidden")
		var_4_21:AnimateSequence("Hidden")
		var_4_34:AnimateSequence("Hidden")
	end

	var_4_0._sequences.Hidden = var_4_64

	local var_4_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 162
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -28.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
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

	var_4_14:RegisterAnimationSequence("DefaultCP", var_4_65)

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_66 = {
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
			}
		}

		var_4_22:RegisterAnimationSequence("DefaultCP", var_4_66)
	end

	local function var_4_67()
		var_4_14:AnimateSequence("DefaultCP")

		if not CONDITIONS.IsThirdGameMode(var_4_0) then
			var_4_22:AnimateSequence("DefaultCP")
		end
	end

	var_4_0._sequences.DefaultCP = var_4_67

	var_4_14:SetDataSourceThroughElement(var_4_0, nil)
	var_4_0:addEventHandler("button_over", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Selected")
	end)
	var_4_0:addEventHandler("button_up", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Deselect")
	end)
	PostLoadFunc(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		ACTIONS.AnimateSequence(var_4_0, "DefaultCP")
	end

	return var_4_0
end

MenuBuilder.registerType("ChallengeInfo", ChallengeInfo)
LockTable(_M)
