module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.TotalStars)
	assert(arg_1_0.Reward)
	arg_1_0:SetAlpha(0)

	arg_1_0._isVisible = false

	local var_1_0, var_1_1 = CP.GetTotalStarsEarned(arg_1_1)

	arg_1_0._maxStarsReached = var_1_0 == var_1_1

	local var_1_2 = CP.GetNextReward(var_1_0)

	if var_1_2 ~= nil then
		ACTIONS.AnimateSequence(arg_1_0.Reward, "Mini")
		arg_1_0.Reward:UpdateCardConfig(var_1_2.lootReward)
		arg_1_0.TotalStars:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_1_0, var_1_2.stars))
		arg_1_0:SetAlpha(1)

		arg_1_0._isVisible = true

		return
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetAlpha(0)

	arg_2_0._isVisible = false

	if not IsSystemLink() then
		local function var_2_0()
			if CONDITIONS.IsSpecOpsGameType() then
				var_0_0(arg_2_0, arg_2_1)
			else
				arg_2_0:SetAlpha(0)

				arg_2_0._isVisible = false
			end
		end

		arg_2_0:SubscribeToModel(DataSources.frontEnd.lobby.gameType:GetModel(arg_2_1), var_2_0)

		arg_2_0.bindButton = LUI.UIBindButton.new()
		arg_2_0.bindButton.id = "selfBindButton"

		arg_2_0:addElement(arg_2_0.bindButton)
		arg_2_0.bindButton:registerEventHandler("button_alt1", function(arg_4_0, arg_4_1)
			if arg_2_0._isVisible then
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)

				if not arg_2_0._maxStarsReached then
					LUI.FlowManager.RequestPopupMenu(arg_2_0, "SORewardsPopup", false, arg_2_1, false, {})
				end
			end
		end)
	end

	if IsLanguageFrench() or IsLanguagePortuguese() or IsLanguageItalian() or IsLanguageSpanish() or IsLanguageGerman() or IsLanguageRussian() or IsLanguagePolish() then
		ACTIONS.AnimateSequence(arg_2_0, "LongLOC")
	end
end

function SOStarRewardNext(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 140 * _1080p, 0, 220 * _1080p)

	var_5_0.id = "SOStarRewardNext"
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

	var_5_4.id = "ViewChallengesPrompt"

	var_5_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_4:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_ALL_STAR_REWARDS"), 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_4:SetWordWrap(false)
	var_5_4:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetTintFontIcons(true)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 302, _1080p * 232, _1080p * 254)
	var_5_0:addElement(var_5_4)

	var_5_0.ViewChallengesPrompt = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Background"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Background = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "TotalStars"

	var_5_8:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -1, _1080p * 81, _1080p * -35, _1080p * -11)
	var_5_0:addElement(var_5_8)

	var_5_0.TotalStars = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "StarIcon"

	var_5_10:setImage(RegisterMaterial("star_on"), 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -38, _1080p * -8, _1080p * -38, _1080p * -8)
	var_5_0:addElement(var_5_10)

	var_5_0.StarIcon = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "Reward"

	var_5_12:SetScale(-0.4, 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -100, _1080p * 100)
	var_5_0:addElement(var_5_12)

	var_5_0.Reward = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "Title"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_14:setText(Engine.CBBHFCGDIC("LUA_MENU/NEXT_REWARD"), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -57, _1080p * 57, _1080p * 22, _1080p * 42)
	var_5_0:addElement(var_5_14)

	var_5_0.Title = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 27
		}
	}

	var_5_14:RegisterAnimationSequence("LongLOC", var_5_16)

	local function var_5_17()
		var_5_14:AnimateSequence("LongLOC")
	end

	var_5_0._sequences.LongLOC = var_5_17

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SOStarRewardNext", SOStarRewardNext)
LockTable(_M)
