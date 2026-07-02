module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = 4 * _1080p
	local var_1_1 = LAYOUT.GetTextWidth(arg_1_0.CreatorName)

	arg_1_0.Supporting:SetRight(-var_1_1 - var_1_0)
end

local function var_0_1(arg_2_0)
	local var_2_0, var_2_1 = Loot.BGIBBGIIDJ(arg_2_0._controllerIndex)
	local var_2_2 = Loot.DBHFICJCGE(arg_2_0._controllerIndex)

	if var_2_1 and Dvar.IBEGCHEFE("OLNMSNSTKS") and not var_2_2 then
		if Dvar.IBEGCHEFE("MTQRRPSQLR") then
			local var_2_3 = Engine.CBBHFCGDIC("CONTENT_CREATOR_CODES/" .. var_2_1)

			arg_2_0.CreatorName:setText(var_2_3)
		else
			arg_2_0.CreatorName:setText(var_2_1)
		end

		arg_2_0:SetAlpha(1)
	else
		arg_2_0:SetAlpha(0)
	end

	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._controllerIndex = arg_3_1

	var_0_1(arg_3_0)
	arg_3_0:registerEventHandler("restore_focus", function(arg_4_0, arg_4_1)
		var_0_1(arg_4_0)
	end)
end

function SupportingCreatorCode(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 24 * _1080p)

	var_5_0.id = "SupportingCreatorCode"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIStyledText.new()

	var_5_4.id = "Supporting"

	var_5_4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SUPPORTING"), 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetAlignment(LUI.Alignment.Right)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -281, 0, _1080p * 24)
	var_5_0:addElement(var_5_4)

	var_5_0.Supporting = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "CreatorName"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_5_6:setText("", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetAlignment(LUI.Alignment.Right)
	var_5_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -281, 0, 0, _1080p * 24)
	var_5_0:addElement(var_5_6)

	var_5_0.CreatorName = var_5_6

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SupportingCreatorCode", SupportingCreatorCode)
LockTable(_M)
