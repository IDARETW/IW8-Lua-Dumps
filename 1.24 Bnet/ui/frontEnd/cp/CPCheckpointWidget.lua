module(..., package.seeall)

local var_0_0
local var_0_1

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0:Wait(1000, true)
	local var_1_1 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Coop).checkpointReached.week:get()

	function var_1_0.onComplete()
		return var_0_2(arg_1_0, arg_1_1, arg_1_2)
	end

	local var_1_2 = CP.CheckpointResetPeriodUTC
	local var_1_3 = Engine.DEIDGHDBHD() - CP.CheckpointResetStartUTC
	local var_1_4 = math.floor(var_1_3 / var_1_2)
	local var_1_5 = (math.ceil(var_1_3 / var_1_2) - var_1_3 / var_1_2) * var_1_2

	arg_1_0.TimerText:setText(Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_1_5)))

	local var_1_6
	local var_1_7
	local var_1_8 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

	if var_1_8 == "cp_dntsk_raid" and arg_1_2 ~= "CPPlaylistMenu" or var_0_0 == "cp_dntsk_raid" then
		var_1_6 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Coop).checkpointReached.cp_dntsk_raid:get()
		var_1_7 = StringTable.DIFCHIGDFB("cp/cp_dntsk_raid_objectives.csv", CSV.levelObjectiveTextTable.cols.checkpointNumber, var_1_6, CSV.levelObjectiveTextTable.cols.checkpointText)
	elseif var_1_8 == "cp_raid_complex" and arg_1_2 ~= "CPPlaylistMenu" or var_0_0 == "cp_raid_complex" then
		var_1_6 = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Coop).checkpointReached.cp_raid_complex:get()
		var_1_7 = StringTable.DIFCHIGDFB("cp/cp_raid_complex_objectives.csv", CSV.levelObjectiveTextTable.cols.checkpointNumber, var_1_6, CSV.levelObjectiveTextTable.cols.checkpointText)
	else
		var_1_6 = 0
		var_1_7 = ""
	end

	if var_1_6 then
		arg_1_0.CheckpointNumber:setText(var_1_6)
	end

	if var_1_6 and var_1_6 > 0 and var_1_7 ~= "nil" and var_1_7 ~= "" then
		arg_1_0.CheckpointName:setText(var_1_6 .. ":  " .. Engine.CBBHFCGDIC(var_1_7))
		arg_1_0:SetAlpha(1, 0)
	else
		arg_1_0.CheckpointName:setText("")
		arg_1_0:SetAlpha(0, 0)
	end

	if var_1_1 < var_1_4 then
		PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Coop).checkpointReached.cp_raid_complex:set(0)
		PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Coop).checkpointReached.cp_dntsk_raid:set(0)
		PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Coop).checkpointReached.week:set(var_1_4)

		local var_1_9 = var_1_4
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:SetAlpha(0, 0)
	arg_3_0:SubscribeToDataSourceThroughElement(arg_3_0, nil, function()
		local var_4_0 = arg_3_0:GetDataSource()

		if var_4_0 then
			local var_4_1 = var_4_0.timeLimit:GetValue(arg_3_1)

			if var_4_1 == 101 then
				var_0_0 = "cp_raid_complex"
			elseif var_4_1 == 100 then
				var_0_0 = "cp_dntsk_raid"
			else
				arg_3_0:SetAlpha(0, 0)

				var_0_0 = ""
			end
		end
	end)

	local var_3_0 = arg_3_0._scoped.menuName

	var_0_2(arg_3_0, arg_3_1, var_3_0)
end

function CPCheckpointWidget(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 100 * _1080p)

	var_5_0.id = "CPCheckpointWidget"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Backer"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_4:SetAlpha(0.3, 0)
	var_5_4:SetZRotation(180, 0)
	var_5_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_5_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -400, _1080p * -4, 0, _1080p * 100)
	var_5_0:addElement(var_5_4)

	var_5_0.Backer = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "CheckpointNumber"

	var_5_6:SetAlpha(0, 0)
	var_5_6:setText("", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 77, _1080p * 280, _1080p * 304)
	var_5_0:addElement(var_5_6)

	var_5_0.CheckpointNumber = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "CurrentDate"

	var_5_8:SetAlpha(0, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 263, _1080p * 158, _1080p * 176)
	var_5_0:addElement(var_5_8)

	var_5_0.CurrentDate = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "ResetDate"

	var_5_10:SetAlpha(0, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 176, _1080p * 200)
	var_5_0:addElement(var_5_10)

	var_5_0.ResetDate = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "EndTimer"

	var_5_12:SetAlpha(0, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 606, _1080p * 176, _1080p * 200)
	var_5_0:addElement(var_5_12)

	var_5_0.EndTimer = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIText.new()

	var_5_14.id = "TimerText"

	var_5_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_14:setText("", 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -200, _1080p * -72, _1080p * 72, _1080p * 96)
	var_5_0:addElement(var_5_14)

	var_5_0.TimerText = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "ResetTitle"

	var_5_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_16:setText(Engine.CBBHFCGDIC("CP_CHECKPOINTS/CHECKPOINT_TITLE"), 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 48, _1080p * 72)
	var_5_0:addElement(var_5_16)

	var_5_0.ResetTitle = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIStyledText.new()

	var_5_18.id = "CheckpointName"

	var_5_18:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_18:setText("", 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 24, _1080p * 48)
	var_5_0:addElement(var_5_18)

	var_5_0.CheckpointName = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "CurrentCheckpointTitle"

	var_5_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_20:setText(Engine.CBBHFCGDIC("CP_CHECKPOINTS/CURRENT_CHECKPOINT"), 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 24)
	var_5_0:addElement(var_5_20)

	var_5_0.CurrentCheckpointTitle = var_5_20

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CPCheckpointWidget", CPCheckpointWidget)
LockTable(_M)
