module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "Player")
	else
		WZWIP.AnimateThemeElement(arg_1_0, arg_1_2 and "ButtonOver" or "ButtonUp")
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

	WZWIP.AnimateThemeElement(arg_2_0, arg_2_0._over and "ButtonOver" or "ButtonUp")
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

	arg_8_0._combinedRankValue = 0

	for iter_8_0, iter_8_1 in pairs(arg_8_0._data) do
		if iter_8_0 == "Gamer Name" or iter_8_0 == "Gamertag" then
			arg_8_0.Name.Field:setText(iter_8_1)
		elseif iter_8_0 == "Rank" then
			arg_8_0.Position.Field:setText(iter_8_1)
		elseif (iter_8_0 == "Total XP" or iter_8_0 == "Magma Total XP") and iter_8_1 and #iter_8_1 > 0 then
			local var_8_1 = arg_8_0._data["Prestige Level"]
			local var_8_2 = PROGRESSION.ValidatePrestigeLevel(tonumber(var_8_1 or arg_8_0._data["Magma Prestige Level"]), {
				_isBackendPrestigeLevel = true
			})

			arg_8_0._combinedRankValue = tonumber(iter_8_1)
			arg_8_0._progData = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = arg_8_0._combinedRankValue,
				_prestigeLevel = var_8_2
			})

			assert(arg_8_0._progData, "LeaderboardRow->Populate(): self._progData is always expected to be non-nil here")
			arg_8_0.Rank.RankDisplay:setText(arg_8_0._progData._rankDisplay)
			arg_8_0.Rank.RankIcon:SetAlpha(1)
			arg_8_0.Rank.RankIcon:setImage(RegisterMaterial(arg_8_0._progData._rankIcon))
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

		assert(arg_9_0._progData, "LeaderboardRow->GetPlayerCardData(): self._progData is always expected to be non-nil here")

		return {
			gamerTag = var_9_0.gamertag,
			bgImage = CallingCardUtils.GetCardTexture(var_9_0.background),
			emblemImage = EmblemEditorUtils.GetEmblemImageFromID(var_9_0.emblemIndex),
			platform = Leaderboards.ConvertToClientPlatform(tonumber(arg_9_0._data.Platform)),
			rankIcon = arg_9_0._progData._rankIcon,
			rankDisplay = arg_9_0._progData._rankDisplay,
			rankName = arg_9_0._progData._rankName
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

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_10_0, "WZWipSetup")
	end
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

	if not CONDITIONS.IsMagmaGameMode() then
		var_13_5 = LUI.UIImage.new()
		var_13_5.id = "TextureLayer"

		var_13_5:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_13_5:SetAlpha(0.1, 0)
		var_13_5:SetPixelGridEnabled(true)
		var_13_5:SetPixelGridContrast(0.8, 0)
		var_13_5:SetPixelGridBlockWidth(2, 0)
		var_13_5:SetPixelGridBlockHeight(2, 0)
		var_13_5:SetPixelGridGutterWidth(1, 0)
		var_13_5:SetPixelGridGutterHeight(1, 0)
		var_13_5:setImage(RegisterMaterial("ui_default_white"), 0)
		var_13_0:addElement(var_13_5)

		var_13_0.TextureLayer = var_13_5
	end

	local var_13_6

	if CONDITIONS.IsMagmaGameMode() then
		var_13_6 = LUI.UIImage.new()
		var_13_6.id = "WZWipBackground"

		var_13_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
		var_13_6:Setup3SliceHorizontalImage(_1080p * 6, 0.3)
		var_13_0:addElement(var_13_6)

		var_13_0.WZWipBackground = var_13_6
	end

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

	if not CONDITIONS.IsMagmaGameMode() then
		local var_13_16 = {
			borderThicknessLeft = _1080p * 0,
			borderThicknessRight = _1080p * 0,
			borderThicknessTop = _1080p * 1,
			borderThicknessBottom = _1080p * 0
		}

		var_13_15 = LUI.UIBorder.new(var_13_16)
		var_13_15.id = "Highlight"

		var_13_15:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
		var_13_15:SetAlpha(0, 0)
		var_13_15:SetBorderThicknessLeft(_1080p * 0, 0)
		var_13_15:SetBorderThicknessRight(_1080p * 0, 0)
		var_13_15:SetBorderThicknessBottom(_1080p * 0, 0)
		var_13_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 0)
		var_13_0:addElement(var_13_15)

		var_13_0.Highlight = var_13_15
	end

	local var_13_17
	local var_13_18 = MenuBuilder.BuildRegisteredType("YouIndicatorLeft", {
		controllerIndex = var_13_1
	})

	var_13_18.id = "YouIndicatorLeft"

	var_13_18:SetAlpha(0, 0)
	var_13_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * 25, _1080p * 100, _1080p * -15, _1080p * 15)
	var_13_0:addElement(var_13_18)

	var_13_0.YouIndicatorLeft = var_13_18

	local var_13_19

	if CONDITIONS.IsMagmaGameMode() then
		var_13_19 = LUI.UIImage.new()
		var_13_19.id = "BotBorderWZ"

		var_13_19:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_13_19:SetAlpha(0.6, 0)
		var_13_19:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
		var_13_0:addElement(var_13_19)

		var_13_0.BotBorderWZ = var_13_19
	end

	local var_13_20

	if CONDITIONS.IsMagmaGameMode() then
		var_13_20 = LUI.UIImage.new()
		var_13_20.id = "TopBorderWZ"

		var_13_20:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
		var_13_20:SetAlpha(0.6, 0)
		var_13_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
		var_13_0:addElement(var_13_20)

		var_13_0.TopBorderWZ = var_13_20
	end

	local function var_13_21()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_21

	local var_13_22
	local var_13_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonOver", var_13_23)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_13_24 = {
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

		var_13_5:RegisterAnimationSequence("ButtonOver", var_13_24)
	end

	local var_13_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonOver", var_13_25)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_13_26 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_15:RegisterAnimationSequence("ButtonOver", var_13_26)
	end

	local function var_13_27()
		var_13_4:AnimateSequence("ButtonOver")

		if not CONDITIONS.IsMagmaGameMode() then
			var_13_5:AnimateSequence("ButtonOver")
		end

		var_13_14:AnimateSequence("ButtonOver")

		if not CONDITIONS.IsMagmaGameMode() then
			var_13_15:AnimateSequence("ButtonOver")
		end
	end

	var_13_0._sequences.ButtonOver = var_13_27

	local var_13_28

	if not CONDITIONS.IsMagmaGameMode() then
		local var_13_29 = {
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

		var_13_5:RegisterAnimationSequence("ButtonUp", var_13_29)
	end

	local var_13_30 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ButtonUp", var_13_30)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_13_31 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_15:RegisterAnimationSequence("ButtonUp", var_13_31)
	end

	local function var_13_32()
		if not CONDITIONS.IsMagmaGameMode() then
			var_13_5:AnimateSequence("ButtonUp")
		end

		var_13_14:AnimateSequence("ButtonUp")

		if not CONDITIONS.IsMagmaGameMode() then
			var_13_15:AnimateSequence("ButtonUp")
		end
	end

	var_13_0._sequences.ButtonUp = var_13_32

	local var_13_33
	local var_13_34 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("IsAlternate", var_13_34)

	local function var_13_35()
		var_13_4:AnimateSequence("IsAlternate")
	end

	var_13_0._sequences.IsAlternate = var_13_35

	local var_13_36
	local var_13_37 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("IsNotAlternate", var_13_37)

	local function var_13_38()
		var_13_4:AnimateSequence("IsNotAlternate")
	end

	var_13_0._sequences.IsNotAlternate = var_13_38

	local var_13_39

	if CONDITIONS.IsMagmaGameMode() then
		local var_13_40 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
			},
			{
				value = 1,
				duration = 180,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_6:RegisterAnimationSequence("WZWipButtonOver", var_13_40)
	end

	local var_13_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("WZWipButtonOver", var_13_41)

	if CONDITIONS.IsMagmaGameMode() then
		local var_13_42 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_13_19:RegisterAnimationSequence("WZWipButtonOver", var_13_42)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_13_43 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZHighlight
			}
		}

		var_13_20:RegisterAnimationSequence("WZWipButtonOver", var_13_43)
	end

	local function var_13_44()
		if CONDITIONS.IsMagmaGameMode() then
			var_13_6:AnimateSequence("WZWipButtonOver")
		end

		var_13_14:AnimateSequence("WZWipButtonOver")

		if CONDITIONS.IsMagmaGameMode() then
			var_13_19:AnimateSequence("WZWipButtonOver")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_13_20:AnimateSequence("WZWipButtonOver")
		end
	end

	var_13_0._sequences.WZWipButtonOver = var_13_44

	local var_13_45
	local var_13_46 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("WZWipSetup", var_13_46)

	if not CONDITIONS.IsMagmaGameMode() then
		local var_13_47 = {}

		var_13_5:RegisterAnimationSequence("WZWipSetup", var_13_47)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_13_48 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_6:RegisterAnimationSequence("WZWipSetup", var_13_48)
	end

	local function var_13_49()
		var_13_4:AnimateSequence("WZWipSetup")

		if not CONDITIONS.IsMagmaGameMode() then
			var_13_5:AnimateSequence("WZWipSetup")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_13_6:AnimateSequence("WZWipSetup")
		end
	end

	var_13_0._sequences.WZWipSetup = var_13_49

	local var_13_50

	if CONDITIONS.IsMagmaGameMode() then
		local var_13_51 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZBackground
			},
			{
				value = 0.5,
				duration = 200,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_6:RegisterAnimationSequence("WZWipButtonUp", var_13_51)
	end

	local var_13_52 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("WZWipButtonUp", var_13_52)

	if CONDITIONS.IsMagmaGameMode() then
		local var_13_53 = {
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			}
		}

		var_13_19:RegisterAnimationSequence("WZWipButtonUp", var_13_53)
	end

	if CONDITIONS.IsMagmaGameMode() then
		local var_13_54 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				value = 0.6,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_20:RegisterAnimationSequence("WZWipButtonUp", var_13_54)
	end

	local function var_13_55()
		if CONDITIONS.IsMagmaGameMode() then
			var_13_6:AnimateSequence("WZWipButtonUp")
		end

		var_13_14:AnimateSequence("WZWipButtonUp")

		if CONDITIONS.IsMagmaGameMode() then
			var_13_19:AnimateSequence("WZWipButtonUp")
		end

		if CONDITIONS.IsMagmaGameMode() then
			var_13_20:AnimateSequence("WZWipButtonUp")
		end
	end

	var_13_0._sequences.WZWipButtonUp = var_13_55

	var_0_5(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("LeaderboardRow", LeaderboardRow)
LockTable(_M)
