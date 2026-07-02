module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.AreTrialsEnabled(arg_1_0) then
		local var_1_0 = Loot.DEBEIFJEEG(arg_1_1, TRIALS.TicketID)

		arg_1_0.TrialsCount:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_TICKET_COUNT", var_1_0))
	end

	arg_1_0.PlayButtonWrapper.PlayButton.Text:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -78, _1080p * -14, _1080p * 16)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOver")

		arg_1_0._isFocused = true
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUp")

		arg_1_0._isFocused = false
	end)
end

function BRTrialsPlayButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 57 * _1080p)

	var_4_0.id = "BRTrialsPlayButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("BRPlayButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "PlayButtonWrapper"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 3, _1080p * 60)
	var_4_0:addElement(var_4_4)

	var_4_0.PlayButtonWrapper = var_4_4

	local var_4_5

	if CONDITIONS.AreTrialsEnabled() then
		var_4_5 = LUI.UIImage.new()
		var_4_5.id = "TrialIcon"

		var_4_5:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_4_5:SetAlpha(0, 0)
		var_4_5:setImage(RegisterMaterial("icon_killhouse_ticket"), 0)
		var_4_5:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -18, _1080p * -14, _1080p * 10)
		var_4_0:addElement(var_4_5)

		var_4_0.TrialIcon = var_4_5
	end

	local var_4_6

	if CONDITIONS.AreTrialsEnabled() then
		var_4_6 = LUI.UIStyledText.new()
		var_4_6.id = "TrialsCount"

		var_4_6:SetRGBFromTable(SWATCHES.Store.Description, 0)
		var_4_6:SetAlpha(0, 0)
		var_4_6:setText("x99", 0)
		var_4_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_4_6:SetAlignment(LUI.Alignment.Right)
		var_4_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -95, _1080p * -45, _1080p * -14, _1080p * 10)
		var_4_0:addElement(var_4_6)

		var_4_0.TrialsCount = var_4_6
	end

	local var_4_7

	if CONDITIONS.AreTrialsEnabled() then
		local var_4_8 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("DefaultSequence", var_4_8)
	end

	if CONDITIONS.AreTrialsEnabled() then
		local var_4_9 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_9)
	end

	local function var_4_10()
		if CONDITIONS.AreTrialsEnabled() then
			var_4_5:AnimateSequence("DefaultSequence")
		end

		if CONDITIONS.AreTrialsEnabled() then
			var_4_6:AnimateSequence("DefaultSequence")
		end
	end

	var_4_0._sequences.DefaultSequence = var_4_10

	local var_4_11

	if CONDITIONS.AreTrialsEnabled() then
		local var_4_12 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_5:RegisterAnimationSequence("TrialsEnabled", var_4_12)
	end

	if CONDITIONS.AreTrialsEnabled() then
		local var_4_13 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_6:RegisterAnimationSequence("TrialsEnabled", var_4_13)
	end

	local function var_4_14()
		if CONDITIONS.AreTrialsEnabled() then
			var_4_5:AnimateSequence("TrialsEnabled")
		end

		if CONDITIONS.AreTrialsEnabled() then
			var_4_6:AnimateSequence("TrialsEnabled")
		end
	end

	var_4_0._sequences.TrialsEnabled = var_4_14

	local function var_4_15()
		return
	end

	var_4_0._sequences.ButtonOver = var_4_15

	local function var_4_16()
		return
	end

	var_4_0._sequences.ButtonUp = var_4_16

	var_0_0(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("BRTrialsPlayButton", BRTrialsPlayButton)
LockTable(_M)
