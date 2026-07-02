module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = {
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon1
		},
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon2
		},
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon3
		}
	}

	local function var_1_1()
		for iter_2_0 = 1, #var_1_0 do
			if not var_1_0[iter_2_0].isUsed then
				var_1_0[iter_2_0].isUsed = true

				local var_2_0 = var_1_0[iter_2_0].icon

				var_2_0:SetAlpha(1)

				return var_2_0
			end
		end
	end

	local var_1_2 = PlaylistUtils.DoesCategoryContainXPBoost(arg_1_0.categoryDataSource, controllerIndex)

	if var_1_2 and #var_1_2 >= 1 then
		for iter_1_0, iter_1_1 in pairs(var_1_2) do
			if iter_1_0 == LOOT.doubleXpTypes.XP and iter_1_1 then
				var_1_1():setImage(RegisterMaterial("icon_double_xp_mini"), 0)
			elseif iter_1_0 == LOOT.doubleXpTypes.WEAPON and iter_1_1 then
				var_1_1():setImage(RegisterMaterial("icon_double_weapon_xp_mini"), 0)
			elseif iter_1_0 == LOOT.doubleXpTypes.BATTLE_PASS and iter_1_1 then
				var_1_1():setImage(RegisterMaterial("icon_double_battle_xp_mini"), 0)
			end
		end
	end

	if IsLanguageArabic() then
		local var_1_3 = 0

		for iter_1_2 = 1, #var_1_0 do
			if var_1_0[iter_1_2].isUsed then
				var_1_3 = var_1_3 + 1
			end
		end

		if var_1_3 > 0 then
			ACTIONS.AnimateSequence(arg_1_0.PlayButton, "ARIcons" .. var_1_3)
		end
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.categoryDataSource = arg_3_2
	arg_3_0.isNewPlaylist = PlaylistUtils.ContainsNewPlaylist(arg_3_1, arg_3_2)
	arg_3_0.id = "BRPlayButton" .. tostring(arg_3_2.index:GetValue(arg_3_1))

	local var_3_0 = arg_3_0.NewItemNotification

	if var_3_0 then
		var_3_0:SetAlpha(arg_3_0.isNewPlaylist and 1 or 0)
	end

	arg_3_0.PlayButton.Text:setText(ToUpperCase(arg_3_2.name:GetValue(arg_3_1)))
	var_0_0(arg_3_0)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.Setup = var_0_1

	local function var_4_0()
		LUI.FlowManager.RequestAddMenu("BRPlaylistMenu", false, arg_4_1, false, {
			openFromPlaylist = true,
			dataSource = arg_4_0.categoryDataSource
		})
	end

	local function var_4_1(arg_6_0, arg_6_1)
		if not Engine.FIDIEBFAG(arg_6_1.controller) then
			local var_6_0 = {
				controllerIndex = arg_6_1.controller,
				onAccept = var_4_0,
				crossplayRecommended = Engine.CIEGIACHAE()
			}

			LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_6_1.controller, false, var_6_0)
		elseif Lobby.IsSplitScreenEnabled() and not PlaylistUtils.DoesCategorySupportSplitScreen(arg_4_0.categoryDataSource, arg_4_1) then
			LUI.FlowManager.RequestPopupMenu(nil, "SplitScreenPopups", true, arg_4_1, false, {
				isSplitScreenWarning = true,
				controllerIndex = arg_4_1,
				text = arg_4_0.categoryDataSource.name:GetValue(arg_4_1)
			})
		else
			var_4_0()
		end
	end

	arg_4_0.PlayButton:registerEventHandler("button_action", var_4_1)
	arg_4_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		arg_7_0.PlayButton.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_4_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		arg_8_0.PlayButton.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		arg_9_0.PlayButton.Text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_10_0, arg_10_1)
		arg_10_0.PlayButton.Text:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function BRPlayButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p)

	var_11_0.id = "BRPlayButton"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("PlaylistButtonSlim", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "PlayButton"

	var_11_4.Text:SetLeft(_1080p * 20, 0)
	var_11_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PLAYLIST")), 0)
	var_11_4.Text:SetAlignment(LUI.Alignment.Left)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_11_0:addElement(var_11_4)

	var_11_0.PlayButton = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "NewItemNotification"

	var_11_6:SetAlpha(0, 0)
	var_11_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -25, _1080p * -17, _1080p * -4, _1080p * 4)
	var_11_0:addElement(var_11_6)

	var_11_0.NewItemNotification = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "ModifierIcon1"

	var_11_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_8:SetAlpha(0, 0)
	var_11_8:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 370, _1080p * 400, _1080p * 10, _1080p * 40)
	var_11_0:addElement(var_11_8)

	var_11_0.ModifierIcon1 = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "ModifierIcon2"

	var_11_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_10:SetAlpha(0, 0)
	var_11_10:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 340, _1080p * 370, _1080p * 10, _1080p * 40)
	var_11_0:addElement(var_11_10)

	var_11_0.ModifierIcon2 = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIImage.new()

	var_11_12.id = "ModifierIcon3"

	var_11_12:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_12:SetAlpha(0, 0)
	var_11_12:setImage(RegisterMaterial("icon_double_weapon_xp"), 0)
	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 310, _1080p * 340, _1080p * 10, _1080p * 40)
	var_11_0:addElement(var_11_12)

	var_11_0.ModifierIcon3 = var_11_12

	local function var_11_13()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_13

	local var_11_14
	local var_11_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 27
		}
	}

	var_11_6:RegisterAnimationSequence("AR", var_11_15)

	local var_11_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 64
		}
	}

	var_11_8:RegisterAnimationSequence("AR", var_11_16)

	local var_11_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 94
		}
	}

	var_11_10:RegisterAnimationSequence("AR", var_11_17)

	local var_11_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 124
		}
	}

	var_11_12:RegisterAnimationSequence("AR", var_11_18)

	local function var_11_19()
		var_11_6:AnimateSequence("AR")
		var_11_8:AnimateSequence("AR")
		var_11_10:AnimateSequence("AR")
		var_11_12:AnimateSequence("AR")
	end

	var_11_0._sequences.AR = var_11_19

	var_0_2(var_11_0, var_11_1, arg_11_1)

	if CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequenceByElement(var_11_0, {
			elementPath = "self.PlayButton",
			sequenceName = "HasModsAR",
			elementName = "PlayButton"
		})
	end

	if not CONDITIONS.IsArabic() then
		ACTIONS.AnimateSequenceByElement(var_11_0, {
			elementPath = "self.PlayButton",
			sequenceName = "HasMods",
			elementName = "PlayButton"
		})
	end

	return var_11_0
end

MenuBuilder.registerType("BRPlayButton", BRPlayButton)
LockTable(_M)
