module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_1_1, CSV.mpMapTable.cols.name)

	arg_1_0.Button.Text:setText(Engine.CBBHFCGDIC(var_1_0))

	if CONDITIONS.AreSpecOpsStarsEnabled() and IsPrivateMatch() and CONDITIONS.IsSpecOpsGameType() or CONDITIONS.InFrontendPublic() then
		local var_1_1 = CP.GetStarsEarnedForMap(arg_1_1, arg_1_0._controllerIndex)

		arg_1_0.CPStars:UpdateStars(var_1_1)
	else
		arg_1_0.CPStars:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Button)

	arg_2_0.SetMap = var_0_0
	arg_2_0._controllerIndex = arg_2_1

	if IsPrivateMatch() or IsSystemLink() then
		arg_2_0.Button:setActionSFX(SOUND_SETS.default.action)

		local var_2_0
		local var_2_1

		arg_2_0:addEventHandler("menu_create", function(arg_3_0, arg_3_1)
			var_2_0 = arg_2_0:GetDataSource()

			assert(var_2_0)

			if CONDITIONS.IsCoreMultiplayer(arg_2_0) then
				var_2_1 = var_2_0.ref:GetValue(arg_2_1)
			else
				var_2_1 = var_2_0.ref
			end

			arg_2_0:SetMap(var_2_1)
		end)
		arg_2_0.Button:addEventHandler("button_action", function(arg_4_0, arg_4_1)
			if not var_2_0.isOwned:GetValue(arg_2_1) then
				local var_4_0 = "vip"

				STORE.GoToStore(arg_2_1, arg_2_0:GetCurrentMenu().id, arg_2_0.id, var_4_0, false)

				return
			end

			assert(var_2_1 and #var_2_1 > 0)
			Dvar.BDEHAEGHAF("NSQLTTMRMP", var_2_1)
			Dvar.BDEHAEGHAF("OKPMLLKRP", var_2_1)
			Engine.DAGFFDGFII("xupdatepartystate")
			LUI.FlowManager.RequestLeaveMenu(arg_2_0, true, true)
		end)
	end
end

function CPMapButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 50 * _1080p)

	var_5_0.id = "CPMapButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Button"

	var_5_4.Text:SetLeft(_1080p * 20, 0)
	var_5_4.Text:setText("", 0)
	var_5_4.Text:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_5_5()
		local var_6_0 = var_5_0:GetDataSource().disabled:GetValue(var_5_1)

		if var_6_0 ~= nil then
			var_5_4:SetButtonDisabled(var_6_0)
		end
	end

	var_5_4:SubscribeToModelThroughElement(var_5_0, "disabled", var_5_5)
	var_5_0:addElement(var_5_4)

	var_5_0.Button = var_5_4

	local var_5_6
	local var_5_7 = MenuBuilder.BuildRegisteredType("SORewardStarsSmall", {
		controllerIndex = var_5_1
	})

	var_5_7.id = "CPStars"

	var_5_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 240, _1080p * 420, 0, _1080p * 50)
	var_5_0:addElement(var_5_7)

	var_5_0.CPStars = var_5_7

	local function var_5_8()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_8

	local var_5_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 180
		}
	}

	var_5_7:RegisterAnimationSequence("isArabic", var_5_9)

	local function var_5_10()
		var_5_7:AnimateSequence("isArabic")
	end

	var_5_0._sequences.isArabic = var_5_10

	var_0_1(var_5_0, var_5_1, arg_5_1)

	if CONDITIONS.IsArabic(var_5_0) then
		ACTIONS.AnimateSequence(var_5_0, "isArabic")
	end

	return var_5_0
end

MenuBuilder.registerType("CPMapButton", CPMapButton)
LockTable(_M)
