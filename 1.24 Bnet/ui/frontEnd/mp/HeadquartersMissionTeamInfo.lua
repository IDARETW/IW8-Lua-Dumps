module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:SubscribeToDataSourceThroughElement(arg_1_0, nil, function()
		local var_2_0 = arg_1_0:GetDataSource().completedMissions:GetValue(arg_1_1)

		arg_1_0.CompletedMissionsLabel:setText(LocalizeIntoString(var_2_0, "MP_FRONTEND_ONLY/MISSIONS_COMPLETED_CAPS"), 0)

		local var_2_1 = arg_1_0:GetDataSource().level:GetValue(arg_1_1)
		local var_2_2 = arg_1_0:GetDataSource().maxLevel:GetValue(arg_1_1)
		local var_2_3

		if var_2_2 and var_2_2 ~= 0 then
			var_2_3 = var_2_1 / var_2_2
		else
			var_2_3 = 0
		end

		if var_2_3 ~= 1 then
			local var_2_4 = math.min(var_2_3, 1)

			arg_1_0.MissionTeamProgressBar.Fill:SetAnchors(0, 1 - var_2_4, 0, 1, 0, LUI.EASING.linear)
		end

		if var_2_1 > 50 then
			arg_1_0.MissionTeamProgressBar.LevelLabel:setText(LocalizeIntoString(var_2_1, "MP_FRONTEND_ONLY/COMMANDER_RANK_CAPS"), 0)
			ACTIONS.AnimateSequence(arg_1_0.MissionTeamProgressBar, "CommanderRankLevelColor")
		else
			arg_1_0.MissionTeamProgressBar.LevelLabel:setText(LocalizeIntoString(var_2_1, "MP_FRONTEND_ONLY/RANK_CAPS"), 0)
		end
	end)
end

function HeadquartersMissionTeamInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "HeadquartersMissionTeamInfo"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIBlur.new()

	var_3_4.id = "ProgressBacker"

	var_3_4:SetRGBFromInt(12566463, 0)
	var_3_4:SetBlurStrength(2.75, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 79.5, 0, _1080p * -56, _1080p * 22)
	var_3_0:addElement(var_3_4)

	var_3_0.ProgressBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "ProgressBackerGradient"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.2, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 79.5, 0, _1080p * -56, _1080p * 22)
	var_3_0:addElement(var_3_6)

	var_3_0.ProgressBackerGradient = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIBlur.new()

	var_3_8.id = "BlurL"

	var_3_8:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_3_8:SetBlurStrength(2.75, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 97, _1080p * 8, _1080p * 86)
	var_3_0:addElement(var_3_8)

	var_3_0.BlurL = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIBlur.new()

	var_3_10.id = "ColouredBlur"

	var_3_10:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_3_10:SetBlurStrength(2.75, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 97, _1080p * 86, _1080p * 127)

	local function var_3_11()
		local var_4_0 = var_3_0:GetDataSource().level:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_10:SetRGBFromInt(var_4_0, 0)
		end
	end

	var_3_10:SubscribeToModelThroughElement(var_3_0, "level", var_3_11)
	var_3_0:addElement(var_3_10)

	var_3_0.ColouredBlur = var_3_10

	local var_3_12
	local var_3_13 = LUI.UIImage.new()

	var_3_13.id = "Spliter"

	var_3_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 107.89, _1080p * 700, _1080p * 85, _1080p * 87)
	var_3_0:addElement(var_3_13)

	var_3_0.Spliter = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIBlur.new()

	var_3_15.id = "MissionTeamBacker"

	var_3_15:SetBlurStrength(2.75, 0)
	var_3_15:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 74, 0, _1080p * 23, _1080p * 63)

	local function var_3_16()
		local var_5_0 = var_3_0:GetDataSource().color:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_15:SetRGBFromInt(var_5_0, 0)
		end
	end

	var_3_15:SubscribeToModelThroughElement(var_3_0, "color", var_3_16)
	var_3_0:addElement(var_3_15)

	var_3_0.MissionTeamBacker = var_3_15

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "MissionTeamIcon"

	var_3_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -700, _1080p * -541, _1080p * -79.5, _1080p * 79.5)

	local function var_3_19()
		local var_6_0 = var_3_0:GetDataSource().image:GetValue(var_3_1)

		if var_6_0 ~= nil then
			var_3_18:setImage(RegisterMaterial(var_6_0), 0)
		end
	end

	var_3_18:SubscribeToModelThroughElement(var_3_0, "image", var_3_19)
	var_3_0:addElement(var_3_18)

	var_3_0.MissionTeamIcon = var_3_18

	local var_3_20
	local var_3_21 = MenuBuilder.BuildRegisteredType("MissionTeamProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_21.id = "MissionTeamProgressBar"

	var_3_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 159, _1080p * 603, 0, _1080p * 92)
	var_3_0:addElement(var_3_21)

	var_3_0.MissionTeamProgressBar = var_3_21

	local var_3_22
	local var_3_23 = LUI.UIText.new()

	var_3_23.id = "CompletedMissionsLabel"

	var_3_23:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_3_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_23:SetAlignment(LUI.Alignment.Left)
	var_3_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 160.5, _1080p * 685.5, _1080p * 96, _1080p * 118)
	var_3_0:addElement(var_3_23)

	var_3_0.CompletedMissionsLabel = var_3_23

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("HeadquartersMissionTeamInfo", HeadquartersMissionTeamInfo)
LockTable(_M)
