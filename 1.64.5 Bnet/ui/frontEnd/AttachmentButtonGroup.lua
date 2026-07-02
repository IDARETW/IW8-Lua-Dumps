module(..., package.seeall)

function IsGunsmithCustomsAvailable(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._hasVariants = #arg_1_0._attachmentData.variants > 1 and arg_1_0._attachmentData.unlocked

	local var_1_0 = GUNSMITH.IsAttachVariantCategoryBlacklisted(arg_1_1, arg_1_2)

	if LOOT.IsT9Item({
		type = LOOT.itemTypes.WEAPON,
		ref = arg_1_1
	}) == true and Dvar.IBEGCHEFE("MSLLOLLTOO") == true then
		return false
	end

	return ATTACHMENT.AreVariantsEnabled() and arg_1_0._hasVariants and not var_1_0 and Engine.DDJFBBJAIG() and Engine.CJJAFGIFAC(arg_1_0._controllerIndex)
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6, arg_2_7)
	arg_2_0._attachmentData = arg_2_2
	arg_2_0._attachSlot = arg_2_6
	arg_2_0._options = arg_2_7
	arg_2_0._isGunsmithCustomsAvailable = IsGunsmithCustomsAvailable(arg_2_0, arg_2_4.weapon, arg_2_7.category)

	arg_2_0.VariantsButton:Setup(arg_2_0._isGunsmithCustomsAvailable, arg_2_5, arg_2_0._attachmentData)
	arg_2_0.AttachmentButton:Setup(arg_2_1, arg_2_0._attachmentData, arg_2_3, arg_2_4, arg_2_5)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_0
	arg_3_0._controllerIndex = arg_3_1

	local function var_3_0()
		local var_4_0 = {
			variants = arg_3_0._attachmentData.variants,
			weaponSlot = arg_3_0._options.weaponSlot,
			loadoutIndex = arg_3_0._options.loadoutIndex,
			attachSlot = arg_3_0._attachSlot and arg_3_0._attachSlot or arg_3_0._attachmentData.blockedCategorySlot,
			attachmentRef = arg_3_0._attachmentData.ref,
			blockedCategorySlot = arg_3_0._attachmentData.blockedCategorySlot,
			category = arg_3_0._options.category
		}

		LUI.FlowManager.RequestAddMenu("AttachmentAppearanceSelect", true, arg_3_1, false, var_4_0)
	end

	arg_3_0:addEventHandler("gain_focus", function(arg_5_0, arg_5_1)
		arg_3_0.VariantsButton:processEvent({
			name = "lose_focus"
		})
		arg_3_0.AttachmentButton:processEvent({
			name = "gain_focus"
		})
		arg_3_0.VariantsButton:SetButtonDisabled(not arg_3_0._isGunsmithCustomsAvailable)

		local var_5_0 = arg_3_0.AttachmentButton
		local var_5_1 = arg_3_0.VariantsButton

		var_5_0.navigation = {}
		var_5_1.navigation = {}

		if arg_3_0._isGunsmithCustomsAvailable then
			var_5_0.navigation.right = var_5_1
			var_5_1.navigation.left = var_5_0
		end
	end)
	arg_3_0:addEventHandler("lose_focus", function(arg_6_0, arg_6_1)
		arg_3_0.VariantsButton:SetAlpha(arg_3_0._isGunsmithCustomsAvailable and 1 or 0)
	end)
	arg_3_0.VariantsButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		var_3_0()
	end)
	arg_3_0.AttachmentButton:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		if arg_3_0._isGunsmithCustomsAvailable then
			ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")
			ACTIONS.AnimateSequence(arg_3_0.VariantsButton, "Expand")
		end
	end)
	arg_3_0.AttachmentButton:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		if arg_3_0._isGunsmithCustomsAvailable then
			ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
			ACTIONS.AnimateSequence(arg_3_0.VariantsButton, "Collapse")
		end
	end)
end

function AttachmentButtonGroup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 62 * _1080p)

	var_10_0.id = "AttachmentButtonGroup"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("AttachmentButton", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "AttachmentButton"

	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 348, 0, _1080p * 62)
	var_10_0:addElement(var_10_4)

	var_10_0.AttachmentButton = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("AttachmentVariantsButton", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "VariantsButton"

	var_10_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 358, _1080p * 394, 0, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.VariantsButton = var_10_6

	local function var_10_7()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_7

	local var_10_8
	local var_10_9 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 420
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonOver", var_10_9)

	local function var_10_10()
		var_10_6:AnimateSequence("ButtonOver")
	end

	var_10_0._sequences.ButtonOver = var_10_10

	local var_10_11
	local var_10_12 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 394
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonUp", var_10_12)

	local function var_10_13()
		var_10_6:AnimateSequence("ButtonUp")
	end

	var_10_0._sequences.ButtonUp = var_10_13

	var_10_6:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonOver")
	end)
	var_10_6:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_10_1
		end

		ACTIONS.AnimateSequence(var_10_0, "ButtonUp")
	end)
	var_0_1(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("AttachmentButtonGroup", AttachmentButtonGroup)
LockTable(_M)
