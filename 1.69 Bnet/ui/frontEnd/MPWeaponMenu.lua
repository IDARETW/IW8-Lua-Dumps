module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1 or Engine.IJEBHJIJF()
	local var_1_1 = PlayerData.BFFBGAJGD(var_1_0, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts
	local var_1_2 = LOADOUT.GetFavoriteLoadoutIndex(var_1_0)
	local var_1_3 = WATCH.GetEquippedWatch(var_1_0)

	if Engine.JEDFGECDJ() > 1 then
		local var_1_4 = {}

		for iter_1_0 = 0, 1 do
			local var_1_5 = var_1_1[var_1_2].weaponSetups[iter_1_0]
			local var_1_6 = WEAPON.GetWeaponModelNameFromPlayerData(var_1_5.weapon:get(), var_1_5, {
				includeCamos = true,
				includeAttachments = true,
				includeStickers = true,
				controllerIndex = var_1_0
			})

			if var_1_6 and #var_1_6 > 0 then
				table.insert(var_1_4, var_1_6)
			end
		end

		local var_1_7 = WATCH.GetFullModelName(var_1_3)

		table.insert(var_1_4, var_1_7)

		if #var_1_4 > 0 then
			FrontEndScene.RequestWeaponViewModels(var_1_4, var_1_0)
		end
	end

	for iter_1_1 = 0, 1 do
		local var_1_8 = var_1_1[var_1_2].weaponSetups[iter_1_1]
		local var_1_9 = WEAPON.GetWeaponModelNameFromPlayerData(var_1_8.weapon:get(), var_1_8, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = var_1_0
		})
		local var_1_10 = WEAPON.GenerateWeaponTable(var_1_8)

		WEAPON.SetModelIfLoaded(var_1_0, arg_1_0._weaponModels[iter_1_1], var_1_9, {
			adjustSandbags = iter_1_1 == 0,
			modelWeaponTable = var_1_10
		})
	end

	local var_1_11

	local function var_1_12()
		if ClientModel.HJHDJDCBF() then
			CLIENT_MODEL.SetAllModelsModifiable(var_1_0)
			CLIENT_MODEL.InitPatchClientModels(arg_1_0, var_1_0)
			CLIENT_MODEL.UpdateModelsForLoadout(arg_1_0, var_1_0, var_1_2)
		else
			arg_1_0:Wait(100).onComplete = var_1_12
		end
	end

	var_1_12()

	if arg_1_0.watchModel then
		WATCH.SetWatchModelIfLoaded(arg_1_0, var_1_0, arg_1_0.watchModel, var_1_3)
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	if arg_3_1 and arg_3_0.MPWeaponMenuButtons[arg_3_1] and arg_3_0.MPWeaponMenuButtons:GetIndexForElement(arg_3_0.MPWeaponMenuButtons[arg_3_1]) then
		arg_3_0.MPWeaponMenuButtons:processEvent({
			name = "lose_focus"
		})
		arg_3_0.MPWeaponMenuButtons[arg_3_1]:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0

	if arg_4_0.MPWeaponMenuButtons then
		var_4_0 = arg_4_0.MPWeaponMenuButtons:GetFocusedElementIndex()

		arg_4_0.MPWeaponMenuButtons:closeTree()

		arg_4_0.MPWeaponMenuButtons = nil
	end

	arg_4_0.MPWeaponMenuButtons = MenuBuilder.BuildRegisteredType("MPWeaponMenuButtons", {
		controllerIndex = arg_4_1
	})
	arg_4_0.MPWeaponMenuButtons.id = "MPWeaponMenuButtons"

	arg_4_0.MPWeaponMenuButtons:SetAnchorsAndPosition(arg_4_0._buttonDimensions.leftAnchor, arg_4_0._buttonDimensions.rightAnchor, arg_4_0._buttonDimensions.topAnchor, arg_4_0._buttonDimensions.bottomAnchor, arg_4_0._buttonDimensions.left, arg_4_0._buttonDimensions.right, arg_4_0._buttonDimensions.top, arg_4_0._buttonDimensions.bottom)
	arg_4_0:addElement(arg_4_0.MPWeaponMenuButtons)

	local function var_4_1()
		if var_4_0 then
			return var_4_0
		end

		return 0
	end

	arg_4_0.MPWeaponMenuButtons:SetDefaultFocus(var_4_1)
	arg_4_0.MPWeaponMenuButtons:processEvent({
		shouldPlayButtonSound = false,
		name = "gain_focus"
	})
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.MPWeaponMenuButtons)

	arg_6_0.FocusButtonByName = var_0_1

	local var_6_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = true,
		controllerIndex = arg_6_1
	})

	var_6_0:SetLimits(-0.3, 0.3, -0.3, 0.3)
	var_6_0:SetSwayValues(3500, 0.06, 0.1)
	arg_6_0:addElement(var_6_0)
	Engine.DHFCHIIJCA("loadout_showcase_overview")
	Engine.EBHIFJCGBH("loadout_showcase_entered", 1)
	Streaming.BDDBGGIC(true)

	if WATCH.GetEquippedWatch(arg_6_1) ~= WATCH.WatchNoneValue then
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary,
			FrontEndScene.ClientWeapons.Watch
		})
	else
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary
		})
	end

	if CONDITIONS.AreWZLoadoutsEnabled() and CONDITIONS.IsMagmaGameMode() and not Onboarding.WeaponCH2WZLoadoutUpdate.WasCompleted(arg_6_0, arg_6_1) then
		LUI.FlowManager.RequestPopupMenu(arg_6_0, "onboardingpopup", true, arg_6_1, false, ONBOARDING_DATA.GetOnboardingCH2WZLoadoutUpdateData())
		Onboarding.WeaponCH2WZLoadoutUpdate.MarkCompleted(arg_6_0, arg_6_1)
	end

	arg_6_0._weaponModels = {}

	for iter_6_0 = 0, 1 do
		arg_6_0._weaponModels[iter_6_0] = WEAPON.GetWeaponModel(arg_6_1, iter_6_0)

		arg_6_0:addElement(arg_6_0._weaponModels[iter_6_0])
	end

	arg_6_0._buttonDimensions = arg_6_0.MPWeaponMenuButtons:GetCurrentAnchorsAndPositions()

	local var_6_1 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex")

	local function var_6_2()
		local var_7_0 = var_6_1:GetValue(arg_6_1) or Engine.IJEBHJIJF()

		if Engine.JEDFGECDJ() > 1 then
			var_0_0(arg_6_0, var_7_0)
			var_0_2(arg_6_0, var_7_0)
		end
	end

	arg_6_0:SubscribeToModel(var_6_1:GetModel(arg_6_1), var_6_2, true)
	var_0_0(arg_6_0, arg_6_1)

	local var_6_3 = LUI.UIBindButton.new()

	var_6_3.id = "bindButton"

	arg_6_0:addElement(var_6_3)

	arg_6_0.bindButton = var_6_3

	arg_6_0.bindButton:addEventHandler("button_left_stick", function(arg_8_0, arg_8_1)
		if Dvar.IBEGCHEFE("MOSNKSLTKM") then
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
			WEAPON.ClearBreadcrumbs(arg_8_1.controller)
			arg_6_0.MPWeaponMenuButtons:RemoveBreadcrumbsFromButtons()
			LOOT.ClearTabBreadcrumb(arg_6_0)
			arg_6_0:RemoveButtonPrompt({
				side = "left",
				button_ref = "button_l3",
				helper_text = ""
			})
		end
	end)
	MenuUtils.SetupSceneChangeCallback(arg_6_0, function()
		local var_9_0 = WATCH.GetEquippedWatch(arg_6_1)

		arg_6_0.watchModel = WEAPON.GetWeaponModel(arg_6_1, FrontEndScene.ClientWeapons.Watch, CSV.weaponOffsets.watchFile)

		arg_6_0:addElement(arg_6_0.watchModel)
		WATCH.SetWatchModelIfLoaded(arg_6_0, arg_6_1, arg_6_0.watchModel, var_9_0)
		WEAPON.SetResetDynBones({
			FrontEndScene.ClientWeapons.GunTablePrimary,
			FrontEndScene.ClientWeapons.GunTableSecondary
		})
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
		LAYOUT.SetupScalingBackgroundVignette(arg_6_0, {
			customAnimState = "ShowWeaponOverlay"
		})
	end

	arg_6_0:registerEventHandler("matchrules_updated", function(arg_10_0, arg_10_1)
		arg_10_0.CDLRestrictionTag:UpdateVisibility(arg_6_1)
	end)
	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)
end

function MPWeaponMenu(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalNavigator.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "MPWeaponMenu"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_11_3 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
			controllerIndex = var_11_1
		})
		var_11_3.id = "Vignette"

		var_11_3:SetAlpha(0, 0)
		var_11_3:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1920, 0, 0)
		var_11_0:addElement(var_11_3)

		var_11_0.Vignette = var_11_3
	end

	local var_11_4
	local var_11_5 = MenuBuilder.BuildRegisteredType("MPWeaponMenuButtons", {
		controllerIndex = var_11_1
	})

	var_11_5.id = "MPWeaponMenuButtons"

	var_11_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 925)
	var_11_0:addElement(var_11_5)

	var_11_0.MPWeaponMenuButtons = var_11_5

	local var_11_6
	local var_11_7 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
		controllerIndex = var_11_1
	})

	var_11_7.id = "CDLRestrictionTag"

	var_11_7.CDLInfo:SetAlpha(1, 0)
	var_11_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
	var_11_0:addElement(var_11_7)

	var_11_0.CDLRestrictionTag = var_11_7

	local function var_11_8()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_8

	local var_11_9

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_11_10 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_3:RegisterAnimationSequence("WZWipSetup", var_11_10)
	end

	local function var_11_11()
		if CONDITIONS.IsWZWipFlowEnabled() then
			var_11_3:AnimateSequence("WZWipSetup")
		end
	end

	var_11_0._sequences.WZWipSetup = var_11_11

	var_0_3(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("MPWeaponMenu", MPWeaponMenu)
LockTable(_M)
