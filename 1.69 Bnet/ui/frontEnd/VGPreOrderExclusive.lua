module(..., package.seeall)

local var_0_0 = "button_r3"
local var_0_1 = "button_right_stick"

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = STORE.GetVGPreOrderMastercraftRewardId()
	local var_1_1 = LOOT.GetTypeForID(var_1_0)

	STORE.PreviewItem(arg_1_0._controllerIndex, var_1_1, var_1_0)
end

local function var_0_3(arg_2_0, arg_2_1)
	if LUI.IsLastInputGamepad(arg_2_0._controllerIndex) then
		arg_2_0.ButtonPrompt:SetAlpha(1)
		arg_2_0.ButtonHelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = var_0_0
		})
	else
		arg_2_0.ButtonPrompt:SetAlpha(0)
		arg_2_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			kbm_only = true,
			helper_text = Engine.CBBHFCGDIC("MENU/PREVIEW_MASTERCRAFT"),
			container = arg_2_0.ButtonPromptContainerHorizontal,
			button_ref = var_0_0,
			containerAlignment = LUI.Alignment.Left
		})
	end
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._controllerIndex = arg_3_1

	arg_3_0:addAndCallEventHandler("update_input_type", var_0_3)

	local var_3_0 = LUI.UIBindButton.new()

	var_3_0.id = "bindButton"

	var_3_0:registerEventHandler(var_0_1, var_0_2)
	arg_3_0:addElement(var_3_0)
end

function VGPreOrderExclusive(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 480 * _1080p, 0, 300 * _1080p)

	var_4_0.id = "VGPreOrderExclusive"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Babkground"

	var_4_4:SetRGBFromTable(SWATCHES.Tracer.blue, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Babkground = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "ExclusiveStripe"

	var_4_6:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 345, _1080p * 114, _1080p * 164)
	var_4_0:addElement(var_4_6)

	var_4_0.ExclusiveStripe = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "PreOrderLabel"

	var_4_8:setText(Engine.CBBHFCGDIC("MENU/PREORDER_EXCLUSIVE_TITLE"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 345, _1080p * 130, _1080p * 148)
	var_4_0:addElement(var_4_8)

	var_4_0.PreOrderLabel = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "DescriptionLabel"

	var_4_10:setText(Engine.CBBHFCGDIC("MENU/PREORDER_EXCLUSIVE_DESC"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 480, _1080p * 168, _1080p * 186)
	var_4_0:addElement(var_4_10)

	var_4_0.DescriptionLabel = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "ButtonPrompt"

	var_4_12:setText(Engine.CBBHFCGDIC("MENU/PREVIEW_MASTERCRAFT_PROMPT"), 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 480, _1080p * 238, _1080p * 266)
	var_4_0:addElement(var_4_12)

	var_4_0.ButtonPrompt = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "DisclamerLabel"

	var_4_14:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_4_14:setText(Engine.CBBHFCGDIC("MENU/PREORDER_EXCLUSIVE_DISCLAMER"), 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 480, _1080p * 272, _1080p * 289)
	var_4_0:addElement(var_4_14)

	var_4_0.DisclamerLabel = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "ButtonHelperBar"

	var_4_16.Background:SetAlpha(0, 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 480, _1080p * 300, _1080p * 328)
	var_4_0:addElement(var_4_16)

	var_4_0.ButtonHelperBar = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "ButtonPromptContainerHorizontal"

	if CONDITIONS.AlwaysFalse() then
		var_4_18.Label:setText("ButtonPrompt", 0)
	end

	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 302, _1080p * 238, _1080p * 269)
	var_4_0:addElement(var_4_18)

	var_4_0.ButtonPromptContainerHorizontal = var_4_18

	var_0_4(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("VGPreOrderExclusive", VGPreOrderExclusive)
LockTable(_M)
