module(..., package.seeall)

local var_0_0 = 32 * _1080p
local var_0_1 = 16 * _1080p

local function var_0_2(arg_1_0)
	if arg_1_0._usingProMode then
		if IsLanguageArabic() then
			local var_1_0 = arg_1_0.UpgradeRight:GetCurrentAnchorsAndPositions().left
			local var_1_1 = arg_1_0.UpgradeLeft:GetCurrentAnchorsAndPositions().right
			local var_1_2 = LAYOUT.GetTextWidth(arg_1_0.UpgradeLeft.TextInfo)
			local var_1_3 = LAYOUT.GetTextWidth(arg_1_0.UpgradeRight.TextInfo)
			local var_1_4 = var_1_1 + var_1_2 + var_1_3 + var_0_0 * 2 + var_0_1

			arg_1_0.UpgradeRight:SetRight(var_1_4 * _1080p, 150)
		else
			local var_1_5 = arg_1_0.UpgradeRight:GetCurrentAnchorsAndPositions().right - LAYOUT.GetTextWidth(arg_1_0.UpgradeRight.TextInfo) - var_0_0 - var_0_1
			local var_1_6 = math.max(var_1_5, -120)

			arg_1_0.UpgradeLeft:SetRight(var_1_6, 150)
		end
	end
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpgradeLeft.TextInfo:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/FIELDUPGRADE_BTN_LEFT_HEADER"))
	arg_2_0.UpgradeRight.TextInfo:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/FIELDUPGRADE_BTN_RIGHT_HEADER"))

	arg_2_0._playerData = PlayerData.BFFBGAJGD(arg_2_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers

	local var_2_0 = arg_2_0._playerData.fieldUpgrades[0]:get()
	local var_2_1 = RegisterMaterial(SUPER.GetImage(var_2_0))
	local var_2_2 = arg_2_0._playerData.fieldUpgrades[1]:get()
	local var_2_3 = RegisterMaterial(SUPER.GetImage(var_2_2))

	if CONDITIONS.IsThirdGameMode() then
		local var_2_4 = arg_2_0._playerData.cpFieldUpgrade:get()

		var_2_2 = Cac.superNoneValue
		var_2_1 = RegisterMaterial(MUNITION.GetRoleImage(var_2_4))
		var_2_3 = var_2_1
	end

	arg_2_0.UpgradeLeft.Image:setImage(var_2_1)
	arg_2_0.UpgradeRight.Image:setImage(var_2_3)

	arg_2_0._usingProMode = var_2_2 ~= Cac.superNoneValue and not CONDITIONS.AreRestrictionsActive(arg_2_1)

	if arg_2_0._usingProMode then
		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_2_0, "ARPro")
		elseif IsLanguageChinese() then
			arg_2_0.PlayMenuButton:SetMinTextRight(400 * _1080p, true)
			ACTIONS.AnimateSequence(arg_2_0, "ProLayout")
		else
			arg_2_0.PlayMenuButton:SetMinTextRight(325 * _1080p, true)
			ACTIONS.AnimateSequence(arg_2_0, "ProLayout")
		end
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "ARReg")
	else
		arg_2_0.PlayMenuButton:SetMinTextRight(348 * _1080p, true)
		ACTIONS.AnimateSequence(arg_2_0, "RegularLayout")
	end

	arg_2_0.PlayMenuButton:Contract()

	local function var_2_5(arg_3_0)
		arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
	end

	local function var_2_6(arg_4_0)
		arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
	end

	arg_2_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		var_2_6(arg_5_0)

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_2_0, arg_2_0._usingProMode and "ButtonUpProAR" or "ButtonUpRegAR")
		else
			ACTIONS.AnimateSequence(arg_2_0, arg_2_0._usingProMode and "ButtonUpPro" or "ButtonUpReg")
		end

		ACTIONS.AnimateSequence(arg_5_0.UpgradeLeft, "Minimize")
		ACTIONS.AnimateSequence(arg_5_0.UpgradeRight, "Minimize")
	end)
	arg_2_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			var_2_5(arg_6_0)

			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_2_0, arg_2_0._usingProMode and "ButtonOverProAR" or "ButtonOverRegAR")
			else
				ACTIONS.AnimateSequence(arg_2_0, arg_2_0._usingProMode and "ButtonOverPro" or "ButtonOverReg")
			end

			var_0_2(arg_6_0)

			if arg_2_0._usingProMode then
				ACTIONS.AnimateSequence(arg_6_0.UpgradeLeft, "Maximize")
				ACTIONS.AnimateSequence(arg_6_0.UpgradeRight, "Maximize")
			end
		else
			if IsLanguageArabic() then
				ACTIONS.AnimateSequence(arg_2_0, arg_2_0._usingProMode and "ButtonUpProAR" or "ButtonUpRegAR")
			else
				ACTIONS.AnimateSequence(arg_2_0, arg_2_0._usingProMode and "ButtonUpPro" or "ButtonUpReg")
			end

			ACTIONS.AnimateSequence(arg_6_0.UpgradeLeft, "Minimize")
			ACTIONS.AnimateSequence(arg_6_0.UpgradeRight, "Minimize")
		end
	end)
end

function EditFieldUpgradesButton(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_7_0.id = "EditFieldUpgradesButton"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "PlayMenuButton"

	var_7_4.Text:setText("", 0)
	var_7_4.Description:setText("", 0)
	var_7_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.PlayMenuButton = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("EquippedItemPanel", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "UpgradeRight"

	var_7_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -135, _1080p * -35, _1080p * -16, _1080p * 16)
	var_7_0:addElement(var_7_6)

	var_7_0.UpgradeRight = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("EquippedItemPanel", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "UpgradeLeft"

	var_7_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -178, _1080p * -78, _1080p * -16, _1080p * 16)
	var_7_0:addElement(var_7_8)

	var_7_0.UpgradeLeft = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "EquippedText"

	var_7_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_7_10:SetAlpha(0, 0)
	var_7_10:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_10:SetStartupDelay(1000)
	var_7_10:SetLineHoldTime(500)
	var_7_10:SetAnimMoveTime(500)
	var_7_10:SetAnimMoveSpeed(50)
	var_7_10:SetEndDelay(1000)
	var_7_10:SetCrossfadeTime(500)
	var_7_10:SetFadeInTime(300)
	var_7_10:SetFadeOutTime(300)
	var_7_10:SetMaxVisibleLines(1)
	var_7_10:SetShadowRGBFromInt(0, 0)
	var_7_10:SetOutlineRGBFromInt(0, 0)
	var_7_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 20, _1080p * -23, _1080p * -32, _1080p * -10)
	var_7_0:addElement(var_7_10)

	var_7_0.EquippedText = var_7_10

	local function var_7_11()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_11

	local var_7_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOverReg", var_7_12)

	local var_7_13 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -140
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverReg", var_7_13)

	local var_7_14 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOverReg", var_7_14)

	local function var_7_15()
		var_7_6:AnimateSequence("ButtonOverReg")
		var_7_8:AnimateSequence("ButtonOverReg")
		var_7_10:AnimateSequence("ButtonOverReg")
	end

	var_7_0._sequences.ButtonOverReg = var_7_15

	local var_7_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUpReg", var_7_16)

	local var_7_17 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -135
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpReg", var_7_17)

	local var_7_18 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpReg", var_7_18)

	local function var_7_19()
		var_7_6:AnimateSequence("ButtonUpReg")
		var_7_8:AnimateSequence("ButtonUpReg")
		var_7_10:AnimateSequence("ButtonUpReg")
	end

	var_7_0._sequences.ButtonUpReg = var_7_19

	local var_7_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("RegularLayout", var_7_20)

	local var_7_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -135
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("RegularLayout", var_7_21)

	local function var_7_22()
		var_7_6:AnimateSequence("RegularLayout")
		var_7_8:AnimateSequence("RegularLayout")
	end

	var_7_0._sequences.RegularLayout = var_7_22

	local var_7_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -135
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		}
	}

	var_7_6:RegisterAnimationSequence("ProLayout", var_7_23)

	local var_7_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
		}
	}

	var_7_8:RegisterAnimationSequence("ProLayout", var_7_24)

	local function var_7_25()
		var_7_6:AnimateSequence("ProLayout")
		var_7_8:AnimateSequence("ProLayout")
	end

	var_7_0._sequences.ProLayout = var_7_25

	local var_7_26 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUpPro", var_7_26)

	local var_7_27 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -178
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -78
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpPro", var_7_27)

	local var_7_28 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpPro", var_7_28)

	local function var_7_29()
		var_7_6:AnimateSequence("ButtonUpPro")
		var_7_8:AnimateSequence("ButtonUpPro")
		var_7_10:AnimateSequence("ButtonUpPro")
	end

	var_7_0._sequences.ButtonUpPro = var_7_29

	local var_7_30 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOverPro", var_7_30)

	local var_7_31 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverPro", var_7_31)

	local var_7_32 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOverPro", var_7_32)

	local function var_7_33()
		var_7_6:AnimateSequence("ButtonOverPro")
		var_7_8:AnimateSequence("ButtonOverPro")
		var_7_10:AnimateSequence("ButtonOverPro")
	end

	var_7_0._sequences.ButtonOverPro = var_7_33

	local var_7_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 214
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
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 109
		}
	}

	var_7_6:RegisterAnimationSequence("ARPro", var_7_34)

	local var_7_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 67
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -33
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
		}
	}

	var_7_8:RegisterAnimationSequence("ARPro", var_7_35)

	local function var_7_36()
		var_7_6:AnimateSequence("ARPro")
		var_7_8:AnimateSequence("ARPro")
	end

	var_7_0._sequences.ARPro = var_7_36

	local var_7_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 92
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
		}
	}

	var_7_6:RegisterAnimationSequence("ARReg", var_7_37)

	local var_7_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 67
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
		}
	}

	var_7_8:RegisterAnimationSequence("ARReg", var_7_38)

	local function var_7_39()
		var_7_6:AnimateSequence("ARReg")
		var_7_8:AnimateSequence("ARReg")
	end

	var_7_0._sequences.ARReg = var_7_39

	local var_7_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOverRegAR", var_7_40)

	local var_7_41 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverRegAR", var_7_41)

	local var_7_42 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOverRegAR", var_7_42)

	local function var_7_43()
		var_7_6:AnimateSequence("ButtonOverRegAR")
		var_7_8:AnimateSequence("ButtonOverRegAR")
		var_7_10:AnimateSequence("ButtonOverRegAR")
	end

	var_7_0._sequences.ButtonOverRegAR = var_7_43

	local var_7_44 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 109
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUpProAR", var_7_44)

	local var_7_45 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpProAR", var_7_45)

	local var_7_46 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpProAR", var_7_46)

	local function var_7_47()
		var_7_6:AnimateSequence("ButtonUpProAR")
		var_7_8:AnimateSequence("ButtonUpProAR")
		var_7_10:AnimateSequence("ButtonUpProAR")
	end

	var_7_0._sequences.ButtonUpProAR = var_7_47

	local var_7_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonUpRegAR", var_7_48)

	local var_7_49 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUpRegAR", var_7_49)

	local var_7_50 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonUpRegAR", var_7_50)

	local function var_7_51()
		var_7_6:AnimateSequence("ButtonUpRegAR")
		var_7_8:AnimateSequence("ButtonUpRegAR")
		var_7_10:AnimateSequence("ButtonUpRegAR")
	end

	var_7_0._sequences.ButtonUpRegAR = var_7_51

	local var_7_52 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_7_6:RegisterAnimationSequence("ButtonOverProAR", var_7_52)

	local var_7_53 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 39
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOverProAR", var_7_53)

	local var_7_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("ButtonOverProAR", var_7_54)

	local function var_7_55()
		var_7_6:AnimateSequence("ButtonOverProAR")
		var_7_8:AnimateSequence("ButtonOverProAR")
		var_7_10:AnimateSequence("ButtonOverProAR")
	end

	var_7_0._sequences.ButtonOverProAR = var_7_55

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("EditFieldUpgradesButton", EditFieldUpgradesButton)
LockTable(_M)
