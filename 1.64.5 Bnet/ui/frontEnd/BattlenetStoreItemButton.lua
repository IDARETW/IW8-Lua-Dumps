module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.Price:setText(arg_1_0.data.price, 0)
	arg_1_0.Title:setText(arg_1_0.data.title, 0)

	if arg_1_0.data.image ~= "" then
		arg_1_0.GameEditionImage:setImage(RegisterMaterial(arg_1_0.data.image), 0)
	end

	if arg_1_0.data.status ~= InGameStoreProductStatus.NOT_OWNED then
		ACTIONS.AnimateSequence(arg_1_0, "Owned")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.data = arg_2_1
	arg_2_0.index = arg_2_2
	arg_2_0.menu = arg_2_3

	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupButtonData = var_0_1

	arg_3_0:addEventHandler("gain_focus", function(arg_4_0, arg_4_1)
		if arg_4_0.data then
			arg_4_0:dispatchEventToCurrentMenu({
				name = "update_item_description",
				editionTitle = arg_4_0.data.title,
				editionDescription = arg_4_0.data.contentLong
			})
		end
	end)
	arg_3_0:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if arg_5_0.data then
			if arg_5_0.data.status ~= InGameStoreProductStatus.NOT_OWNED then
				LUI.FlowManager.RequestPopupMenu(arg_3_0, "PopupOK", true, arg_5_1.controller, false, {
					message = Engine.CBBHFCGDIC("LUA_MENU_MP/ALREADY_OWN_ITEM")
				})
			else
				InGameStore.SelectProduct(arg_5_1.controller, arg_5_0.data.productId)
			end
		end
	end)
end

function BattlenetStoreItemButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 620 * _1080p, 0, 100 * _1080p)

	var_6_0.id = "BattlenetStoreItemButton"
	var_6_0._animationSets = {}
	var_6_0._sequences = {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "Background"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "Price"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_6_6:SetAlpha(0.75, 0)
	var_6_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 179, _1080p * 552, _1080p * 7, _1080p * 37)
	var_6_0:addElement(var_6_6)

	var_6_0.Price = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "Title"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_8:setText("", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetLeading(-4 * _1080p, 0)
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_6_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 179, _1080p * -68, _1080p * -19, _1080p * 5)
	var_6_0:addElement(var_6_8)

	var_6_0.Title = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "PurchasedRadio"

	var_6_10:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_6_10:SetAlpha(0, 0)
	var_6_10:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_6_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -52, _1080p * -22, _1080p * -15, _1080p * 15)
	var_6_0:addElement(var_6_10)

	var_6_0.PurchasedRadio = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("BattlenetStoreEditionImage", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "GameEditionImage"

	var_6_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 15, _1080p * 161, _1080p * -40, _1080p * 40)
	var_6_0:addElement(var_6_12)

	var_6_0.GameEditionImage = var_6_12

	local var_6_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_6_6:RegisterAnimationSequence("DefaultSequence", var_6_13)

	local var_6_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("DefaultSequence", var_6_14)

	local function var_6_15()
		var_6_6:AnimateSequence("DefaultSequence")
		var_6_10:AnimateSequence("DefaultSequence")
	end

	var_6_0._sequences.DefaultSequence = var_6_15

	local var_6_16 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_16)

	local var_6_17 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_17)

	local function var_6_18()
		var_6_6:AnimateSequence("ButtonOver")
		var_6_8:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_18

	local var_6_19 = {
		{
			value = 0.75,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_19)

	local var_6_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_20)

	local function var_6_21()
		var_6_6:AnimateSequence("ButtonUp")
		var_6_8:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_21

	local var_6_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/OWNED_CAPS")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationHighlight
		}
	}

	var_6_6:RegisterAnimationSequence("Owned", var_6_22)

	local var_6_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Owned", var_6_23)

	local function var_6_24()
		var_6_6:AnimateSequence("Owned")
		var_6_10:AnimateSequence("Owned")
	end

	var_6_0._sequences.Owned = var_6_24

	var_6_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
	end)
	var_6_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUp")
	end)
	var_0_2(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "DefaultSequence")

	return var_6_0
end

MenuBuilder.registerType("BattlenetStoreItemButton", BattlenetStoreItemButton)
LockTable(_M)
