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

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2[CRM.keys.LAYOUT_TYPE] == 3 then
		ACTIONS.AnimateSequence(arg_2_0, "BLM")
		ACTIONS.AnimateSequence(arg_2_0.CRMTextDetails, "BLM")
		arg_2_0.CRMTextDetails.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BLM")))
		arg_2_0.CRMTextDetails:UpdateTitleBacker()
		arg_2_0.Image:setImage(RegisterMaterial("ui_default_white"))
		arg_2_0.Image:SetRGBFromTable(SWATCHES.genericMenu.blackBackground)
		arg_2_0.CRMTextDetails:SetSpacing(20 * _1080p)

		local var_2_0 = Engine.CBBHFCGDIC("MENU/BLM_DESC")

		if arg_2_2[CRM.keys.CONTENT_LONG] and #arg_2_2[CRM.keys.CONTENT_LONG] > 0 then
			var_2_0 = arg_2_2[CRM.keys.CONTENT_LONG]
		elseif arg_2_2[CRM.keys.CONTENT_SHORT] and #arg_2_2[CRM.keys.CONTENT_SHORT] > 0 then
			var_2_0 = arg_2_2[CRM.keys.CONTENT_SHORT]
		end

		arg_2_0.CRMTextDetails:UpdateDetails(var_2_0, true)
		arg_2_0.CRMTextDetails.Prompt:SetText("")
	else
		ACTIONS.AnimateSequence(arg_2_0, "DefaultSequence")
		ACTIONS.AnimateSequence(arg_2_0.CRMTextDetails, "DefaultSequence")
		arg_2_0.CRMTextDetails.HeaderText:setText(arg_2_2[CRM.keys.TITLE])
		arg_2_0.CRMTextDetails:UpdateTitleBacker()

		local var_2_1 = arg_2_2[CRM.keys.POPUP_IMAGE]

		if var_2_1 and #var_2_1 > 0 then
			arg_2_0.Image:setImage(RegisterMaterial(var_2_1))
			arg_2_0.Image:SetRGBFromTable(SWATCHES.Reticles.White)
			arg_2_0.Image:SetAlpha(1)
		else
			arg_2_0.Image:SetAlpha(0)
		end

		local var_2_2 = ""

		if arg_2_2[CRM.keys.CONTENT_LONG] and #arg_2_2[CRM.keys.CONTENT_LONG] > 0 then
			var_2_2 = arg_2_2[CRM.keys.CONTENT_LONG]
		elseif arg_2_2[CRM.keys.CONTENT_SHORT] and #arg_2_2[CRM.keys.CONTENT_SHORT] > 0 then
			var_2_2 = arg_2_2[CRM.keys.CONTENT_SHORT]
		end

		arg_2_0.CRMTextDetails:UpdateDetails(var_2_2)
		var_0_0(arg_2_0, arg_2_2)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupContent = var_0_1

	arg_3_0.CRMTextDetails:InitializeDimensions(arg_3_0.CRMTextDetails:GetCurrentAnchorsAndPositions())
	arg_3_0:setPriority(-1)
	Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
end

function CRMLayoutDefault(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "CRMLayoutDefault"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "GenericPopupWindow"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 173, _1080p * 925)
	var_4_0:addElement(var_4_4)

	var_4_0.GenericPopupWindow = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Image"

	var_4_6:setImage(RegisterMaterial("image_motd_mpreveal_price"), 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 120, _1080p * -120, _1080p * 197, _1080p * -183)
	var_4_0:addElement(var_4_6)

	var_4_0.Image = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Backer"

	var_4_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_8:SetAlpha(0.3, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, _1080p * 1800, _1080p * 718, _1080p * 897)
	var_4_0:addElement(var_4_8)

	var_4_0.Backer = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Gradient"

	var_4_10:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_4_10:SetAlpha(0.75, 0)
	var_4_10:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1204, _1080p * -1800, _1080p * 197, _1080p * -183)
	var_4_0:addElement(var_4_10)

	var_4_0.Gradient = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("CRMTextDetails", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "CRMTextDetails"

	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 687, _1080p * 588, _1080p * 668)
	var_4_0:addElement(var_4_12)

	var_4_0.CRMTextDetails = var_4_12

	local var_4_13
	local var_4_14 = {
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

	var_4_12:RegisterAnimationSequence("DefaultSequence", var_4_14)

	local function var_4_15()
		var_4_12:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_15

	local function var_4_16()
		return
	end

	var_4_0._sequences.LongDescription = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.ShortDescription = var_4_17

	local var_4_18
	local var_4_19 = {
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

	var_4_12:RegisterAnimationSequence("BLM", var_4_19)

	local function var_4_20()
		var_4_12:AnimateSequence("BLM")
	end

	var_4_0._sequences.BLM = var_4_20

	var_0_2(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("CRMLayoutDefault", CRMLayoutDefault)
LockTable(_M)
