module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0.Score:GetCurrentAnchorsAndPositions()
	local var_1_1 = var_1_0.left
	local var_1_2 = var_1_0.right
	local var_1_3 = 0

	for iter_1_0, iter_1_1 in ipairs(arg_1_0._textFields) do
		local var_1_4 = arg_1_2.offset * iter_1_0

		iter_1_1:SetAnchors(0, 1, 0.5, 0.5)
		iter_1_1:SetLeft(var_1_1 + (var_1_4 + var_1_3) * _1080p, 0)
		iter_1_1:SetRight(var_1_2 + (var_1_4 + var_1_3) * _1080p, 0)
	end

	arg_1_0.Score:SetAnchors(0, 1, 0.5, 0.5)

	if Engine.CGABICJHAI() and CONDITIONS.InGame() then
		local var_1_5 = SCOREBOARD.GetMaxColumn(arg_1_1)
		local var_1_6 = arg_1_2.offset * (var_1_5 + 1)

		arg_1_0.Ping:SetAnchors(0, 1, 0.5, 0.5)
		arg_1_0.Ping:SetLeft(var_1_1 + var_1_6 * _1080p, 0)
		arg_1_0.Ping:SetRight(var_1_2 + var_1_6 * _1080p, 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._textFields = {}

	local var_2_0 = SCOREBOARD.GetColumnNames(arg_2_1)
	local var_2_1 = SCOREBOARD.GetMaxColumn(arg_2_1)
	local var_2_2 = -29
	local var_2_3 = -5

	if IsLanguageRussian() then
		var_2_2 = -24
		var_2_3 = -9
	elseif IsLanguageChinese() then
		var_2_2 = -30
		var_2_3 = -4
	elseif IsLanguageJapanese() then
		var_2_2 = -26
		var_2_3 = -7
	elseif IsLanguageArabic() then
		var_2_2 = -30
		var_2_3 = 0
	elseif IsLanguagePolish() then
		var_2_2 = -26
		var_2_3 = -7
	end

	for iter_2_0 = 1, var_2_1 do
		local var_2_4 = MenuBuilder.BuildRegisteredType("ScoreboardTitleTextField", {
			controllerIndex = arg_2_1
		})
		local var_2_5 = var_2_0[iter_2_0]
		local var_2_6 = StringTable.DIFCHIGDFB(CSV.gameStats.file, CSV.gameStats.cols.ref, var_2_5, CSV.gameStats.cols.name)

		var_2_4.Field:setText(Engine.CBBHFCGDIC(var_2_6), 0)
		var_2_4.Field:SetAlignment(LUI.Alignment.Center)
		var_2_4:SetRGBFromTable(SWATCHES.Scoreboard.text)
		var_2_4.Field:SetTop(_1080p * var_2_2, 0)
		var_2_4.Field:SetBottom(_1080p * var_2_3, 0)

		arg_2_0._textFields[iter_2_0] = var_2_4

		arg_2_0:addElement(arg_2_0._textFields[iter_2_0])
	end

	arg_2_0.Score.Field:SetTop(_1080p * var_2_2, 0)
	arg_2_0.Score.Field:SetBottom(_1080p * var_2_3, 0)

	if Engine.CGABICJHAI() and CONDITIONS.InGame() then
		arg_2_0.Ping.Field:SetTop(_1080p * var_2_2, 0)
		arg_2_0.Ping.Field:SetBottom(_1080p * var_2_3, 0)
	end
end

local function var_0_2(arg_3_0)
	for iter_3_0 = 1, #arg_3_0._textFields do
		arg_3_0._textFields[iter_3_0]:closeTree()
	end

	arg_3_0._textFields = {}
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Score)

	arg_4_0.PositionTextFields = var_0_0
	arg_4_0.ClearTextFields = var_0_2
	arg_4_0.BuildTextFields = var_0_1

	arg_4_0:BuildTextFields(arg_4_1)

	arg_4_2.offset = 140

	arg_4_0:PositionTextFields(arg_4_1, arg_4_2)

	if CONDITIONS.IsArenaGameType() then
		local var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_0.Score:getLocalRect()
		local var_4_4 = -20

		arg_4_0.Score:SetLeft(var_4_0 + var_4_4 * _1080p, 0)
		arg_4_0.Score:SetRight(var_4_2 + var_4_4 * _1080p, 0)
	end

	if CONDITIONS.InGame() then
		local function var_4_5()
			if DataSources.inGame.MP.match.matchOver:GetValue(arg_4_1) then
				if Engine.CGABICJHAI() then
					ACTIONS.AnimateSequence(arg_4_0, "HidePing")
				end

				if CONDITIONS.IsArenaGameType() then
					arg_4_2.offset = 88
				end

				arg_4_0:ClearTextFields()
				arg_4_0:BuildTextFields(arg_4_1)
				arg_4_0:PositionTextFields(arg_4_1, arg_4_2)
			end
		end

		arg_4_0:SubscribeToModel(DataSources.inGame.MP.match.matchOver:GetModel(arg_4_1), var_4_5)
	end
end

function ScoreboardTitleRow(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1080 * _1080p, 0, 36 * _1080p)

	var_6_0.id = "ScoreboardTitleRow"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:setUseStencil(true)

	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("ScoreboardTitleTextField", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "Score"

	var_6_4:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_6_4.Field:SetTop(_1080p * -12, 0)
	var_6_4.Field:SetBottom(_1080p * 12, 0)
	var_6_4.Field:setText(Engine.CBBHFCGDIC("PLATFORM/SCORE"), 0)
	var_6_4.Field:SetAlignment(LUI.Alignment.Center)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 320, _1080p * 465, _1080p * 20, _1080p * 20)
	var_6_0:addElement(var_6_4)

	var_6_0.Score = var_6_4

	local var_6_5

	if not Engine.DDJFBBJAIG() and not Engine.HDGDBCJFG() then
		var_6_5 = MenuBuilder.BuildRegisteredType("ScoreboardTitleTextField", {
			controllerIndex = var_6_1
		})
		var_6_5.id = "Ping"

		var_6_5:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
		var_6_5.Field:SetTop(_1080p * -12, 0)
		var_6_5.Field:SetBottom(_1080p * 12, 0)
		var_6_5.Field:setText(Engine.CBBHFCGDIC("LUA_MENU/LATENCY"), 0)
		var_6_5.Field:SetAlignment(LUI.Alignment.Center)
		var_6_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 755, _1080p * 895, _1080p * 20, _1080p * 20)
		var_6_0:addElement(var_6_5)

		var_6_0.Ping = var_6_5
	end

	local function var_6_6()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_6

	if not Engine.DDJFBBJAIG() and not Engine.HDGDBCJFG() then
		local var_6_7 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_5:RegisterAnimationSequence("HidePing", var_6_7)
	end

	local function var_6_8()
		if not Engine.DDJFBBJAIG() and not Engine.HDGDBCJFG() then
			var_6_5:AnimateSequence("HidePing")
		end
	end

	var_6_0._sequences.HidePing = var_6_8

	if not Engine.DDJFBBJAIG() and not Engine.HDGDBCJFG() then
		local var_6_9 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_5:RegisterAnimationSequence("ShowPing", var_6_9)
	end

	local function var_6_10()
		if not Engine.DDJFBBJAIG() and not Engine.HDGDBCJFG() then
			var_6_5:AnimateSequence("ShowPing")
		end
	end

	var_6_0._sequences.ShowPing = var_6_10

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ScoreboardTitleRow", ScoreboardTitleRow)
LockTable(_M)
