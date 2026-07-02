module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.FlowManager.GetScopedData(arg_1_0)
	local var_1_1 = {}

	if #arg_1_1.messageTable > 0 then
		var_1_1[#var_1_1 + 1] = {
			menuName = "CRMMessages",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/LATEST"))
		}
	end

	var_1_1[#var_1_1 + 1] = {
		menuName = "CRMPatchNotes",
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PATCH_NOTES"))
	}

	if #var_1_1 == 1 then
		arg_1_0.Tabs:SetAlpha(0)
	end

	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_1) do
		table.insert(var_1_2, {
			name = iter_1_1.name,
			disabled = iter_1_1.disabled,
			hasDefaultFocus = iter_1_0 == var_1_0.activeTabIndex,
			focusFunction = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
				arg_1_1.popupContainer = arg_1_0

				if var_1_0.activeTabIndex and arg_2_2 == var_1_0.activeTabIndex and arg_1_0.activeTabWidget then
					return
				end

				TAB.UpdateBuiltWidgetOnTabChange(arg_1_0, var_1_0.activeTabIndex, "activeTabWidget", arg_2_2, arg_2_3, iter_1_1.menuName, arg_1_1)

				var_1_0.activeTabIndex = arg_2_2

				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)

				if iter_1_1.menuName == "CRMPatchNotes" then
					arg_1_0:RemoveButtonHelperTextFromElement(arg_1_0.ButtonHelperBar, "button_alt2", "left")
					arg_1_0:AddButtonHelperTextToElement(arg_1_0.ButtonHelperBar, {
						side = "left",
						button_ref = "button_secondary",
						priority = 0,
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLOSE")
					})
					arg_1_0:AddButtonHelperTextToElement(arg_1_0.ButtonHelperBar, {
						side = "left",
						button_ref = "button_primary",
						priority = 1,
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
					})
				else
					arg_1_0:RemoveButtonHelperTextFromElement(arg_1_0.ButtonHelperBar, "button_primary", "left")
				end
			end
		})
	end

	assert(#var_1_2 > 0)
	arg_1_0.Tabs:SetTabs(var_1_2)
	arg_1_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2.messageTable = {}
	arg_3_2.patchNoteTable = {}

	local var_3_0 = "MENU/NOTICE"

	if arg_3_2.messageData then
		table.insert(arg_3_2.messageTable, arg_3_2.messageData)
	else
		arg_3_2.messageTable = CRM.GetMenuMessageData()
		arg_3_2.patchNoteTable = CRM.GetPatchNoteMessageData()

		if #arg_3_2.messageTable > 0 then
			var_3_0 = "LUA_MENU/MOTD_CAPS"
		elseif #arg_3_2.patchNoteTable > 0 then
			var_3_0 = "LUA_MENU_MP/PATCH_NOTES"
		end
	end

	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(var_3_0))
	var_0_0(arg_3_0, arg_3_2)
	arg_3_0:addEventHandler("lose_focus", function(arg_4_0, arg_4_1)
		arg_3_0:SetAlpha(0)
	end)
	arg_3_0:addEventHandler("restore_focus", function(arg_5_0, arg_5_1)
		arg_3_0:SetAlpha(1)
	end)
	arg_3_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	ACTIONS.ScaleFullscreen(arg_3_0.DarkenBackground)
end

function CRMContainer(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "CRMContainer"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "DarkenBackground"

	var_6_4:SetRGBFromTable(SWATCHES.text.overText, 0)
	var_6_4:SetAlpha(0.9, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.DarkenBackground = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "ButtonHelperBar"

	var_6_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0:addElement(var_6_6)

	var_6_0.ButtonHelperBar = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "MenuTitle"

	var_6_8.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/MOTD_CAPS"), 0)
	var_6_8.Line:SetLeft(0, 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_6_0:addElement(var_6_8)

	var_6_0.MenuTitle = var_6_8

	local var_6_9
	local var_6_10 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_6_1
			})
		end,
		controllerIndex = var_6_1
	}
	local var_6_11 = LUI.TabManager.new(var_6_10)

	var_6_11.id = "Tabs"

	var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1087, _1080p * 108, _1080p * 160)
	var_6_0:addElement(var_6_11)

	var_6_0.Tabs = var_6_11

	local var_6_12

	if CONDITIONS.IsUserSignedInDemonware(var_6_1) then
		local var_6_13 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_6_1
		})

		var_6_13.id = "MPPlayerDetails"

		var_6_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_6_0:addElement(var_6_13)

		var_6_0.MPPlayerDetails = var_6_13
	end

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("CRMContainer", CRMContainer)
LockTable(_M)
