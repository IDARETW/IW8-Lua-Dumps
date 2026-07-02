module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_1, "SeasonalEventFullChallengeProgressPanel -> RefreshSeasonalGameSourceDataForWidget -> snipeIcon is nil, but must be specified")
	assert(arg_1_2, "SeasonalEventFullChallengeProgressPanel -> RefreshSeasonalGameSourceDataForWidget -> checklist is nil, but must be specified")

	if arg_1_0._csvEntryListData[arg_1_3] then
		arg_1_1:UpdateSnipeIcon({
			selected = true,
			gameSourceID = arg_1_3
		})
		arg_1_2:InitSetupWithData(arg_1_0._csvEntryListData[arg_1_3])
	else
		arg_1_1:SetAlpha(0, 0)
		arg_1_2:SetAlpha(0, 0)
	end
end

local function var_0_1(arg_2_0)
	local var_2_0 = SEASONAL_EVENT.GetChallengesData(arg_2_0._controllerIndex).miscChallengesData

	arg_2_0._csvEntryListData = {}

	SEASONAL_EVENT.SetupProgressionEntries(var_2_0, arg_2_0._csvEntryListData)
	var_0_0(arg_2_0, arg_2_0.WZSnipeIcon, arg_2_0.WZCheckboxList, LUI.GAME_SOURCE_ID.WARZONE)
	var_0_0(arg_2_0, arg_2_0.OtherSnipeIcon, arg_2_0.OtherCheckboxList, LUI.GAME_SOURCE_ID.COLD_WAR)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0.Setup = var_0_1
end

function SeasonalEventFullChallengeProgressPanel(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 102 * _1080p)

	var_4_0.id = "SeasonalEventFullChallengeProgressPanel"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_4_0, "Backer") then
		local var_4_4 = LUI.UIImage.new()

		var_4_4.id = "Backer"

		var_4_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
		var_4_4:SetAlpha(0, 0)
		var_4_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 512, 0, _1080p * -10)
		var_4_0:addElement(var_4_4)

		var_4_0.Backer = var_4_4
	end

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericCheckBoxHorizList", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "OtherCheckboxList"

	var_4_6:SetScale(0.1, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 153, _1080p * 482, _1080p * 60, _1080p * 82)
	var_4_0:addElement(var_4_6)

	var_4_0.OtherCheckboxList = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "OtherSnipeIcon"

	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 136, _1080p * 55, _1080p * 88)
	var_4_0:addElement(var_4_8)

	var_4_0.OtherSnipeIcon = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("GenericCheckBoxHorizList", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "WZCheckboxList"

	var_4_10:SetScale(0.1, 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 153, _1080p * 482, _1080p * 15, _1080p * 38)
	var_4_0:addElement(var_4_10)

	var_4_0.WZCheckboxList = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "WZSnipeIcon"

	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 136, _1080p * 10, _1080p * 43)
	var_4_0:addElement(var_4_12)

	var_4_0.WZSnipeIcon = var_4_12

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SeasonalEventFullChallengeProgressPanel", SeasonalEventFullChallengeProgressPanel)
LockTable(_M)
