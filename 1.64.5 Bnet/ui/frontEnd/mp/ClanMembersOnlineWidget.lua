module(..., package.seeall)

local var_0_0 = 0
local var_0_1 = 10

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.Label:GetCurrentAnchorsAndPositions()
	local var_1_1 = arg_1_0.Count:GetCurrentAnchorsAndPositions()
	local var_1_2 = LAYOUT.GetRawTextWidth(arg_1_0.Label, var_0_0, arg_1_1)
	local var_1_3 = var_1_1.right - var_1_1.left
	local var_1_4 = 0
	local var_1_5 = 0

	if IsLanguageArabic() then
		var_1_5 = var_1_0.right + var_1_2 + var_0_1
		var_1_4 = var_1_5 - var_1_3
	else
		var_1_4 = var_1_0.left + var_1_2 + var_0_1
		var_1_5 = var_1_4 + var_1_3
	end

	arg_1_0.Count:SetLeft(_1080p * var_1_4)
	arg_1_0.Count:SetRight(_1080p * var_1_5)
end

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0 = tostring(arg_2_1 and arg_2_1.numClanMembersOnline or 0)
	local var_2_1 = tostring(arg_2_1 and arg_2_1.numClanMembers or 1)

	arg_2_0.Count:setText(Engine.CBBHFCGDIC("LUA_MENU/TWO_STATE_SORT_PROMPT_WITH_DIVIDER", var_2_0, var_2_1))
end

local function var_0_4(arg_3_0, arg_3_1)
	var_0_3(arg_3_0, arg_3_1)
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetClanData = var_0_4

	var_0_2(arg_4_0, arg_4_1)
end

function ClanMembersOnlineWidget(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 80 * _1080p)

	var_5_0.id = "ClanMembersOnlineWidget"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIStyledText.new()

	var_5_4.id = "Label"

	var_5_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_5_4:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_MEMBERS_ONLINE"), 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_4:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 245, 0, _1080p * 30)
	var_5_0:addElement(var_5_4)

	var_5_0.Label = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "Count"

	var_5_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_5_6:setText(Engine.CBBHFCGDIC("LUA_MENU/TWO_STATE_SORT_PROMPT_WITH_DIVIDER"), 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 245, _1080p * 420, 0, _1080p * 30)
	var_5_0:addElement(var_5_6)

	var_5_0.Count = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Description"

	var_5_8:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_MEMBER_NAV_MESSAGE"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 38, _1080p * 56)
	var_5_0:addElement(var_5_8)

	var_5_0.Description = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10
	local var_5_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 420
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_5_4:RegisterAnimationSequence("AR", var_5_11)

	local var_5_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_5_6:RegisterAnimationSequence("AR", var_5_12)

	local function var_5_13()
		var_5_4:AnimateSequence("AR")
		var_5_6:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_13

	var_0_5(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ClanMembersOnlineWidget", ClanMembersOnlineWidget)
LockTable(_M)
