module(..., package.seeall)

local var_0_0 = 64

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = MenuBuilder.BuildRegisteredType("CPIntelButton", {
		controllerIndex = arg_1_1
	})

	var_1_0.id = "IntelButton"

	var_1_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 86, 0)
	var_1_0:SetButtonDisabled(not arg_1_3.isUnlocked)
	var_1_0:SetSelected(isIntelSelected)
	var_1_0:SetNew(arg_1_3.isNew)

	if arg_1_3.isUnlocked == 1 then
		ACTIONS.AnimateSequence(var_1_0, "Enabled")
		var_1_0.Text:setText(Engine.CBBHFCGDIC(arg_1_3.name))
		var_1_0.Icon:setImage(RegisterMaterial(arg_1_3.image))
		var_1_0.Icon:SetAlpha(1, 0)
	else
		ACTIONS.AnimateSequence(var_1_0, "Disabled")
		var_1_0.Text:setText(Engine.CBBHFCGDIC("CP_INTEL/NOT_FOUND"))
		var_1_0.Icon:setImage(RegisterMaterial(arg_1_3.image))
		var_1_0.Icon:SetAlpha(0, 0)
	end

	var_1_0:addEventHandler("button_action", function(arg_2_0)
		if arg_1_3.isUnlocked == 1 then
			arg_1_0.Darkener:SetAlpha(0.7, 100, LUI.EASING.outQuadratic)

			if arg_1_3.isNew == 1 then
				PlayerData.BFFBGAJGD(arg_2_0._controllerIndex, CoD.StatsGroup.Coop).cpIntelNew[arg_1_3.index]:set(0)

				arg_1_3.isNew = 0

				var_1_0.SetNew(var_1_0, 0)

				local var_2_0 = arg_1_0:getParent()

				var_2_0.SetupTabs(var_2_0, arg_2_0._controllerIndex)
			end

			Engine.EBCGADABJ()

			if arg_1_3.type == "audio" then
				arg_1_0.CPIntelAudio.TextBox:setText(Engine.CBBHFCGDIC(arg_1_3.desc))
				arg_1_0.CPIntelImage:SetAlpha(0, 0)
				arg_1_0.CPIntelVideo:SetAlpha(0, 0)
				arg_1_0.CPIntelBillet:SetAlpha(0, 0)
				arg_1_0.CPIntelAAR:SetAlpha(0, 0)
				arg_1_0.CPIntelText:SetAlpha(0, 0)
				arg_1_0.CPIntelNote:SetAlpha(0, 0)
				arg_1_0.CPIntelMissing:SetAlpha(0, 0)
				arg_1_0.CPIntelAudio:SetAlpha(1, 0)
				arg_1_0.CPIntelAudio.IntelName:setText(Engine.CBBHFCGDIC(arg_1_3.name))
				arg_1_0.CPIntelAudio.CategoryText:setText(Engine.CBBHFCGDIC(arg_1_3.categoryName))
				ACTIONS.AnimateSequenceByElement(arg_1_0, {
					elementPath = "menu.CPIntelAudio",
					sequenceName = "Show",
					elementName = "CPIntelAudio"
				})
			elseif arg_1_3.type == "image" then
				arg_1_0.CPIntelImage:Update(arg_1_3)
				arg_1_0.CPIntelAudio:SetAlpha(0, 0)
				arg_1_0.CPIntelVideo:SetAlpha(0, 0)
				arg_1_0.CPIntelBillet:SetAlpha(0, 0)
				arg_1_0.CPIntelAAR:SetAlpha(0, 0)
				arg_1_0.CPIntelText:SetAlpha(0, 0)
				arg_1_0.CPIntelNote:SetAlpha(0, 0)
				arg_1_0.CPIntelMissing:SetAlpha(0, 0)
				arg_1_0.CPIntelImage:SetAlpha(1, 100, LUI.EASING.outQuadratic)
			elseif arg_1_3.type == "billet" then
				arg_1_0.CPIntelBillet:Update(arg_1_3.ref)
				arg_1_0.CPIntelAudio:SetAlpha(0, 0)
				arg_1_0.CPIntelVideo:SetAlpha(0, 0)
				arg_1_0.CPIntelImage:SetAlpha(0, 0)
				arg_1_0.CPIntelAAR:SetAlpha(0, 0)
				arg_1_0.CPIntelText:SetAlpha(0, 0)
				arg_1_0.CPIntelNote:SetAlpha(0, 0)
				arg_1_0.CPIntelMissing:SetAlpha(0, 0)
				arg_1_0.CPIntelBillet:SetAlpha(1, 100, LUI.EASING.outQuadratic)
			elseif arg_1_3.type == "aar" then
				arg_1_0.CPIntelAAR:Update(arg_1_3.ref)
				arg_1_0.CPIntelAudio:SetAlpha(0, 0)
				arg_1_0.CPIntelVideo:SetAlpha(0, 0)
				arg_1_0.CPIntelImage:SetAlpha(0, 0)
				arg_1_0.CPIntelBillet:SetAlpha(0, 0)
				arg_1_0.CPIntelText:SetAlpha(0, 0)
				arg_1_0.CPIntelNote:SetAlpha(0, 0)
				arg_1_0.CPIntelMissing:SetAlpha(0, 0)
				arg_1_0.CPIntelAAR:SetAlpha(1, 100, LUI.EASING.outQuadratic)
			elseif arg_1_3.type == "sms" then
				arg_1_0.CPIntelText:Update(arg_1_3)
				arg_1_0.CPIntelAudio:SetAlpha(0, 0)
				arg_1_0.CPIntelVideo:SetAlpha(0, 0)
				arg_1_0.CPIntelImage:SetAlpha(0, 0)
				arg_1_0.CPIntelBillet:SetAlpha(0, 0)
				arg_1_0.CPIntelAAR:SetAlpha(0, 0)
				arg_1_0.CPIntelNote:SetAlpha(0, 0)
				arg_1_0.CPIntelMissing:SetAlpha(0, 0)
				arg_1_0.CPIntelText:SetAlpha(1, 100, LUI.EASING.outQuadratic)
			elseif arg_1_3.type == "note" then
				arg_1_0.CPIntelNote:Update(arg_1_3)
				arg_1_0.CPIntelAudio:SetAlpha(0, 0)
				arg_1_0.CPIntelVideo:SetAlpha(0, 0)
				arg_1_0.CPIntelImage:SetAlpha(0, 0)
				arg_1_0.CPIntelBillet:SetAlpha(0, 0)
				arg_1_0.CPIntelAAR:SetAlpha(0, 0)
				arg_1_0.CPIntelText:SetAlpha(0, 0)
				arg_1_0.CPIntelMissing:SetAlpha(0, 0)
				arg_1_0.CPIntelNote:SetAlpha(1, 100, LUI.EASING.outQuadratic)
			elseif arg_1_3.type == "missing" then
				arg_1_0.CPIntelMissing:Update(arg_1_3)
				arg_1_0.CPIntelAudio:SetAlpha(0, 0)
				arg_1_0.CPIntelVideo:SetAlpha(0, 0)
				arg_1_0.CPIntelImage:SetAlpha(0, 0)
				arg_1_0.CPIntelBillet:SetAlpha(0, 0)
				arg_1_0.CPIntelAAR:SetAlpha(0, 0)
				arg_1_0.CPIntelText:SetAlpha(0, 0)
				arg_1_0.CPIntelNote:SetAlpha(0, 0)
				arg_1_0.CPIntelMissing:SetAlpha(1, 100, LUI.EASING.outQuadratic)
			elseif arg_1_3.type == "video" then
				arg_1_0.CPIntelAudio:SetAlpha(0, 0)
				arg_1_0.CPIntelImage:SetAlpha(0, 0)
				arg_1_0.CPIntelBillet:SetAlpha(0, 0)
				arg_1_0.CPIntelAAR:SetAlpha(0, 0)
				arg_1_0.CPIntelText:SetAlpha(0, 0)
				arg_1_0.CPIntelNote:SetAlpha(0, 0)
				arg_1_0.CPIntelMissing:SetAlpha(0, 0)
				arg_1_0.CPIntelVideo:SetAlpha(1, 0)
				arg_1_0.CPIntelVideo.IntelName:setText(Engine.CBBHFCGDIC(arg_1_3.name))
				arg_1_0.CPIntelVideo.CategoryText:setText(Engine.CBBHFCGDIC(arg_1_3.categoryName))

				arg_1_0:Wait(var_0_0).onComplete = function()
					Engine.DFCGFCGBFD(arg_1_3.videoName, VideoPlaybackFlags.LOOP)
				end
			end
		end
	end)

	return var_1_0
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {}

	for iter_4_0 = 0, StringTable.BFHCAIIDA(CSV.cpIntel.file) - 1 do
		local var_4_1 = CSV.ReadRow(CSV.cpIntel, iter_4_0)

		table.insert(var_4_0, var_4_1)
	end

	local var_4_2 = {
		maxVisibleColumns = 1,
		maxVisibleRows = 8,
		wrapY = true,
		maxRows = 20,
		buildArrowsLabel = true,
		adjustSizeToContent = true,
		wrapX = false,
		controllerIndex = arg_4_1,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4
	}
	local var_4_3 = LUI.UIGrid.new(var_4_2)

	var_4_3.id = "RoleGrid"

	var_4_3:setUseStencil(true)
	var_4_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 900)
	arg_4_0:addElement(var_4_3)

	local var_4_4 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_4_0.VerticalMinimalScrollbar,
		startCap = arg_4_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_4_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_4_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_4_0.VerticalMinimalScrollbar.sliderArea and arg_4_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_4_0.VerticalMinimalScrollbar.sliderArea and arg_4_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	var_4_3:AddScrollbar(var_4_4)

	local var_4_5 = 0
	local var_4_6 = 1

	for iter_4_1, iter_4_2 in ipairs(var_4_0) do
		if iter_4_2.showInMenus == "1" and iter_4_2.category == arg_4_2.category and iter_4_2.season == arg_4_2.season then
			local var_4_7 = tonumber(iter_4_2.index)

			iter_4_2.isUnlocked = PlayerData.BFFBGAJGD(arg_4_1, CoD.StatsGroup.Coop).cpIntel[var_4_7]:get()
			iter_4_2.isNew = PlayerData.BFFBGAJGD(arg_4_1, CoD.StatsGroup.Coop).cpIntelNew[var_4_7]:get()
			iter_4_2.categoryName = arg_4_2.categoryName

			local var_4_8 = var_0_1(arg_4_0, arg_4_1, playerData, iter_4_2)

			var_4_3:AddElement(var_4_8)
		end
	end

	var_4_3:RefreshContent()

	if not LUI.IsLastInputMouseNavigation(arg_4_1) then
		var_4_3:processEvent({
			name = "gain_focus"
		})
	end

	ACTIONS.ScaleFullscreen(arg_4_0.Background)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_4_0.Darkener)
end

function CPIntelCategoryList(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "CPIntelCategoryList"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:setImage(RegisterMaterial("frontend_cpintel_apartment_bkgnd"), 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Darkener"

	var_5_6:SetRGBFromInt(0, 0)
	var_5_6:SetAlpha(0.02, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Darkener = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("CPIntelAudio", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "CPIntelAudio"

	var_5_8:SetAlpha(0, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_8)

	var_5_0.CPIntelAudio = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("CPIntelImage", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "CPIntelImage"

	var_5_10:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_10)

	var_5_0.CPIntelImage = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("CPIntelVideo", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "CPIntelVideo"

	var_5_12:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_12)

	var_5_0.CPIntelVideo = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "VerticalMinimalScrollbar"

	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 526, _1080p * 537, _1080p * 216, _1080p * 933)
	var_5_0:addElement(var_5_14)

	var_5_0.VerticalMinimalScrollbar = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("CPIntelBillet", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "CPIntelBillet"

	var_5_16:SetAlpha(0, 0)
	var_5_16:SetScale(-0.04, 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 1930, _1080p * 89, _1080p * 1169)
	var_5_0:addElement(var_5_16)

	var_5_0.CPIntelBillet = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("CPIntelAAR", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "CPIntelAAR"

	var_5_18:SetAlpha(0, 0)
	var_5_18.AfterActionTitle:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_5_18.AfterActionTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("CP_INTEL/AAR_TITLE")), 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 140, _1080p * 2060, _1080p * 73, _1080p * 1153)
	var_5_0:addElement(var_5_18)

	var_5_0.CPIntelAAR = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("CPIntelText", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "CPIntelText"

	var_5_20:SetAlpha(0, 0)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_5_0:addElement(var_5_20)

	var_5_0.CPIntelText = var_5_20

	local var_5_21
	local var_5_22 = MenuBuilder.BuildRegisteredType("CPIntelNote", {
		controllerIndex = var_5_1
	})

	var_5_22.id = "CPIntelNote"

	var_5_22:SetAlpha(0, 0)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_5_0:addElement(var_5_22)

	var_5_0.CPIntelNote = var_5_22

	local var_5_23
	local var_5_24 = MenuBuilder.BuildRegisteredType("CPIntelMissing", {
		controllerIndex = var_5_1
	})

	var_5_24.id = "CPIntelMissing"

	var_5_24:SetAlpha(0, 0)
	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_5_0:addElement(var_5_24)

	var_5_0.CPIntelMissing = var_5_24

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CPIntelCategoryList", CPIntelCategoryList)
LockTable(_M)
