module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0._isVisible = false

	arg_1_0:SetAlpha(0)
	arg_1_0:SetMouseFocusBlocker(true)
	arg_1_0:processEvent({
		name = "on_upsell_button_hidden"
	})
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._isVisible = true

	arg_2_0:SetAlpha(1)
	arg_2_0:SetMouseFocusBlocker(false)
	arg_2_0.BundleTypeLabel.Text:setText(Engine.CBBHFCGDIC(arg_2_1.bundleType))
	arg_2_0.BundleImage:setImage(RegisterMaterial(arg_2_1.image))
	arg_2_0.BundleNameImage:setImage(RegisterMaterial(arg_2_1.titleImage))
	arg_2_0.LimitedTime:SetupTimeLimit(nil)
	arg_2_0.LimitedTime:SetAlpha(0)
	arg_2_0:processEvent({
		name = "on_upsell_button_shown"
	})
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = "hiddenItem"

	for iter_3_0 = 1, arg_3_0.numHiddenItems do
		local var_3_1 = arg_3_0[var_3_0 .. iter_3_0]

		if tonumber(var_3_1) == arg_3_1 then
			return true
		end
	end

	local var_3_2 = "item"

	for iter_3_1 = 1, arg_3_0.numItems do
		local var_3_3 = arg_3_0[var_3_2 .. iter_3_1]

		if tonumber(var_3_3) == arg_3_1 then
			return true
		end
	end

	return false
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = {}
	local var_4_1 = LOOT.emptyID

	if arg_4_1.type and arg_4_1.ref then
		var_4_1 = LOOT.GetItemID(arg_4_1.type, arg_4_1.ref)
	elseif arg_4_1.lootID then
		var_4_1 = arg_4_1.lootID
	end

	local var_4_2 = StringTable.BFHCAIIDA(CSV.bundleIDs.file)

	for iter_4_0 = 0, var_4_2 - 1 do
		local var_4_3 = CSV.ReadRow(CSV.bundleIDs, iter_4_0)
		local var_4_4 = var_0_2(var_4_3, var_4_1)
		local var_4_5 = var_4_3.id
		local var_4_6 = STORE.BundleAvailable(arg_4_0, var_4_5)
		local var_4_7 = STORE.IsFirstPartyBundle(var_4_5)

		if var_4_4 and var_4_6 and not var_4_7 then
			var_4_0[var_4_5] = var_4_3
		end
	end

	return var_4_0
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = var_0_3(arg_5_0, arg_5_1)
	local var_5_1 = Engine.CFHBIHABCB(arg_5_0) and Dvar.DHEEJCCJBH("NQPLOSRSTP") or Dvar.DHEEJCCJBH("NOTKSOLRMO") or ""
	local var_5_2 = Engine.CFHBIHABCB(arg_5_0) and Dvar.DHEEJCCJBH("MMOOTLNTNR") or Dvar.DHEEJCCJBH("LQQSPONNOK") or ""
	local var_5_3 = Engine.CFHBIHABCB(arg_5_0) and Dvar.DHEEJCCJBH("OTPQONQQT") or Dvar.DHEEJCCJBH("LRQOORNNQS") or ""
	local var_5_4 = table.concat({
		var_5_1,
		var_5_2,
		var_5_3
	}, ",")
	local var_5_5 = split(var_5_4, ",")

	for iter_5_0, iter_5_1 in ipairs(var_5_5) do
		if var_5_0[iter_5_1] then
			return var_5_0[iter_5_1]
		end
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	if arg_6_1.type == LOOT.itemTypes.OPERATOR then
		return var_0_4(arg_6_0, arg_6_1)
	else
		local var_6_0 = var_0_3(arg_6_0, arg_6_1)
		local var_6_1 = next(var_6_0)

		if var_6_1 then
			return var_6_0[var_6_1]
		end
	end
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	if Dvar.IBEGCHEFE("NLTNQNSMQK") then
		arg_7_0._bundleData = arg_7_2

		if not arg_7_2 then
			arg_7_0:HideButton()
		else
			arg_7_0:ShowButton(arg_7_2)

			local function var_7_0(arg_8_0)
				if arg_8_0._bundleData and arg_8_0._isVisible then
					if arg_8_0._preOpenStoreBundlePreviewFunc then
						arg_8_0._preOpenStoreBundlePreviewFunc(arg_8_0)
					end

					local var_8_0 = {
						displayUpsellPopup = true,
						bundleID = tonumber(arg_8_0._bundleData.id),
						rarity = tonumber(arg_8_0._bundleData.rarity),
						description = arg_8_0._bundleData.description,
						bundleType = arg_8_0._bundleData.bundleType,
						titleImage = arg_8_0._bundleData.titleImage,
						currencyID = tonumber(arg_8_0._bundleData.currencyID),
						currencyAmount = tonumber(arg_8_0._bundleData.currencyAmount),
						timerPubVar = arg_8_0._timePubVar
					}

					LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_7_1, false, var_8_0)
				end
			end

			arg_7_0:addEventHandler("button_action", var_7_0)
			arg_7_0:addEventHandler("view_bundle", var_7_0)
		end
	else
		arg_7_0:HideButton()
	end
end

local function var_0_7(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if Dvar.IBEGCHEFE("NLTNQNSMQK") then
		local var_9_0 = var_0_5(arg_9_1, {
			type = arg_9_2,
			ref = arg_9_3
		})

		var_0_6(arg_9_0, arg_9_1, var_9_0)
	else
		arg_9_0:HideButton()
	end
end

local function var_0_8(arg_10_0, arg_10_1, arg_10_2)
	if Dvar.IBEGCHEFE("NLTNQNSMQK") then
		local var_10_0 = var_0_5(arg_10_1, {
			lootID = arg_10_2
		})

		var_0_6(arg_10_0, arg_10_1, var_10_0)
	else
		arg_10_0:HideButton()
	end
end

local function var_0_9(arg_11_0, arg_11_1, arg_11_2)
	if Dvar.IBEGCHEFE("NLTNQNSMQK") then
		local var_11_0 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_11_2)

		if var_11_0 and var_11_0 >= 0 then
			local var_11_1 = CSV.ReadRow(CSV.bundleIDs, var_11_0)

			var_0_6(arg_11_0, arg_11_1, var_11_1)

			return
		end
	end

	arg_11_0:HideButton()
end

local function var_0_10(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0._bundleItems, "Attempt to setup bundle with key before calling CacheBundleItems.")

	if arg_12_0._bundleItems and arg_12_0._bundleItems[arg_12_2] then
		local var_12_0 = arg_12_0._bundleItems[arg_12_2].bundleID

		var_0_9(arg_12_0, arg_12_1, var_12_0)

		return
	end

	arg_12_0:HideButton()
end

local function var_0_11(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0._bundleItems = STORE.GetAllItemsInStore(arg_13_1, arg_13_2)
end

local function var_0_12(arg_14_0, arg_14_1)
	arg_14_0._preOpenStoreBundlePreviewFunc = arg_14_1
end

local function var_0_13(arg_15_0, arg_15_1)
	arg_15_0._usePrimary = arg_15_1

	local var_15_0 = arg_15_1 and "MENU/VIEW_BUNDLE_PRIMARY" or "MENU/VIEW_BUNDLE"

	arg_15_0.ViewBundleLabel:setText(Engine.CBBHFCGDIC(var_15_0))
end

local function var_0_14(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_0._isVisible and arg_16_0._bundleData then
		arg_16_2 = arg_16_2 or {}

		if arg_16_0._preOpenStoreBundlePreviewFunc then
			arg_16_0._preOpenStoreBundlePreviewFunc(arg_16_0)
		end

		local var_16_0 = {
			displayUpsellPopup = true,
			bundleID = tonumber(arg_16_0._bundleData.id),
			rarity = tonumber(arg_16_0._bundleData.rarity),
			description = arg_16_0._bundleData.description,
			bundleType = arg_16_0._bundleData.bundleType,
			titleImage = arg_16_0._bundleData.titleImage,
			currencyID = tonumber(arg_16_0._bundleData.currencyID),
			currencyAmount = tonumber(arg_16_0._bundleData.currencyAmount),
			timerPubVar = arg_16_0._timePubVar,
			oneModBlueprintStore = arg_16_2.oneModBlueprintStore,
			upsellMenu = arg_16_0._upsellMenu
		}

		LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_16_1, false, var_16_0)
	end
end

local function var_0_15(arg_17_0, arg_17_1)
	arg_17_0._upsellMenu = arg_17_1
end

local function var_0_16(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.SetupUpsellButton = var_0_7
	arg_18_0.SetupUpsellButtonWithLootID = var_0_8
	arg_18_0.SetPreOpenStoreBundlePreviewFunc = var_0_12
	arg_18_0.SetButtonPrimary = var_0_13
	arg_18_0.OpenBundle = var_0_14
	arg_18_0.SetupUpsellButtonWithBundleID = var_0_9
	arg_18_0.SetupUpsellButtonWithKey = var_0_10
	arg_18_0.CacheBundleItems = var_0_11
	arg_18_0.HideButton = var_0_0
	arg_18_0.ShowButton = var_0_1
	arg_18_0.SetUpsellMenu = var_0_15

	arg_18_0:HideButton()
	arg_18_0.BundleImage:SetMask(arg_18_0.Mask)
	arg_18_0:addEventHandler("gamepad_button", function(arg_19_0, arg_19_1)
		local var_19_0 = arg_19_0._usePrimary and "primary" or "alt1"

		if arg_19_1.button == var_19_0 and arg_19_1.down then
			arg_19_0:OpenBundle(arg_18_1)
		end
	end)
	arg_18_0:addEventHandler("on_close", function(arg_20_0)
		arg_20_0._preOpenStoreBundlePreviewFunc = nil
	end)
	arg_18_0:addAndCallEventHandler("update_input_type", function(arg_21_0, arg_21_1)
		if LUI.IsLastInputKeyboardMouse(arg_21_1.controllerIndex or arg_18_1) then
			arg_21_0:SetFocusable(true)
		else
			arg_21_0:SetFocusable(false)
			arg_21_0:processEvent({
				name = "lose_focus"
			})
		end
	end)

	if IsLanguageChinese() or IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_18_0, "LimitedTimeCHTAR")
	end

	if not IsLanguageArabic() then
		arg_18_0.LimitedTime:SetIsShort(true)
	end
end

function BundleUpsellButton(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIButton.new()

	var_22_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 204 * _1080p)

	var_22_0.id = "BundleUpsellButton"
	var_22_0._animationSets = var_22_0._animationSets or {}
	var_22_0._sequences = var_22_0._sequences or {}

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	local var_22_2 = var_22_0
	local var_22_3
	local var_22_4 = LUI.UIImage.new()

	var_22_4.id = "BundleImage"

	var_22_4:SetScale(0.35, 0)
	var_22_4:setImage(RegisterMaterial("mw_store_billboard_mother_russia"), 0)
	var_22_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 20, _1080p * 156)
	var_22_0:addElement(var_22_4)

	var_22_0.BundleImage = var_22_4

	local var_22_5
	local var_22_6 = LUI.UIImage.new()

	var_22_6.id = "BundleNameImage"

	var_22_6:setImage(RegisterMaterial("mw_store_title_mother_russia"), 0)
	var_22_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 240, _1080p * 55, _1080p * 170)
	var_22_0:addElement(var_22_6)

	var_22_0.BundleNameImage = var_22_6

	local var_22_7
	local var_22_8 = LUI.UIImage.new()

	var_22_8.id = "TitleDarkener"

	var_22_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_22_8:SetAlpha(0.6, 0)
	var_22_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_22_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_22_0:addElement(var_22_8)

	var_22_0.TitleDarkener = var_22_8

	local var_22_9
	local var_22_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_22_1
	})

	var_22_10.id = "BundleTypeLabel"

	var_22_10.Divider:SetRGBFromTable(SWATCHES.MPArmory.bundleTextFocus, 0)
	var_22_10.Text:SetRGBFromTable(SWATCHES.MPArmory.bundleTextFocus, 0)
	var_22_10.Text:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TYPE_OPERATOR"), 0)
	var_22_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_22_0:addElement(var_22_10)

	var_22_0.BundleTypeLabel = var_22_10

	local var_22_11
	local var_22_12 = LUI.UIText.new()

	var_22_12.id = "ViewBundleLabel"

	var_22_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_22_12:setText(Engine.CBBHFCGDIC("MENU/VIEW_BUNDLE"), 0)
	var_22_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_12:SetAlignment(LUI.Alignment.Left)
	var_22_12:SetTintFontIcons(true)
	var_22_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 186, _1080p * 210)
	var_22_0:addElement(var_22_12)

	var_22_0.ViewBundleLabel = var_22_12

	local var_22_13
	local var_22_14 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_22_1
	})

	var_22_14.id = "LimitedTime"

	var_22_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 299, _1080p * 540, _1080p * 10, _1080p * 40)
	var_22_0:addElement(var_22_14)

	var_22_0.LimitedTime = var_22_14

	local var_22_15
	local var_22_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_22_1
	})

	var_22_16.id = "HighlightBarBottom"

	var_22_16:SetAlpha(0, 0)
	var_22_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 175, _1080p * 178)
	var_22_0:addElement(var_22_16)

	var_22_0.HighlightBarBottom = var_22_16

	local var_22_17
	local var_22_18 = LUI.UIImage.new()

	var_22_18.id = "Mask"

	var_22_18:setImage(RegisterMaterial("stencil_mask"), 0)
	var_22_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 176)
	var_22_0:addElement(var_22_18)

	var_22_0.Mask = var_22_18

	local function var_22_19()
		return
	end

	var_22_0._sequences.DefaultSequence = var_22_19

	local var_22_20
	local var_22_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_16:RegisterAnimationSequence("ButtonOver", var_22_21)

	local function var_22_22()
		var_22_16:AnimateSequence("ButtonOver")
	end

	var_22_0._sequences.ButtonOver = var_22_22

	local var_22_23
	local var_22_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_16:RegisterAnimationSequence("ButtonUp", var_22_24)

	local function var_22_25()
		var_22_16:AnimateSequence("ButtonUp")
	end

	var_22_0._sequences.ButtonUp = var_22_25

	local var_22_26
	local var_22_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 494
		}
	}

	var_22_14:RegisterAnimationSequence("LimitedTimeCHTAR", var_22_27)

	local function var_22_28()
		var_22_14:AnimateSequence("LimitedTimeCHTAR")
	end

	var_22_0._sequences.LimitedTimeCHTAR = var_22_28

	var_0_16(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("BundleUpsellButton", BundleUpsellButton)
LockTable(_M)
