module(..., package.seeall)

local var_0_0 = 20 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	assert(arg_1_1)

	local var_1_0 = MenuBuilder.BuildRegisteredType("WZLookForPartyStatusItem", {
		controllerIndex = arg_1_0._controllerIndex
	})

	var_1_0.id = "WZLookForPartyStatusItem" .. arg_1_1.index

	var_1_0:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 104, _1080p * 164)
	arg_1_0:addElement(var_1_0)
	var_1_0:SetData(arg_1_1)

	return var_1_0, var_1_0:GetWidgetHeight()
end

local function var_0_2(arg_2_0)
	local var_2_0 = Lobby.GetLookForPartyStatusPanelData()

	if not var_2_0 or next(var_2_0) == nil then
		return
	end

	local var_2_1 = 1
	local var_2_2 = {}

	for iter_2_0, iter_2_1 in pairs(var_2_0) do
		local var_2_3 = {}
		local var_2_4 = {}
		local var_2_5 = ""

		var_2_3.categoryName = Engine.CBBHFCGDIC(iter_2_0)
		var_2_3.index = var_2_1

		for iter_2_2, iter_2_3 in pairs(iter_2_1.selectionData) do
			if iter_2_3.string then
				if var_2_5 ~= "" then
					var_2_5 = var_2_5 .. ", "
				end

				var_2_5 = var_2_5 .. iter_2_3.string
				var_2_3.selections = var_2_5
			end

			if iter_2_3.icon then
				table.insert(var_2_4, RegisterMaterial(iter_2_3.icon))
			end
		end

		var_2_3.icons = var_2_4
		var_2_2[var_2_1] = var_2_3
		var_2_1 = var_2_1 + 1
	end

	local var_2_6 = 0

	if #arg_2_0._statusitems < #var_2_2 then
		local var_2_7
		local var_2_8
		local var_2_9 = 0

		for iter_2_4, iter_2_5 in pairs(var_2_2) do
			local var_2_10, var_2_11 = var_0_1(arg_2_0, iter_2_5)

			if iter_2_4 > 1 then
				var_2_9 = var_2_9 + arg_2_0._statusitems[iter_2_4 - 1]:GetWidgetHeight()
			end

			var_2_10:SetTop(arg_2_0._baseHeight + var_2_9 + var_0_0)

			var_2_6 = arg_2_0._baseHeight + var_2_11 + var_2_9

			var_2_10:SetBottom(var_2_6)
			var_2_10:setHeight(var_2_11)

			arg_2_0._statusitems[iter_2_4] = var_2_10
		end

		arg_2_0:setHeight(var_2_6 + arg_2_0._footerHeight)
	end
end

local function var_0_3(arg_3_0)
	local var_3_0
	local var_3_1
	local var_3_2 = Lobby.LOOK_FOR_PARTY_OPTIONS._isSearchingForGroup ~= true and "MENU/MY_PARTY_SETTINGS" or (Lobby.LOOK_FOR_PARTY_OPTIONS._isInParty ~= true or Lobby.LOOK_FOR_PARTY_OPTIONS._currentPlayerCount <= 1) and "MENU/LOOKING_FOR_PARTY" or Lobby.LOOK_FOR_PARTY_OPTIONS._requiredPlayerCount == 0 and "MENU/PARTY_FULL" or "LUA_MENU/PARTY_SETTINGS"
	local var_3_3 = Lobby.LOOK_FOR_PARTY_OPTIONS._isInParty == true and Lobby.LOOK_FOR_PARTY_OPTIONS._isHost ~= true and "MENU/PARTY_SETTINGS_DESC_CLIENT" or "MENU/PARTY_SETTINGS_DESC"
	local var_3_4 = ToUpperCase(Engine.CBBHFCGDIC(var_3_2))
	local var_3_5 = Engine.CBBHFCGDIC(var_3_3)

	arg_3_0.StatusHeader:setText(var_3_4)
	arg_3_0.StatusDescription:setText(var_3_5)

	local var_3_6, var_3_7, var_3_8, var_3_9 = arg_3_0.StatusHeader:getLocalRect()
	local var_3_10 = var_3_7 + LAYOUT.GetTextHeightWithWrapping(arg_3_0.StatusHeader, var_3_4)
	local var_3_11 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.StatusDescription, var_3_5)
	local var_3_12, var_3_13, var_3_14, var_3_15 = arg_3_0.StatusHeader:getLocalRect()
	local var_3_16, var_3_17, var_3_18, var_3_19

	arg_3_0._baseHeight, var_3_16, var_3_17, var_3_18, var_3_19 = var_3_10 + var_3_13 + var_3_11, arg_3_0.SquadIcon:getLocalRect()
	arg_3_0._footerHeight = var_3_19 - var_3_17 + var_0_0 * 2

	var_0_2(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0, "Show")
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0.UpdateStatusHeaderAndDesc = var_0_3
	arg_4_0.UpdateView = var_0_2
	arg_4_0._baseHeight = 0
	arg_4_0._footerHeight = 0
	arg_4_0._statusitems = {}

	ACTIONS.AnimateSequence(arg_4_0, "Hide")
	arg_4_0:registerEventHandler("update_lfp_status_panel", function(arg_5_0, arg_5_1)
		for iter_5_0, iter_5_1 in pairs(arg_5_0._statusitems) do
			iter_5_1:closeTree()

			arg_5_0._statusitems[iter_5_0] = nil
		end
	end)
end

function WZLookForPartyStatusPanel(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 480 * _1080p, 0, 435 * _1080p)

	var_6_0.id = "WZLookForPartyStatusPanel"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Background"

	var_6_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_6_4:SetAlpha(0.5, 0)
	var_6_4:setImage(RegisterMaterial("ui_mp_wz_bkg_challenge"), 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 480, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIStyledText.new()

	var_6_6.id = "StatusHeader"

	var_6_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_6_6:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/MY_PARTY_SETTINGS")), 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_6:SetWordWrap(false)
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_6:SetStartupDelay(1000)
	var_6_6:SetLineHoldTime(400)
	var_6_6:SetAnimMoveTime(250)
	var_6_6:SetAnimMoveSpeed(20)
	var_6_6:SetEndDelay(1000)
	var_6_6:SetCrossfadeTime(400)
	var_6_6:SetFadeInTime(300)
	var_6_6:SetFadeOutTime(300)
	var_6_6:SetMaxVisibleLines(1)
	var_6_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 11, _1080p * 41)
	var_6_0:addElement(var_6_6)

	var_6_0.StatusHeader = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIText.new()

	var_6_8.id = "StatusDescription"

	var_6_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_6_8:setText(Engine.CBBHFCGDIC("MENU/PARTY_SETTINGS_DESC"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 48, _1080p * 66)
	var_6_0:addElement(var_6_8)

	var_6_0.StatusDescription = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "BETAFooter"

	var_6_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_6_10:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/BETA"), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 70, _1080p * -20, _1080p * -46, _1080p * -22)
	var_6_0:addElement(var_6_10)

	var_6_0.BETAFooter = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "SquadIcon"

	var_6_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_6_12:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 20, _1080p * 60, _1080p * -54, _1080p * -14)
	var_6_0:addElement(var_6_12)

	var_6_0.SquadIcon = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "FooterLine"

	var_6_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_6_14:SetAlpha(0.45, 0)
	var_6_14:setImage(RegisterMaterial("line_dot_ch2"), 0)
	var_6_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 20, _1080p * -20, _1080p * -68, _1080p * -66)
	var_6_0:addElement(var_6_14)

	var_6_0.FooterLine = var_6_14

	local function var_6_15()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_15

	local var_6_16
	local var_6_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Hide", var_6_17)

	local var_6_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Hide", var_6_18)

	local var_6_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Hide", var_6_19)

	local var_6_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Hide", var_6_20)

	local var_6_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Hide", var_6_21)

	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Hide", var_6_22)

	local function var_6_23()
		var_6_4:AnimateSequence("Hide")
		var_6_6:AnimateSequence("Hide")
		var_6_8:AnimateSequence("Hide")
		var_6_10:AnimateSequence("Hide")
		var_6_12:AnimateSequence("Hide")
		var_6_14:AnimateSequence("Hide")
	end

	var_6_0._sequences.Hide = var_6_23

	local var_6_24
	local var_6_25 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Show", var_6_25)

	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Show", var_6_26)

	local var_6_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Show", var_6_27)

	local var_6_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Show", var_6_28)

	local var_6_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Show", var_6_29)

	local var_6_30 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_14:RegisterAnimationSequence("Show", var_6_30)

	local function var_6_31()
		var_6_4:AnimateSequence("Show")
		var_6_6:AnimateSequence("Show")
		var_6_8:AnimateSequence("Show")
		var_6_10:AnimateSequence("Show")
		var_6_12:AnimateSequence("Show")
		var_6_14:AnimateSequence("Show")
	end

	var_6_0._sequences.Show = var_6_31

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WZLookForPartyStatusPanel", WZLookForPartyStatusPanel)
LockTable(_M)
