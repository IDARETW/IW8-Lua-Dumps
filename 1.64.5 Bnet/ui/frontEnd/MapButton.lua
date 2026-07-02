module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Button)
	arg_1_0.Button:setActionSFX(SOUND_SETS.default.action)
	arg_1_0.Button:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_1_0:GetDataSource()

		assert(var_2_0)

		if not var_2_0.isOwned:GetValue(arg_1_1) then
			local var_2_1 = "vip"

			STORE.GoToStore(arg_1_1, arg_1_0:GetCurrentMenu().id, arg_1_0.id, var_2_1, false)

			return
		end

		local var_2_2

		if CONDITIONS.IsCoreMultiplayer(arg_1_0) then
			var_2_2 = var_2_0.ref:GetValue(arg_1_1)
		else
			var_2_2 = var_2_0.ref
		end

		assert(var_2_2 and #var_2_2 > 0)

		local var_2_3 = LUI.FlowManager.GetScopedData(arg_1_0)

		if var_2_3.isTournament and var_2_3.matchmakerSettings and var_2_3.roundIndex then
			var_2_3.matchmakerSettings.maps[var_2_3.roundIndex] = var_2_2
		else
			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_2_2)

			if CONDITIONS.IsCoreMultiplayer(arg_1_0) then
				Dvar.BDEHAEGHAF("OKPMLLKRP", var_2_2)
			end

			if var_2_0.isExtendedMode and var_2_0.isExtendedMode:GetValue(arg_1_1) then
				Engine.DAGFFDGFII("set scr_map_use10v10_objectives 1")
			else
				Engine.DAGFFDGFII("set scr_map_use10v10_objectives 0")
			end

			LUI.DataSourceInControllerModel.new("alwaysLoaded.isExtendedModeSelected"):SetValue(arg_1_1, var_2_0.isExtendedMode:GetValue(arg_1_1))
			Engine.DAGFFDGFII("xupdatepartystate")
		end

		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
	end)
	arg_1_0:registerEventHandler("grid_anim", function(arg_3_0, arg_3_1)
		arg_3_0:SetAlpha(arg_3_1.value)
	end)
end

function MapButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 40 * _1080p)

	var_4_0.id = "MapButton"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Button"

	var_4_4.Text:SetLeft(_1080p * 20, 0)
	var_4_4.Text:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_4_5()
		local var_5_0 = var_4_0:GetDataSource().disabled:GetValue(var_4_1)

		if var_5_0 ~= nil then
			var_4_4:SetButtonDisabled(var_5_0)
		end
	end

	var_4_4:SubscribeToModelThroughElement(var_4_0, "disabled", var_4_5)

	local function var_4_6()
		local var_6_0 = var_4_0:GetDataSource().name:GetValue(var_4_1)

		if var_6_0 ~= nil then
			var_4_4.Text:setText(ToUpperCase(var_6_0), 0)
		end
	end

	var_4_4:SubscribeToModelThroughElement(var_4_0, "name", var_4_6)
	var_4_0:addElement(var_4_4)

	var_4_0.Button = var_4_4

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "DownloadIcon"

	var_4_8:setImage(RegisterMaterial("icon_download"), 0)
	var_4_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -80, _1080p * -54, _1080p * -13, _1080p * 13)
	var_4_0:addElement(var_4_8)

	var_4_0.DownloadIcon = var_4_8

	local var_4_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("DefaultSequence", var_4_9)

	local function var_4_10()
		var_4_8:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_10

	local var_4_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ShowDownloadIcon", var_4_11)

	local function var_4_12()
		var_4_8:AnimateSequence("ShowDownloadIcon")
	end

	var_4_0._sequences.ShowDownloadIcon = var_4_12

	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HideDownloadIcon", var_4_13)

	local function var_4_14()
		var_4_8:AnimateSequence("HideDownloadIcon")
	end

	var_4_0._sequences.HideDownloadIcon = var_4_14

	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -488
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -462
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_8:RegisterAnimationSequence("isArabic", var_4_15)

	local function var_4_16()
		var_4_8:AnimateSequence("isArabic")
	end

	var_4_0._sequences.isArabic = var_4_16

	local function var_4_17()
		if var_4_0:GetDataSource().isOwned:GetValue(var_4_1) ~= nil and var_4_0:GetDataSource().isOwned:GetValue(var_4_1) == true then
			ACTIONS.AnimateSequence(var_4_0, "HideDownloadIcon")
		end

		if var_4_0:GetDataSource().isOwned:GetValue(var_4_1) ~= nil and var_4_0:GetDataSource().isOwned:GetValue(var_4_1) == false then
			ACTIONS.AnimateSequence(var_4_0, "ShowDownloadIcon")
		end
	end

	var_4_0:SubscribeToModelThroughElement(var_4_0, "isOwned", var_4_17)
	var_0_0(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	if CONDITIONS.IsArabic(var_4_0) then
		ACTIONS.AnimateSequence(var_4_0, "isArabic")
	end

	return var_4_0
end

MenuBuilder.registerType("MapButton", MapButton)
LockTable(_M)
