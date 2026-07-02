module(..., package.seeall)

local function var_0_0(arg_1_0)
	if not arg_1_0.MainButton.Fill then
		arg_1_0.MainButton.Fill = LUI.UIImage.new()
		arg_1_0.MainButton.Fill.id = "Fill"

		arg_1_0.MainButton.Fill:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
		arg_1_0.MainButton.Fill:setImage(RegisterMaterial("cac_equip_fill"), 0)
		arg_1_0.MainButton.Fill:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -46, _1080p * -24, _1080p * -11, _1080p * 11)
		arg_1_0.MainButton:addElement(arg_1_0.MainButton.Fill)
	end

	if arg_1_0.selected then
		arg_1_0.MainButton.Fill:SetAlpha(1)
	else
		arg_1_0.MainButton.Fill:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if not arg_2_0.selected then
		arg_2_0.selected = true

		var_0_0(arg_2_0)

		if arg_2_0.selected then
			local var_2_0 = arg_2_0.MainButton.modeInfo.name
			local var_2_1 = {
				displayTime = 3000,
				icon = arg_2_0.MainButton.modeInfo.image,
				description = Engine.CBBHFCGDIC("LUA_MENU/FILTER_EQUIPPED", var_2_0),
				type = LUI.ToastManager.NotificationType.QuickPlayFilterEquipped,
				controllerIndex = arg_2_1
			}

			arg_2_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = var_2_1
			})
			arg_2_0:dispatchEventToCurrentMenu({
				name = "gamemode_selection_updated",
				dispatchChildren = true,
				immediate = true,
				buttonIndex = arg_2_0.index
			})
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = LUI.FlowManager.GetScopedData(arg_3_0)

	if var_3_0.matchmakerSettings and var_3_0.matchmakerSettings.gameType == arg_3_0.MainButton.modeInfo.ref then
		arg_3_0.selected = true
	else
		arg_3_0.selected = false
	end

	var_0_0(arg_3_0, arg_3_1)
end

local function var_0_3(arg_4_0, arg_4_1)
	if CONDITIONS.IsMagmaGameMode() and IsPrivateMatch() then
		var_0_2(arg_4_0, arg_4_1)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.ApplyGameModeButtonSelectedAction = var_0_1
	arg_5_0.InitGameModeButton = var_0_3

	arg_5_0:registerEventHandler("gamemode_selection_updated", function(arg_6_0, arg_6_1)
		if arg_6_0.index ~= arg_6_1.buttonIndex then
			arg_6_0.selected = false

			var_0_0(arg_6_0, arg_5_1)
		end
	end)

	if IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_5_0, "RU")
	end
end

function GameModeButton(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIHorizontalStackedLayout.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 40 * _1080p)

	var_7_0.id = "GameModeButton"
	var_7_0._animationSets = {}
	var_7_0._sequences = {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(5 * _1080p)

	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "MainButton"

	var_7_4.Text:SetLeft(_1080p * 20, 0)
	var_7_4.Text:setText(ToUpperCase(""), 0)
	var_7_4.Text:SetAlignment(LUI.Alignment.Left)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 40)
	var_7_0:addElement(var_7_4)

	var_7_0.MainButton = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "OptionsButton"

	var_7_6.Text:SetLeft(0, 0)
	var_7_6.Text:setText(Engine.CBBHFCGDIC("MENU/OPTIONS"), 0)
	var_7_6.Text:SetAlignment(LUI.Alignment.Center)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 425, _1080p * 544, 0, _1080p * 40)
	var_7_0:addElement(var_7_6)

	var_7_0.OptionsButton = var_7_6

	local function var_7_7()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_7

	local var_7_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5,
			child = var_7_0.OptionsButton.Text
		}
	}

	var_7_6:RegisterAnimationSequence("RU", var_7_8)

	local function var_7_9()
		var_7_6:AnimateSequence("RU")
	end

	var_7_0._sequences.RU = var_7_9

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("GameModeButton", GameModeButton)
LockTable(_M)
