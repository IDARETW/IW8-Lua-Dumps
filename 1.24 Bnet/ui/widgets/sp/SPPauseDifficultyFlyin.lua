module(..., package.seeall)

local function var_0_0()
	ACTIONS.ResumeGame()
	LUI.FlowManager.RequestCloseAllMenus()
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_1)
	Dvar.DFIJDJFIFD("TTMRSTRO", arg_2_1)
	Engine.DAGFFDGFII("profile_difficultySave " .. arg_2_1)
	Engine.EBIDFIDHIE("updategamerprofile")

	if Engine.DDJFBBJAIG() and (arg_2_0._mapToStart ~= nil or arg_2_0._mapToStart ~= "") then
		local var_2_0 = arg_2_0._mapToStart

		local function var_2_1()
			Engine.EBIDFIDHIE("spmap " .. var_2_0)
		end

		LUI.FlowManager.RequestPopupMenu(nil, "FakeLoadingScreenOverlay", true, 0, false, {
			onLoadCompleteFunc = function()
				if CONDITIONS.IsWeGame() and var_2_0 == "proxywar" then
					LUI.FlowManager.RequestPopupMenu(nil, "WeGameSPPrologue", false, nil, false, {
						callback = var_2_1
					})
				else
					var_2_1()
				end
			end
		})
	else
		var_0_0()
	end
end

local function var_0_2(arg_5_0, arg_5_1)
	arg_5_0._mapToStart = arg_5_1
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.Buttons)
	arg_6_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/SELECT_DIFFICULTY"))

	arg_6_0.SetMap = var_0_2
	arg_6_0._mapToStart = ""

	local var_6_0 = {
		arg_6_0.Buttons.ButtonRecruit,
		arg_6_0.Buttons.ButtonRegular,
		arg_6_0.Buttons.ButtonHardened,
		arg_6_0.Buttons.ButtonVeteran,
		arg_6_0.Buttons.ButtonRealism
	}
	local var_6_1 = Dvar.CFHDGABACF("TTMRSTRO")

	local function var_6_2(arg_7_0)
		for iter_7_0 = 1, #arg_7_0 do
			arg_7_0[iter_7_0]:SetCheck(false)
		end
	end

	for iter_6_0 = 1, #var_6_0 do
		var_6_0[iter_6_0]:addEventHandler("button_action", function(arg_8_0, arg_8_1)
			var_6_2(var_6_0)
			var_0_1(arg_6_0, iter_6_0 - 1)

			if not Engine.DDJFBBJAIG() then
				arg_8_0:SetCheck(true)
			end
		end)
	end

	arg_6_0.Buttons:SetDefaultFocus(var_6_1 + 1)

	if not Engine.DDJFBBJAIG() then
		var_6_0[var_6_1 + 1]:SetCheck(true)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end
end

function SPPauseDifficultyFlyin(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalNavigator.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 640 * _1080p, 0, 1080 * _1080p)

	var_9_0.id = "SPPauseDifficultyFlyin"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3

	if CONDITIONS.InFrontend(var_9_0) then
		var_9_3 = LUI.UIText.new()
		var_9_3.id = "AutoSaveMessage"

		var_9_3:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
		var_9_3:setText(Engine.CBBHFCGDIC("PLATFORM/WARNING_AUTOSAVE"), 0)
		var_9_3:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_9_3:SetAlignment(LUI.Alignment.Left)
		var_9_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 114, _1080p * 506, _1080p * 543, _1080p * 561)
		var_9_0:addElement(var_9_3)

		var_9_0.AutoSaveMessage = var_9_3
	end

	local var_9_4
	local var_9_5 = MenuBuilder.BuildRegisteredType("SPDifficultyButtons", {
		controllerIndex = var_9_1
	})

	var_9_5.id = "Buttons"

	var_9_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 525, _1080p * 152, _1080p * 552)
	var_9_0:addElement(var_9_5)

	var_9_0.Buttons = var_9_5

	local var_9_6
	local var_9_7 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_9_1
	})

	var_9_7.id = "MenuTitle"

	var_9_7.MenuTitle:setText(Engine.CBBHFCGDIC("MENU/SELECT_DIFFICULTY"), 0)
	var_9_7.Line:SetLeft(0, 0)
	var_9_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 105)
	var_9_0:addElement(var_9_7)

	var_9_0.MenuTitle = var_9_7

	local function var_9_8()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_8

	if CONDITIONS.InFrontend(var_9_0) then
		local var_9_9 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 534
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 564
			}
		}

		var_9_3:RegisterAnimationSequence("AR", var_9_9)
	end

	local function var_9_10()
		if CONDITIONS.InFrontend(var_9_0) then
			var_9_3:AnimateSequence("AR")
		end
	end

	var_9_0._sequences.AR = var_9_10

	var_0_3(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("SPPauseDifficultyFlyin", SPPauseDifficultyFlyin)
LockTable(_M)
