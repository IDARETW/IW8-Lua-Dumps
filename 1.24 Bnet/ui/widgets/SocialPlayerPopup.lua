module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0)
	local var_1_0 = Friends.CCBABDAGGJ(arg_1_0._playerData.controllerIndex, arg_1_0._playerData.xuid, arg_1_0._playerData.platformId, arg_1_0._playerData.selectedTab)

	if not var_1_0.isValidEntry then
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true)

		return
	end

	arg_1_0._playerData.background = var_1_0.background
	arg_1_0._playerData.presence = var_1_0.presence
	arg_1_0._playerData.presencePlatform = var_1_0.presencePlatform
	arg_1_0._playerData.inputType = var_1_0.inputType

	local var_1_1 = ""
	local var_1_2 = ""

	if arg_1_0._playerData.isRegiments then
		if arg_1_0._playerData.role == OnlineClanRole.OWNER then
			var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEADER")
		elseif arg_1_0._playerData.role == OnlineClanRole.OFFICER then
			var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_OFFICER")
		end
	elseif not arg_1_0._playerData.isPartyMember then
		var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/OFFLINE")

		if arg_1_0._playerData.presence ~= nil and #arg_1_0._playerData.presence > 0 and arg_1_0._playerData.onlineStatus ~= BattleNetOnlineStatus.APPEAR_OFFLINE then
			var_1_1 = Engine.JCBDICCAH(arg_1_0._playerData.presence)
		end

		var_1_2 = Engine.CBBHFCGDIC("MENU/NOT_JOINABLE")

		if arg_1_0._playerData.joinable then
			var_1_2 = Engine.CBBHFCGDIC("MENU/JOINABLE")
		end
	end

	arg_1_0.JoinableText:setText(var_1_2)
	arg_1_0.PresenceText:setText(var_1_1)

	arg_1_0._playerData.hideRank = true

	arg_1_0.PlayerDetails:SetupPlayerDetails(arg_1_0._playerData)

	arg_1_0:Wait(1000).onComplete = function()
		return var_0_1(arg_1_0, options)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.PlayerDetails)
	assert(arg_3_0.MenuTitle)
	assert(arg_3_2.isRegiments ~= nil)
	arg_3_0.MenuTitle:SetTitle(ToUpperCase(arg_3_2.fullName))
	arg_3_0.MenuTitle.MenuTitle:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end

	arg_3_0._playerData = arg_3_2

	var_0_1(arg_3_0)
	arg_3_0:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_0:GetCurrentMenu()

		FRIENDS.RegisterPlatformIdForViewProfileEventOnMenu(var_4_0, arg_3_1)
	end)
end

function SocialPlayerPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "SocialPlayerPopup"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("SocialPlayerActions", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "PlayerActions"

	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 650, _1080p * 388, _1080p * 1000)
	var_5_0:addElement(var_5_4)

	var_5_0.PlayerActions = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "MenuTitle"

	var_5_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PLAYER_DETAILS")), 0)
	var_5_6.Line:SetLeft(0, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_6)

	var_5_0.MenuTitle = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("SocialPlayerDetails", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "PlayerDetails"

	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 139, _1080p * 659, _1080p * 192, _1080p * 316)
	var_5_0:addElement(var_5_8)

	var_5_0.PlayerDetails = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "JoinableText"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Right)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 399, _1080p * 552, _1080p * 316, _1080p * 338)
	var_5_0:addElement(var_5_10)

	var_5_0.JoinableText = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "PresenceText"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 144, _1080p * 390, _1080p * 316, _1080p * 338)
	var_5_0:addElement(var_5_12)

	var_5_0.PresenceText = var_5_12

	local function var_5_13()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_13

	local var_5_14
	local var_5_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 346
		}
	}

	var_5_10:RegisterAnimationSequence("AR", var_5_15)

	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 346
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_16)

	local function var_5_17()
		var_5_10:AnimateSequence("AR")
		var_5_12:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_17

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SocialPlayerPopup", SocialPlayerPopup)
LockTable(_M)
