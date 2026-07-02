module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	local var_1_0 = arg_1_3 == arg_1_1.variantID

	if var_1_0 then
		ACTIONS.AnimateSequence(arg_1_0.EquippedWidget, "TurnOn")
		ACTIONS.AnimateSequence(arg_1_0, "IsEquippedOrBlocked")
	else
		ACTIONS.AnimateSequence(arg_1_0, "IsNotEquipped")
	end

	arg_1_0.EquippedWidget:SetAlpha(var_1_0 and 1 or 0)
	arg_1_0.Name:setText(GUNSMITH.GetVariantName(arg_1_1.variantID, arg_1_1.lootID))
	arg_1_0.Category:setText(arg_1_5)

	if arg_1_4 then
		arg_1_0.BlockWarning:SetAlpha(1)
		arg_1_0.BlockWarning:setText(GUNSMITH.GetBlockedCategoryWarning(arg_1_2, arg_1_4))
		ACTIONS.AnimateSequence(arg_1_0, "IsEquippedOrBlocked")
	else
		arg_1_0.BlockWarning:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.EquippedWidget)
	assert(arg_2_0.Name)

	arg_2_0.Setup = var_0_0

	arg_2_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
end

function AttachmentAppearanceDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 140 * _1080p)

	var_3_0.id = "AttachmentAppearanceDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Name"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetStartupDelay(2000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(2000)
	var_3_6:SetAnimMoveSpeed(150)
	var_3_6:SetEndDelay(2000)
	var_3_6:SetCrossfadeTime(1000)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -28, _1080p * 14, _1080p * 50)
	var_3_0:addElement(var_3_6)

	var_3_0.Name = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "EquippedWidget"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 31, _1080p * 167, _1080p * 87, _1080p * 117)
	var_3_0:addElement(var_3_8)

	var_3_0.EquippedWidget = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "BlockWarning"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_10:SetAlpha(0, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("CAS/BLOCKED_CATEGORY_WARNING"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -23, _1080p * 87, _1080p * 107)
	var_3_0:addElement(var_3_10)

	var_3_0.BlockWarning = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Category"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetWordWrap(false)
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_12:SetStartupDelay(2000)
	var_3_12:SetLineHoldTime(400)
	var_3_12:SetAnimMoveTime(2000)
	var_3_12:SetAnimMoveSpeed(150)
	var_3_12:SetEndDelay(2000)
	var_3_12:SetCrossfadeTime(1000)
	var_3_12:SetFadeInTime(300)
	var_3_12:SetFadeOutTime(300)
	var_3_12:SetMaxVisibleLines(1)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -28, _1080p * 50, _1080p * 74)
	var_3_0:addElement(var_3_12)

	var_3_0.Category = var_3_12

	local var_3_13
	local var_3_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -53
		}
	}

	var_3_4:RegisterAnimationSequence("DefaultSequence", var_3_14)

	local function var_3_15()
		var_3_4:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_3_4:RegisterAnimationSequence("IsEquippedOrBlocked", var_3_17)

	local function var_3_18()
		var_3_4:AnimateSequence("IsEquippedOrBlocked")
	end

	var_3_0._sequences.IsEquippedOrBlocked = var_3_18

	local var_3_19
	local var_3_20 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -53
		}
	}

	var_3_4:RegisterAnimationSequence("IsNotEquipped", var_3_20)

	local function var_3_21()
		var_3_4:AnimateSequence("IsNotEquipped")
	end

	var_3_0._sequences.IsNotEquipped = var_3_21

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("AttachmentAppearanceDetails", AttachmentAppearanceDetails)
LockTable(_M)
