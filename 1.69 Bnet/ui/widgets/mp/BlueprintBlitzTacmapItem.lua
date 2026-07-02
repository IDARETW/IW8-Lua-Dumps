module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1 and arg_1_1.animSequence, "You must specify an animation.")

	if arg_1_0._lastAnimState ~= arg_1_1.animSequence then
		arg_1_0._lastAnimState = arg_1_1.animSequence

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1.animSequence)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._contractCount = 0
	arg_2_0._initialized = false
	arg_2_0._extracting = false
	arg_2_0.RefreshAnimation = var_0_0

	local function var_2_0()
		if DataSources.inGame.MP.completedContracts:GetValue(arg_2_1) < 0 then
			if arg_2_0._lastAnimState ~= BRCONTRACTS.BBLITZ.HIDE then
				arg_2_0:RefreshAnimation({
					animSequence = BRCONTRACTS.BBLITZ.HIDE
				})
			end

			return
		end

		if arg_2_0._initialized then
			arg_2_0._contractCount = arg_2_0._contractCount + 1
		end

		if arg_2_0._lastAnimState == BRCONTRACTS.BBLITZ.SHOW and arg_2_0._contractCount ~= nil then
			if arg_2_0._contractCount >= BRCONTRACTS.BBLITZ.MAX_CONTRACTS then
				arg_2_0.challenge1:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TACMAP_OBJ1", BRCONTRACTS.BBLITZ.MAX_CONTRACTS, BRCONTRACTS.BBLITZ.MAX_CONTRACTS))

				arg_2_0._contractCount = 0

				arg_2_0:RefreshAnimation({
					animSequence = BRCONTRACTS.BBLITZ.COMPLETE_OBJ1
				})
			else
				arg_2_0.challenge1:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TACMAP_OBJ1", arg_2_0._contractCount, BRCONTRACTS.BBLITZ.MAX_CONTRACTS))
			end
		end
	end

	local function var_2_1()
		if DataSources.inGame.MP.completedContracts:GetValue(arg_2_1) < 0 then
			return
		end

		arg_2_0._extracting = DataSources.inGame.HUD.extractCarrier:GetValue(arg_2_1)

		if arg_2_0._extracting ~= nil then
			if arg_2_0._lastAnimState == BRCONTRACTS.BBLITZ.COMPLETE_OBJ1 then
				if arg_2_0._extracting then
					arg_2_0:RefreshAnimation({
						animSequence = BRCONTRACTS.BBLITZ.COMPLETE_OBJ2
					})
				end
			elseif arg_2_0._lastAnimState == BRCONTRACTS.BBLITZ.COMPLETE_OBJ2 and not arg_2_0._extracting then
				arg_2_0:RefreshAnimation({
					animSequence = BRCONTRACTS.BBLITZ.SHOW
				})

				arg_2_0._contractCount = 0

				arg_2_0.challenge1:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TACMAP_OBJ1", arg_2_0._contractCount, BRCONTRACTS.BBLITZ.MAX_CONTRACTS))
			end
		end
	end

	var_2_1()
	arg_2_0:RefreshAnimation({
		animSequence = BRCONTRACTS.BBLITZ.SHOW
	})
	arg_2_0:SubscribeToModel(DataSources.inGame.MP.completedContracts:GetModel(arg_2_1), var_2_0)
	arg_2_0:SubscribeToModel(DataSources.inGame.HUD.extractCarrier:GetModel(arg_2_1), var_2_1)

	arg_2_0._initialized = true
end

function BlueprintBlitzTacmapItem(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 200 * _1080p)

	var_5_0.id = "BlueprintBlitzTacmapItem"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "background"

	var_5_4:SetAlpha(0.75, 0)
	var_5_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 200)
	var_5_0:addElement(var_5_4)

	var_5_0.background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "CategoryIcon"

	var_5_6:setImage(RegisterMaterial("ui_mp_br_ping_icon_mission_extraction"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 57, _1080p * 5, _1080p * 49)
	var_5_0:addElement(var_5_6)

	var_5_0.CategoryIcon = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "lineDivider"

	var_5_8:SetAlpha(0.5, 0)
	var_5_8:setImage(RegisterMaterial("line_dot_ch2"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 395, _1080p * 52, _1080p * 55)
	var_5_0:addElement(var_5_8)

	var_5_0.lineDivider = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "subTitle"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_10:SetAlpha(0.5, 0)
	var_5_10:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TACMAP_SUBTITLE"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 397, _1080p * 31, _1080p * 49)
	var_5_0:addElement(var_5_10)

	var_5_0.subTitle = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "Title"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.wzTitle, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TITLE"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 376, _1080p * 7, _1080p * 31)
	var_5_0:addElement(var_5_12)

	var_5_0.Title = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "Check3"

	var_5_14.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 45, _1080p * 152, _1080p * 174)
	var_5_0:addElement(var_5_14)

	var_5_0.Check3 = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "Check2"

	var_5_16.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 45, _1080p * 112, _1080p * 134)
	var_5_0:addElement(var_5_16)

	var_5_0.Check2 = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "Check1"

	var_5_18.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 45, _1080p * 73, _1080p * 95)
	var_5_0:addElement(var_5_18)

	var_5_0.Check1 = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "challenge1"

	var_5_20:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TACMAP_OBJ1"), 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 391, _1080p * 71, _1080p * 95)
	var_5_0:addElement(var_5_20)

	var_5_0.challenge1 = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIStyledText.new()

	var_5_22.id = "challenge2"

	var_5_22:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TACMAP_OBJ2"), 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_22:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 391, _1080p * 110, _1080p * 134)
	var_5_0:addElement(var_5_22)

	var_5_0.challenge2 = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIStyledText.new()

	var_5_24.id = "challenge3"

	var_5_24:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/BLUEPRINT_BLITZ_TACMAP_OBJ3"), 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_24:SetAlignment(LUI.Alignment.Left)
	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 391, _1080p * 150, _1080p * 174)
	var_5_0:addElement(var_5_24)

	var_5_0.challenge3 = var_5_24

	local var_5_25
	local var_5_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Check3.Fill
		}
	}

	var_5_14:RegisterAnimationSequence("DefaultSequence", var_5_26)

	local var_5_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Check2.Fill
		}
	}

	var_5_16:RegisterAnimationSequence("DefaultSequence", var_5_27)

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_checkbox_checked"),
			child = var_5_0.Check1.Fill
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Check1.Fill
		}
	}

	var_5_18:RegisterAnimationSequence("DefaultSequence", var_5_28)

	local function var_5_29()
		var_5_14:AnimateSequence("DefaultSequence")
		var_5_16:AnimateSequence("DefaultSequence")
		var_5_18:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_29

	local var_5_30
	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Hide", var_5_31)

	local var_5_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Hide", var_5_32)

	local var_5_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Hide", var_5_33)

	local var_5_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Hide", var_5_34)

	local var_5_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Hide", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("Hide", var_5_36)

	local var_5_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("Hide", var_5_37)

	local var_5_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("Hide", var_5_38)

	local var_5_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Hide", var_5_39)

	local var_5_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("Hide", var_5_40)

	local var_5_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("Hide", var_5_41)

	local function var_5_42()
		var_5_4:AnimateSequence("Hide")
		var_5_6:AnimateSequence("Hide")
		var_5_8:AnimateSequence("Hide")
		var_5_10:AnimateSequence("Hide")
		var_5_12:AnimateSequence("Hide")
		var_5_14:AnimateSequence("Hide")
		var_5_16:AnimateSequence("Hide")
		var_5_18:AnimateSequence("Hide")
		var_5_20:AnimateSequence("Hide")
		var_5_22:AnimateSequence("Hide")
		var_5_24:AnimateSequence("Hide")
	end

	var_5_0._sequences.Hide = var_5_42

	local var_5_43
	local var_5_44 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Show", var_5_44)

	local var_5_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Show", var_5_45)

	local var_5_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Show", var_5_46)

	local var_5_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default
		}
	}

	var_5_10:RegisterAnimationSequence("Show", var_5_47)

	local var_5_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_12:RegisterAnimationSequence("Show", var_5_48)

	local var_5_49 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default,
			child = var_5_0.Check3.Frame
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Check3.Fill
		}
	}

	var_5_14:RegisterAnimationSequence("Show", var_5_49)

	local var_5_50 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default,
			child = var_5_0.Check2.Frame
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Check2.Fill
		}
	}

	var_5_16:RegisterAnimationSequence("Show", var_5_50)

	local var_5_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default,
			child = var_5_0.Check1.Frame
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Check1.Fill
		}
	}

	var_5_18:RegisterAnimationSequence("Show", var_5_51)

	local var_5_52 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Show", var_5_52)

	local var_5_53 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 136
		}
	}

	var_5_22:RegisterAnimationSequence("Show", var_5_53)

	local var_5_54 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default
		}
	}

	var_5_24:RegisterAnimationSequence("Show", var_5_54)

	local function var_5_55()
		var_5_4:AnimateSequence("Show")
		var_5_6:AnimateSequence("Show")
		var_5_8:AnimateSequence("Show")
		var_5_10:AnimateSequence("Show")
		var_5_12:AnimateSequence("Show")
		var_5_14:AnimateSequence("Show")
		var_5_16:AnimateSequence("Show")
		var_5_18:AnimateSequence("Show")
		var_5_20:AnimateSequence("Show")
		var_5_22:AnimateSequence("Show")
		var_5_24:AnimateSequence("Show")
	end

	var_5_0._sequences.Show = var_5_55

	local var_5_56
	local var_5_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("OBJ1Complete", var_5_57)

	local var_5_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_5_0.Check1.Frame
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Check1.Fill
		}
	}

	var_5_18:RegisterAnimationSequence("OBJ1Complete", var_5_58)

	local var_5_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_20:RegisterAnimationSequence("OBJ1Complete", var_5_59)

	local var_5_60 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("OBJ1Complete", var_5_60)

	local function var_5_61()
		var_5_16:AnimateSequence("OBJ1Complete")
		var_5_18:AnimateSequence("OBJ1Complete")
		var_5_20:AnimateSequence("OBJ1Complete")
		var_5_22:AnimateSequence("OBJ1Complete")
	end

	var_5_0._sequences.OBJ1Complete = var_5_61

	local var_5_62
	local var_5_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("OBJ2Complete", var_5_63)

	local var_5_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_5_0.Check2.Frame
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_5_0.Check2.Fill
		}
	}

	var_5_16:RegisterAnimationSequence("OBJ2Complete", var_5_64)

	local var_5_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_22:RegisterAnimationSequence("OBJ2Complete", var_5_65)

	local var_5_66 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("OBJ2Complete", var_5_66)

	local function var_5_67()
		var_5_14:AnimateSequence("OBJ2Complete")
		var_5_16:AnimateSequence("OBJ2Complete")
		var_5_22:AnimateSequence("OBJ2Complete")
		var_5_24:AnimateSequence("OBJ2Complete")
	end

	var_5_0._sequences.OBJ2Complete = var_5_67

	local var_5_68
	local var_5_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_10:RegisterAnimationSequence("WZSetup", var_5_69)

	local var_5_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_12:RegisterAnimationSequence("WZSetup", var_5_70)

	local var_5_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_5_20:RegisterAnimationSequence("WZSetup", var_5_71)

	local var_5_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_22:RegisterAnimationSequence("WZSetup", var_5_72)

	local var_5_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_24:RegisterAnimationSequence("WZSetup", var_5_73)

	local function var_5_74()
		var_5_10:AnimateSequence("WZSetup")
		var_5_12:AnimateSequence("WZSetup")
		var_5_20:AnimateSequence("WZSetup")
		var_5_22:AnimateSequence("WZSetup")
		var_5_24:AnimateSequence("WZSetup")
	end

	var_5_0._sequences.WZSetup = var_5_74

	var_0_1(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	return var_5_0
end

MenuBuilder.registerType("BlueprintBlitzTacmapItem", BlueprintBlitzTacmapItem)
LockTable(_M)
