module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.ContractsGrid:SetAlignment(LUI.Alignment.Center)

	local var_1_0 = AAR.BrGetContractStatsForController(arg_1_1)

	if var_1_0 then
		if var_1_0.totalCompleted and var_1_0.totalCompleted > 0 then
			assert(arg_1_0.Subheader)
			assert(arg_1_0.ContractsGrid)
			assert(arg_1_0.TotalXpNum)

			local var_1_1 = "INVALID"

			arg_1_0.Subheader:setText(var_1_0.totalCompleted and tonumber(var_1_0.totalCompleted) or var_1_1)
			arg_1_0.TotalXpNum:setText(var_1_0.totalContractXp and Engine.CBBHFCGDIC("AAR/PLUS_XP", tonumber(var_1_0.totalContractXp)) or var_1_1)
			arg_1_0.ContractsGrid:SetupContractGrid(arg_1_1, var_1_0)
		else
			ACTIONS.AnimateSequence(arg_1_0, "NoCompletedContracts")
		end
	end
end

function AARContracts(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "AARContracts"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "NoContractsImage"

	var_2_4:SetAlpha(0, 0)
	var_2_4:setImage(RegisterMaterial("ui_mp_br_contracts_splash_icon_dom"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 704, _1080p * 1216, _1080p * 310, _1080p * 822)
	var_2_0:addElement(var_2_4)

	var_2_0.NoContractsImage = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "Header"

	var_2_6:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_2_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/CONTRACT_TIER_REACHED")), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 220, _1080p * 270)
	var_2_0:addElement(var_2_6)

	var_2_0.Header = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "Subheader"

	var_2_8:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_2_8:setText("99", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 890, _1080p * 1030, _1080p * 283, _1080p * 403)
	var_2_0:addElement(var_2_8)

	var_2_0.Subheader = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("AARContractGridContainer", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "ContractsGrid"

	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 434, _1080p * 1486, _1080p * 391, _1080p * 838)
	var_2_0:addElement(var_2_10)

	var_2_0.ContractsGrid = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "TotalXpNum"

	var_2_12:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_2_12:setText("+2000", 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_12:SetWordWrap(false)
	var_2_12:SetAlignment(LUI.Alignment.Center)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -150, _1080p * 150, _1080p * -258, _1080p * -188)
	var_2_0:addElement(var_2_12)

	var_2_0.TotalXpNum = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "ULFrame"

	var_2_14:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_2_14:SetAlpha(0.45, 0)
	var_2_14:setImage(RegisterMaterial("apache_reticle_corner"), 0)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 893, _1080p * 925, _1080p * 283, _1080p * 315)
	var_2_0:addElement(var_2_14)

	var_2_0.ULFrame = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIImage.new()

	var_2_16.id = "URFrame"

	var_2_16:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_2_16:SetAlpha(0.45, 0)
	var_2_16:SetZRotation(-90, 0)
	var_2_16:setImage(RegisterMaterial("apache_reticle_corner"), 0)
	var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 995, _1080p * 1027, _1080p * 283, _1080p * 315)
	var_2_0:addElement(var_2_16)

	var_2_0.URFrame = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "BRFrame"

	var_2_18:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_2_18:SetAlpha(0.45, 0)
	var_2_18:SetZRotation(-180, 0)
	var_2_18:setImage(RegisterMaterial("apache_reticle_corner"), 0)
	var_2_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 995, _1080p * 1027, _1080p * 372, _1080p * 404)
	var_2_0:addElement(var_2_18)

	var_2_0.BRFrame = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIImage.new()

	var_2_20.id = "BLFrame"

	var_2_20:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_2_20:SetAlpha(0.45, 0)
	var_2_20:SetZRotation(90, 0)
	var_2_20:setImage(RegisterMaterial("apache_reticle_corner"), 0)
	var_2_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 893, _1080p * 925, _1080p * 372, _1080p * 404)
	var_2_0:addElement(var_2_20)

	var_2_0.BLFrame = var_2_20

	local var_2_21
	local var_2_22 = LUI.UIImage.new()

	var_2_22.id = "NoContractsBanner"

	var_2_22:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_2_22:SetAlpha(0, 0)
	var_2_22:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_2_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 378, _1080p * 1472, _1080p * 550, _1080p * 646)
	var_2_0:addElement(var_2_22)

	var_2_0.NoContractsBanner = var_2_22

	local function var_2_23()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_23

	local var_2_24
	local var_2_25 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 342
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 854
		}
	}

	var_2_4:RegisterAnimationSequence("NoCompletedContracts", var_2_25)

	local var_2_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 533
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 583
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/NO_CONTRACTS_COMPLETED_TITLE"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_2_6:RegisterAnimationSequence("NoCompletedContracts", var_2_26)

	local var_2_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 583
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 617
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_MP/NO_CONTRACTS_COMPLETED_DESC")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		}
	}

	var_2_8:RegisterAnimationSequence("NoCompletedContracts", var_2_27)

	local var_2_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("NoCompletedContracts", var_2_28)

	local var_2_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("NoCompletedContracts", var_2_29)

	local var_2_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("NoCompletedContracts", var_2_30)

	local var_2_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("NoCompletedContracts", var_2_31)

	local var_2_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_18:RegisterAnimationSequence("NoCompletedContracts", var_2_32)

	local var_2_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("NoCompletedContracts", var_2_33)

	local var_2_34 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 530
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 626
		}
	}

	var_2_22:RegisterAnimationSequence("NoCompletedContracts", var_2_34)

	local function var_2_35()
		var_2_4:AnimateSequence("NoCompletedContracts")
		var_2_6:AnimateSequence("NoCompletedContracts")
		var_2_8:AnimateSequence("NoCompletedContracts")
		var_2_10:AnimateSequence("NoCompletedContracts")
		var_2_12:AnimateSequence("NoCompletedContracts")
		var_2_14:AnimateSequence("NoCompletedContracts")
		var_2_16:AnimateSequence("NoCompletedContracts")
		var_2_18:AnimateSequence("NoCompletedContracts")
		var_2_20:AnimateSequence("NoCompletedContracts")
		var_2_22:AnimateSequence("NoCompletedContracts")
	end

	var_2_0._sequences.NoCompletedContracts = var_2_35

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("AARContracts", AARContracts)
LockTable(_M)
