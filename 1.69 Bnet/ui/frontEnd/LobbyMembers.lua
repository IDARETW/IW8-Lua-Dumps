module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = arg_1_1,
		alignment = LUI.Alignment.Middle
	})

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, _1080p * 610, _1080p * 0, _1080p * 26)
	arg_1_0:addElement(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.LobbyMembersHeader.PlayerCount)

	arg_2_0.AddLobbyStatus = var_0_0

	local var_2_0 = Dvar.DHEEJCCJBH("MOLPOSLOMO")
	local var_2_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_2_0, CSV.gameTypesTable.cols.teamBased)
	local var_2_2 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.memberCount")
	local var_2_3 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamAlliesCount")
	local var_2_4 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamAxisCount")
	local var_2_5 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamSpectatorCount")
	local var_2_6 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.activeParty.members.teamFollowerCount")

	local function var_2_7()
		local var_3_0 = var_2_2:GetValue(arg_2_1)

		if var_3_0 ~= nil then
			local var_3_1

			if var_3_0 == 1 then
				var_3_1 = var_3_0 .. " " .. Engine.CBBHFCGDIC("MENU/PLAYER")
			else
				var_3_1 = var_3_0 .. " " .. Engine.CBBHFCGDIC("MENU/PLAYERS")
			end

			if MLG.DBIBHEAEGD() then
				local var_3_2 = var_2_3:GetValue(arg_2_1)
				local var_3_3 = var_2_4:GetValue(arg_2_1)
				local var_3_4 = var_2_5:GetValue(arg_2_1)
				local var_3_5 = var_2_6:GetValue(arg_2_1)

				var_3_1 = var_3_1 .. " (All:" .. var_3_3 .. " Coa:" .. var_3_2 .. " Cod:" .. var_3_4 .. " Fol:" .. var_3_5 .. ")"
			end

			arg_2_0.LobbyMembersHeader.PlayerCount:setText(var_3_1)
			arg_2_0.LobbyMembersHeader:AdjustSplitScreenPromptSize()
		end
	end

	if arg_2_0.LobbyMembersHeader.ChangeTeamPrompt then
		arg_2_0.LobbyMembersHeader.ChangeTeamPrompt:SetAlpha(var_2_1 == "1" and 1 or 0)
	end

	arg_2_0:SubscribeToModel(var_2_2:GetModel(arg_2_1), var_2_7)

	if MLG.DBIBHEAEGD() then
		arg_2_0:SubscribeToModel(var_2_3:GetModel(arg_2_1), var_2_7)
		arg_2_0:SubscribeToModel(var_2_4:GetModel(arg_2_1), var_2_7)
		arg_2_0:SubscribeToModel(var_2_5:GetModel(arg_2_1), var_2_7)
		arg_2_0:SubscribeToModel(var_2_6:GetModel(arg_2_1), var_2_7)
	end
end

function LobbyMembers(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalStackedLayout.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 610 * _1080p, 0, 610 * _1080p)

	var_4_0.id = "LobbyMembers"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:SetSpacing(10 * _1080p)

	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LobbyMembersHeader", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "LobbyMembersHeader"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 20)
	var_4_0:addElement(var_4_4)

	var_4_0.LobbyMembersHeader = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("LobbyMembersList", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "LobbyMembersList"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -154, _1080p * 635, _1080p * 30, _1080p * 520)
	var_4_0:addElement(var_4_6)

	var_4_0.LobbyMembersList = var_4_6

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LobbyMembers", LobbyMembers)
LockTable(_M)
