module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0._data
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	arg_2_0._data = arg_2_2

	arg_2_0.Selected:SetEquipped(arg_2_3)

	if arg_2_5 then
		ACTIONS.AnimateSequence(arg_2_0, "ShowRestriction")
	else
		ACTIONS.AnimateSequence(arg_2_0, "HideRestriction")
	end

	local var_2_0 = #arg_2_0._data.image > 0 and arg_2_0._data.image or "white"

	if arg_2_0._data.isClassified then
		arg_2_0.Icon:setImage(RegisterMaterial("icon_empty_circle"))
		arg_2_0.Text:setText(Engine.CBBHFCGDIC("CAS/CLASSIFIED"))
	else
		arg_2_0.Icon:setImage(RegisterMaterial(var_2_0))
		arg_2_0.Text:setText(Engine.CBBHFCGDIC(arg_2_0._data.name))
	end

	arg_2_0._data.blockedCategorySlot = ATTACHMENT.GetBlockedCategorySlot(arg_2_0._data.ref, arg_2_4)

	if CONDITIONS.IsWaveGameType() then
		arg_2_0.CPWaveSurvivalCost:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/CURRENCY", tostring(arg_2_0._data.survivalCost)))
	end

	if not arg_2_0._data.unlocked then
		local var_2_1 = arg_2_0._data.gunsmithAttach
		local var_2_2 = PROGRESSION.GetNonPlayerProgressionData({
			_level = var_2_1.level
		})
		local var_2_3 = {
			type = #var_2_1.challengeID > 0 and LOOT.unlockTypes.CHALLENGE or LOOT.unlockTypes.LEVEL,
			level = var_2_2._levelDisplay
		}

		arg_2_0.GenericLock:Setup(var_2_3)
	end

	local var_2_4 = GUNSMITH.IsAttachVariantCategoryBlacklisted(arg_2_4.weapon, ATTACHMENT.GetCategory(arg_2_2.ref))

	if not arg_2_0._handlersAdded then
		arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
			arg_2_0:dispatchEventToCurrentMenu({
				name = "update_showcase",
				attachmentData = arg_3_0._data
			})
			ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")
		end)
		arg_2_0:addEventHandler("button_over_disable", function(arg_4_0, arg_4_1)
			arg_2_0:dispatchEventToCurrentMenu({
				name = "update_showcase",
				attachmentData = arg_4_0._data
			})
			ACTIONS.AnimateSequence(arg_2_0, "ButtonOverDisabled")
		end)
		arg_2_0:addEventHandler("button_disable", function(arg_5_0, arg_5_1)
			ACTIONS.AnimateSequence(arg_2_0, "ButtonUpDisabled")
		end)

		if CONDITIONS.IsWaveGameType() then
			arg_2_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
				if CP.CurrencyGet(arg_6_1.controller) >= tonumber(arg_6_0._data.survivalCost) then
					arg_2_0:dispatchEventToCurrentMenu({
						name = "equip_attachment",
						attachmentData = arg_6_0._data
					})
				else
					Engine.BJDBIAGIDA("ui_select_purchase_deny")
				end
			end)
		else
			arg_2_0:addEventHandler("button_action", function(arg_7_0, arg_7_1)
				arg_2_0:dispatchEventToCurrentMenu({
					name = "equip_attachment",
					attachmentData = arg_7_0._data
				})
			end)
		end

		arg_2_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
			if arg_2_0.NewItemNotification then
				arg_2_0.NewItemNotification:ClearBreadcrumbByID(arg_2_1, arg_2_0._attachmentID, true)
			end

			ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")
		end)

		arg_2_0._handlersAdded = true
	end

	arg_2_0:SetButtonDisabled(not arg_2_0._data.unlocked or arg_2_5)

	arg_2_0._attachmentID = arg_2_0._data.gunsmithAttach.lootID

	if arg_2_0.NewItemNotification and not arg_2_3 then
		arg_2_0.NewItemNotification:UpdateBreadcrumbByID(arg_2_1, arg_2_0._attachmentID, true)
	end
end

local function var_0_2(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_0.Selected)
	assert(arg_9_0.Icon)
	assert(arg_9_0.Text)

	arg_9_0.Setup = var_0_1
	arg_9_0.GetData = var_0_0
end

function AttachmentButton(arg_10_0, arg_10_1)
	local var_10_0 = MenuBuilder.BuildRegisteredType("ProgressionItemButton", arg_10_1)

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 62 * _1080p)

	var_10_0.id = "AttachmentButton"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3

	if not CONDITIONS.AreCDLRulesActive(var_10_1) then
		var_10_3 = MenuBuilder.BuildRegisteredType("GenericLock", {
			controllerIndex = var_10_1
		})
		var_10_3.id = "GenericLock"

		var_10_3:SetAlpha(0, 0)
		var_10_3:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -56, _1080p * -6, _1080p * -25, _1080p * 25)
		var_10_0:addElement(var_10_3)

		var_10_0.GenericLock = var_10_3
	end

	local var_10_4

	if CONDITIONS.IsWaveGameType(var_10_0) then
		local var_10_5 = LUI.UIStyledText.new()

		var_10_5.id = "CPWaveSurvivalCost"

		var_10_5:SetRGBFromInt(8421504, 0)
		var_10_5:SetAlpha(0.6, 0)
		var_10_5:setText("", 0)
		var_10_5:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_5:SetAlignment(LUI.Alignment.Right)
		var_10_5:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_10_5:SetStartupDelay(2000)
		var_10_5:SetLineHoldTime(400)
		var_10_5:SetAnimMoveTime(300)
		var_10_5:SetAnimMoveSpeed(50)
		var_10_5:SetEndDelay(1500)
		var_10_5:SetCrossfadeTime(750)
		var_10_5:SetFadeInTime(300)
		var_10_5:SetFadeOutTime(300)
		var_10_5:SetMaxVisibleLines(1)
		var_10_5:SetOutlineRGBFromInt(0, 0)
		var_10_5:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -177, _1080p * -49, _1080p * 38, _1080p * 62)
		var_10_0:addElement(var_10_5)

		var_10_0.CPWaveSurvivalCost = var_10_5
	end

	local var_10_6
	local var_10_7 = LUI.UIImage.new()

	var_10_7.id = "RestrictionWarning"

	var_10_7:SetAlpha(0, 0)
	var_10_7:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_10_7:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -48, _1080p * -14, _1080p * -17, _1080p * 17)
	var_10_0:addElement(var_10_7)

	var_10_0.RestrictionWarning = var_10_7

	local function var_10_8()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_8

	local var_10_9

	if not CONDITIONS.AreCDLRulesActive(var_10_1) then
		local var_10_10 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_3:RegisterAnimationSequence("ButtonUp", var_10_10)
	end

	local function var_10_11()
		if not CONDITIONS.AreCDLRulesActive(var_10_1) then
			var_10_3:AnimateSequence("ButtonUp")
		end
	end

	var_10_0._sequences.ButtonUp = var_10_11

	local var_10_12

	if not CONDITIONS.AreCDLRulesActive(var_10_1) then
		local var_10_13 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_3:RegisterAnimationSequence("ButtonOver", var_10_13)
	end

	local function var_10_14()
		if not CONDITIONS.AreCDLRulesActive(var_10_1) then
			var_10_3:AnimateSequence("ButtonOver")
		end
	end

	var_10_0._sequences.ButtonOver = var_10_14

	local var_10_15

	if not CONDITIONS.AreCDLRulesActive(var_10_1) then
		local var_10_16 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_3:RegisterAnimationSequence("ButtonOverDisabled", var_10_16)
	end

	local function var_10_17()
		if not CONDITIONS.AreCDLRulesActive(var_10_1) then
			var_10_3:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_10_0._sequences.ButtonOverDisabled = var_10_17

	local var_10_18

	if not CONDITIONS.AreCDLRulesActive(var_10_1) then
		local var_10_19 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_3:RegisterAnimationSequence("ButtonUpDisabled", var_10_19)
	end

	local function var_10_20()
		if not CONDITIONS.AreCDLRulesActive(var_10_1) then
			var_10_3:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_10_0._sequences.ButtonUpDisabled = var_10_20

	local var_10_21
	local var_10_22 = {
		{
			value = 1,
			duration = 30,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_7:RegisterAnimationSequence("ShowRestriction", var_10_22)

	local function var_10_23()
		var_10_7:AnimateSequence("ShowRestriction")
	end

	var_10_0._sequences.ShowRestriction = var_10_23

	local var_10_24
	local var_10_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_7:RegisterAnimationSequence("HideRestriction", var_10_25)

	local function var_10_26()
		var_10_7:AnimateSequence("HideRestriction")
	end

	var_10_0._sequences.HideRestriction = var_10_26

	var_0_2(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("AttachmentButton", AttachmentButton)
LockTable(_M)
