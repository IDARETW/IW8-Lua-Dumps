module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.PlaylistTypeLabel:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CHANGE_PLAYLIST", Engine.JCBDICCAH(arg_1_1)))

	arg_1_0._name = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._name = ""

	local function var_2_0(arg_3_0, arg_3_1)
		arg_3_0.PlaylistTypeLabel:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CHANGE_PLAYLIST", Engine.JCBDICCAH(arg_3_0._name)))
	end

	arg_2_0:addAndCallEventHandler("update_input_type", var_2_0, {
		controllerIndex = arg_2_1
	})

	arg_2_0.UpdateString = var_0_0
end

function PlaylistFilterPromptButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 498 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "PlaylistFilterPromptButton"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "PlaylistTypeLabel"

	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:SetWordWrap(false)
	var_4_4:SetAlignment(LUI.Alignment.Right)
	var_4_4:SetTintFontIcons(true)
	var_4_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -490, 0, 0, _1080p * 30)
	var_4_0:addElement(var_4_4)

	var_4_0.PlaylistTypeLabel = var_4_4

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("PlaylistFilterPromptButton", PlaylistFilterPromptButton)
LockTable(_M)
