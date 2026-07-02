module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "Player")
	else
		ACTIONS.AnimateSequence(arg_1_0, arg_1_2 and "ButtonOver" or "ButtonUp")
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0._data == nil then
		return
	end

	var_0_0(arg_2_0, arg_2_0._data.isMyPlayer, arg_2_0._over)
	var_0_0(arg_2_0.Name, arg_2_0._data.isMyPlayer, arg_2_0._over)
	var_0_0(arg_2_0.Position, arg_2_0._data.isMyPlayer, arg_2_0._over)

	local var_2_0 = arg_2_0.Rank.RankDisplay:getText()

	if var_2_0 and #var_2_0 > 0 then
		var_0_0(arg_2_0.Rank, arg_2_0._data.isMyPlayer, arg_2_0._over)
	else
		ACTIONS.AnimateSequence(arg_2_0.Rank, "Disabled")
	end

	local var_2_1 = arg_2_0._extraColumnsList:getFirstChild()

	while var_2_1 do
		var_0_0(var_2_1, arg_2_0._data.isMyPlayer, arg_2_0._over)

		var_2_1 = var_2_1:getNextSibling()
	end

	if arg_2_0._data.rowIndex and arg_2_0._data.rowIndex % 2 == 0 then
		ACTIONS.AnimateSequence(arg_2_0, "IsAlternate")
	else
		ACTIONS.AnimateSequence(arg_2_0, "IsNotAlternate")
	end

	if arg_2_0._data.isMyPlayer then
		arg_2_0.YouIndicatorLeft:SetAlpha(1)
	else
		arg_2_0.YouIndicatorLeft:SetAlpha(0)
	end

	ACTIONS.AnimateSequence(arg_2_0, arg_2_0._over and "ButtonOver" or "ButtonUp")
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0._extraColumnsList then
		arg_3_0._extraColumnsList:closeTree()

		arg_3_0._extraColumnsList = nil
	end

	assert(arg_3_2)
	assert(Leaderboards.Boards[arg_3_2] ~= nil)

	local var_3_0 = Leaderboards.Boards[arg_3_2].extraColumns
	local var_3_1 = #var_3_0

	if var_3_1 <= 0 then
		return
	end

	local var_3_2, var_3_3, var_3_4, var_3_5 = arg_3_0:getLocalRect()
	local var_3_6 = var_3_4 - var_3_2
	local var_3_7 = 6
	local var_3_8, var_3_9, var_3_10, var_3_11 = arg_3_0.Position:getLocalRect()
	local var_3_12 = var_3_7 + (var_3_10 - var_3_8)
	local var_3_13, var_3_14, var_3_15, var_3_16 = arg_3_0.Rank:getLocalRect()
	local var_3_17 = var_3_16
	local var_3_18 = var_3_15
	local var_3_19 = var_3_14
	local var_3_20 = var_3_12 + (var_3_18 - var_3_13)
	local var_3_21, var_3_22, var_3_23, var_3_24 = arg_3_0.SocialPlatformPresence:getLocalRect()
	local var_3_25 = var_3_24
	local var_3_26 = var_3_23
	local var_3_27 = var_3_22
	local var_3_28 = var_3_20 + (var_3_26 - var_3_21)
	local var_3_29, var_3_30, var_3_31, var_3_32 = arg_3_0.Name:getLocalRect()
	local var_3_33 = var_3_32
	local var_3_34 = var_3_31
	local var_3_35 = var_3_30
	local var_3_36 = var_3_28 + (var_3_34 - var_3_29)

	arg_3_0._extraColumnsList = LUI.UIHorizontalStackedLayout.new()

	arg_3_0._extraColumnsList:SetAnchorsAndPosition(0, 0, 0, 0, var_3_36, 0, 0, 0)

	arg_3_0._extraColumnsList.id = "extraColumnsList"

	arg_3_0:addElement(arg_3_0._extraColumnsList)

	for iter_3_0 = 1, var_3_1 do
		local var_3_37 = MenuBuilder.BuildRegisteredType("LeaderboardTextField", {
			controllerIndex = arg_3_1
		})

		var_3_37.id = "extraColumn" .. iter_3_0

		var_3_37:SetAnchorsAndPosition((iter_3_0 - 1) / var_3_1, 1 - iter_3_0 / var_3_1, 0, 0, 0, 0, 0, 0)
		var_3_37:addEventHandler("button_up", function(arg_4_0, arg_4_1)
			if arg_3_0._data then
				var_0_0(arg_4_0, arg_3_0._data.isMyPlayer, false)
			end
		end)
		var_3_37:addEventHandler("button_over", function(arg_5_0, arg_5_1)
			if arg_3_0._data then
				var_0_0(arg_5_0, arg_3_0._data.isMyPlayer, true)
			end
		end)

		var_3_37.columnKey = var_3_0[iter_3_0].key

		arg_3_0._extraColumnsList:addElement(var_3_37)
	end

	arg_3_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if arg_3_0._data then
			var_0_0(arg_6_0.Name, arg_3_0._data.isMyPlayer, true)
			var_0_0(arg_6_0.Position, arg_3_0._data.isMyPlayer, true)

			local var_6_0 = arg_3_0.Rank.RankDisplay:getText()

			if var_6_0 and #var_6_0 > 0 then
				var_0_0(arg_6_0.Rank, arg_3_0._data.isMyPlayer, true)
			else
				ACTIONS.AnimateSequence(arg_3_0.Rank, "Disabled")
			end
		end
	end)
	arg_3_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if arg_3_0._data then
			var_0_0(arg_7_0.Name, arg_3_0._data.isMyPlayer, false)
			var_0_0(arg_7_0.Position, arg_3_0._data.isMyPlayer, false)

			local var_7_0 = arg_3_0.Rank.RankDisplay:getText()

			if var_7_0 and #var_7_0 > 0 then
				var_0_0(arg_7_0.Rank, arg_3_0._data.isMyPlayer, false)
			else
				ACTIONS.AnimateSequence(arg_3_0.Rank, "Disabled")
			end
		end
	end)
end

local function var_0_3(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	if arg_8_0._leaderboard ~= arg_8_2 then
		arg_8_0:CreateExtraColumns(arg_8_1, arg_8_2)

		arg_8_0._leaderboard = arg_8_2
	end

	assert(arg_8_3)

	arg_8_0._data = arg_8_3

	arg_8_0.Name.Field:setText("")
	arg_8_0.Position.Field:setText("")
	arg_8_0.Rank.RankDisplay:setText("")
	arg_8_0.Rank.RankIcon:SetAlpha(0)

	local var_8_0 = arg_8_0._extraColumnsList:getFirstChild()

	while var_8_0 do
		var_8_0.Field:setText("")

		var_8_0 = var_8_0:getNextSibling()
	end

	if not arg_8_0._data.Gamertag or #arg_8_0._data.Gamertag == 0 then
		arg_8_0._data.Gamertag = arg_8_0._data["Gamer Name"]
	end

	if not (arg_8_0._data.Gamertag and #arg_8_0._data.Gamertag > 0) then
		if not arg_8_0._spinner then
			arg_8_0._spinner = MenuBuilder.BuildRegisteredType("Spinner")

			arg_8_0._spinner:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * -5, _1080p * 5)
			arg_8_0:addElement(arg_8_0._spinner)
		end

		return
	elseif arg_8_0._spinner then
		arg_8_0._spinner:closeTree()

		arg_8_0._spinner = nil
	end

	arg_8_0._rankValue = 0

	for iter_8_0, iter_8_1 in pairs(arg_8_0._data) do
		if iter_8_0 == "Gamer Name" or iter_8_0 == "Gamertag" then
			arg_8_0.Name.Field:setText(iter_8_1)
		elseif iter_8_0 == "Rank" then
			arg_8_0.Position.Field:setText(iter_8_1)
		elseif (iter_8_0 == "Total XP" or iter_8_0 == "Magma Total XP") and iter_8_1 and #iter_8_1 > 0 then
			local var_8_1 = arg_8_0._data["Prestige Level"] or arg_8_0._data["Magma Prestige Level"]
			local var_8_2 = tonumber(iter_8_1)

			if var_8_1 and #var_8_1 > 0 then
				var_8_2 = var_8_2 + tonumber(var_8_1)
			end

			arg_8_0.Rank.RankDisplay:setText(var_8_2)
			arg_8_0.Rank.RankIcon:SetAlpha(1)
			arg_8_0.Rank.RankIcon:setImage(RegisterMaterial(PROGRESSION.GetRankIcon(var_8_2)))

			arg_8_0._rankValue = var_8_2
		end
	end

	local var_8_3 = arg_8_0._extraColumnsList:getFirstChild()

	while var_8_3 do
		assert(var_8_3.columnKey)

		local var_8_4 = arg_8_0._data[var_8_3.columnKey]

		if var_8_4 then
			if var_8_3.columnKey == "BMoney Cash" then
				var_8_4 = BRLOOT.GetAbbreviatedNumber(var_8_4 * 10000)
			end

			var_8_3.Field:setText(var_8_4)
		end

		var_8_3 = var_8_3:getNextSibling()
	end

	if arg_8_0._data.Platform then
		local var_8_5 = Leaderboards.ConvertToClientPlatform(tonumber(arg_8_0._data.Platform))

		arg_8_0.SocialPlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[var_8_5])
	end

	var_0_1(arg_8_0)
end

local function var_0_4(arg_9_0)
	if arg_9_0._data and arg_9_0._data.xuid then
		local var_9_0 = Engine.DADEEDCCAC(arg_9_0._data.xuid)

		return {
			gamerTag = var_9_0.gamertag,
			bgImage = CallingCardUtils.GetCardTexture(var_9_0.background),
			emblemImage = EmblemEditorUtils.GetEmblemImageFromID(var_9_0.emblemIndex),
			platform = Leaderboards.ConvertToClientPlatform(tonumber(arg_9_0._data.Platform)),
			rankIcon = PROGRESSION.GetRankBigIcon(arg_9_0._rankValue),
			rankDisplay = arg_9_0._rankValue,
			rankName = PROGRESSION.GetRankName(arg_9_0._rankValue)
		}
	end
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.Position)
	assert(arg_10_0.Rank)
	assert(arg_10_0.Rank.RankIcon)
	assert(arg_10_0.Name)

	arg_10_0.Populate = var_0_3
	arg_10_0.CreateExtraColumns = var_0_2
	arg_10_0.UpdateAnimation = var_0_1
	arg_10_0.GetPlayerCardData = var_0_4

	arg_10_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		arg_10_0._over = true

		if arg_10_0._data and arg_10_0._data.xuid then
			arg_10_0:dispatchEventToCurrentMenu({
				name = "leaderboard_row_on_button_over",
				row = arg_11_0
			})
		end

		var_0_1(arg_10_0)
	end)
	arg_10_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		arg_12_0._over = false

		var_0_1(arg_12_0)
	end)
end

function LeaderboardRow(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 30 * _1080p)

	var_13_0.id = "LeaderboardRow"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Background"

	var_13_4:SetRGBFromInt(0, 0)
	var_13_4:SetAlpha(0.2, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "TextureLayer"

	var_13_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_13_6:SetAlpha(0.1, 0)
	var_13_6:SetPixelGridEnabled(true)
	var_13_6:SetPixelGridContrast(0.8, 0)
	var_13_6:SetPixelGridBlockWidth(2, 0)
	var_13_6:SetPixelGridBlockHeight(2, 0)
	var_13_6:SetPixelGridGutterWidth(1, 0)
	var_13_6:SetPixelGridGutterHeight(1, 0)
	var_13_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_13_0:addElement(var_13_6)

	var_13_0.TextureLayer = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("LeaderboardTextField", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "Position"

	var_13_8.Field:setText("99999", 0)
	var_13_8.Field:SetAlignment(LUI.Alignment.Left)
	var_13_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 13, _1080p * 112, 0, _1080p * -1)
	var_13_0:addElement(var_13_8)

	var_13_0.Position = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("LeaderboardRankField", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "Rank"

	var_13_10.RankDisplay:setText("", 0)
	var_13_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 103, _1080p * 212, 0, _1080p * -1)
	var_13_0:addElement(var_13_10)

	var_13_0.Rank = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("LeaderboardTextField", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "Name"

	var_13_12.Field:setText("", 0)
	var_13_12.Field:SetAlignment(LUI.Alignment.Left)
	var_13_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 246, _1080p * 546, 0, _1080p * -1)
	var_13_0:addElement(var_13_12)

	var_13_0.Name = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "SocialPlatformPresence"

	var_13_14:SetAlpha(0.75, 0)
	var_13_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 217, _1080p * 239, _1080p * -11, _1080p * 11)
	var_13_0:addElement(var_13_14)

	var_13_0.SocialPlatformPresence = var_13_14

	local var_13_15
	local var_13_16 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_13_17 = LUI.UIBorder.new(var_13_16)

	var_13_17.id = "Highlight"

	var_13_17:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_13_17:SetAlpha(0, 0)
	var_13_17:SetBorderThicknessLeft(_1080p * 0, 0)
	var_13_17:SetBorderThicknessRight(_1080p * 0, 0)
	var_13_17:SetBorderThicknessBottom(_1080p * 0, 0)
	var_13_17:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 0)
	var_13_0:addElement(var_13_17)

	var_13_0.Highlight = var_13_17

	local var_13_18
	local var_13_19 = MenuBuilder.BuildRegisteredType("YouIndicatorLeft", {
		controllerIndex = var_13_1
	})

	var_13_19.id = "YouIndicatorLeft"

	var_13_19:SetAlpha(0, 0)
	var_13_19:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 25, _1080p * 100, _1080p * -15, _1080p * 15)
	var_13_0:addElement(var_13_19)

	var_13_0.YouIndicatorLeft = var_13_19

	local function var_13_20()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_20

	local var_13_21
	local var_13_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonOver", var_13_22)

	local var_13_23 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOver", var_13_23)

	local var_13_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOver", var_13_24)

	local var_13_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_17:RegisterAnimationSequence("ButtonOver", var_13_25)

	local function var_13_26()
		var_13_4:AnimateSequence("ButtonOver")
		var_13_6:AnimateSequence("ButtonOver")
		var_13_14:AnimateSequence("ButtonOver")
		var_13_17:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_26

	local var_13_27
	local var_13_28 = {
		{
			value = 0.05,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUp", var_13_28)

	local var_13_29 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUp", var_13_29)

	local var_13_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_17:RegisterAnimationSequence("ButtonUp", var_13_30)

	local function var_13_31()
		var_13_6:AnimateSequence("ButtonUp")
		var_13_14:AnimateSequence("ButtonUp")
		var_13_17:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_31

	local var_13_32
	local var_13_33 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("IsAlternate", var_13_33)

	local function var_13_34()
		var_13_4:AnimateSequence("IsAlternate")
	end

	var_13_0._sequences.IsAlternate = var_13_34

	local var_13_35
	local var_13_36 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("IsNotAlternate", var_13_36)

	local function var_13_37()
		var_13_4:AnimateSequence("IsNotAlternate")
	end

	var_13_0._sequences.IsNotAlternate = var_13_37

	var_0_5(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("LeaderboardRow", LeaderboardRow)
LockTable(_M)
