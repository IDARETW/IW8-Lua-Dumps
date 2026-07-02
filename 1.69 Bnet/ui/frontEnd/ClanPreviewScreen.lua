module(..., package.seeall)

local var_0_0 = "CLANS/CLAN_ERROR"

local function var_0_1(arg_1_0)
	ACTIONS.LeaveMenu(arg_1_0)
end

local function var_0_2(arg_2_0, arg_2_1)
	return
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	LUI.FlowManager.RequestPopupMenu(arg_3_0, "PopupOK", true, arg_3_1, false, {
		title = Engine.CBBHFCGDIC(arg_3_2),
		message = Engine.CBBHFCGDIC(arg_3_3)
	})
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	if Clans2.BCDHJBCEGJ(arg_4_1, arg_4_2.clanId) then
		arg_4_0.SetupActionButtonStates(arg_4_0, arg_4_2)
	else
		var_0_3(arg_4_0, arg_4_1, var_0_0, "CLANS/FAILED_TO_SEND_INVITE_REQUEST")
	end
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	if Clans2.BCDHJBCEGJ(arg_5_1, arg_5_2.clanId) then
		CLANS.DispatchClanNotification(arg_5_0, Engine.CBBHFCGDIC("CLANS/INVITE_REQUEST_SENT"), Engine.CBBHFCGDIC("CLANS/NAME_AND_TAG", Engine.JCBDICCAH(arg_5_2.clanTag), Engine.JCBDICCAH(arg_5_2.clanName)))
		arg_5_0.SetupActionButtonStates(arg_5_0, arg_5_2)
	else
		var_0_3(arg_5_0, arg_5_1, var_0_0, "CLANS/FAILED_TO_SEND_INVITE_REQUEST")
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	if Clans2.CFGBBBHFHB(arg_6_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "PopupOK", true, arg_6_1, false, {
			message = Engine.CBBHFCGDIC("CLANS/ALREADY_IN_CLAN_POPUP")
		})
	elseif Clans2.IEHDGEGJC(arg_6_1, arg_6_2.clanId) then
		arg_6_0.SetupActionButtonStates(arg_6_0, arg_6_2)
	else
		var_0_3(arg_6_0, arg_6_1, var_0_0, "CLANS/FAILED_CLAN_ACCEPT_INVITE")
	end
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2)
	if Clans2.DJIFJAAFAI(arg_7_1, arg_7_2.clanId) then
		arg_7_0.SetupActionButtonStates(arg_7_0, arg_7_2)
	else
		var_0_3(arg_7_0, arg_7_1, var_0_0, "CLANS/FAILED_CLAN_DECLINE_INVITE")
	end
end

local function var_0_8(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0._clanDetails
	local var_8_1 = arg_8_0._controllerIndex
	local var_8_2 = Clans2.CFGBBBHFHB(var_8_1)
	local var_8_3 = var_8_2 and var_8_0 and var_8_2 == var_8_0.clanId or false
	local var_8_4 = false
	local var_8_5 = Clans2.EBDFICHCEJ(var_8_1)

	for iter_8_0 = 1, #var_8_5 do
		if var_8_5[iter_8_0].clanId == var_8_0.clanId then
			var_8_4 = true

			break
		end
	end

	arg_8_0.ClanActionLabel:SetAlpha(0)
	ACTIONS.AnimateSequence(arg_8_0.ClanPreviewActionButton1, "CenterText")
	ACTIONS.AnimateSequence(arg_8_0.ClanPreviewActionButton2, "CenterText")

	if var_8_3 then
		arg_8_0.ClanPreviewActionButton1:SetAlpha(0)
		arg_8_0.ClanPreviewActionButton2:SetAlpha(0)
		arg_8_0.ClanPreviewActionButton1:registerEventHandler("button_action", var_0_2)
		arg_8_0.ClanPreviewActionButton2:registerEventHandler("button_action", var_0_2)
		arg_8_0.ClanActionLabel:SetAlpha(1)
		arg_8_0.ClanActionLabel:setText(Engine.CBBHFCGDIC("CLANS/ALREADY_IN_CLAN"))
	elseif var_8_4 then
		arg_8_0.ClanPreviewActionButton2:SetAlpha(1)
		arg_8_0.ClanPreviewActionButton2.Text:setText(Engine.CBBHFCGDIC("CLANS/DECLINE_INCOMING_INVITE"))
		arg_8_0.ClanPreviewActionButton2:registerEventHandler("button_action", function(arg_9_0, arg_9_1)
			var_0_7(arg_8_0, arg_8_0._controllerIndex, var_8_0)
		end)
		arg_8_0.ClanPreviewActionButton1:SetAlpha(1)
		arg_8_0.ClanPreviewActionButton1.Text:setText(Engine.CBBHFCGDIC("CLANS/ACCEPT_INCOMING_INVITE"))
		arg_8_0.ClanPreviewActionButton1:registerEventHandler("button_action", function(arg_10_0, arg_10_1)
			var_0_6(arg_8_0, arg_8_0._controllerIndex, var_8_0)
		end)
	elseif var_8_0.clanPrivacy == CLANS.CLAN_PRIVACY_LEVEL.OPEN then
		arg_8_0.ClanPreviewActionButton2:SetAlpha(0)
		arg_8_0.ClanPreviewActionButton2:registerEventHandler("button_action", var_0_2)
		arg_8_0.ClanPreviewActionButton1:SetAlpha(1)
		arg_8_0.ClanPreviewActionButton1.Text:setText(Engine.CBBHFCGDIC("CLANS/JOIN_CLAN"))
		arg_8_0.ClanPreviewActionButton1:registerEventHandler("button_action", function(arg_11_0, arg_11_1)
			var_0_4(arg_8_0, arg_8_0._controllerIndex, var_8_0)
		end)
	elseif var_8_0.clanPrivacy == CLANS.CLAN_PRIVACY_LEVEL.INVITE_ONLY then
		arg_8_0.ClanPreviewActionButton1:SetAlpha(0)
		arg_8_0.ClanPreviewActionButton2:SetAlpha(0)
		arg_8_0.ClanPreviewActionButton1:registerEventHandler("button_action", var_0_2)
		arg_8_0.ClanPreviewActionButton2:registerEventHandler("button_action", var_0_2)
		arg_8_0.ClanActionLabel:SetAlpha(1)
		arg_8_0.ClanActionLabel:setText(Engine.CBBHFCGDIC(CLANS.CLAN_PRIVACY_LEVEL_STRINGS[CLANS.CLAN_PRIVACY_LEVEL.INVITE_ONLY]))
	elseif var_8_0.clanPrivacy == CLANS.CLAN_PRIVACY_LEVEL.BY_REQUEST then
		arg_8_0.ClanPreviewActionButton2:SetAlpha(0)
		arg_8_0.ClanPreviewActionButton2:registerEventHandler("button_action", var_0_2)
		arg_8_0.ClanPreviewActionButton1:SetAlpha(1)
		arg_8_0.ClanPreviewActionButton1.Text:setText(Engine.CBBHFCGDIC("CLANS/REQUEST_TO_JOIN_CLAN"))
		arg_8_0.ClanPreviewActionButton1:registerEventHandler("button_action", function(arg_12_0, arg_12_1)
			var_0_5(arg_8_0, arg_8_0._controllerIndex, var_8_0)
		end)
	end
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	ACTIONS.AnimateSequence(arg_13_1, "CenterText")

	local var_13_0 = arg_13_2
	local var_13_1 = CLANS.CLAN_LABEL_STRINGS[arg_13_0._clanTags[var_13_0 + 1]]

	arg_13_1.Label:setText(Engine.CBBHFCGDIC(var_13_1))
end

local function var_0_10(arg_14_0, arg_14_1)
	local var_14_0 = Engine.CBBHFCGDIC("CLANS/NAME_AND_TAG", Engine.JCBDICCAH(arg_14_1.clanTag), Engine.JCBDICCAH(arg_14_1.clanName))

	arg_14_0.ClanTagAndName:setText(var_14_0)
	arg_14_0.ClanMembersCount:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", tostring(arg_14_1.numClanMembers), tostring(arg_14_1.numClanMembersMax or CLANS.MAX_NUM_CLAN_MEMBERS)))

	if not CONDITIONS.AreClanDescriptionsDisabled() then
		arg_14_0.ClanDescription:setText(arg_14_1.clanDescription or arg_14_1.clanProfile.profileDescription)
	end

	if arg_14_1.clanPrivacyLevel then
		local var_14_1 = CLANS.CLAN_PRIVACY_LEVEL_STRINGS[arg_14_1.clanPrivacyLevel]

		arg_14_0.ClanPrivacy:setText(Engine.CBBHFCGDIC(var_14_1))
	else
		local var_14_2 = Clans2.CCHEAGFIID(arg_14_0._controllerIndex, arg_14_1)

		if var_14_2 then
			arg_14_0.ClanPrivacy:setText(Engine.CBBHFCGDIC(CLANS.CLAN_PRIVACY_LEVEL_STRINGS[var_14_2]))
		end
	end

	local var_14_3 = arg_14_1.emblemData or arg_14_1.clanProfile.emblem

	if not var_14_3 then
		arg_14_0.ClanEmblemWidget:SetAlpha(0)
	else
		arg_14_0.ClanEmblemWidget:SetAlpha(1)
		arg_14_0.ClanEmblemWidget:SetEmblem(var_14_3, true)
	end

	local var_14_4 = CLANS.GetClanOwnerPlayerData(arg_14_0._controllerIndex, arg_14_1)

	if var_14_4 then
		arg_14_0.ClanGamerTag:SetupPlayerData(var_14_4)
	end

	arg_14_0.ClanGamerTag:SetAlpha(var_14_4 and 1 or 0)

	arg_14_1.clanPrivacy = arg_14_1.clanPrivacy or arg_14_1.clanPrivacyLevel

	var_0_8(arg_14_0, arg_14_1)
	Clans2.BJFEDEICAC(arg_14_0._controllerIndex, arg_14_1.clanId)
end

local function var_0_11(arg_15_0)
	local var_15_0 = LUI.UIBindButton.new()

	var_15_0.id = "selfBindButton"

	arg_15_0:addElement(var_15_0)

	arg_15_0._bindButton = var_15_0

	arg_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_15_0._bindButton:addEventHandler("button_secondary", function(arg_16_0, arg_16_1)
		var_0_1(arg_15_0)
	end)
end

local function var_0_12(arg_17_0, arg_17_1, arg_17_2)
	assert(arg_17_2.clanDetails)

	arg_17_0.SetupActionButtonStates = var_0_8
	arg_17_0._controllerIndex = arg_17_1
	arg_17_0._clanTags = {}

	local var_17_0 = arg_17_2.clanDetails

	arg_17_0._clanDetails = var_17_0

	arg_17_0.LabelsGrid:SetSnapOnWrapEnabled(true)
	arg_17_0.LabelsGrid:SetNumChildren(0)
	arg_17_0.LabelsGrid:SetRefreshChild(function(arg_18_0, arg_18_1, arg_18_2)
		var_0_9(arg_17_0, arg_18_0, arg_18_1, arg_18_2)
	end)
	arg_17_0.LabelsGrid:RefreshContent()
	arg_17_0.ClanLeaderLabel:setText(Engine.CBBHFCGDIC("CLANS/CLAN_LEADER_NAME", Engine.JCBDICCAH("")))
	var_0_10(arg_17_0, var_17_0)
	var_0_11(arg_17_0)
	arg_17_0:registerEventHandler(CLANS.CLAN_EVENTS.CLAN_SEARCH_TAGS, function(arg_19_0, arg_19_1)
		arg_17_0._clanTags = {}

		local var_19_0 = 0

		if arg_19_1.success then
			for iter_19_0, iter_19_1 in ipairs(arg_19_1.keys) do
				local var_19_1 = iter_19_1.key
				local var_19_2 = iter_19_1.values

				for iter_19_2, iter_19_3 in pairs(var_19_2) do
					table.insert(arg_17_0._clanTags, iter_19_3)
				end
			end

			var_19_0 = #arg_17_0._clanTags

			arg_17_0.LabelsGrid:SetNumChildren(var_19_0)
			arg_17_0.LabelsGrid:RefreshContent()
		end

		if var_19_0 == 0 then
			arg_17_0.EmptyLabels:SetAlpha(1)
		else
			arg_17_0.EmptyLabels:SetAlpha(0)
		end
	end)
	arg_17_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/CLAN_PREVIEW_HEADER"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_17_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_17_0, arg_17_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

function ClanPreviewScreen(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIVerticalNavigator.new()

	var_20_0.id = "ClanPreviewScreen"

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	var_20_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_20_1
	})
	var_20_0.HelperBar.id = "HelperBar"

	var_20_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_20_0.HelperBar:setPriority(10)
	var_20_0:addElement(var_20_0.HelperBar)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = LUI.UIText.new()

	var_20_4.id = "ClanTagAndName"

	var_20_4:setText("WWWWW", 0)
	var_20_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_20_4:SetAlignment(LUI.Alignment.Left)
	var_20_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 592, _1080p * 305, _1080p * 355)
	var_20_0:addElement(var_20_4)

	var_20_0.ClanTagAndName = var_20_4

	local var_20_5
	local var_20_6 = LUI.UIText.new()

	var_20_6.id = "ClanLeaderLabel"

	var_20_6:setText(ToUpperCase(Engine.CBBHFCGDIC("CLANS/CLAN_LEADER_NAME")), 0)
	var_20_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_20_6:SetAlignment(LUI.Alignment.Left)
	var_20_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 209, _1080p * 370, _1080p * 406)
	var_20_0:addElement(var_20_6)

	var_20_0.ClanLeaderLabel = var_20_6

	local var_20_7
	local var_20_8 = MenuBuilder.BuildRegisteredType("ClanGamerTagWidget", {
		controllerIndex = var_20_1
	})

	var_20_8.id = "ClanGamerTag"

	var_20_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 186, _1080p * 732, _1080p * 370, _1080p * 410)
	var_20_0:addElement(var_20_8)

	var_20_0.ClanGamerTag = var_20_8

	local var_20_9
	local var_20_10 = LUI.UIText.new()

	var_20_10.id = "ClanMembers"

	var_20_10:setText(ToUpperCase(Engine.CBBHFCGDIC("CLANS/CLAN_MEMBERS_COLON")), 0)
	var_20_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_20_10:SetAlignment(LUI.Alignment.Left)
	var_20_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 159, _1080p * 424, _1080p * 460)
	var_20_0:addElement(var_20_10)

	var_20_0.ClanMembers = var_20_10

	local var_20_11
	local var_20_12 = LUI.UIText.new()

	var_20_12.id = "ClanMembersCount"

	var_20_12:setText("2/250", 0)
	var_20_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_12:SetAlignment(LUI.Alignment.Left)
	var_20_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 163, _1080p * 291, _1080p * 424, _1080p * 460)
	var_20_0:addElement(var_20_12)

	var_20_0.ClanMembersCount = var_20_12

	local var_20_13
	local var_20_14 = LUI.UIText.new()

	var_20_14.id = "ClanDescription"

	var_20_14:setText("", 0)
	var_20_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_14:SetAlignment(LUI.Alignment.Left)
	var_20_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 500, _1080p * 582, _1080p * 612)
	var_20_0:addElement(var_20_14)

	var_20_0.ClanDescription = var_20_14

	local var_20_15
	local var_20_16 = LUI.UIText.new()

	var_20_16.id = "ClanLabel"

	var_20_16:setText(ToUpperCase(Engine.CBBHFCGDIC("CLANS/CLAN_LABELS")), 0)
	var_20_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_20_16:SetAlignment(LUI.Alignment.Left)
	var_20_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 500, _1080p * 730, _1080p * 768)
	var_20_0:addElement(var_20_16)

	var_20_0.ClanLabel = var_20_16

	local var_20_17
	local var_20_18 = LUI.UIText.new()

	var_20_18.id = "ClanPerkDesc"

	var_20_18:setText(Engine.CBBHFCGDIC("CLANS/CLAN_PERK_DESC"), 0)
	var_20_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_18:SetAlignment(LUI.Alignment.Left)
	var_20_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 746, _1080p * 931, _1080p * 955)
	var_20_0:addElement(var_20_18)

	var_20_0.ClanPerkDesc = var_20_18

	local var_20_19
	local var_20_20 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_20_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ClanLabelWidget", {
				controllerIndex = var_20_1
			})
		end,
		refreshChild = function(arg_22_0, arg_22_1, arg_22_2)
			return
		end,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 152,
		rowHeight = _1080p * 28,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_20_21 = LUI.UIGrid.new(var_20_20)

	var_20_21.id = "LabelsGrid"

	var_20_21:setUseStencil(true)
	var_20_21:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 629, _1080p * 780, _1080p * 836)
	var_20_0:addElement(var_20_21)

	var_20_0.LabelsGrid = var_20_21

	local var_20_22
	local var_20_23 = LUI.UIText.new()

	var_20_23.id = "ClanPrivacyHeader"

	var_20_23:setText(ToUpperCase(Engine.CBBHFCGDIC("CLANS/CLAN_PRIVACY")), 0)
	var_20_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_20_23:SetAlignment(LUI.Alignment.Left)
	var_20_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -722, _1080p * -498, _1080p * 825, _1080p * 861)
	var_20_0:addElement(var_20_23)

	var_20_0.ClanPrivacyHeader = var_20_23

	local var_20_24
	local var_20_25 = LUI.UIText.new()

	var_20_25.id = "ClanPrivacy"

	var_20_25:setText("", 0)
	var_20_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_25:SetAlignment(LUI.Alignment.Left)
	var_20_25:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -491, _1080p * -239, _1080p * 825, _1080p * 861)
	var_20_0:addElement(var_20_25)

	var_20_0.ClanPrivacy = var_20_25

	local var_20_26
	local var_20_27 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_20_1
	})

	var_20_27.id = "ClanPreviewActionButton1"

	var_20_27.Text:setText("", 0)
	var_20_27.Description:setText("", 0)
	var_20_27:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -722, _1080p * -322, _1080p * 730, _1080p * 770)
	var_20_0:addElement(var_20_27)

	var_20_0.ClanPreviewActionButton1 = var_20_27

	local var_20_28
	local var_20_29 = MenuBuilder.BuildRegisteredType("MPMenuButton", {
		controllerIndex = var_20_1
	})

	var_20_29.id = "ClanPreviewActionButton2"

	var_20_29.Text:setText("", 0)
	var_20_29.Description:setText("", 0)
	var_20_29:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -722, _1080p * -322, _1080p * 780, _1080p * 820)
	var_20_0:addElement(var_20_29)

	var_20_0.ClanPreviewActionButton2 = var_20_29

	local var_20_30
	local var_20_31 = LUI.UIText.new()

	var_20_31.id = "EmptyLabels"

	var_20_31:SetAlpha(0, 0)
	var_20_31:setText(Engine.CBBHFCGDIC("CLANS/NO_SEARCH_LABELS_ACTION_MENU"), 0)
	var_20_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_31:SetAlignment(LUI.Alignment.Left)
	var_20_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 960, _1080p * 1460, _1080p * 780, _1080p * 810)
	var_20_0:addElement(var_20_31)

	var_20_0.EmptyLabels = var_20_31

	local var_20_32
	local var_20_33 = LUI.UIText.new()

	var_20_33.id = "ClanActionLabel"

	var_20_33:SetAlpha(0, 0)
	var_20_33:setText("", 0)
	var_20_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_33:SetAlignment(LUI.Alignment.Center)
	var_20_33:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -780, _1080p * -280, _1080p * 730, _1080p * 760)
	var_20_0:addElement(var_20_33)

	var_20_0.ClanActionLabel = var_20_33

	local var_20_34
	local var_20_35 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_20_1
	})

	var_20_35.id = "ClanEmblemWidget"

	var_20_35:SetScale(2, 0)
	var_20_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 374, _1080p * 502, _1080p * 433, _1080p * 561)
	var_20_0:addElement(var_20_35)

	var_20_0.ClanEmblemWidget = var_20_35

	local var_20_36
	local var_20_37 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_20_1
	})

	var_20_37.id = "TabBacker"

	var_20_37:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_20_0:addElement(var_20_37)

	var_20_0.TabBacker = var_20_37

	local var_20_38
	local var_20_39 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_20_1
	})

	var_20_39.id = "MenuTitle"

	var_20_39.MenuTitle:setText("PRIMARY WEAPON SELECT", 0)
	var_20_39.Line:SetLeft(0, 0)
	var_20_39:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_20_0:addElement(var_20_39)

	var_20_0.MenuTitle = var_20_39

	local var_20_40
	local var_20_41 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_20_1
	})

	var_20_41.id = "LobbyMembersFooter"

	var_20_41:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_20_0:addElement(var_20_41)

	var_20_0.LobbyMembersFooter = var_20_41

	local var_20_42
	local var_20_43 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_20_1
	})

	var_20_43.id = "MPPlayerDetails"

	var_20_43:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * 96, _1080p * 54, _1080p * 114)
	var_20_0:addElement(var_20_43)

	var_20_0.MPPlayerDetails = var_20_43

	var_0_12(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("ClanPreviewScreen", ClanPreviewScreen)
LockTable(_M)
