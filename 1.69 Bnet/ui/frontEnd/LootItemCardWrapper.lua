module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		if arg_1_0._previewsEnabled then
			arg_1_0.Flare:SetScale(0.05, 150, LUI.EASING.outBack)
		end
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_3_0, arg_3_1)
		if arg_1_0._previewsEnabled then
			arg_1_0.Flare:SetScale(-0.05, 100)
		end
	end)
end

function LootItemCardWrapper(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 210 * _1080p, 0, 310 * _1080p)

	var_4_0.id = "LootItemCardWrapper"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LootItemCard", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Card"

	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -155, _1080p * 125)
	var_4_0:addElement(var_4_4)

	var_4_0.Card = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "Flare"

	var_4_6:SetScale(-0.05, 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -151, _1080p * 129)
	var_4_0:addElement(var_4_6)

	var_4_0.Flare = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "DisableMask"

	var_4_8:SetRGBFromInt(0, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 210, 0, _1080p * 310)
	var_4_0:addElement(var_4_8)

	var_4_0.DisableMask = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Disabled", var_4_11)

	local function var_4_12()
		var_4_8:AnimateSequence("Disabled")
	end

	var_4_0._sequences.Disabled = var_4_12

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LootItemCardWrapper", LootItemCardWrapper)
LockTable(_M)
