module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0._extraColumnsList then
		arg_1_0._extraColumnsList:closeTree()

		arg_1_0._extraColumnsList = nil
	end

	assert(arg_1_2)
	assert(Leaderboards.Boards[arg_1_2] ~= nil)

	local var_1_0 = Leaderboards.Boards[arg_1_2].extraColumns
	local var_1_1 = #var_1_0

	if var_1_1 <= 0 then
		return
	end

	local var_1_2, var_1_3, var_1_4, var_1_5 = arg_1_0:getLocalRect()
	local var_1_6 = var_1_4 - var_1_2
	local var_1_7 = 0
	local var_1_8, var_1_9, var_1_10, var_1_11 = arg_1_0.Position:getLocalRect()
	local var_1_12 = var_1_7 + (var_1_10 - var_1_8)
	local var_1_13, var_1_14, var_1_15, var_1_16 = arg_1_0.Rank:getLocalRect()
	local var_1_17 = var_1_16
	local var_1_18 = var_1_15
	local var_1_19 = var_1_14
	local var_1_20 = var_1_12 + (var_1_18 - var_1_13)
	local var_1_21, var_1_22, var_1_23, var_1_24 = arg_1_0.Name:getLocalRect()
	local var_1_25 = var_1_24
	local var_1_26 = var_1_23
	local var_1_27 = var_1_22
	local var_1_28 = var_1_20 + (var_1_26 - var_1_21)

	arg_1_0._extraColumnsList = LUI.UIHorizontalStackedLayout.new()

	arg_1_0._extraColumnsList:SetAnchorsAndPosition(0, 0, 0, 0, var_1_28, 0, 0, 0)

	arg_1_0._extraColumnsList.id = "extraColumnsList"

	arg_1_0:addElement(arg_1_0._extraColumnsList)

	local var_1_29 = IsLanguageArabic() and LUI.Alignment.Right or LUI.Alignment.Left

	for iter_1_0 = 1, var_1_1 do
		local var_1_30 = MenuBuilder.BuildRegisteredType("LeaderboardHeaderTextField", {
			controllerIndex = arg_1_1
		})

		var_1_30.id = "extraColumn" .. iter_1_0

		var_1_30:SetAnchorsAndPosition((iter_1_0 - 1) / var_1_1, 1 - iter_1_0 / var_1_1, 0, 0, 0, 0, 0, 0)

		local var_1_31 = Engine.CBBHFCGDIC(var_1_0[iter_1_0].title)

		var_1_30.Field:setText(var_1_31)
		var_1_30.Field:SetAlignment(var_1_29)
		var_1_30:SetRGBFromTable(SWATCHES.genericMenu.mainTitle)
		arg_1_0._extraColumnsList:addElement(var_1_30)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Position)
	assert(arg_2_0.Rank)
	assert(arg_2_0.Name)

	arg_2_0.CreateExtraColumns = var_0_0
end

function LeaderboardHeaderRow(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 30 * _1080p)

	var_3_0.id = "LeaderboardHeaderRow"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LeaderboardHeaderTextField", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Position"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_4.Field:setText(Engine.CBBHFCGDIC("MP_EMBLEM_EDITOR/POSITION"), 0)
	var_3_4.Field:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 13, _1080p * 108, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Position = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("LeaderboardHeaderTextField", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Rank"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6.Field:setText(Engine.CBBHFCGDIC("MENU/RANK"), 0)
	var_3_6.Field:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 108, _1080p * 217, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Rank = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("LeaderboardHeaderTextField", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Name"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_8.Field:setText(Engine.CBBHFCGDIC("MENU/NAME"), 0)
	var_3_8.Field:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 217, _1080p * 551, 0, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.Name = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local function var_3_10()
		return
	end

	var_3_0._sequences.CP = var_3_10

	local var_3_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right,
			child = var_3_0.Position.Field
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_11)

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right,
			child = var_3_0.Rank.Field
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_12)

	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right,
			child = var_3_0.Name.Field
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("AR")
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LeaderboardHeaderRow", LeaderboardHeaderRow)
LockTable(_M)
