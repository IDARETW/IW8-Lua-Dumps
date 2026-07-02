module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SetIgnoreInvisibleChildren(true)

	function arg_1_0.UpdateDividerVisibility(arg_2_0)
		if arg_2_0.OperatorChallenges:GetAlpha() == 0 or arg_2_0.BundleUpsellButton:GetAlpha() == 0 then
			arg_2_0.TextDivider:SetAlpha(0)
		else
			arg_2_0.TextDivider:SetAlpha(1)
		end
	end

	local function var_1_0()
		arg_1_0:UpdateDividerVisibility()

		return true
	end

	arg_1_0.BundleUpsellButton:addEventHandler("on_upsell_button_hidden", var_1_0)
	arg_1_0.BundleUpsellButton:addEventHandler("on_upsell_button_shown", var_1_0)
	arg_1_0:UpdateDividerVisibility()
end

function OperatorLootDetailsLayout(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalStackedLayout.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 506 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "OperatorLootDetailsLayout"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:SetSpacing(10 * _1080p)

	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("OperatorLootDetails", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "OperatorLootDetails"

	if CONDITIONS.InFrontend() then
		var_4_4.ActionPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_FULLSCREEN_PROMPT"), 0)
	end

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 506, 0, _1080p * 25)
	var_4_0:addElement(var_4_4)

	var_4_0.OperatorLootDetails = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "SelectPrompt"

	var_4_6:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetTintFontIcons(true)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 358, _1080p * 35, _1080p * 55)
	var_4_0:addElement(var_4_6)

	var_4_0.SelectPrompt = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "PreviewPrompt"

	var_4_8:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("OPERATIONS/OPERATOR_PREVIEW_SKIN"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetTintFontIcons(true)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 534, _1080p * 65, _1080p * 85)
	var_4_0:addElement(var_4_8)

	var_4_0.PreviewPrompt = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Spacer"

	var_4_10:SetRGBFromInt(0, 0)
	var_4_10:SetAlpha(0.01, 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 506, _1080p * 95, _1080p * 165)
	var_4_0:addElement(var_4_10)

	var_4_0.Spacer = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("OperatorChallenges", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "OperatorChallenges"

	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 506, _1080p * 175, _1080p * 350)
	var_4_0:addElement(var_4_12)

	var_4_0.OperatorChallenges = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("TextDivider", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "TextDivider"

	var_4_14.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/OR"), 0)
	var_4_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 360, _1080p * 390)
	var_4_0:addElement(var_4_14)

	var_4_0.TextDivider = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("BundleUpsellButton", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "BundleUpsellButton"

	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 478, _1080p * 400, _1080p * 604)
	var_4_0:addElement(var_4_16)

	var_4_0.BundleUpsellButton = var_4_16

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("OperatorLootDetailsLayout", OperatorLootDetailsLayout)
LockTable(_M)
