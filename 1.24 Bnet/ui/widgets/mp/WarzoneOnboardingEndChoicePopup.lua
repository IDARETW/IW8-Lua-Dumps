module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	Engine.EBHIFJCGBH("ftue_popup_state_change", MP.WarzonePracticePopupStatus.POPUP_OPENED)

	local function var_1_0(arg_2_0)
		if arg_2_0 ~= MP.WarzonePracticePopupStatus.POPUP_OPENED then
			Dvar.DFIJDJFIFD("NLOQPLMLKR", arg_2_0)
		end

		Engine.EBHIFJCGBH("ftue_popup_state_change", arg_2_0)
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
	end

	local var_1_1 = {
		{
			buttonElement = arg_1_0.WarzoneOnboardingEndButtons.BattleButton,
			visiblityFunction = function()
				return not CONDITIONS.IsBMTutorialMap()
			end,
			onActivateAction = function()
				var_1_0(MP.WarzonePracticePopupStatus.GO_TO_WARZONE_LOBBY)

				return true
			end,
			description = Engine.CBBHFCGDIC("LUA_MENU_MP/BR_DESC_2"),
			descriptionTitle = Engine.CBBHFCGDIC("LUA_MENU/WZ_INTOBATTLE_POPUP_PLAYTRIO")
		},
		{
			buttonElement = arg_1_0.WarzoneOnboardingEndButtons.PracticeButton,
			visiblityFunction = function()
				return not CONDITIONS.IsBMTutorialMap()
			end,
			onActivateAction = function()
				var_1_0(MP.WarzonePracticePopupStatus.GO_TO_PRACTICE_LOBBY)

				return true
			end,
			description = Engine.CBBHFCGDIC("LUA_MENU/ WZ_PRACTICE_DESC"),
			descriptionTitle = Engine.CBBHFCGDIC("LUA_MENU/WZ_INTOBATTLE_POPUP_GOPRACTICE")
		},
		{
			buttonElement = arg_1_0.WarzoneOnboardingEndButtons.BloodMoneyButton,
			visiblityFunction = function()
				return true
			end,
			onActivateAction = function()
				var_1_0(MP.WarzonePracticePopupStatus.GO_TO_BLOODMONEY_LOBBY)

				return true
			end,
			description = Engine.CBBHFCGDIC("LUA_MENU_MP/BMO_VIP3_DESC"),
			descriptionTitle = Engine.CBBHFCGDIC("LUA_MENU/WZ_INTOBATTLE_POPUP_PLAYBLOODMONEY")
		},
		{
			buttonElement = arg_1_0.WarzoneOnboardingEndButtons.RetryButton,
			visiblityFunction = function()
				return false
			end,
			onActivateAction = function()
				var_1_0(MP.WarzonePracticePopupStatus.RETRY_TUTORIAL)

				return true
			end
		},
		{
			buttonElement = arg_1_0.WarzoneOnboardingEndButtons.MainMenuButton,
			visiblityFunction = function()
				return true
			end,
			onActivateAction = function()
				Dvar.DHEGHJJJHI("RMTPOKQP", true)

				if CONDITIONS.IsBMTutorialMap() then
					var_1_0(MP.WarzonePracticePopupStatus.GO_TO_BLOODMONEY_TUTORIAL_LOBBY)
				else
					var_1_0(MP.WarzonePracticePopupStatus.EXIT_TUTORIAL)
				end

				return true
			end
		}
	}

	local function var_1_2(arg_13_0, arg_13_1)
		return function()
			if arg_13_0 and arg_13_1 then
				arg_1_0.Description:setText(arg_13_0)
				arg_1_0.TitleDesc:setText(arg_13_1)
				ACTIONS.AnimateSequence(arg_1_0, "WithDescription")
			else
				ACTIONS.AnimateSequence(arg_1_0, "NoDescription")
			end

			return true
		end
	end

	for iter_1_0, iter_1_1 in ipairs(var_1_1) do
		if iter_1_1.buttonElement then
			if iter_1_1.visiblityFunction() then
				iter_1_1.buttonElement:addEventHandler("button_action", iter_1_1.onActivateAction)
				iter_1_1.buttonElement:addEventHandler("gain_focus", var_1_2(iter_1_1.description, iter_1_1.descriptionTitle))
				iter_1_1.buttonElement:addEventHandler("update_description", var_1_2(iter_1_1.description, iter_1_1.descriptionTitle))
			else
				iter_1_1.buttonElement:closeTree()
			end
		end
	end

	arg_1_0.WarzoneOnboardingEndButtons:processEvent({
		name = "update_description",
		controller = arg_1_1
	})
end

function WarzoneOnboardingEndChoicePopup(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIVerticalNavigator.new()

	var_15_0.id = "WarzoneOnboardingEndChoicePopup"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "Darkener"

	var_15_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_4:SetAlpha(0.8, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.Darkener = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "GenericPopupWindow"

	var_15_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -209, _1080p * 209)
	var_15_0:addElement(var_15_6)

	var_15_0.GenericPopupWindow = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIText.new()

	var_15_8.id = "Title"

	var_15_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_15_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WZ_INTOBATTLE_POPUP_TITLE")), 0)
	var_15_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_15_8:SetAlignment(LUI.Alignment.Left)
	var_15_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -597, _1080p * 448, _1080p * -175, _1080p * -115)
	var_15_0:addElement(var_15_8)

	var_15_0.Title = var_15_8

	local var_15_9
	local var_15_10 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_15_1
	})

	var_15_10.id = "DoubleNotchedBacker"

	var_15_10:SetAlpha(0.5, 0)
	var_15_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 601, _1080p * -73, _1080p * 106)
	var_15_0:addElement(var_15_10)

	var_15_0.DoubleNotchedBacker = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIStyledText.new()

	var_15_12.id = "Description"

	var_15_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_15_12:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_PRACTICE_DESC"), 0)
	var_15_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_15_12:SetAlignment(LUI.Alignment.Left)
	var_15_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 562, _1080p * -11, _1080p * 11)
	var_15_0:addElement(var_15_12)

	var_15_0.Description = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIImage.new()

	var_15_14.id = "Divider"

	var_15_14:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_15_14:SetAlpha(0.8, 0)
	var_15_14:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_15_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 276, _1080p * -23, _1080p * -22)
	var_15_0:addElement(var_15_14)

	var_15_0.Divider = var_15_14

	local var_15_15
	local var_15_16 = LUI.UIText.new()

	var_15_16.id = "TitleDesc"

	var_15_16:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_15_16:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_INTOBATTLE_POPUP_GOPRACTICE"), 0)
	var_15_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_16:SetWordWrap(false)
	var_15_16:SetAlignment(LUI.Alignment.Left)
	var_15_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_15_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 526, _1080p * -60, _1080p * -30)
	var_15_0:addElement(var_15_16)

	var_15_0.TitleDesc = var_15_16

	local var_15_17
	local var_15_18 = MenuBuilder.BuildRegisteredType("WarzoneOnboardingEndButtons", {
		controllerIndex = var_15_1
	})

	var_15_18.id = "WarzoneOnboardingEndButtons"

	var_15_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -597, _1080p * -113, _1080p * -73, _1080p * 162)
	var_15_0:addElement(var_15_18)

	var_15_0.WarzoneOnboardingEndButtons = var_15_18

	local function var_15_19()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_19

	local var_15_20
	local var_15_21 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WithDescription", var_15_21)

	local var_15_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("WithDescription", var_15_22)

	local var_15_23 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WithDescription", var_15_23)

	local var_15_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("WithDescription", var_15_24)

	local function var_15_25()
		var_15_10:AnimateSequence("WithDescription")
		var_15_12:AnimateSequence("WithDescription")
		var_15_14:AnimateSequence("WithDescription")
		var_15_16:AnimateSequence("WithDescription")
	end

	var_15_0._sequences.WithDescription = var_15_25

	local var_15_26
	local var_15_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("NoDescription", var_15_27)

	local var_15_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("NoDescription", var_15_28)

	local var_15_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("NoDescription", var_15_29)

	local var_15_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("NoDescription", var_15_30)

	local function var_15_31()
		var_15_10:AnimateSequence("NoDescription")
		var_15_12:AnimateSequence("NoDescription")
		var_15_14:AnimateSequence("NoDescription")
		var_15_16:AnimateSequence("NoDescription")
	end

	var_15_0._sequences.NoDescription = var_15_31

	var_0_0(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("WarzoneOnboardingEndChoicePopup", WarzoneOnboardingEndChoicePopup)
LockTable(_M)
