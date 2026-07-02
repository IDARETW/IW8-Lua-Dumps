module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.DeepLinkPrompt:setText("")

	if arg_1_1.actionFunction then
		local var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW")
		local var_1_1 = arg_1_1[CRM.keys.ACTION_TITLE]

		if var_1_1 ~= nil and #var_1_1 > 0 then
			var_1_0 = var_1_1
		end

		arg_1_0.DeepLinkPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_PRIMARY_BUTTON") .. " " .. var_1_0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2[CRM.keys.POPUP_IMAGE]

	if var_2_0 and #var_2_0 > 0 then
		arg_2_0.Image:setImage(RegisterMaterial(var_2_0))
		arg_2_0.Image:SetAlpha(1)
	else
		arg_2_0.Image:SetAlpha(0)
	end

	var_0_0(arg_2_0, arg_2_2)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupContent = var_0_1

	arg_3_0:setPriority(-1)
end

function CRMLayoutFullImage(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "CRMLayoutFullImage"

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
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "DeepLinkPrompt"

	var_4_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_10:SetStartupDelay(2000)
	var_4_10:SetLineHoldTime(400)
	var_4_10:SetAnimMoveTime(2000)
	var_4_10:SetAnimMoveSpeed(150)
	var_4_10:SetEndDelay(2000)
	var_4_10:SetCrossfadeTime(250)
	var_4_10:SetFadeInTime(300)
	var_4_10:SetFadeOutTime(300)
	var_4_10:SetMaxVisibleLines(3)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 160, _1080p * 672, _1080p * 674, _1080p * 696)
	var_4_0:addElement(var_4_10)

	var_4_0.DeepLinkPrompt = var_4_10

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CRMLayoutFullImage", CRMLayoutFullImage)
LockTable(_M)
