module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuBackgroundImage)

	if arg_1_0.MenuTitle ~= nil then
		arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/AUDIO"))
	end

	local var_1_0

	arg_1_0._selectedMix, arg_1_0._mixIndex = OPTIONS.GetCurrentAudioMixPreset()
	arg_1_0.isQuickAccessShortcutsDisabled = true

	local var_1_1 = OPTIONS_DATA.optionsDataList.MixPreset.defaultOptionValue(arg_1_1)
	local var_1_2 = OPTIONS.GetMixPresets()

	arg_1_0.ButtonsList:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = var_1_2[arg_2_2 + 1]

		arg_2_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 38 * _1080p)
		arg_2_0:SetText(Engine.CBBHFCGDIC(var_2_0.label))

		if arg_2_2 + 1 == var_1_1 then
			ACTIONS.AnimateSequence(arg_2_0, "NotificationOn")

			arg_2_0._isDefaultAudio = true
		end

		arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			arg_1_0._selectedMix = var_2_0.value

			ACTIONS.AnimateSequence(arg_3_0, "NotificationOff")

			if arg_1_0._equipped then
				arg_1_0._equipped:SetEquipped(false)

				if arg_1_0._equipped._isDefaultAudio then
					ACTIONS.AnimateSequence(arg_1_0._equipped, "NotificationOn")
				end
			end

			arg_3_0:SetEquipped(true)

			arg_1_0._equipped = arg_3_0

			if not Engine.CGABICJHAI() then
				arg_1_0:dispatchEventToCurrentMenu({
					name = "audio_updated"
				})
			end
		end)
		arg_2_0:addEventHandler("gain_focus", function(arg_4_0, arg_4_1)
			Dvar.DFIJDJFIFD("PTKLRRLLQ", var_2_0.value)
			Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_1_1)

			if var_2_0.image then
				ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
				arg_1_0.AudioPreview:setImage(RegisterMaterial(var_2_0.image))
				arg_1_0.ButtonTitle:setText(Engine.CBBHFCGDIC(var_2_0.label))
				arg_1_0.Description.Text:setText(Engine.CBBHFCGDIC(var_2_0.description))
			end

			arg_4_0:dispatchEventToParent({
				name = "request_active",
				target = arg_4_0
			})

			return true
		end)
	end)
	arg_1_0.ButtonsList:SetNavigateLikeUIList(true)
	arg_1_0.ButtonsList:SetNumColumns(1)
	arg_1_0.ButtonsList:SetNumRows(#var_1_2)
	arg_1_0.ButtonsList:RefreshContent()

	local var_1_3 = LUI.UIBindButton.new()

	var_1_3.id = "selfBindButton"

	arg_1_0:addElement(var_1_3)

	arg_1_0.bindButton = var_1_3

	arg_1_0.bindButton:registerEventHandler("button_alt1", function(arg_5_0, arg_5_1)
		arg_1_0:RemoveButtonHelperTextFromElement(arg_1_0.HelperBar, "button_alt1", "left")

		if var_1_0 == nil or not Engine.CHFEJIG(var_1_0) then
			var_1_0 = Engine.BJDBIAGIDA("ui_audio_test")

			arg_1_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/STOP_AUDIO_PROMPT"), 0)
			arg_1_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/STOP")
			})

			if arg_1_0.checkSoundTimer then
				arg_1_0:RemoveElement(arg_1_0.checkSoundTimer)
				arg_1_0.checkSoundTimer:closeTree()

				arg_1_0.checkSoundTimer = nil
			end

			arg_1_0.checkSoundTimer = LUI.UITimer.new({
				interval = 45,
				event = "checkSound"
			})

			arg_1_0:addElement(arg_1_0.checkSoundTimer)
		else
			Engine.EAGBECEBGA(var_1_0)

			var_1_0 = nil

			arg_1_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
			arg_1_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
			})

			if arg_1_0.checkSoundTimer then
				arg_1_0:RemoveElement(arg_1_0.checkSoundTimer)
				arg_1_0.checkSoundTimer:closeTree()

				arg_1_0.checkSoundTimer = nil
			end
		end
	end)
	arg_1_0:registerEventHandler("checkSound", function(arg_6_0, arg_6_1)
		if not Engine.CHFEJIG(var_1_0) then
			var_1_0 = nil

			arg_1_0:RemoveButtonHelperTextFromElement(arg_1_0.HelperBar, "button_alt1", "left")
			arg_1_0.PlayPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
			arg_1_0:AddButtonHelperText({
				kbm_only = true,
				priority = 2,
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
			})

			if arg_1_0.checkSoundTimer then
				arg_1_0:RemoveElement(arg_1_0.checkSoundTimer)
				arg_1_0.checkSoundTimer:closeTree()

				arg_1_0.checkSoundTimer = nil
			end
		end
	end)
	arg_1_0:addEventHandler("menu_close", function(arg_7_0, arg_7_1)
		if var_1_0 then
			Engine.EAGBECEBGA(var_1_0)

			var_1_0 = nil
		end
	end)
	arg_1_0:addEventHandler("menu_create", function(arg_8_0, arg_8_1)
		arg_8_0:AddButtonHelperText({
			side = "left",
			priority = 1,
			gamepad_only = true,
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_8_0:AddButtonHelperText({
			kbm_only = true,
			priority = 2,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO")
		})

		local var_8_0 = arg_8_0.ButtonsList:GetElementAtPosition(0, arg_1_0._mixIndex - 1)

		if var_8_0 then
			var_8_0:SetEquipped(true)
			ACTIONS.AnimateSequence(var_8_0, "NotificationOff")

			arg_1_0._equipped = var_8_0
		end
	end)
	arg_1_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()

	arg_1_0.Continue.buttonName = arg_1_0.Continue.Text:getText()

	arg_1_0.Continue:addEventHandler("gain_focus", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_1_0, "NoPreview")
		arg_1_0.ButtonTitle:setText(arg_1_0.Continue.buttonName)
		arg_1_0.Description.Text:setText(arg_1_0.Continue.buttonDescription)
		arg_1_0.Continue:dispatchEventToParent({
			name = "request_active",
			target = arg_1_0.Continue
		})

		return true
	end)
	arg_1_0.Continue:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		Dvar.DFIJDJFIFD("PTKLRRLLQ", arg_1_0._selectedMix)
		Engine.DAGFFDGFII("profile_menuDvarsFinish " .. arg_1_1)
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true)
	end)

	local var_1_4 = OPTIONS.InitOptionsList(arg_1_0, arg_1_1)

	BOOT.CreateMasterVolumeLogic(arg_1_0, arg_1_1, var_1_4)
	arg_1_0:SetActiveParentBehavior()
end

function BootAudioMixPreset(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0.id = "BootAudioMixPreset"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "MenuBackgroundImage"

	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.MenuBackgroundImage = var_11_4

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "MenuTitle"

	var_11_6.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/AUDIO")), 0)
	var_11_6.Line:SetLeft(0, 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_6)

	var_11_0.MenuTitle = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("GenericSliderWithEditBox", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "MasterVolume"

	var_11_8.GenericOptionButtonBase.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 751, _1080p * 202, _1080p * 256)
	var_11_0:addElement(var_11_8)

	var_11_0.MasterVolume = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("GenericOptionSubcategoryTitle", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "AudioMixLabel"

	var_11_10.OptionSubcategory:setText(Engine.CBBHFCGDIC("LUA_MENU/MIX_PRESET"), 0)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 751, _1080p * 266, _1080p * 300)
	var_11_0:addElement(var_11_10)

	var_11_0.AudioMixLabel = var_11_10

	local var_11_11
	local var_11_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 3,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 7,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericOptionButton", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_13_0, arg_13_1, arg_13_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_13 = LUI.UIGrid.new(var_11_12)

	var_11_13.id = "ButtonsList"

	var_11_13:setUseStencil(true)
	var_11_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 751, _1080p * 311, _1080p * 637)
	var_11_0:addElement(var_11_13)

	var_11_0.ButtonsList = var_11_13

	local var_11_14
	local var_11_15 = LUI.UIText.new()

	var_11_15.id = "PlayPrompt"

	var_11_15:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_11_15:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAY_AUDIO_PROMPT"), 0)
	var_11_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_15:SetAlignment(LUI.Alignment.Left)
	var_11_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 135, _1080p * 751, _1080p * 171, _1080p * 191)
	var_11_0:addElement(var_11_15)

	var_11_0.PlayPrompt = var_11_15

	local var_11_16
	local var_11_17 = LUI.UIText.new()

	var_11_17.id = "ButtonTitle"

	var_11_17:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_11_17:setText(ToUpperCase(""), 0)
	var_11_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_17:SetAlignment(LUI.Alignment.Left)
	var_11_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 811, _1080p * 1603, _1080p * 190, _1080p * 240)
	var_11_0:addElement(var_11_17)

	var_11_0.ButtonTitle = var_11_17

	local var_11_18
	local var_11_19 = LUI.UIImage.new()

	var_11_19.id = "AudioPreview"

	var_11_19:setImage(RegisterMaterial("image_options_audio"), 0)
	var_11_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 811, _1080p * 1603, _1080p * 277, _1080p * 725)
	var_11_0:addElement(var_11_19)

	var_11_0.AudioPreview = var_11_19

	local var_11_20
	local var_11_21 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_11_1
	})

	var_11_21.id = "Continue"
	var_11_21.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/CONTINUE_BOOT_DESC")

	var_11_21.Text:SetLeft(_1080p * 20, 0)
	var_11_21.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_11_21.Text:SetAlignment(LUI.Alignment.Left)
	var_11_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 751, _1080p * 682, _1080p * 722)
	var_11_0:addElement(var_11_21)

	var_11_0.Continue = var_11_21

	local var_11_22
	local var_11_23 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_23.id = "ContinueSpacerTop"

	var_11_23.SpacerImage:SetAlpha(0, 0)
	var_11_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 751, _1080p * 643, _1080p * 648)
	var_11_0:addElement(var_11_23)

	var_11_0.ContinueSpacerTop = var_11_23

	local var_11_24
	local var_11_25 = LUI.UIImage.new()

	var_11_25.id = "LineSpacer"

	var_11_25:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_11_25:SetAlpha(0.6, 0)
	var_11_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 318, _1080p * 563, _1080p * 659, _1080p * 660)
	var_11_0:addElement(var_11_25)

	var_11_0.LineSpacer = var_11_25

	local var_11_26
	local var_11_27 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_27.id = "ContinueSpacerBottom"

	var_11_27.SpacerImage:SetAlpha(0, 0)
	var_11_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 751, _1080p * 671, _1080p * 676)
	var_11_0:addElement(var_11_27)

	var_11_0.ContinueSpacerBottom = var_11_27

	local var_11_28
	local var_11_29 = MenuBuilder.BuildRegisteredType("OptionDescription", {
		controllerIndex = var_11_1
	})

	var_11_29.id = "Description"

	var_11_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 811, _1080p * 1603, _1080p * 268, _1080p * 292)
	var_11_0:addElement(var_11_29)

	var_11_0.Description = var_11_29

	local var_11_30
	local var_11_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_19:RegisterAnimationSequence("DefaultSequence", var_11_31)

	local var_11_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 739
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 763
		}
	}

	var_11_29:RegisterAnimationSequence("DefaultSequence", var_11_32)

	local function var_11_33()
		var_11_19:AnimateSequence("DefaultSequence")
		var_11_29:AnimateSequence("DefaultSequence")
	end

	var_11_0._sequences.DefaultSequence = var_11_33

	local var_11_34
	local var_11_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_19:RegisterAnimationSequence("NoPreview", var_11_35)

	local var_11_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 292
		}
	}

	var_11_29:RegisterAnimationSequence("NoPreview", var_11_36)

	local function var_11_37()
		var_11_19:AnimateSequence("NoPreview")
		var_11_29:AnimateSequence("NoPreview")
	end

	var_11_0._sequences.NoPreview = var_11_37

	var_0_0(var_11_0, var_11_1, arg_11_1)
	ACTIONS.AnimateSequence(var_11_0, "DefaultSequence")

	if CONDITIONS.IsSplitscreen(var_11_0) then
		ACTIONS.AnimateSequence(var_11_0, "Splitscreen")
	end

	return var_11_0
end

MenuBuilder.registerType("BootAudioMixPreset", BootAudioMixPreset)
LockTable(_M)
