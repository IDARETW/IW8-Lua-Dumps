module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0._categories) do
		local var_1_0 = arg_1_1[iter_1_0]

		if not var_1_0 then
			iter_1_1.header:SetAlpha(0)

			for iter_1_2, iter_1_3 in ipairs(iter_1_1.buttons) do
				iter_1_3:SetAlpha(0)
			end

			for iter_1_4, iter_1_5 in ipairs(iter_1_1.links) do
				iter_1_5:SetAlpha(0)
			end
		end

		for iter_1_6, iter_1_7 in ipairs(var_1_0) do
			if iter_1_6 == 1 then
				iter_1_1.header:setText(iter_1_7.categoryName or "")
			end

			if iter_1_6 <= #iter_1_1.buttons then
				iter_1_1.buttons[iter_1_6]:Setup(iter_1_7)
			end

			local var_1_1 = iter_1_1.links[iter_1_6]

			if var_1_1 then
				if iter_1_7.isComplete then
					var_1_1:SetRGBFromTable(SWATCHES.genericButton.textDefault)
				else
					var_1_1:SetRGBFromTable(SWATCHES.genericButton.border)
				end
			end
		end
	end
end

local function var_0_1(arg_2_0)
	arg_2_0._categories = {
		{
			header = arg_2_0.Cat1Header,
			buttons = {
				arg_2_0.Cat1Button1,
				arg_2_0.Cat1Button2
			},
			links = {
				arg_2_0.Cat1Link1
			}
		},
		{
			header = arg_2_0.Cat2Header,
			buttons = {
				arg_2_0.Cat2Button1,
				arg_2_0.Cat2Button2
			},
			links = {
				arg_2_0.Cat2Link1
			}
		},
		{
			header = arg_2_0.Cat3Header,
			buttons = {
				arg_2_0.Cat3Button1,
				arg_2_0.Cat3Button2,
				arg_2_0.Cat3Button3,
				arg_2_0.Cat3Button4
			},
			links = {
				arg_2_0.Cat3Link1,
				arg_2_0.Cat3Link2,
				arg_2_0.Cat3Link3
			}
		}
	}
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_2.loadoutIndex)
	assert(arg_3_2.weaponSlot)

	local var_3_0 = PlayerData.BFFBGAJGD(arg_3_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_3_2.loadoutIndex].weaponSetups[arg_3_2.weaponSlot].weapon:get()
	local var_3_1 = WEAPON.GetMasterChallenges(arg_3_1, var_3_0)

	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CHALLENGE/WEAPON_MASTER_TITLE"))
	var_0_1(arg_3_0)
	var_0_0(arg_3_0, var_3_1)
	arg_3_0:registerEventHandler("update_weapon_master_challenge_details", function(arg_4_0, arg_4_1)
		assert(arg_4_1.challenge)
		arg_4_0.DetailsPanel:Setup(arg_4_1.challenge)

		local var_4_0 = WEAPON.GetMasterChallengeCompletionCount(arg_3_1)

		if var_4_0 and var_4_0 >= WEAPON.UltimateChallengeCounts.MIN then
			arg_3_0.UltimatePanel:SetAlpha(1)
			arg_3_0.UltimatePanel:Setup(var_4_0)

			if not Onboarding.WeaponMasteryClassifiedChallenges.WasCompleted(arg_3_0, arg_3_1) then
				LUI.FlowManager.RequestPopupMenu(arg_3_0, "onboardingpopup", true, arg_3_1, false, ONBOARDING_DATA.GetOnboardingWeaponClassifiedChallengeData())
				Onboarding.WeaponMasteryClassifiedChallenges.MarkCompleted(arg_3_0, arg_3_1)
			end
		else
			arg_3_0.UltimatePanel:SetAlpha(0)
		end
	end)

	if LUI.IsLastInputMouseNavigation(arg_3_1) then
		local var_3_2 = 1
		local var_3_3 = 1

		arg_3_0._categories[var_3_2].buttons[var_3_3]:processEvent({
			name = "gain_focus"
		})
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.Darkener)
end

function WeaponMasterMenu(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "WeaponMasterMenu"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = {
		worldBlur = 3,
		controllerIndex = var_5_1
	}
	local var_5_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_5_4)

	var_5_5.id = "WorldBlur"

	var_5_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_5_0:addElement(var_5_5)

	var_5_0.WorldBlur = var_5_5

	local var_5_6
	local var_5_7 = LUI.UIImage.new()

	var_5_7.id = "Darkener"

	var_5_7:SetRGBFromInt(0, 0)
	var_5_7:SetAlpha(0.2, 0)
	var_5_0:addElement(var_5_7)

	var_5_0.Darkener = var_5_7

	local var_5_8
	local var_5_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_5_1
	})

	var_5_9.id = "TabBacker"

	var_5_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_5_0:addElement(var_5_9)

	var_5_0.TabBacker = var_5_9

	local var_5_10
	local var_5_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_11.id = "MenuTitle"

	var_5_11.MenuTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/WEAPON_MASTER_TITLE"), 0)
	var_5_11.Line:SetLeft(0, 0)
	var_5_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_5_0:addElement(var_5_11)

	var_5_0.MenuTitle = var_5_11

	local var_5_12
	local var_5_13 = LUI.UIStyledText.new()

	var_5_13.id = "Cat1Header"

	var_5_13:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_13:setText(Engine.CBBHFCGDIC("CHALLENGE/WEAPON_MASTER_CATEGORY_1"), 0)
	var_5_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_13:SetAlignment(LUI.Alignment.Left)
	var_5_13:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_13:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_13:SetStartupDelay(1000)
	var_5_13:SetLineHoldTime(400)
	var_5_13:SetAnimMoveTime(1000)
	var_5_13:SetAnimMoveSpeed(150)
	var_5_13:SetEndDelay(1000)
	var_5_13:SetCrossfadeTime(1000)
	var_5_13:SetFadeInTime(300)
	var_5_13:SetFadeOutTime(300)
	var_5_13:SetMaxVisibleLines(2)
	var_5_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 448, _1080p * 200, _1080p * 224)
	var_5_0:addElement(var_5_13)

	var_5_0.Cat1Header = var_5_13

	local var_5_14
	local var_5_15 = LUI.UIStyledText.new()

	var_5_15.id = "Cat2Header"

	var_5_15:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_15:setText(Engine.CBBHFCGDIC("CHALLENGE/WEAPON_MASTER_CATEGORY_2"), 0)
	var_5_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_15:SetAlignment(LUI.Alignment.Left)
	var_5_15:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_15:SetStartupDelay(1000)
	var_5_15:SetLineHoldTime(400)
	var_5_15:SetAnimMoveTime(1000)
	var_5_15:SetAnimMoveSpeed(150)
	var_5_15:SetEndDelay(1000)
	var_5_15:SetCrossfadeTime(1000)
	var_5_15:SetFadeInTime(300)
	var_5_15:SetFadeOutTime(300)
	var_5_15:SetMaxVisibleLines(2)
	var_5_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 448, _1080p * 400, _1080p * 424)
	var_5_0:addElement(var_5_15)

	var_5_0.Cat2Header = var_5_15

	local var_5_16
	local var_5_17 = LUI.UIStyledText.new()

	var_5_17.id = "Cat3Header"

	var_5_17:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_17:setText(Engine.CBBHFCGDIC("CHALLENGE/WEAPON_MASTER_CATEGORY_3"), 0)
	var_5_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_17:SetAlignment(LUI.Alignment.Left)
	var_5_17:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_17:SetStartupDelay(1000)
	var_5_17:SetLineHoldTime(400)
	var_5_17:SetAnimMoveTime(1000)
	var_5_17:SetAnimMoveSpeed(150)
	var_5_17:SetEndDelay(1000)
	var_5_17:SetCrossfadeTime(1000)
	var_5_17:SetFadeInTime(300)
	var_5_17:SetFadeOutTime(300)
	var_5_17:SetMaxVisibleLines(2)
	var_5_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 448, _1080p * 600, _1080p * 624)
	var_5_0:addElement(var_5_17)

	var_5_0.Cat3Header = var_5_17

	local var_5_18
	local var_5_19 = MenuBuilder.BuildRegisteredType("WeaponMasterButton", {
		controllerIndex = var_5_1
	})

	var_5_19.id = "Cat1Button1"

	var_5_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 306, _1080p * 226, _1080p * 376)
	var_5_0:addElement(var_5_19)

	var_5_0.Cat1Button1 = var_5_19

	local var_5_20
	local var_5_21 = MenuBuilder.BuildRegisteredType("WeaponMasterButton", {
		controllerIndex = var_5_1
	})

	var_5_21.id = "Cat1Button2"

	var_5_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 381, _1080p * 557, _1080p * 226, _1080p * 376)
	var_5_0:addElement(var_5_21)

	var_5_0.Cat1Button2 = var_5_21

	local var_5_22
	local var_5_23 = MenuBuilder.BuildRegisteredType("WeaponMasterButton", {
		controllerIndex = var_5_1
	})

	var_5_23.id = "Cat2Button1"

	var_5_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 306, _1080p * 426, _1080p * 576)
	var_5_0:addElement(var_5_23)

	var_5_0.Cat2Button1 = var_5_23

	local var_5_24
	local var_5_25 = MenuBuilder.BuildRegisteredType("WeaponMasterButton", {
		controllerIndex = var_5_1
	})

	var_5_25.id = "Cat2Button2"

	var_5_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 381, _1080p * 557, _1080p * 426, _1080p * 576)
	var_5_0:addElement(var_5_25)

	var_5_0.Cat2Button2 = var_5_25

	local var_5_26
	local var_5_27 = MenuBuilder.BuildRegisteredType("WeaponMasterButton", {
		controllerIndex = var_5_1
	})

	var_5_27.id = "Cat3Button1"

	var_5_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 306, _1080p * 626, _1080p * 776)
	var_5_0:addElement(var_5_27)

	var_5_0.Cat3Button1 = var_5_27

	local var_5_28
	local var_5_29 = MenuBuilder.BuildRegisteredType("WeaponMasterButton", {
		controllerIndex = var_5_1
	})

	var_5_29.id = "Cat3Button2"

	var_5_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 381, _1080p * 557, _1080p * 626, _1080p * 776)
	var_5_0:addElement(var_5_29)

	var_5_0.Cat3Button2 = var_5_29

	local var_5_30
	local var_5_31 = MenuBuilder.BuildRegisteredType("WeaponMasterButton", {
		controllerIndex = var_5_1
	})

	var_5_31.id = "Cat3Button3"

	var_5_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 632, _1080p * 808, _1080p * 626, _1080p * 776)
	var_5_0:addElement(var_5_31)

	var_5_0.Cat3Button3 = var_5_31

	local var_5_32
	local var_5_33 = MenuBuilder.BuildRegisteredType("WeaponMasterButton", {
		controllerIndex = var_5_1
	})

	var_5_33.id = "Cat3Button4"

	var_5_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 883, _1080p * 1059, _1080p * 626, _1080p * 776)
	var_5_0:addElement(var_5_33)

	var_5_0.Cat3Button4 = var_5_33

	local var_5_34
	local var_5_35 = LUI.UIImage.new()

	var_5_35.id = "Cat1Link1"

	var_5_35:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_5_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 306, _1080p * 381, _1080p * 364, _1080p * 370)
	var_5_0:addElement(var_5_35)

	var_5_0.Cat1Link1 = var_5_35

	local var_5_36
	local var_5_37 = LUI.UIImage.new()

	var_5_37.id = "Cat2Link1"

	var_5_37:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_5_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 306, _1080p * 381, _1080p * 564, _1080p * 570)
	var_5_0:addElement(var_5_37)

	var_5_0.Cat2Link1 = var_5_37

	local var_5_38
	local var_5_39 = LUI.UIImage.new()

	var_5_39.id = "Cat3Link1"

	var_5_39:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_5_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 306, _1080p * 381, _1080p * 765, _1080p * 771)
	var_5_0:addElement(var_5_39)

	var_5_0.Cat3Link1 = var_5_39

	local var_5_40
	local var_5_41 = LUI.UIImage.new()

	var_5_41.id = "Cat3Link2"

	var_5_41:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_5_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 557, _1080p * 632, _1080p * 765, _1080p * 771)
	var_5_0:addElement(var_5_41)

	var_5_0.Cat3Link2 = var_5_41

	local var_5_42
	local var_5_43 = LUI.UIImage.new()

	var_5_43.id = "Cat3Link3"

	var_5_43:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_5_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 808, _1080p * 883, _1080p * 765, _1080p * 771)
	var_5_0:addElement(var_5_43)

	var_5_0.Cat3Link3 = var_5_43

	local var_5_44
	local var_5_45 = MenuBuilder.BuildRegisteredType("WeaponMasterUltimatePanel", {
		controllerIndex = var_5_1
	})

	var_5_45.id = "UltimatePanel"

	var_5_45:SetAlpha(0, 0)
	var_5_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1060, _1080p * 809, _1080p * 979)
	var_5_0:addElement(var_5_45)

	var_5_0.UltimatePanel = var_5_45

	local var_5_46
	local var_5_47 = MenuBuilder.BuildRegisteredType("WeaponMasterDetailsPanel", {
		controllerIndex = var_5_1
	})

	var_5_47.id = "DetailsPanel"

	var_5_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1214, _1080p * 1790, _1080p * 200, _1080p * 850)
	var_5_0:addElement(var_5_47)

	var_5_0.DetailsPanel = var_5_47
	var_5_19.navigation = {
		right = var_5_21,
		down = var_5_23
	}
	var_5_21.navigation = {
		left = var_5_19,
		down = var_5_25
	}
	var_5_23.navigation = {
		up = var_5_19,
		right = var_5_25,
		down = var_5_27
	}
	var_5_25.navigation = {
		left = var_5_23,
		up = var_5_21,
		down = var_5_29
	}
	var_5_27.navigation = {
		up = var_5_23,
		right = var_5_29
	}
	var_5_29.navigation = {
		left = var_5_27,
		up = var_5_25,
		right = var_5_31
	}
	var_5_31.navigation = {
		left = var_5_29,
		right = var_5_33
	}
	var_5_33.navigation = {
		left = var_5_31
	}

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_5_48 = LUI.UIBindButton.new()

	var_5_48.id = "selfBindButton"

	var_5_0:addElement(var_5_48)

	var_5_0.bindButton = var_5_48

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("WeaponMasterMenu", WeaponMasterMenu)
LockTable(_M)
