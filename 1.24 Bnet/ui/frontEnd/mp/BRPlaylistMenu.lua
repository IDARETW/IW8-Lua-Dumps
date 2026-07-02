module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.PlaylistList.PlaylistButtons:SetGridDataSource(arg_1_2.dataSource.playlists)
	assert(arg_1_0.MenuTitle)

	local var_1_0 = arg_1_2.dataSource.name:GetValue(arg_1_1) or Engine.CBBHFCGDIC("LUA_MENU/WARZONE_PLAYLIST_SELECT")

	arg_1_0.MenuTitle:SetTitle(var_1_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.TabBacker)

	local function var_1_1()
		local var_2_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_1_0.Vignette:SetScale(var_2_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_1)
	arg_1_0:registerEventHandler("playlist_button_over", function(arg_3_0, arg_3_1)
		arg_3_0.PlaylistDetails:SetDataSource(arg_3_1.dataSource, arg_1_1)

		local var_3_0 = arg_3_1.dataSource
		local var_3_1 = PlaylistUtils.GetPlaylistConditions(arg_1_1, var_3_0)

		if var_3_1.showSplitScreenWarning then
			arg_3_0.PlaylistDetails.WarningMessage:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SPLITSCREEN_SINGLE_UNSUPPORTED_MODE", Engine.JCBDICCAH(var_3_0.name:GetValue(arg_1_1))))
		elseif var_3_1.showTooManyPeopleInPartyWarning then
			arg_3_0.PlaylistDetails.WarningMessage:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GAME_MODE_HIGH_PARTY_MEMBER_COUNT_WARNING", var_3_1.activePartyMemberCount, maxPartySize))
		end

		local var_3_2 = var_3_1.showSplitScreenWarning or var_3_1.showTooManyPeopleInPartyWarning

		arg_3_0.PlaylistDetails:UpdatePanel(false, var_3_1.isCrossPlayRequired, var_3_2, false, var_3_1.showXPModifier)
		arg_3_0.PlaylistDetails:SetAlpha(1)

		return true
	end)
	arg_1_0.PlaylistDetails:SetAlpha(0)
end

function BRPlaylistMenu(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "BRPlaylistMenu"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	var_4_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})
	var_4_0.HelperBar.id = "HelperBar"

	var_4_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_4_0.HelperBar:setPriority(10)
	var_4_0:addElement(var_4_0.HelperBar)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = {
		worldBlur = 1,
		controllerIndex = var_4_1
	}
	local var_4_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_4_4)

	var_4_5.id = "WorldBlur"

	var_4_0:addElement(var_4_5)

	var_4_0.WorldBlur = var_4_5

	local var_4_6
	local var_4_7 = LUI.UIImage.new()

	var_4_7.id = "Darkener"

	var_4_7:SetRGBFromInt(0, 0)
	var_4_7:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_7)

	var_4_0.Darkener = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIImage.new()

	var_4_9.id = "Vignette"

	var_4_9:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_9:SetAlpha(0.5, 0)
	var_4_9:setImage(RegisterMaterial("gradient_curve"), 0)
	var_4_0:addElement(var_4_9)

	var_4_0.Vignette = var_4_9

	local var_4_10
	local var_4_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_4_1
	})

	var_4_11.id = "TabBacker"

	var_4_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_4_0:addElement(var_4_11)

	var_4_0.TabBacker = var_4_11

	local var_4_12
	local var_4_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_13.id = "MenuTitle"

	var_4_13.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_PLAYLIST_SELECT")), 0)
	var_4_13.Line:SetLeft(0, 0)
	var_4_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_4_0:addElement(var_4_13)

	var_4_0.MenuTitle = var_4_13

	local var_4_14
	local var_4_15 = LUI.UIImage.new()

	var_4_15.id = "Line"

	var_4_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_15:SetAlpha(0.4, 0)
	var_4_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 594, _1080p * 200, _1080p * 201)
	var_4_0:addElement(var_4_15)

	var_4_0.Line = var_4_15

	local var_4_16
	local var_4_17 = MenuBuilder.BuildRegisteredType("PlaylistList", {
		controllerIndex = var_4_1
	})

	var_4_17.id = "PlaylistList"

	var_4_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 217, _1080p * 807)
	var_4_0:addElement(var_4_17)

	var_4_0.PlaylistList = var_4_17

	local var_4_18
	local var_4_19 = MenuBuilder.BuildRegisteredType("PlaylistDetails", {
		controllerIndex = var_4_1
	})

	var_4_19.id = "PlaylistDetails"

	var_4_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 671, _1080p * 1427, _1080p * 216, _1080p * 596)
	var_4_0:addElement(var_4_19)

	var_4_0.PlaylistDetails = var_4_19

	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_4_20 = LUI.UIBindButton.new()

	var_4_20.id = "selfBindButton"

	var_4_0:addElement(var_4_20)

	var_4_0.bindButton = var_4_20

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BRPlaylistMenu", BRPlaylistMenu)
LockTable(_M)
