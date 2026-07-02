LUI.UIRadialProgressBar = LUI.Class(LUI.UIElement)

function LUI.UIRadialProgressBar.init(arg_1_0, arg_1_1)
	LUI.UIRadialProgressBar.super.init(arg_1_0, arg_1_1)

	arg_1_0.id = "UIRadialProgressBar"

	assert(type(arg_1_1) == "table")
	assert(type(arg_1_1) == "table")
	assert(arg_1_1.snapToMultiplesOfAngle == nil or type(arg_1_1.snapToMultiplesOfAngle) == "number")
	assert(arg_1_1.segmentCount > 1)
	assert(arg_1_1.segmentMaterial)
	assert(arg_1_1.maskMaterial or arg_1_1.segmentCount < 3)

	arg_1_0.segmentCount = arg_1_1.segmentCount
	arg_1_0.percentUpdateFunc = arg_1_1.percentUpdateFunc
	arg_1_0.snapToMultiplesOfAngle = arg_1_1.snapToMultiplesOfAngle or 0
	arg_1_0.useCodeImplementation = arg_1_0.segmentCount < 3

	if arg_1_0.useCodeImplementation then
		local var_1_0 = arg_1_1.counterClockwise == true

		arg_1_0:SetupRadialProgressBar(var_1_0)
		arg_1_0:setImage(RegisterMaterial(arg_1_1.segmentMaterial))
	else
		arg_1_0.rotDirection = arg_1_1.counterClockwise and 1 or -1
		arg_1_0.segmentData = {}

		arg_1_0:CreateSegments(arg_1_1.segmentMaterial, arg_1_1.maskMaterial, arg_1_1.counterClockwise)
		arg_1_0:SetProgress(0)
	end
end

function LUI.UIRadialProgressBar.SetProgress(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0

	if arg_2_0.snapToMultiplesOfAngle > 0 then
		local var_2_1 = arg_2_0.snapToMultiplesOfAngle / 360

		arg_2_1 = math.floor(0.5 + arg_2_1 / var_2_1) * var_2_1
	end

	if arg_2_0.useCodeImplementation then
		var_2_0 = arg_2_0:SetProgressInC(arg_2_1, arg_2_2 or 0, arg_2_3 or 0)
	else
		arg_2_0.fillPercent = arg_2_1

		arg_2_0:RefreshSegments(arg_2_1)
	end

	if arg_2_0.percentUpdateFunc then
		arg_2_0.percentUpdateFunc(arg_2_1)
	end

	return var_2_0
end

function LUI.UIRadialProgressBar.SetOnUpdateCallback(arg_3_0, arg_3_1)
	arg_3_0.percentUpdateFunc = arg_3_1
end

function LUI.UIRadialProgressBar.SetSegmentImage(arg_4_0, arg_4_1)
	if arg_4_0.useCodeImplementation then
		arg_4_0:setImage(arg_4_1)
	else
		for iter_4_0 = 1, arg_4_0.segmentCount do
			arg_4_0.segmentData[iter_4_0].segment:setImage(arg_4_1)
		end
	end
end

function LUI.UIRadialProgressBar.CreateSegments(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_0.rotDirection * (360 / arg_5_0.segmentCount)
	local var_5_1 = 1 / arg_5_0.segmentCount
	local var_5_2, var_5_3, var_5_4, var_5_5 = arg_5_0:getCurrentRGBA()

	for iter_5_0 = 1, arg_5_0.segmentCount do
		local var_5_6 = (iter_5_0 - 1) * var_5_0
		local var_5_7 = LUI.UIImage.new()

		var_5_7:SetRGBFromTable({
			r = var_5_2,
			g = var_5_3,
			b = var_5_4
		})
		var_5_7:SetZRotation(var_5_6)
		var_5_7:setImage(RegisterMaterial(arg_5_1))

		var_5_7.id = "segment" .. iter_5_0

		arg_5_0:addElement(var_5_7)

		local var_5_8 = LUI.UIImage.new()

		var_5_8:SetRGBFromTable({
			r = var_5_2,
			g = var_5_3,
			b = var_5_4
		})
		var_5_8:SetZRotation(var_5_6)
		var_5_8:setImage(RegisterMaterial(arg_5_2))

		var_5_8.id = "segmentMask" .. iter_5_0

		arg_5_0:addElement(var_5_8)

		if arg_5_3 then
			var_5_7:SetUMin(1, 0)
			var_5_7:SetUMax(0, 0)
			var_5_8:SetUMin(1, 0)
			var_5_8:SetUMax(0, 0)
		end

		var_5_7:SetMask(var_5_8)

		var_5_8.startRot = var_5_6
		var_5_8.endRot = math.max(var_5_6 + var_5_0)
		var_5_8.startPercent = (iter_5_0 - 1) * var_5_1
		var_5_8.endPercent = math.max(var_5_8.startPercent + var_5_1)

		table.insert(arg_5_0.segmentData, {
			segment = var_5_7,
			mask = var_5_8
		})
	end
end

function LUI.UIRadialProgressBar.RefreshSegments(arg_6_0, arg_6_1)
	for iter_6_0 = 1, arg_6_0.segmentCount do
		local var_6_0 = arg_6_0.segmentData[iter_6_0].mask
		local var_6_1 = (arg_6_1 - var_6_0.startPercent) / (var_6_0.endPercent - var_6_0.startPercent)
		local var_6_2 = LUI.clamp(var_6_1, 0, 1)
		local var_6_3 = var_6_0.startRot + var_6_2 * (var_6_0.endRot - var_6_0.startRot)

		var_6_0:SetZRotation(var_6_3)
	end
end

function BuildRadialProgressBar(arg_7_0, arg_7_1)
	return LUI.UIRadialProgressBar.new(arg_7_1)
end

MenuBuilder.registerType("UIRadialProgressBar", BuildRadialProgressBar)
