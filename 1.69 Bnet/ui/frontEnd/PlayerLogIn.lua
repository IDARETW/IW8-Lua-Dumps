module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TextLabel)

	local function var_1_0()
		local var_2_0 = DataSources.frontEnd.primaryPlayerUserName:GetValue(arg_1_1)

		if var_2_0 == nil or var_2_0 == "" then
			arg_1_0.TextLabel:setText(ToUpperCase(Engine.CBBHFCGDIC("XBOXLIVE/NOTSIGNEDIN"), 0))
		else
			local var_2_1 = Engine.JCBDICCAH(var_2_0)

			arg_1_0.TextLabel:setText(ToUpperCase(Engine.CBBHFCGDIC("XBOXLIVE/SIGNEDINAS", var_2_1), 0))
		end
	end

	local var_1_1 = DataSources.frontEnd.primaryPlayerUserName

	arg_1_0.TextLabel:SubscribeToModel(var_1_1:GetModel(arg_1_1), var_1_0)
end

function PlayerLogIn(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 24 * _1080p)

	var_3_0.id = "PlayerLogIn"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "TextLabel"

	var_3_4:setText(ToUpperCase(Engine.CBBHFCGDIC("XBOXLIVE/SIGNEDINAS")), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_3_0:addElement(var_3_4)

	var_3_0.TextLabel = var_3_4

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PlayerLogIn", PlayerLogIn)
LockTable(_M)
