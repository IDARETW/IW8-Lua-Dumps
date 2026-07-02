module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.AreTrialsEnabled(arg_1_0) then
		local var_1_0 = Loot.DEBEIFJEEG(arg_1_1, TRIALS.TicketID)

		arg_1_0.TrialsCount:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_TICKET_COUNT", var_1_0))
	end

	arg_1_0.PlayButtonWrapper.PlayButton.Text:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -78, _1080p * -14, _1080p * 16)
end

function BRTrialsPlayButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p)

	var_2_0.id = "BRTrialsPlayButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("BRPlayButton", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "PlayButtonWrapper"

	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 50)
	var_2_0:addElement(var_2_4)

	var_2_0.PlayButtonWrapper = var_2_4

	local var_2_5

	if CONDITIONS.AreTrialsEnabled(var_2_0) then
		var_2_5 = LUI.UIImage.new()
		var_2_5.id = "TrialIcon"

		var_2_5:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_2_5:SetAlpha(0, 0)
		var_2_5:setImage(RegisterMaterial("icon_killhouse_ticket"), 0)
		var_2_5:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -42, _1080p * -18, _1080p * -12, _1080p * 12)
		var_2_0:addElement(var_2_5)

		var_2_0.TrialIcon = var_2_5
	end

	local var_2_6

	if CONDITIONS.AreTrialsEnabled(var_2_0) then
		var_2_6 = LUI.UIStyledText.new()
		var_2_6.id = "TrialsCount"

		var_2_6:SetRGBFromTable(SWATCHES.Store.Description, 0)
		var_2_6:SetAlpha(0, 0)
		var_2_6:setText("x99", 0)
		var_2_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_2_6:SetAlignment(LUI.Alignment.Right)
		var_2_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -95, _1080p * -45, _1080p * -12, _1080p * 12)
		var_2_0:addElement(var_2_6)

		var_2_0.TrialsCount = var_2_6
	end

	local var_2_7

	if CONDITIONS.AreTrialsEnabled(var_2_0) then
		local var_2_8 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_2_5:RegisterAnimationSequence("DefaultSequence", var_2_8)
	end

	if CONDITIONS.AreTrialsEnabled(var_2_0) then
		local var_2_9 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_2_6:RegisterAnimationSequence("DefaultSequence", var_2_9)
	end

	local function var_2_10()
		if CONDITIONS.AreTrialsEnabled(var_2_0) then
			var_2_5:AnimateSequence("DefaultSequence")
		end

		if CONDITIONS.AreTrialsEnabled(var_2_0) then
			var_2_6:AnimateSequence("DefaultSequence")
		end
	end

	var_2_0._sequences.DefaultSequence = var_2_10

	local var_2_11

	if CONDITIONS.AreTrialsEnabled(var_2_0) then
		local var_2_12 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_2_5:RegisterAnimationSequence("TrialsEnabled", var_2_12)
	end

	if CONDITIONS.AreTrialsEnabled(var_2_0) then
		local var_2_13 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_2_6:RegisterAnimationSequence("TrialsEnabled", var_2_13)
	end

	local function var_2_14()
		if CONDITIONS.AreTrialsEnabled(var_2_0) then
			var_2_5:AnimateSequence("TrialsEnabled")
		end

		if CONDITIONS.AreTrialsEnabled(var_2_0) then
			var_2_6:AnimateSequence("TrialsEnabled")
		end
	end

	var_2_0._sequences.TrialsEnabled = var_2_14

	var_0_0(var_2_0, var_2_1, arg_2_1)
	ACTIONS.AnimateSequence(var_2_0, "DefaultSequence")

	return var_2_0
end

MenuBuilder.registerType("BRTrialsPlayButton", BRTrialsPlayButton)
LockTable(_M)
