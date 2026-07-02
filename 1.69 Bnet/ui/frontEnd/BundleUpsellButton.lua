module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.hasOperatorMissions then
		if not arg_1_0.OperatorMissionBorder then
			local var_1_0
			local var_1_1 = LUI.UIImage.new()

			var_1_1.id = "OperatorMissionBorder"

			var_1_1:setImage(RegisterMaterial("ui_icon_mtx_bundle_highlight"), 0)
			var_1_1:SetBlendMode(BLEND_MODE.addWithAlpha)
			var_1_1:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * 0, _1080p * 1, _1080p * -18)
			arg_1_0:addElement(var_1_1)

			arg_1_0.OperatorMissionBorder = var_1_1
		end
	elseif arg_1_0.OperatorMissionBorder then
		arg_1_0.OperatorMissionBorder:closeTree()

		arg_1_0.OperatorMissionBorder = nil
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1.hasOperatorMissions then
		if not arg_2_0.BundleIncludesOperatorMissionIndicator then
			local var_2_0
			local var_2_1 = MenuBuilder.BuildRegisteredType("BundleIncludesOperatorMissionIndicator", {
				controllerIndex = arg_2_0._controllerIndex
			})

			var_2_1.id = "BundleIncludesOperatorMissionIndicator"

			var_2_1:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 6, _1080p * 134, _1080p * -60, _1080p * -34)
			arg_2_0:addElement(var_2_1)

			arg_2_0.BundleIncludesOperatorMissionIndicator = var_2_1
		end

		local var_2_2 = LOOT.GetBundleOperatorMissionsCP(arg_2_0._controllerIndex, arg_2_1.id)

		arg_2_0.BundleIncludesOperatorMissionIndicator:SetAmount(var_2_2)
	elseif arg_2_0.BundleIncludesOperatorMissionIndicator then
		arg_2_0.BundleIncludesOperatorMissionIndicator:closeTree()

		arg_2_0.BundleIncludesOperatorMissionIndicator = nil
	end
end

local function var_0_2(arg_3_0)
	arg_3_0._isVisible = false

	arg_3_0:SetAlpha(0)
	arg_3_0:SetMouseFocusBlocker(true)
	arg_3_0:processEvent({
		name = "on_upsell_button_hidden"
	})
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0._isVisible = true

	arg_4_0:SetAlpha(1)
	arg_4_0:SetMouseFocusBlocker(false)

	if arg_4_0.BundleTypeLabel and arg_4_1.bundleType and #arg_4_1.bundleType > 0 then
		arg_4_0.BundleTypeLabel.Text:setText(Engine.CBBHFCGDIC(arg_4_1.bundleType))
	else
		if arg_4_0.BundleTypeLabel then
			arg_4_0.BundleTypeLabel:closeTree()

			arg_4_0.BundleTypeLabel = nil
		end

		if arg_4_0.TitleDarkener then
			arg_4_0.TitleDarkener:closeTree()

			arg_4_0.TitleDarkener = nil
		end
	end

	arg_4_0.BundleImage:setImage(RegisterMaterial(arg_4_1.image))
	arg_4_0.BundleNameImage:setImage(RegisterMaterial(arg_4_1.titleImage))

	local var_4_0 = STORE.IsItemOnSale(tonumber(arg_4_1.id), arg_4_0._controllerIndex)

	if CONDITIONS.IsStoreSalesBannerEnabled() and var_4_0 and arg_4_1.discountPercent then
		arg_4_0.LimitedTime:SetupDiscountPercentage(arg_4_1.discountPercent)
		arg_4_0.LimitedTime:SetAlpha(1)
	else
		arg_4_0.LimitedTime:SetAlpha(0)
	end

	var_0_0(arg_4_0, arg_4_1)
	var_0_1(arg_4_0, arg_4_1)
	arg_4_0:processEvent({
		name = "on_upsell_button_shown"
	})
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.numHiddenItems and tonumber(arg_5_0.numHiddenItems) or 0
	local var_5_1 = "hiddenItem"

	for iter_5_0 = 1, var_5_0 do
		local var_5_2 = arg_5_0[var_5_1 .. iter_5_0]

		if tonumber(var_5_2) == arg_5_1 then
			return true
		end
	end

	local var_5_3 = "item"

	for iter_5_1 = 1, arg_5_0.numItems do
		local var_5_4 = arg_5_0[var_5_3 .. iter_5_1]

		if tonumber(var_5_4) == arg_5_1 then
			return true
		end
	end

	return false
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0 = {}
	local var_6_1 = LOOT.emptyID

	if arg_6_1.type and arg_6_1.ref then
		var_6_1 = LOOT.GetItemID(arg_6_1.type, arg_6_1.ref)

		if arg_6_1.type == LOOT.itemTypes.OPERATOR and OPERATOR.IsS4Operator(arg_6_1.ref) then
			var_6_1 = OPERATOR.GetOperatorActivationID(var_6_1)
		end
	elseif arg_6_1.lootID then
		var_6_1 = arg_6_1.lootID
	end

	local var_6_2

	if var_6_1 ~= nil and var_6_1 ~= "" then
		var_6_2 = Loot.DFGCEHHCEA(var_6_1)
	end

	if var_6_2 then
		for iter_6_0, iter_6_1 in ipairs(var_6_2) do
			local var_6_3 = STORE.BundleAvailable(arg_6_0, iter_6_1)
			local var_6_4 = STORE.IsFirstPartyBundle(iter_6_1)

			if var_6_3 and not var_6_4 then
				local var_6_5 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, tostring(iter_6_1))

				var_6_0[iter_6_1] = CSV.ReadRow(CSV.bundleIDs, var_6_5)
			end
		end
	end

	return var_6_0
end

local function var_0_6(arg_7_0, arg_7_1)
	local var_7_0 = var_0_5(arg_7_0, arg_7_1)

	if not Dvar.IBEGCHEFE("OKMSPKPMLO") then
		for iter_7_0, iter_7_1 in pairs(var_7_0) do
			local var_7_1, var_7_2 = STORE.GetIndexForBundle(iter_7_0, arg_7_0)

			if var_7_1 and var_7_2 then
				return iter_7_1
			end
		end
	else
		local var_7_3 = Engine.CFHBIHABCB(arg_7_0) and OPERATOR.IsMWOperator(arg_7_1.ref)
		local var_7_4 = CONDITIONS.IsWZWipFlowEnabled() and not var_7_3
		local var_7_5 = var_7_4 and Dvar.DHEEJCCJBH("NOTKSOLRMO") or Dvar.DHEEJCCJBH("NQPLOSRSTP") or ""
		local var_7_6 = var_7_4 and Dvar.DHEEJCCJBH("LQQSPONNOK") or Dvar.DHEEJCCJBH("MMOOTLNTNR") or ""
		local var_7_7 = var_7_4 and Dvar.DHEEJCCJBH("LRQOORNNQS") or Dvar.DHEEJCCJBH("OTPQONQQT") or ""
		local var_7_8 = table.concat({
			var_7_5,
			var_7_6,
			var_7_7
		}, ",")
		local var_7_9 = split(var_7_8, ",")

		for iter_7_2, iter_7_3 in ipairs(var_7_9) do
			if var_7_0[tonumber(iter_7_3)] then
				return var_7_0[tonumber(iter_7_3)]
			end
		end
	end
end

local function var_0_7(arg_8_0, arg_8_1)
	if arg_8_1.type == LOOT.itemTypes.OPERATOR then
		return var_0_6(arg_8_0, arg_8_1)
	else
		local var_8_0 = var_0_5(arg_8_0, arg_8_1)
		local var_8_1 = next(var_8_0)

		if var_8_1 then
			return var_8_0[var_8_1]
		end
	end
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	if CONDITIONS.ShouldShowBundleButton() then
		arg_9_0._bundleData = arg_9_2

		if not arg_9_2 then
			arg_9_0:HideButton()
		else
			local var_9_0 = arg_9_0._bundleData.hasOperatorMissions

			arg_9_0._bundleData.hasOperatorMissions = (var_9_0 ~= "" and tonumber(var_9_0) or 0) == 1

			arg_9_0:ShowButton(arg_9_2)

			local function var_9_1(arg_10_0)
				if arg_10_0._bundleData and arg_10_0._isVisible then
					if arg_10_0._preOpenStoreBundlePreviewFunc then
						arg_10_0._preOpenStoreBundlePreviewFunc(arg_10_0)
					end

					local var_10_0 = {
						displayUpsellPopup = true,
						bundleID = tonumber(arg_10_0._bundleData.id),
						rarity = tonumber(arg_10_0._bundleData.rarity),
						description = arg_10_0._bundleData.description,
						bundleType = arg_10_0._bundleData.bundleType,
						titleImage = arg_10_0._bundleData.titleImage,
						currencyID = tonumber(arg_10_0._bundleData.currencyID),
						currencyAmount = tonumber(arg_10_0._bundleData.currencyAmount),
						timerPubVar = arg_10_0._timePubVar
					}

					LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_9_1, false, var_10_0)
				end
			end

			arg_9_0:addEventHandler("button_action", var_9_1)
			arg_9_0:addEventHandler("view_bundle", var_9_1)
		end
	else
		arg_9_0:HideButton()
	end
end

local function var_0_9(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if CONDITIONS.ShouldShowBundleButton() then
		local var_11_0 = var_0_7(arg_11_1, {
			type = arg_11_2,
			ref = arg_11_3
		})

		var_0_8(arg_11_0, arg_11_1, var_11_0)
	else
		arg_11_0:HideButton()
	end
end

local function var_0_10(arg_12_0, arg_12_1, arg_12_2)
	if CONDITIONS.ShouldShowBundleButton() then
		local var_12_0 = var_0_7(arg_12_1, {
			lootID = arg_12_2
		})

		var_0_8(arg_12_0, arg_12_1, var_12_0)
	else
		arg_12_0:HideButton()
	end
end

local function var_0_11(arg_13_0, arg_13_1, arg_13_2)
	if CONDITIONS.ShouldShowBundleButton() then
		local var_13_0 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, arg_13_2)

		if var_13_0 and var_13_0 >= 0 then
			local var_13_1 = CSV.ReadRow(CSV.bundleIDs, var_13_0)

			var_0_8(arg_13_0, arg_13_1, var_13_1)

			return
		end
	end

	arg_13_0:HideButton()
end

local function var_0_12(arg_14_0, arg_14_1, arg_14_2)
	assert(arg_14_0._bundleItems, "Attempt to setup bundle with key before calling CacheBundleItems.")

	if arg_14_0._bundleItems and arg_14_0._bundleItems[arg_14_2] then
		local var_14_0 = arg_14_0._bundleItems[arg_14_2].bundleID

		var_0_11(arg_14_0, arg_14_1, var_14_0)

		return
	end

	arg_14_0:HideButton()
end

local function var_0_13(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._bundleItems = STORE.GetAllItemsInStore(arg_15_1, arg_15_2)
end

local function var_0_14(arg_16_0, arg_16_1)
	arg_16_0._preOpenStoreBundlePreviewFunc = arg_16_1
end

local function var_0_15(arg_17_0, arg_17_1)
	arg_17_0._usePrimary = arg_17_1

	local var_17_0 = arg_17_1 and "MENU/VIEW_BUNDLE_PRIMARY" or "MENU/VIEW_BUNDLE"

	arg_17_0.ViewBundleLabel:setText(Engine.CBBHFCGDIC(var_17_0))
end

local function var_0_16(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_0._isVisible and arg_18_0._bundleData then
		arg_18_2 = arg_18_2 or {}

		if arg_18_0._preOpenStoreBundlePreviewFunc then
			arg_18_0._preOpenStoreBundlePreviewFunc(arg_18_0)
		end

		local var_18_0 = {
			displayUpsellPopup = true,
			bundleID = tonumber(arg_18_0._bundleData.id),
			rarity = tonumber(arg_18_0._bundleData.rarity),
			description = arg_18_0._bundleData.description,
			bundleType = arg_18_0._bundleData.bundleType,
			titleImage = arg_18_0._bundleData.titleImage,
			currencyID = tonumber(arg_18_0._bundleData.currencyID),
			currencyAmount = tonumber(arg_18_0._bundleData.currencyAmount),
			timerPubVar = arg_18_0._timePubVar,
			oneModBlueprintStore = arg_18_2.oneModBlueprintStore,
			upsellMenu = arg_18_0._upsellMenu
		}

		LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_18_1, false, var_18_0)
	end
end

local function var_0_17(arg_19_0, arg_19_1)
	arg_19_0._upsellMenu = arg_19_1
end

local function var_0_18(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0._controllerIndex = arg_20_1
	arg_20_0.SetupUpsellButton = var_0_9
	arg_20_0.SetupUpsellButtonWithLootID = var_0_10
	arg_20_0.SetPreOpenStoreBundlePreviewFunc = var_0_14
	arg_20_0.SetButtonPrimary = var_0_15
	arg_20_0.OpenBundle = var_0_16
	arg_20_0.SetupUpsellButtonWithBundleID = var_0_11
	arg_20_0.SetupUpsellButtonWithKey = var_0_12
	arg_20_0.CacheBundleItems = var_0_13
	arg_20_0.HideButton = var_0_2
	arg_20_0.ShowButton = var_0_3
	arg_20_0.SetUpsellMenu = var_0_17

	arg_20_0:HideButton()
	arg_20_0.BundleImage:SetMask(arg_20_0.Mask)
	arg_20_0:addEventHandler("gamepad_button", function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_0._usePrimary and "primary" or "alt1"

		if arg_21_1.button == var_21_0 and arg_21_1.down then
			arg_21_0:OpenBundle(arg_20_1)
		end
	end)
	arg_20_0:addEventHandler("on_close", function(arg_22_0)
		arg_22_0._preOpenStoreBundlePreviewFunc = nil
	end)
	arg_20_0:addAndCallEventHandler("update_input_type", function(arg_23_0, arg_23_1)
		if LUI.IsLastInputKeyboardMouse(arg_23_1.controllerIndex or arg_20_1) then
			arg_23_0:SetFocusable(true)
		else
			arg_23_0:SetFocusable(false)
			arg_23_0:processEvent({
				name = "lose_focus"
			})
		end
	end)

	if IsLanguageChinese() or IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_20_0, "LimitedTimeCHTAR")
	end

	if not IsLanguageArabic() then
		arg_20_0.LimitedTime:SetIsShort(true)
	end
end

function BundleUpsellButton(arg_24_0, arg_24_1)
	local var_24_0 = LUI.UIButton.new()

	var_24_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 204 * _1080p)

	var_24_0.id = "BundleUpsellButton"
	var_24_0._animationSets = var_24_0._animationSets or {}
	var_24_0._sequences = var_24_0._sequences or {}

	local var_24_1 = arg_24_1 and arg_24_1.controllerIndex

	if not var_24_1 and not Engine.DDJFBBJAIG() then
		var_24_1 = var_24_0:getRootController()
	end

	assert(var_24_1)

	local var_24_2 = var_24_0
	local var_24_3
	local var_24_4 = LUI.UIImage.new()

	var_24_4.id = "BundleImage"

	var_24_4:SetScale(0.35, 0)
	var_24_4:setImage(RegisterMaterial("mw_store_billboard_mother_russia"), 0)
	var_24_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 20, _1080p * 156)
	var_24_0:addElement(var_24_4)

	var_24_0.BundleImage = var_24_4

	local var_24_5
	local var_24_6 = LUI.UIImage.new()

	var_24_6.id = "BundleNameImage"

	var_24_6:setImage(RegisterMaterial("mw_store_title_mother_russia"), 0)
	var_24_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 240, _1080p * 55, _1080p * 170)
	var_24_0:addElement(var_24_6)

	var_24_0.BundleNameImage = var_24_6

	local var_24_7
	local var_24_8 = LUI.UIImage.new()

	var_24_8.id = "TitleDarkener"

	var_24_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_24_8:SetAlpha(0.6, 0)
	var_24_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_24_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_24_0:addElement(var_24_8)

	var_24_0.TitleDarkener = var_24_8

	local var_24_9
	local var_24_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_24_1
	})

	var_24_10.id = "BundleTypeLabel"

	var_24_10.Divider:SetRGBFromTable(SWATCHES.MPArmory.bundleTextFocus, 0)
	var_24_10.Text:SetLeft(0, 0)
	var_24_10.Text:SetRight(0, 0)
	var_24_10.Text:SetRGBFromTable(SWATCHES.MPArmory.bundleTextFocus, 0)
	var_24_10.Text:setText(Engine.CBBHFCGDIC("MENU/BUNDLE_TYPE_OPERATOR"), 0)
	var_24_10.Text:SetAlignment(LUI.Alignment.Center)
	var_24_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_24_0:addElement(var_24_10)

	var_24_0.BundleTypeLabel = var_24_10

	local var_24_11
	local var_24_12 = LUI.UIText.new()

	var_24_12.id = "ViewBundleLabel"

	var_24_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_24_12:setText(Engine.CBBHFCGDIC("MENU/VIEW_BUNDLE"), 0)
	var_24_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_24_12:SetAlignment(LUI.Alignment.Left)
	var_24_12:SetTintFontIcons(true)
	var_24_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 186, _1080p * 210)
	var_24_0:addElement(var_24_12)

	var_24_0.ViewBundleLabel = var_24_12

	local var_24_13
	local var_24_14 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_24_1
	})

	var_24_14.id = "LimitedTime"

	var_24_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -109, _1080p * -6, _1080p * -59, _1080p * -29)
	var_24_0:addElement(var_24_14)

	var_24_0.LimitedTime = var_24_14

	local var_24_15
	local var_24_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_24_1
	})

	var_24_16.id = "HighlightBarBottom"

	var_24_16:SetAlpha(0, 0)
	var_24_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 175, _1080p * 178)
	var_24_0:addElement(var_24_16)

	var_24_0.HighlightBarBottom = var_24_16

	local var_24_17
	local var_24_18 = LUI.UIImage.new()

	var_24_18.id = "Mask"

	var_24_18:setImage(RegisterMaterial("stencil_mask"), 0)
	var_24_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, 0, _1080p * 176)
	var_24_0:addElement(var_24_18)

	var_24_0.Mask = var_24_18

	local function var_24_19()
		return
	end

	var_24_0._sequences.DefaultSequence = var_24_19

	local var_24_20
	local var_24_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("ButtonOver", var_24_21)

	local function var_24_22()
		var_24_16:AnimateSequence("ButtonOver")
	end

	var_24_0._sequences.ButtonOver = var_24_22

	local var_24_23
	local var_24_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_24_16:RegisterAnimationSequence("ButtonUp", var_24_24)

	local function var_24_25()
		var_24_16:AnimateSequence("ButtonUp")
	end

	var_24_0._sequences.ButtonUp = var_24_25

	local var_24_26
	local var_24_27 = {
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

	var_24_14:RegisterAnimationSequence("LimitedTimeCHTAR", var_24_27)

	local function var_24_28()
		var_24_14:AnimateSequence("LimitedTimeCHTAR")
	end

	var_24_0._sequences.LimitedTimeCHTAR = var_24_28

	var_0_18(var_24_0, var_24_1, arg_24_1)

	return var_24_0
end

MenuBuilder.registerType("BundleUpsellButton", BundleUpsellButton)
LockTable(_M)
