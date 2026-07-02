module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = arg_1_1
	})

	var_1_0.id = arg_1_3.category

	var_1_0.Text:setText(Engine.CBBHFCGDIC(arg_1_3.operationName))

	if arg_1_4 == 0 then
		var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 0, _1080p * 50)
	else
		var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * arg_1_4, _1080p * (50 + arg_1_4))
	end

	var_1_0:SetButtonDisabled(not arg_1_3.isUnlocked)

	local var_1_1 = 0

	for iter_1_0 = 0, StringTable.BFHCAIIDA(CSV.cpIntel.file) - 1 do
		local var_1_2 = CSV.ReadRow(CSV.cpIntel, iter_1_0)

		if arg_1_3.category == var_1_2.category and PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Coop).cpIntelNew[var_1_2.index]:get() == 1 then
			var_1_0.UpdateNewItemNotification(var_1_0, 1)

			break
		end
	end

	var_1_0:addEventHandler("button_over_disable", ButtonOverHandler)
	var_1_0:addEventHandler("button_action", function(arg_2_0)
		if arg_1_3.isUnlocked == "1" then
			LUI.FlowManager.RequestAddMenu("CPIntelCategory", true, arg_1_1, false, {
				season = arg_1_3.season,
				buttonIndex = arg_1_3.vertIndex
			})
		end
	end)

	return var_1_0
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	ACTIONS.ScaleFullscreen(arg_3_0.Background)
	LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)

	local var_3_0 = {}

	for iter_3_0 = 0, StringTable.BFHCAIIDA(CSV.cpIntelCategories.file) - 1 do
		local var_3_1 = CSV.ReadRow(CSV.cpIntelCategories, iter_3_0)

		var_3_1.isUnlocked = var_3_1.levelUnlock

		table.insert(var_3_0, var_3_1)
	end

	local var_3_2 = 0
	local var_3_3 = 100
	local var_3_4 = 0

	for iter_3_1, iter_3_2 in ipairs(var_3_0) do
		if iter_3_2.season == arg_3_2.season then
			if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
				local var_3_5 = var_0_0(arg_3_0, arg_3_1, playerData, iter_3_2, var_3_2)

				var_3_2 = var_3_2 + var_3_3
				iter_3_2.vertIndex = var_3_4
				var_3_4 = var_3_4 + 1

				arg_3_0.CPIntelButtons:addElement(var_3_5)
			elseif iter_3_2.devOnly ~= "1" then
				local var_3_6 = var_0_0(arg_3_0, arg_3_1, playerData, iter_3_2, var_3_2)

				var_3_2 = var_3_2 + var_3_3
				iter_3_2.vertIndex = var_3_4
				var_3_4 = var_3_4 + 1

				arg_3_0.CPIntelButtons:addElement(var_3_6)
			end
		end
	end

	arg_3_0.bindButton:addEventHandler("button_alt1", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_1.controller or arg_3_1
		local var_4_1 = arg_3_0.CPIntelButtons:GetFocusedElementIndex()

		if var_4_1 ~= nil then
			local var_4_2 = var_3_0[var_4_1]
			local var_4_3 = {
				intelData = var_4_2
			}

			LUI.FlowManager.RequestAddMenu("CPPlaylistMenu", false, var_4_0, false, var_4_3, true)
		else
			LUI.FlowManager.RequestAddMenu("CPPlaylistMenu", false, var_4_0, false)
		end
	end)
end

function CPIntelSeason(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -960 * _1080p, 960 * _1080p, -542 * _1080p, 542 * _1080p)

	var_5_0.id = "CPIntelSeason"

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
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1920, 0, _1080p * 1080)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("CPIntelButtons", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "CPIntelButtons"

	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 973)
	var_5_0:addElement(var_5_6)

	var_5_0.CPIntelButtons = var_5_6

	function var_5_0.addButtonHelperFunction(arg_6_0, arg_6_1)
		arg_6_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_alt1",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("MENU/VIEW_MISSION")
		})
	end

	var_5_0:addEventHandler("menu_create", var_5_0.addButtonHelperFunction)

	local var_5_7 = LUI.UIBindButton.new()

	var_5_7.id = "selfBindButton"

	var_5_0:addElement(var_5_7)

	var_5_0.bindButton = var_5_7

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CPIntelSeason", CPIntelSeason)
LockTable(_M)
