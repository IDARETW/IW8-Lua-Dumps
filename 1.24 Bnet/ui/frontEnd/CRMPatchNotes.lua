module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.patchNoteTable)

	local var_1_0 = arg_1_2.patchNoteTable

	local function var_1_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
		arg_2_2.Title:setText(arg_2_3[CRM.keys.TITLE])

		if not arg_2_2._handlersAdded then
			arg_2_2._handlersAdded = true

			arg_2_2:addEventHandler("button_over", function(arg_3_0, arg_3_1)
				arg_2_0.SummaryBody:setText(arg_2_3[CRM.keys.CONTENT_SHORT])
			end)
			arg_2_2:addEventHandler("button_action", function(arg_4_0, arg_4_1)
				LUI.FlowManager.RequestPopupMenu(arg_4_0, "CRMPatchNoteInfo", false, arg_2_1, false, {
					controllerIndex = arg_2_1,
					messageData = arg_2_3
				})
			end)
		end
	end

	arg_1_0.PatchNotesGrid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_1_0.PatchNotesGrid:GetContentIndex(arg_5_1, arg_5_2)
		local var_5_1 = var_1_0[var_5_0 + 1]

		var_1_1(arg_1_0, arg_1_1, arg_5_0, var_5_1, var_5_0)
	end)
	arg_1_0.PatchNotesGrid:SetNumChildren(#var_1_0)
	arg_1_0.PatchNotesGrid:RefreshContent()

	if #var_1_0 > 0 then
		arg_1_0.EmptyGridLabel:SetAlpha(0)
	end

	local var_1_2 = LUI.UIBindButton.new()

	var_1_2.id = "bindButton"

	arg_1_0:addElement(var_1_2)

	arg_1_0.bindButton = var_1_2

	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = arg_1_1
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end)
end

function CRMPatchNotes(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_7_0.id = "CRMPatchNotes"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "GenericPopupWindow"

	var_7_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -367, _1080p * 385)
	var_7_0:addElement(var_7_4)

	var_7_0.GenericPopupWindow = var_7_4

	local var_7_5
	local var_7_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CRMPatchNoteItem", {
				controllerIndex = var_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 660,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_7 = LUI.UIGrid.new(var_7_6)

	var_7_7.id = "PatchNotesGrid"

	var_7_7:setUseStencil(true)
	var_7_7:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -170, _1080p * -324, _1080p * 346)
	var_7_0:addElement(var_7_7)

	var_7_0.PatchNotesGrid = var_7_7

	local var_7_8
	local var_7_9 = LUI.UIText.new()

	var_7_9.id = "EmptyGridLabel"

	var_7_9:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_7_9:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NO_PATCH_NOTES"), 0)
	var_7_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_9:SetAlignment(LUI.Alignment.Center)
	var_7_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -170, _1080p * -44, 0)
	var_7_0:addElement(var_7_9)

	var_7_0.EmptyGridLabel = var_7_9

	local var_7_10
	local var_7_11 = LUI.UIImage.new()

	var_7_11.id = "SummaryBackground"

	var_7_11:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_7_11:SetAlpha(0.5, 0)
	var_7_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -102, _1080p * 830, _1080p * -325, _1080p * 346)
	var_7_0:addElement(var_7_11)

	var_7_0.SummaryBackground = var_7_11

	local var_7_12
	local var_7_13 = LUI.UIStyledText.new()

	var_7_13.id = "SummaryTitle"

	var_7_13:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_13:setText(Engine.CBBHFCGDIC("LUA_MENU/SUMMARY"), 0)
	var_7_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_13:SetAlignment(LUI.Alignment.Left)
	var_7_13:SetShadowMinDistance(-0.2, 0)
	var_7_13:SetShadowMaxDistance(0.2, 0)
	var_7_13:SetShadowRGBFromInt(0, 0)
	var_7_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -73, _1080p * 336, _1080p * -307, _1080p * -271)
	var_7_0:addElement(var_7_13)

	var_7_0.SummaryTitle = var_7_13

	local var_7_14
	local var_7_15 = LUI.UIText.new()

	var_7_15.id = "SummaryBody"

	var_7_15:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_7_15:setText("", 0)
	var_7_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_15:SetAlignment(LUI.Alignment.Left)
	var_7_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -73, _1080p * 830, _1080p * -260, _1080p * -232)
	var_7_0:addElement(var_7_15)

	var_7_0.SummaryBody = var_7_15

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("CRMPatchNotes", CRMPatchNotes)
LockTable(_M)
