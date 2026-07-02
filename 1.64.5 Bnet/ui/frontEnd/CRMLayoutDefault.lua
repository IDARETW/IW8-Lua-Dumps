module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.CRMTextDetails.Prompt:SetText("")

	if arg_1_1.actionFunction then
		local var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW")
		local var_1_1 = arg_1_1[CRM.keys.ACTION_TITLE]

		if var_1_1 ~= nil and #var_1_1 > 0 then
			var_1_0 = var_1_1
		end

		arg_1_0.CRMTextDetails.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/PAD_PRIMARY_BUTTON") .. " " .. var_1_0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1.actionFunction then
		local var_2_0 = Engine.CBBHFCGDIC("BATTLEPASS/REDEEM_FREE_REWARD")
		local var_2_1 = arg_2_1[CRM.keys.ACTION_TITLE]

		if var_2_1 ~= nil and #var_2_1 > 0 then
			var_2_0 = var_2_1
		end

		arg_2_0.CRMTextDetails:UpdateRedeemText(Engine.CBBHFCGDIC("LUA_MENU/PAD_PRIMARY_BUTTON") .. " " .. var_2_0)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_2[CRM.keys.LAYOUT_TYPE] == 3 then
		ACTIONS.AnimateSequence(arg_3_0, "TextOnTop")
		ACTIONS.AnimateSequence(arg_3_0.CRMTextDetails, "BLM")
		arg_3_0.CRMTextDetails.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BLM")))
		arg_3_0.CRMTextDetails:UpdateTitleBacker()
		arg_3_0.Image:setImage(RegisterMaterial("ui_default_white"))
		arg_3_0.Image:SetRGBFromTable(SWATCHES.genericMenu.blackBackground)
		arg_3_0.CRMTextDetails:SetSpacing(20 * _1080p)

		local var_3_0 = Engine.CBBHFCGDIC("MENU/BLM_DESC")

		if arg_3_2[CRM.keys.CONTENT_LONG] and #arg_3_2[CRM.keys.CONTENT_LONG] > 0 then
			var_3_0 = arg_3_2[CRM.keys.CONTENT_LONG]
		elseif arg_3_2[CRM.keys.CONTENT_SHORT] and #arg_3_2[CRM.keys.CONTENT_SHORT] > 0 then
			var_3_0 = arg_3_2[CRM.keys.CONTENT_SHORT]
		end

		arg_3_0.CRMTextDetails:UpdateDetails(var_3_0, true)
		arg_3_0.CRMTextDetails.Prompt:SetText("")
	elseif arg_3_2.action and arg_3_2.action == "redeem" then
		ACTIONS.AnimateSequence(arg_3_0, "DefaultSequence")
		ACTIONS.AnimateSequence(arg_3_0.CRMTextDetails, "DefaultSequence")
		arg_3_0.CRMTextDetails.HeaderText:setText(arg_3_2[CRM.keys.TITLE])
		arg_3_0.CRMTextDetails:UpdateTitleBacker()

		local var_3_1 = arg_3_2[CRM.keys.POPUP_IMAGE]

		if var_3_1 and #var_3_1 > 0 then
			arg_3_0.Image:setImage(RegisterMaterial(var_3_1))
			arg_3_0.Image:SetRGBFromTable(SWATCHES.Reticles.White)
			arg_3_0.Image:SetAlpha(1)
		else
			arg_3_0.Image:SetAlpha(0)
		end

		local var_3_2 = ""
		local var_3_3 = ""

		if arg_3_2[CRM.keys.CONTENT_LONG] and #arg_3_2[CRM.keys.CONTENT_LONG] > 0 then
			var_3_2 = arg_3_2[CRM.keys.CONTENT_LONG]
		end

		if arg_3_2[CRM.keys.CONTENT_SHORT] and #arg_3_2[CRM.keys.CONTENT_SHORT] > 0 then
			var_3_3 = arg_3_2[CRM.keys.CONTENT_SHORT]
		end

		arg_3_0.CRMTextDetails:UpdateDetails(var_3_2, false, true, var_3_3)
		arg_3_0.CRMTextDetails.Prompt:SetText("")
		var_0_1(arg_3_0, arg_3_2)
	else
		ACTIONS.AnimateSequence(arg_3_0, "DefaultSequence")
		ACTIONS.AnimateSequence(arg_3_0.CRMTextDetails, "DefaultSequence")
		arg_3_0.CRMTextDetails.HeaderText:setText(arg_3_2[CRM.keys.TITLE])
		arg_3_0.CRMTextDetails:UpdateTitleBacker()

		local var_3_4 = arg_3_2[CRM.keys.POPUP_IMAGE]

		if var_3_4 and #var_3_4 > 0 then
			arg_3_0.Image:setImage(RegisterMaterial(var_3_4))
			arg_3_0.Image:SetRGBFromTable(SWATCHES.Reticles.White)
			arg_3_0.Image:SetAlpha(1)
		else
			arg_3_0.Image:SetAlpha(0)
		end

		local var_3_5 = ""

		if arg_3_2[CRM.keys.CONTENT_LONG] and #arg_3_2[CRM.keys.CONTENT_LONG] > 0 then
			var_3_5 = arg_3_2[CRM.keys.CONTENT_LONG]
		elseif arg_3_2[CRM.keys.CONTENT_SHORT] and #arg_3_2[CRM.keys.CONTENT_SHORT] > 0 then
			var_3_5 = arg_3_2[CRM.keys.CONTENT_SHORT]
		end

		arg_3_0.CRMTextDetails:UpdateDetails(var_3_5)
		var_0_0(arg_3_0, arg_3_2)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupContent = var_0_2

	arg_4_0.CRMTextDetails:InitializeDimensions(arg_4_0.CRMTextDetails:GetCurrentAnchorsAndPositions())
	arg_4_0:setPriority(-1)
	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
end

function CRMLayoutDefault(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "CRMLayoutDefault"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "GenericPopupWindow"

	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 173, _1080p * 925)
	var_5_0:addElement(var_5_4)

	var_5_0.GenericPopupWindow = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Image"

	var_5_6:setImage(RegisterMaterial("image_motd_mpreveal_price"), 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 120, _1080p * -120, _1080p * 197, _1080p * -183)
	var_5_0:addElement(var_5_6)

	var_5_0.Image = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Backer"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_8:SetAlpha(0.3, 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, _1080p * 1800, _1080p * 718, _1080p * 897)
	var_5_0:addElement(var_5_8)

	var_5_0.Backer = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Gradient"

	var_5_10:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_5_10:SetAlpha(0.75, 0)
	var_5_10:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1204, _1080p * -1800, _1080p * 197, _1080p * -183)
	var_5_0:addElement(var_5_10)

	var_5_0.Gradient = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("CRMTextDetails", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "CRMTextDetails"

	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 687, _1080p * 588, _1080p * 668)
	var_5_0:addElement(var_5_12)

	var_5_0.CRMTextDetails = var_5_12

	local var_5_13
	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 588
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 668
		}
	}

	var_5_12:RegisterAnimationSequence("DefaultSequence", var_5_14)

	local function var_5_15()
		var_5_12:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 341
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 421
		}
	}

	var_5_12:RegisterAnimationSequence("TextOnTop", var_5_17)

	local function var_5_18()
		var_5_12:AnimateSequence("TextOnTop")
	end

	var_5_0._sequences.TextOnTop = var_5_18

	var_0_3(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	return var_5_0
end

MenuBuilder.registerType("CRMLayoutDefault", CRMLayoutDefault)
LockTable(_M)
