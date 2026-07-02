module(..., package.seeall)

function HeadquartersLeaderboardButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 498 * _1080p, 0, 250 * _1080p)

	var_1_0.id = "HeadquartersLeaderboardButton"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericItemBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "GenericItemBackground"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 496.9, _1080p * 24, _1080p * 248.6)
	var_1_0:addElement(var_1_4)

	var_1_0.GenericItemBackground = var_1_4

	local var_1_5

	if CONDITIONS.IsLeaderboardsKillswitched(var_1_0) then
		local var_1_6 = MenuBuilder.BuildRegisteredType("HeadquartersLeaderboardComingSoon", {
			controllerIndex = var_1_1
		})

		var_1_6.id = "HeadquartersLeaderboardComingSoon"

		var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 22.6, 0)
		var_1_0:addElement(var_1_6)

		var_1_0.HeadquartersLeaderboardComingSoon = var_1_6
	end

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("GenericButtonSelection", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "GenericButtonSelection"

	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 494.9, _1080p * 24, _1080p * 248.6)
	var_1_0:addElement(var_1_8)

	var_1_0.GenericButtonSelection = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("GenericListButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "TitleBackground"

	var_1_10.DropShadow:SetAlpha(0, 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -3.1, 0, _1080p * 24)
	var_1_0:addElement(var_1_10)

	var_1_0.TitleBackground = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIText.new()

	var_1_12.id = "Title"

	var_1_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD")), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 486.9, _1080p * 2.5, _1080p * 21.5)
	var_1_0:addElement(var_1_12)

	var_1_0.Title = var_1_12

	local var_1_13

	if not CONDITIONS.IsLeaderboardsKillswitched(var_1_0) then
		local var_1_14 = LUI.UIImage.new()

		var_1_14.id = "TrophyIcon"

		var_1_14:setImage(RegisterMaterial("icon_barracks_trophy"), 0)
		var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 160.45, _1080p * 334.45, _1080p * 49.3, _1080p * 223.3)
		var_1_0:addElement(var_1_14)

		var_1_0.TrophyIcon = var_1_14
	end

	local function var_1_15()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_15

	local var_1_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonOver", var_1_16)

	local function var_1_17()
		var_1_12:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_17

	local var_1_18 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonUp", var_1_18)

	local function var_1_19()
		var_1_12:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_19

	var_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)

	return var_1_0
end

MenuBuilder.registerType("HeadquartersLeaderboardButton", HeadquartersLeaderboardButton)
LockTable(_M)
