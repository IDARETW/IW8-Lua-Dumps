module(..., package.seeall)

local var_0_0 = {
	[Teams.free] = "LUA_MENU/AUTOASSIGN_CAPS",
	[Teams.spectator] = "CODCASTER/CAPS",
	[Teams.follower] = "CODCASTER/FOLLOWER_CAPS"
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0

	if Lobby.IsSplitScreenEnabled() then
		local var_1_1 = arg_1_0:GetDataSource()

		if var_1_1 then
			var_1_0 = var_1_1.xuid:GetValue(arg_1_1)
		end
	end

	local var_1_2 = Lobby.GetLocalPlayerDataSource(arg_1_1, var_1_0) or arg_1_0:GetDataSource()

	if var_1_2.controllerIndex:GetValue(arg_1_1) ~= arg_1_1 then
		return false
	end

	if arg_1_3 then
		ACTIONS.PlaySoundSetSound(arg_1_0, "action", false)
	end

	local var_1_3 = var_1_2.followersCount:GetValue(arg_1_1)
	local var_1_4 = var_1_2.desiredTeam:GetValue(arg_1_1)
	local var_1_5 = Lobby.GetAcceptableTeams(var_1_3, var_1_4)
	local var_1_6 = 0

	for iter_1_0, iter_1_1 in ipairs(var_1_5) do
		if var_1_4 == iter_1_1 then
			var_1_6 = iter_1_0

			break
		end
	end

	local var_1_7 = var_1_6 + arg_1_2

	if var_1_7 < 1 or var_1_7 > #var_1_5 then
		var_1_7 = 1
	end

	local var_1_8 = var_1_5[var_1_7]

	Lobby.BFBCBFEGFI(arg_1_1, var_1_8)

	local var_1_9 = var_1_8 == Teams.spectator or var_1_8 == Teams.follower

	LobbyMember.BABJJDBHCH(var_1_9, arg_1_1)

	if var_1_8 == Teams.follower then
		local var_1_10 = var_1_2.followerIndex:GetValue(arg_1_1)
		local var_1_11 = var_1_2.memberIndex:GetValue(arg_1_1)
		local var_1_12, var_1_13, var_1_14 = Lobby.GetMembersListDataSource()

		if var_1_10 >= var_1_14:GetValue(arg_1_1) or var_1_10 == var_1_11 then
			var_1_10 = Lobby.GetFirstFollowablePlayerNum(var_1_11)
		end

		LobbyMember.CGEEIHHBAA(var_1_10, arg_1_1)
		LobbyMember.IFIJDJICI(true, arg_1_1)
	else
		LobbyMember.IFIJDJICI(false, arg_1_1)
	end

	return true
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	return var_0_1(arg_2_0, arg_2_2, arg_2_1, arg_2_3)
end

local function var_0_3(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:GetDataSource()
	local var_3_1 = arg_3_1

	if var_3_0 then
		var_3_1 = var_3_0.controllerIndex:GetValue(arg_3_1)
	end

	return var_3_1
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = LUI.UIBindButton.new()

	var_4_0.id = "fakeButton"

	arg_4_0:addElement(var_4_0)

	arg_4_0.BindButton = var_4_0

	local var_4_1 = Lobby.GetCurrentGameType()

	if StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_4_1, CSV.gameTypesTable.cols.teamBased) == "1" then
		arg_4_0.BindButton:registerEventHandler("button_alt1", function(arg_5_0, arg_5_1)
			local var_5_0 = arg_5_1.controller

			assert(var_5_0)

			local var_5_1 = arg_5_0:getParent()

			return var_0_2(var_5_1, 1, var_5_0, arg_5_1.qualifier and true or false)
		end)
	end

	if not IsPrivateMatch() and not IsSystemLink() then
		ACTIONS.AnimateSequence(arg_4_0, "Hide")
	end

	arg_4_0:SubscribeToModelThroughElement(arg_4_0, "desiredTeam", function(arg_6_0)
		local var_6_0 = DataModel.JJEHAEBDF(arg_6_0)
		local var_6_1 = MP.GetTeamInfo(var_6_0)

		if var_6_0 ~= Teams.free and var_6_0 ~= Teams.spectator and var_6_0 ~= Teams.follower then
			arg_4_0.RoleName:setText(ToUpperCase(var_6_1.name))
		else
			arg_4_0.RoleName:setText(ToUpperCase(Engine.CBBHFCGDIC(var_0_0[var_6_0])))
		end
	end)
	arg_4_0:addEventHandler("menu_create", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_1.controller or arg_4_1
		local var_7_1 = var_0_3(arg_7_0, var_7_0) or var_7_0

		var_0_1(arg_7_0, var_7_1, 0, false)

		local var_7_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isCodCastingEnabled")

		arg_7_0:SubscribeToModel(var_7_2:GetModel(var_7_0), function()
			local var_8_0 = var_0_3(arg_7_0, var_7_0) or var_7_0

			var_0_1(arg_7_0, var_8_0, 0, false)
		end, true)

		local var_7_3 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.gameType")

		arg_7_0:SubscribeToModel(var_7_3:GetModel(var_7_0), function()
			local var_9_0 = var_0_3(arg_7_0, var_7_0) or var_7_0

			var_0_1(arg_7_0, var_9_0, 0, false)
		end, true)

		local var_7_4 = DataSources.frontEnd.lobby.inSplitScreen

		arg_7_0:SubscribeToModel(var_7_4:GetModel(var_7_0), function()
			local var_10_0 = var_0_3(arg_7_0, var_7_0) or var_7_0

			var_0_1(arg_7_0, var_10_0, 0, false)
		end, true)

		local var_7_5 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isGameStartRequested")

		arg_7_0:SubscribeToModel(var_7_5:GetModel(var_7_0), function()
			local var_11_0 = var_0_3(arg_7_0, var_7_0) or var_7_0

			var_0_1(arg_7_0, var_11_0, 0, false)
		end)
	end)

	arg_4_0._roleNumMembersDataSource, arg_4_0._roleMembersDataSource = Lobby.GetMembersListDataSource()
end

function MPPlayerRole(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 30 * _1080p)

	var_12_0.id = "MPPlayerRole"
	var_12_0._animationSets = {}
	var_12_0._sequences = {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Fader"

	var_12_4:SetRGBFromInt(0, 0)
	var_12_4:SetAlpha(0.6, 0)
	var_12_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_12_4:SetAnchorsAndPosition(0, 0, 0, 0.01, 0, 0, 0, _1080p * 0.3)
	var_12_0:addElement(var_12_4)

	var_12_0.Fader = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIStyledText.new()

	var_12_6.id = "RoleName"

	var_12_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_12_6:setText(Engine.CBBHFCGDIC("CODCASTER/CAPS"), 0)
	var_12_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_6:SetAlignment(LUI.Alignment.Right)
	var_12_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_6:SetUseEllipses(ELLIPSES.enabled)
	var_12_6:SetStartupDelay(1000)
	var_12_6:SetLineHoldTime(400)
	var_12_6:SetAnimMoveTime(0)
	var_12_6:SetAnimMoveSpeed(300)
	var_12_6:SetEndDelay(1500)
	var_12_6:SetCrossfadeTime(400)
	var_12_6:SetFadeInTime(300)
	var_12_6:SetFadeOutTime(300)
	var_12_6:SetMaxVisibleLines(1)
	var_12_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -85, _1080p * -11, _1080p * 11)
	var_12_0:addElement(var_12_6)

	var_12_0.RoleName = var_12_6

	local function var_12_7()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_7

	local var_12_8 = {
		{
			value = 0,
			duration = 270,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Hide", var_12_8)

	local var_12_9 = {
		{
			value = 0,
			duration = 270,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Hide", var_12_9)

	local function var_12_10()
		var_12_4:AnimateSequence("Hide")
		var_12_6:AnimateSequence("Hide")
	end

	var_12_0._sequences.Hide = var_12_10

	local function var_12_11()
		return
	end

	var_12_0._sequences.HideHint = var_12_11

	local function var_12_12()
		return
	end

	var_12_0._sequences.ShowHint = var_12_12

	var_0_4(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("MPPlayerRole", MPPlayerRole)
LockTable(_M)
