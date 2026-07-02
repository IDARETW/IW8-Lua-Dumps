module(..., package.seeall)

local var_0_0 = SWATCHES.genericMenu.bodycopy
local var_0_1 = SWATCHES.tabManager.tabTextDisabled
local var_0_2 = 0.01
local var_0_3 = 10

local function var_0_4(arg_1_0, arg_1_1)
	if arg_1_1 < 0 or arg_1_1 > 1 then
		DebugPrint("seasonProgress is not in percent format.")
	end

	arg_1_1 = LUI.clamp(arg_1_1, 0, 1)

	arg_1_0:UpdateProgress(0, arg_1_1, true)
	arg_1_0.StartPoint:SetRGBFromTable(arg_1_1 > 0 and var_0_0 or var_0_1)
end

local function var_0_5(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_3 then
		arg_2_0:Wait(1, true)
	end

	if var_0_3 > 0 and arg_2_2 > arg_2_1 + var_0_2 then
		arg_2_0.ImageProgressBarElement:SetProgress(arg_2_1)

		arg_2_0:Wait(var_0_3).onComplete = function()
			arg_2_0:UpdateProgress(arg_2_1 + var_0_2, arg_2_2, false)
		end
	else
		if arg_2_2 >= 1 then
			arg_2_0.Mask:SetRight(0)
		end

		arg_2_0.ImageProgressBarElement:SetProgress(arg_2_2)
	end
end

local function var_0_6(arg_4_0, arg_4_1)
	local var_4_0 = {}

	for iter_4_0 = 1, arg_4_0.ImageProgressBarElement:GetNodeCount() do
		table.insert(var_4_0, {
			seasonEmblem = SEASON.GetSeasonEmblem(arg_4_1, iter_4_0)
		})
	end

	arg_4_0.ImageProgressBarElement:SetAllNodeData(var_4_0)
end

local function var_0_7(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetSeasonProgress = var_0_4
	arg_5_0.UpdateProgress = var_0_5
	arg_5_0.SetEmblemImages = var_0_6

	arg_5_0.EmblemMessage:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/EMBLEM_CHALLENGE_UPDATE", 10))
	arg_5_0.ImageProgressBarElement:SetMask(arg_5_0.Mask)
	arg_5_0.ImageProgressBarElement:SetProgressColor(var_0_0, var_0_1)
	var_0_6(arg_5_0, SEASON.GetCurrentSeason())
end

function ElderProgressionEmblemPanel(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1390 * _1080p, 0, 100 * _1080p)

	var_6_0.id = "ElderProgressionEmblemPanel"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "DoubleNotchedBacker"

	var_6_4:SetAlpha(0.5, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.DoubleNotchedBacker = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "EmblemMessage"

	var_6_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetAlignment(LUI.Alignment.Left)
	var_6_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 22, _1080p * 347, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_6)

	var_6_0.EmblemMessage = var_6_6

	local var_6_7
	local var_6_8 = {
		progressBarThickness = 5,
		spacing = 38,
		numNodes = 10,
		buildChild = "ElderProgressionProgressNode",
		direction = LUI.DIRECTION.horizontal,
		controllerIndex = var_6_1
	}
	local var_6_9 = MenuBuilder.BuildRegisteredType("ImageProgressBar", var_6_8)

	var_6_9.id = "ImageProgressBarElement"

	var_6_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 421, _1080p * 469, _1080p * -23, _1080p * 25)
	var_6_0:addElement(var_6_9)

	var_6_0.ImageProgressBarElement = var_6_9

	local var_6_10
	local var_6_11 = LUI.UIImage.new()

	var_6_11.id = "StartPoint"

	var_6_11:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_6_11:setImage(RegisterMaterial("widg_glow_circle"), 0)
	var_6_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 360, _1080p * 386, _1080p * -13, _1080p * 13)
	var_6_0:addElement(var_6_11)

	var_6_0.StartPoint = var_6_11

	local var_6_12
	local var_6_13 = LUI.UIImage.new()

	var_6_13.id = "Mask"

	var_6_13:setImage(RegisterMaterial("stencil_mask"), 0)
	var_6_13:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 360, _1080p * -28, 0, 0)
	var_6_0:addElement(var_6_13)

	var_6_0.Mask = var_6_13

	var_0_7(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ElderProgressionEmblemPanel", ElderProgressionEmblemPanel)
LockTable(_M)
