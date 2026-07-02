module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	assert(arg_1_2.messageData)

	local var_1_0 = arg_1_2.messageData

	arg_1_0.MenuTitle:SetTitle(var_1_0[CRM.keys.TITLE])
	arg_1_0.SummaryBody:setText(var_1_0[CRM.keys.CONTENT_SHORT])
	arg_1_0.Tabs:SetAlignment(LUI.Alignment.Left)

	local var_1_1 = var_1_0[CRM.keys.CONTENT_LONG]
	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_1) do
		local var_1_3 = iter_1_1.title
		local var_1_4 = iter_1_1.body

		if var_1_3 == nil or var_1_3 == "" then
			Engine.CBBHFCGDIC("LUA_MENU/GENERAL")
		end

		if var_1_4 ~= nil and var_1_4 ~= "" then
			table.insert(var_1_2, {
				name = var_1_3,
				focusFunction = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
					arg_1_0.SectionTitle:setText(var_1_3)
					arg_1_0.SectionBody:setText(var_1_4)
					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end
			})
		end
	end

	if #var_1_2 > 0 then
		arg_1_0.Tabs:SetTabs(var_1_2)
		arg_1_0.Tabs:SetAlignment(LUI.Alignment.Left)
	else
		arg_1_0.Tabs:closeTree()

		arg_1_0.Tabs = nil

		arg_1_0.SectionTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/GENERAL"))
		arg_1_0.SectionBody:setText(var_1_0.content_long)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.DarkenBackground)
end

function CRMPatchNoteInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "CRMPatchNoteInfo"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "DarkenBackground"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DarkenBackground = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ButtonHelperBar"

	var_3_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.ButtonHelperBar = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "GenericPopupWindow"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 173, _1080p * 925)
	var_3_0:addElement(var_3_8)

	var_3_0.GenericPopupWindow = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "BodyBackground"

	var_3_10:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_10:SetAlpha(0.5, 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 130, _1080p * -695, _1080p * 216, _1080p * -194)
	var_3_0:addElement(var_3_10)

	var_3_0.BodyBackground = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "SummaryBackground"

	var_3_12:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_12:SetAlpha(0.5, 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1258, _1080p * -130, _1080p * 216, _1080p * -194)
	var_3_0:addElement(var_3_12)

	var_3_0.SummaryBackground = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "SummaryTitle"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("LUA_MENU/SUMMARY"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetShadowMinDistance(-0.2, 0)
	var_3_14:SetShadowMaxDistance(0.2, 0)
	var_3_14:SetShadowRGBFromInt(0, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1292, _1080p * 1756, _1080p * 233, _1080p * 269)
	var_3_0:addElement(var_3_14)

	var_3_0.SummaryTitle = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "MenuTitle"

	var_3_16.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PATCH_NOTES_NUMBER"), 0)
	var_3_16.Line:SetLeft(0, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_3_0:addElement(var_3_16)

	var_3_0.MenuTitle = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "SummaryBody"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_18:setText("", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1292, _1080p * 1756, _1080p * 280, _1080p * 308)
	var_3_0:addElement(var_3_18)

	var_3_0.SummaryBody = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "SectionBody"

	var_3_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_20:setText("", 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Left)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 154, _1080p * 1202, _1080p * 280, _1080p * 308)
	var_3_0:addElement(var_3_20)

	var_3_0.SectionBody = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIStyledText.new()

	var_3_22.id = "SectionTitle"

	var_3_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_22:setText("", 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_22:SetAlignment(LUI.Alignment.Left)
	var_3_22:SetShadowMinDistance(-0.2, 0)
	var_3_22:SetShadowMaxDistance(0.2, 0)
	var_3_22:SetShadowRGBFromInt(0, 0)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 154, _1080p * 1202, _1080p * 233, _1080p * 269)
	var_3_0:addElement(var_3_22)

	var_3_0.SectionTitle = var_3_22

	local var_3_23
	local var_3_24 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_3_1
			})
		end,
		controllerIndex = var_3_1
	}
	local var_3_25 = LUI.TabManager.new(var_3_24)

	var_3_25.id = "Tabs"

	var_3_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1087, _1080p * 108, _1080p * 160)
	var_3_0:addElement(var_3_25)

	var_3_0.Tabs = var_3_25

	function var_3_0.addButtonHelperFunction(arg_5_0, arg_5_1)
		arg_5_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_26 = LUI.UIBindButton.new()

	var_3_26.id = "selfBindButton"

	var_3_0:addElement(var_3_26)

	var_3_0.bindButton = var_3_26

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CRMPatchNoteInfo", CRMPatchNoteInfo)
LockTable(_M)
