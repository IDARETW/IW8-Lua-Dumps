module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.BlackQuad)

	if arg_1_2.fadeUI then
		local var_1_0

		arg_1_0.BlackQuad:SetAlpha(0)

		if Engine.DDJFBBJAIG() then
			var_1_0 = DataSources.frontEnd.lobby.isUIFadingOut

			local function var_1_1()
				if var_1_0:GetValue(arg_1_1) == true then
					ACTIONS.AnimateSequence(arg_1_0, "FadeToBlack")
				else
					arg_1_0.BlackQuad:SetAlpha(0)
				end
			end

			arg_1_0:SubscribeToModel(var_1_0:GetModel(arg_1_1), var_1_1)
		else
			var_1_0 = LUI.DataSourceFromOmnvar.new("ui_total_fade")

			local var_1_2 = var_1_0:GetModel(arg_1_1)

			arg_1_0.BlackQuad:BindAlphaToModel(var_1_2)

			local var_1_3 = DataSources.inGame.MP.match.postGameState

			arg_1_0:SubscribeToModel(var_1_3:GetModel(arg_1_1), function()
				if var_1_3:GetValue(arg_1_1) == PostGameState.NUKE_TOTAL_WHITE then
					arg_1_0.BlackQuad:SetRGBFromTable(COLORS.white)
				end
			end)
		end
	else
		local var_1_4

		if Engine.DDJFBBJAIG() then
			assert(Engine.DFBHAJECAH())

			var_1_4 = LUI.DataSourceInGlobalModel.new("cg.frontendscene.opacity")
		else
			var_1_4 = LUI.DataSourceFromOmnvar.new("ui_world_fade")

			local var_1_5 = DataSources.inGame.MP.match.postGameState

			arg_1_0:SubscribeToModel(var_1_5:GetModel(arg_1_1), function()
				if var_1_5:GetValue(arg_1_1) == PostGameState.NUKE_BNK then
					local var_4_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
					local var_4_1 = MP.GetMapIsNight(var_4_0) and "mp_nukesequence_nighttime" or "mp_nukesequence_daytime"

					Engine.DFCGFCGBFD(var_4_1, VideoPlaybackFlags.LOOP)
					arg_1_0.Cinematic:SetAlpha(1)
				end
			end)
		end

		local var_1_6 = var_1_4:GetModel(arg_1_1)

		arg_1_0.BlackQuad:BindAlphaToModel(var_1_6)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.BlackQuad)
end

function ScreenFade(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "ScreenFade"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "BlackQuad"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.BlackQuad = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Cinematic"

	var_5_6:SetAlpha(0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Cinematic = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("Spinner", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Spinner"

	var_5_8:SetAlpha(0, 0)
	var_5_8:setImage(RegisterMaterial("spinner_loading"), 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 52, _1080p * 62)
	var_5_0:addElement(var_5_8)

	var_5_0.Spinner = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("FadeToBlack", var_5_10)

	local var_5_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 3750,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("FadeToBlack", var_5_11)

	local function var_5_12()
		var_5_4:AnimateSequence("FadeToBlack")
		var_5_8:AnimateSequence("FadeToBlack")
	end

	var_5_0._sequences.FadeToBlack = var_5_12

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ScreenFade", ScreenFade)
LockTable(_M)
