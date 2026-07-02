module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	local var_1_0 = Engine.DDJFBBJAIG() and DataSources.frontEnd.AAR.gameType:GetValue(arg_1_1) or Dvar.DHEEJCCJBH("MOLPOSLOMO")
	local var_1_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_1_0, CSV.gameTypesTable.cols.name)

	if var_1_1 then
		arg_1_0.GameMode:setText(Engine.CBBHFCGDIC(var_1_1))
	end

	if CONDITIONS.InFrontend(arg_1_0) then
		local var_1_2 = DataSources.frontEnd.AAR.mapName:GetValue(arg_1_1)

		if var_1_2 then
			arg_1_0.Map:setText(var_1_2)
		end
	else
		local var_1_3 = CONDITIONS.IsThirdGameMode() and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "" and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "none"
		local var_1_4 = var_1_3 and CSV.mpMapTable.cols.cpMissionName or CSV.mpMapTable.cols.ref
		local var_1_5 = var_1_3 and Dvar.DHEEJCCJBH("PTNOLQOOP") or Dvar.DHEEJCCJBH("NSQLTTMRMP")
		local var_1_6 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, var_1_4, var_1_5, CSV.mpMapTable.cols.caps)

		if var_1_6 then
			arg_1_0.Map:setText(Engine.CBBHFCGDIC(var_1_6))
		end
	end
end

function CPScoreboardHeader(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 252 * _1080p, 0, 22 * _1080p)

	var_2_0.id = "CPScoreboardHeader"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "Map"

	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetWordWrap(false)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 275, _1080p * 620, 0, _1080p * 20)
	var_2_0:addElement(var_2_4)

	var_2_0.Map = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "GameMode"

	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 252, 0, _1080p * 20)
	var_2_0:addElement(var_2_6)

	var_2_0.GameMode = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "DividingLine"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 264, _1080p * 265, 0, _1080p * 22)
	var_2_0:addElement(var_2_8)

	var_2_0.DividingLine = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
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

	var_2_4:RegisterAnimationSequence("AR", var_2_10)

	local var_2_11 = {
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

	var_2_6:RegisterAnimationSequence("AR", var_2_11)

	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("AR")
		var_2_6:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_13

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CPScoreboardHeader", CPScoreboardHeader)
LockTable(_M)
