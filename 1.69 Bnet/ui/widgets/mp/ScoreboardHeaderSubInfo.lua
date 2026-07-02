module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.GameModeName)
	assert(arg_1_0.MapName)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	local var_1_0 = Engine.DDJFBBJAIG() and DataSources.frontEnd.AAR.gameType or DataSources.inGame.MP.match.gameMode
	local var_1_1 = Engine.DDJFBBJAIG() and DataSources.frontEnd.AAR.mapName or DataSources.inGame.mapName
	local var_1_2, var_1_3, var_1_4, var_1_5 = arg_1_0.GameModeName:getLocalRect()
	local var_1_6 = math.abs(var_1_5 - var_1_3)
	local var_1_7 = arg_1_0.GameModeName:GetCurrentFont()

	local function var_1_8()
		local var_2_0

		if Engine.DDJFBBJAIG() and Engine.ECHCFGDDDF() then
			if CONDITIONS.IsBloodMoney() or AAR.IsBloodMoneyAARDataReady(arg_1_1) or CONDITIONS.IsWZRatRace() then
				var_2_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/PAYBACK")
			elseif CONDITIONS.IsRiskGametype() then
				var_2_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/RISK")
			elseif CONDITIONS.IsBRKingSlayer() or AAR.IsBRKingSlayerAARDataReady(arg_1_1) then
				var_2_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRKING")
			elseif CONDITIONS.IsWZPayload() then
				var_2_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/PAYLOAD")
			else
				local var_2_1 = var_1_0:GetValue(arg_1_1)
				local var_2_2 = DataSources.frontEnd.AAR.gameModeModifier:GetValue(arg_1_1)

				var_2_0 = SCOREBOARD.GetGameTypeNameWithModifier(var_2_1, var_2_2)
			end
		elseif CONDITIONS.IsWZPayload() then
			var_2_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/PAYLOAD")
		else
			var_2_0 = var_1_0:GetValue(arg_1_1)
		end

		if var_2_0 then
			arg_1_0.GameModeName:setText(var_2_0)
			arg_1_0.MapName:setText(var_1_1:GetValue(arg_1_1))

			local var_2_3, var_2_4, var_2_5, var_2_6 = GetTextDimensions(var_2_0, var_1_7, var_1_6)
			local var_2_7 = var_2_5 - var_2_3 + _1080p * 30

			arg_1_0.MapName:SetLeft(var_2_7, 0)
			arg_1_0.LineBreak:SetLeft(var_2_7 - 10, 0)
			arg_1_0.LineBreak:SetRight(var_2_7 - 9, 0)
		end
	end

	arg_1_0:SubscribeToModel(var_1_0:GetModel(arg_1_1), var_1_8)
end

function ScoreboardHeaderSubInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 252 * _1080p, 0, 22 * _1080p)

	var_3_0.id = "ScoreboardHeaderSubInfo"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "MapName"

	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_4:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 275, _1080p * 620, 0, _1080p * 20)
	var_3_0:addElement(var_3_4)

	var_3_0.MapName = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "GameModeName"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 252, 0, _1080p * 20)
	var_3_0:addElement(var_3_6)

	var_3_0.GameModeName = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "LineBreak"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 264, _1080p * 265, 0, _1080p * 22)
	var_3_0:addElement(var_3_8)

	var_3_0.LineBreak = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_10)

	local var_3_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_11)

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("AR")
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_13

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ScoreboardHeaderSubInfo", ScoreboardHeaderSubInfo)
LockTable(_M)
