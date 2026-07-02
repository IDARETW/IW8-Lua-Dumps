module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = CONDITIONS.IsThirdGameMode(arg_1_0) and arg_1_0.FillCP or arg_1_0.Fill

	assert(var_1_0)

	local var_1_1 = math.min(arg_1_1, 1)

	var_1_0:SetAnchors(0, 1 - var_1_1, 0, 1, 0, LUI.EASING.linear)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = CONDITIONS.IsThirdGameMode(arg_2_0) and arg_2_0.FillCP or arg_2_0.Fill

	local function var_2_1()
		local var_3_0 = arg_2_0:GetDataSource().currentProgressPercent:GetValue(arg_2_1)

		var_0_0(arg_2_0, var_3_0)
	end

	var_2_0:SubscribeToModelThroughElement(arg_2_0, "currentProgressPercent", var_2_1)

	arg_2_0.SetCurrentProgress = var_0_0
end

function ChallengeInfoProgressBar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 206 * _1080p, 0, 27 * _1080p)

	var_4_0.id = "ChallengeInfoProgressBar"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "black"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.black = var_4_4

	local var_4_5

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_6 = LUI.UIImage.new()

		var_4_6.id = "left"

		var_4_6:setImage(RegisterMaterial("challenges_progress_hori_bg_left"), 0)
		var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -8, _1080p * 16, _1080p * -5, _1080p * 31)
		var_4_0:addElement(var_4_6)

		var_4_0.left = var_4_6
	end

	local var_4_7

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_8 = LUI.UIImage.new()

		var_4_8.id = "center"

		var_4_8:setImage(RegisterMaterial("challenges_progress_hori_bg_center"), 0)
		var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 16, _1080p * -18, _1080p * -5, _1080p * 31)
		var_4_0:addElement(var_4_8)

		var_4_0.center = var_4_8
	end

	local var_4_9

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_10 = LUI.UIImage.new()

		var_4_10.id = "right"

		var_4_10:setImage(RegisterMaterial("challenges_progress_hori_bg_right"), 0)
		var_4_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -18, _1080p * 6, _1080p * -5, _1080p * 31)
		var_4_0:addElement(var_4_10)

		var_4_0.right = var_4_10
	end

	local var_4_11

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_12 = LUI.UIImage.new()

		var_4_12.id = "Fill"

		var_4_12:setImage(RegisterMaterial("challenges_progress_hori_center"), 0)
		var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 8, _1080p * -8, _1080p * -4, _1080p * 32)
		var_4_0:addElement(var_4_12)

		var_4_0.Fill = var_4_12
	end

	local var_4_13

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_14 = LUI.UIImage.new()

		var_4_14.id = "BackCP"

		var_4_14:SetAlpha(0.3, 0)
		var_4_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 11, _1080p * 17)
		var_4_0:addElement(var_4_14)

		var_4_0.BackCP = var_4_14
	end

	local var_4_15

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_16 = LUI.UIImage.new()

		var_4_16.id = "FillCP"

		var_4_16:SetRGBFromTable(SWATCHES.CashPlacement.DamascusTitle, 0)
		var_4_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 12, _1080p * 16)
		var_4_0:addElement(var_4_16)

		var_4_0.FillCP = var_4_16
	end

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ChallengeInfoProgressBar", ChallengeInfoProgressBar)
LockTable(_M)
