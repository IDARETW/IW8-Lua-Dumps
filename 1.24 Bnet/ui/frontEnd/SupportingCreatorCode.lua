module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0, var_1_1 = Loot.BGIBBGIIDJ(arg_1_0._controllerIndex)
	local var_1_2 = os.time()
	local var_1_3 = Loot.DBHFICJCGE(arg_1_0._controllerIndex)

	if var_1_1 and Dvar.IBEGCHEFE("OLNMSNSTKS") and not var_1_3 then
		local var_1_4 = Engine.CBBHFCGDIC("CONTENT_CREATOR_CODES/" .. var_1_1)

		arg_1_0.CreatorName:setText(var_1_4)
		arg_1_0:SetAlpha(1)
	else
		arg_1_0:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1

	var_0_0(arg_2_0)
	LUI.FlowManager.RegisterStackPopBehaviour("CreatorCodePopup", function()
		var_0_0(arg_2_0)
	end)
end

function SupportingCreatorCode(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 24 * _1080p)

	var_4_0.id = "SupportingCreatorCode"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIStyledText.new()

	var_4_4.id = "Supporting"

	var_4_4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SUPPORTING"), 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 116, 0, _1080p * 24)
	var_4_0:addElement(var_4_4)

	var_4_0.Supporting = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "CreatorName"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 119, _1080p * 400, 0, _1080p * 24)
	var_4_0:addElement(var_4_6)

	var_4_0.CreatorName = var_4_6

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SupportingCreatorCode", SupportingCreatorCode)
LockTable(_M)
