module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	return
end

function NewOperatorsFactionInfo(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 800 * _1080p, 0, 850 * _1080p)

	var_2_0.id = "NewOperatorsFactionInfo"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "FactionIcon"

	var_2_4:SetAlpha(0.5, 0)
	var_2_4:SetColorOp(COLOR_OP.saturation, 0)
	var_2_4:SetColorOpParam(1, 0)
	var_2_4:setImage(RegisterMaterial("icon_faction_sas_large"), 0)
	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -135, _1080p * 135, _1080p * -409, _1080p * -139)
	var_2_0:addElement(var_2_4)

	var_2_0.FactionIcon = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "SuperFactionName"

	var_2_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 301, _1080p * -301, _1080p * -779, _1080p * -751)
	var_2_0:addElement(var_2_6)

	var_2_0.SuperFactionName = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "SubFaction"

	var_2_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 218, _1080p * -218, _1080p * -740, _1080p * -640)
	var_2_0:addElement(var_2_8)

	var_2_0.SubFaction = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "TheSquad"

	var_2_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_10:setText("", 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetWordWrap(false)
	var_2_10:SetAlignment(LUI.Alignment.Center)
	var_2_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 301, _1080p * -301, _1080p * -611, _1080p * -587)
	var_2_0:addElement(var_2_10)

	var_2_0.TheSquad = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("NewOperatorIconList", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "NewOperatorIconList"

	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 750, _1080p * 309, _1080p * 491)
	var_2_0:addElement(var_2_12)

	var_2_0.NewOperatorIconList = var_2_12

	local var_2_13
	local var_2_14 = MenuBuilder.BuildRegisteredType("OperatorIntroVideo", {
		controllerIndex = var_2_1
	})

	var_2_14.id = "OperatorIntroVideo"

	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 172, _1080p * 628, _1080p * 530, _1080p * 786)
	var_2_0:addElement(var_2_14)

	var_2_0.OperatorIntroVideo = var_2_14

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("NewOperatorsFactionInfo", NewOperatorsFactionInfo)
LockTable(_M)
