module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.data.mission

	arg_1_0.MissionName:setText(var_1_0.missionName)
	arg_1_0.MissionDescription:setText(var_1_0.missionDesc)
	arg_1_0.MissionProgress.ProgressBar:SetProgress(var_1_0.currProgress / var_1_0.maxProgress, 0)
	arg_1_0.MissionProgress.ProgressValue:setText(var_1_0.currProgress .. "/" .. var_1_0.maxProgress)
	arg_1_0.Experience:setText(var_1_0.reward)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.MissionName)
	assert(arg_2_0.MissionDescription)
	assert(arg_2_0.MissionProgress)
	assert(arg_2_0.Experience)
	arg_2_0:addEventHandler("update_mission_details", var_0_0)
end

function MissionDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 490 * _1080p)

	var_3_0.id = "MissionDetails"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_4:SetAlpha(0.2, 0)
	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.2, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 39, _1080p * 489)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "MissionDetails"

	var_3_6:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/MISSION_DETAILS"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 352, _1080p * 2, _1080p * 26)
	var_3_0:addElement(var_3_6)

	var_3_0.MissionDetails = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "MissionDescription"

	var_3_8:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_3_8:setText("Play 2 matches of headquarters and be good at it.", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 416, _1080p * 120, _1080p * 142)
	var_3_0:addElement(var_3_8)

	var_3_0.MissionDescription = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Reward"

	var_3_10:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 386, _1080p * 264, _1080p * 288)
	var_3_0:addElement(var_3_10)

	var_3_0.Reward = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "XPBackground"

	var_3_12:SetRGBFromTable(SWATCHES.HUD.disabled, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 394, _1080p * 305, _1080p * 433)
	var_3_0:addElement(var_3_12)

	var_3_0.XPBackground = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Experience"

	var_3_14:setText("2000 XP", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 94, _1080p * 328, _1080p * 351, _1080p * 387)
	var_3_0:addElement(var_3_14)

	var_3_0.Experience = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("MissionProgress", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "MissionProgress"

	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 36, _1080p * 386, _1080p * 184, _1080p * 214)
	var_3_0:addElement(var_3_16)

	var_3_0.MissionProgress = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "MissionName"

	var_3_18:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_3_18:setText("Headquarters", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 106, _1080p * 400, _1080p * 68, _1080p * 92)
	var_3_0:addElement(var_3_18)

	var_3_0.MissionName = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "MissionIcon"

	var_3_20:setImage(RegisterMaterial("gamemode_team_deathmatch"), 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 36, _1080p * 90, _1080p * 53, _1080p * 107)
	var_3_0:addElement(var_3_20)

	var_3_0.MissionIcon = var_3_20

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MissionDetails", MissionDetails)
LockTable(_M)
