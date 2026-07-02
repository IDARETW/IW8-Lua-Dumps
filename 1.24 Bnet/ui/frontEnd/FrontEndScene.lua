FrontEndScene = FrontEndScene or {}
FrontEndScene.ClientCharacters = {
	ArenaRight2 = 5,
	ArenaRight3 = 6,
	ArenaRight1 = 4,
	OperatorEast = 1,
	ArenaLeft3 = 2,
	ArenaLeft2 = 1,
	ArenaLeft4 = 3,
	LobbyPet3 = 10,
	Lobby3 = 3,
	Lobby5 = 5,
	Lobby7 = 7,
	LobbyPet1 = 8,
	OperatorWest = 0,
	LocalSquadMember = 0,
	Lobby6 = 6,
	LobbyPet2 = 9,
	ArenaLeft1 = 0,
	MainMenuWest = 12,
	Lobby2 = 2,
	Lobby1 = 1,
	WestGoodBoy = 8,
	EastGoodGirl = 9,
	ArenaRight4 = 7,
	MainMenuEast = 13,
	Lobby4 = 4,
	LobbyPet4 = 11,
	Ghost = 14
}
FrontEndScene.LobbyCharacters = {
	FrontEndScene.ClientCharacters.LocalSquadMember,
	FrontEndScene.ClientCharacters.Lobby1,
	FrontEndScene.ClientCharacters.Lobby2,
	FrontEndScene.ClientCharacters.Lobby3,
	FrontEndScene.ClientCharacters.Lobby4,
	FrontEndScene.ClientCharacters.Lobby5,
	FrontEndScene.ClientCharacters.Lobby6,
	FrontEndScene.ClientCharacters.Lobby7
}
FrontEndScene.MaxLobbyCharacters = #FrontEndScene.LobbyCharacters
FrontEndScene.Pets = {
	FrontEndScene.ClientCharacters.LobbyPet1,
	FrontEndScene.ClientCharacters.LobbyPet2,
	FrontEndScene.ClientCharacters.LobbyPet3,
	FrontEndScene.ClientCharacters.LobbyPet4
}
FrontEndScene.MaxPets = #FrontEndScene.Pets
FrontEndScene.ArenaCharacters = {
	FrontEndScene.ClientCharacters.ArenaLeft1,
	FrontEndScene.ClientCharacters.ArenaLeft2,
	FrontEndScene.ClientCharacters.ArenaLeft3,
	FrontEndScene.ClientCharacters.ArenaLeft4,
	FrontEndScene.ClientCharacters.ArenaRight1,
	FrontEndScene.ClientCharacters.ArenaRight2,
	FrontEndScene.ClientCharacters.ArenaRight3,
	FrontEndScene.ClientCharacters.ArenaRight4
}
FrontEndScene.QuartermasterCharacters = {
	FrontEndScene.ClientCharacters.QuartermasterCrate,
	FrontEndScene.ClientCharacters.QuartermasterTarget1,
	FrontEndScene.ClientCharacters.QuartermasterTarget2,
	FrontEndScene.ClientCharacters.QuartermasterTarget3
}
FrontEndScene.ClientWeapons = {
	Preview = 2,
	GunTablePrimary = 0,
	GunTableSecondary = 1,
	Watch = 3
}
FrontEndScene.CurrentScene = ""
FrontEndScene.RequestedSceneStack = {}
FrontEndScene.NumWeaponModels = 4
FrontEndScene.MaxClientCharactersMPMainMenu = 6

function FrontEndScene.RegisterScene(arg_1_0, arg_1_1)
	LUI.FlowManager.RegisterStackPushBehaviour(arg_1_0, function()
		table.insert(FrontEndScene.RequestedSceneStack, arg_1_1)
		FrontEndScene.UpdateScene()
	end)
	LUI.FlowManager.RegisterStackPopBehaviour(arg_1_0, function()
		table.remove(FrontEndScene.RequestedSceneStack)
		FrontEndScene.UpdateScene()
	end)
end

function FrontEndScene.UpdateScene()
	local var_4_0 = #FrontEndScene.RequestedSceneStack
	local var_4_1 = FrontEndScene.RequestedSceneStack[var_4_0]

	if var_4_1 and var_4_1 ~= FrontEndScene.CurrentScene then
		Engine.DHFCHIIJCA(var_4_1)
	end
end

function FrontEndScene.HideAllCharacters()
	for iter_5_0, iter_5_1 in pairs(FrontEndScene.ClientCharacters) do
		FrontEndScene.SetCharacterVisible(iter_5_1, false)
	end
end

function FrontEndScene.IsCharacterFullyLoaded(arg_6_0)
	return Engine.DHEEHAJFEA() and ClientCharacter.IJFGGGBAB(arg_6_0) and ClientCharacter.EBDDCJHAHD(arg_6_0)
end

function FrontEndScene.IsSceneFadeComplete(arg_7_0)
	local var_7_0 = DataSources.frontEnd.lobby.isUIFadingOut:GetValue(arg_7_0)
	local var_7_1 = LUI.DataSourceInGlobalModel.new("cg.frontendscene.opacity"):GetValue(arg_7_0)

	return not var_7_0 and var_7_1 <= 0 and #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0
end

function FrontEndScene.HideAllLobbyCharactersPastIndex(arg_8_0)
	local var_8_0 = arg_8_0

	while var_8_0 <= FrontEndScene.MaxLobbyCharacters do
		local var_8_1 = FrontEndScene.LobbyCharacters[var_8_0]

		FrontEndScene.SetCharacterVisible(var_8_1, false)

		local var_8_2 = Lobby.GetPetIndexForCharacter(var_8_1)

		if var_8_2 then
			FrontEndScene.SetCharacterVisible(var_8_2, false)
		end

		var_8_0 = var_8_0 + 1
	end
end

function FrontEndScene.SetupCharacters(arg_9_0)
	FrontEndScene.HideAllCharacters()

	for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
		FrontEndScene.SetCharacterVisible(iter_9_1, true)
	end
end

function FrontEndScene.SetCharacterModels(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_2 and arg_10_2 ~= "" then
		ClientCharacter.DFHIIAGHDG(arg_10_0, arg_10_1, arg_10_2)
		FrontEndScene.PlayFacialIdleAnim(arg_10_0)
	else
		ClientCharacter.DFHIIAGHDG(arg_10_0, arg_10_1)
	end
end

function FrontEndScene.SetCharacterModelsByIndex(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.index, arg_11_1, CSV.bodies.cols.model)
	local var_11_1 = StringTable.DIFCHIGDFB(CSV.heads.file, CSV.heads.cols.index, arg_11_2, CSV.heads.cols.model)

	FrontEndScene.SetCharacterModels(arg_11_0, var_11_0, var_11_1)
end

function FrontEndScene.SetCharacterToRig(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0
	local var_12_1

	if arg_12_2 then
		local var_12_2 = Cac.GetPreferencesForRig(arg_12_2, arg_12_1, arg_12_3)

		var_12_0 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.ref, var_12_2.body:GetValue(arg_12_3), CSV.bodies.cols.index)
		var_12_1 = StringTable.DIFCHIGDFB(CSV.heads.file, CSV.heads.cols.ref, var_12_2.head:GetValue(arg_12_3), CSV.heads.cols.index)
	end

	var_12_0 = var_12_0 or Cac.GetRigBaseBodyModel(arg_12_1)
	var_12_1 = var_12_1 or Cac.GetRigBaseHeadModel(arg_12_1)

	local var_12_3 = StringTable.DIFCHIGDFB(CSV.bodies.file, CSV.bodies.cols.index, var_12_0, CSV.bodies.cols.model)
	local var_12_4 = StringTable.DIFCHIGDFB(CSV.heads.file, CSV.heads.cols.index, var_12_1, CSV.heads.cols.model)

	FrontEndScene.SetCharacterModels(arg_12_0, var_12_3, var_12_4)

	local var_12_5 = Cac.GetRigOffset(Cac.GetRigTableIndex(arg_12_1))

	ClientCharacter.GHFDEGFFJ(arg_12_0, tonumber(var_12_5[1]), tonumber(var_12_5[2]), tonumber(var_12_5[3]))

	local var_12_6 = Cac.GetRigFrontEndIdleAnim(arg_12_1)

	if var_12_6 and var_12_6 ~= "" then
		ClientCharacter.CAECDIHFCF(arg_12_0, var_12_6)
	end
end

function FrontEndScene.SetCharacterVisible(arg_13_0, arg_13_1, arg_13_2)
	if not arg_13_1 and not arg_13_2 then
		ClientCharacter.CAECDIHFCF(arg_13_0, "chr_menu_mp_squad_male_01")
	end

	ClientCharacter.DJEGBAEGJC(arg_13_0, arg_13_1)
end

function FrontEndScene.IsCategoryAttachmentForWeaponOffset(arg_14_0)
	if #arg_14_0 == 0 or arg_14_0 == "rec" or arg_14_0 == "front" or arg_14_0 == "back" or arg_14_0 == "mag" or arg_14_0 == "guard" or arg_14_0 == "gunperk" then
		return false
	end

	return true
end

function FrontEndScene.GetAttachModelOverrideData(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = LUI.Split(arg_15_1, "+")
	local var_15_1
	local var_15_2 = -1

	for iter_15_0 = 2, #var_15_0 do
		local var_15_3 = LUI.Split(var_15_0[iter_15_0], "_")

		if FrontEndScene.IsCategoryAttachmentForWeaponOffset(var_15_3[1]) then
			local var_15_4 = LUI.Split(var_15_0[iter_15_0], "|")[1]
			local var_15_5 = {
				{
					col = CSV.weaponOffsets.cols.modelName,
					key = var_15_4
				},
				{
					col = CSV.weaponOffsets.cols.weaponBaseModel,
					key = arg_15_0
				}
			}
			local var_15_6 = StringTable.BABCABFJEJ(arg_15_2, var_15_5)

			if var_15_6 and var_15_6 > -1 then
				local var_15_7 = CSV.ReadRowWithFileAndColumns(arg_15_2, var_15_6, arg_15_3)

				if #var_15_7.priority > 0 and var_15_2 < tonumber(var_15_7.priority) then
					var_15_1 = var_15_7
					var_15_2 = tonumber(var_15_7.priority)
				end
			end
		end
	end

	return var_15_1
end

local var_0_0 = {
	[WEAPON.FrontEndRiotShield] = true,
	[WEAPON.FrontEndRiotShield_V2] = true,
	[WEAPON.FrontEndRiotShield_V4] = true,
	[WEAPON.FrontEndRiotShield_V5] = true,
	[WEAPON.FrontEndRiotShield_V6] = true
}

local function var_0_1(arg_16_0)
	return var_0_0[arg_16_0]
end

function FrontEndScene.GetWeaponModelOffset(arg_17_0, arg_17_1)
	local var_17_0 = LUI.Split(arg_17_0, "+")
	local var_17_1 = LUI.Split(var_17_0[1], "|")[1]

	if not WATCH.IsWeaponWatch(var_17_1) and not var_0_1(var_17_1) then
		var_17_1 = WEAPON.GetBaseRef(var_17_1, true)
	end

	local var_17_2 = CSV.weaponOffsets
	local var_17_3 = {
		xOffset = var_17_2.cols.xOffset,
		yOffset = var_17_2.cols.yOffset,
		zOffset = var_17_2.cols.zOffset,
		xRotationCenter = var_17_2.cols.xRotationCenter,
		yRotationCenter = var_17_2.cols.yRotationCenter,
		zRotationCenter = var_17_2.cols.zRotationCenter,
		pitch = var_17_2.cols.pitch,
		yaw = var_17_2.cols.yaw,
		roll = var_17_2.cols.roll,
		priority = var_17_2.cols.priority
	}
	local var_17_4 = FrontEndScene.GetAttachModelOverrideData(var_17_1, arg_17_0, arg_17_1, var_17_3)

	if not var_17_4 then
		local var_17_5 = StringTable.BJJBBCJGEJ(arg_17_1, CSV.weaponOffsets.cols.modelName, var_17_1)

		if var_17_5 and var_17_5 > -1 then
			var_17_4 = CSV.ReadRowWithFileAndColumns(arg_17_1, var_17_5, var_17_3)
		end
	end

	if var_17_4 then
		for iter_17_0, iter_17_1 in pairs(var_17_4) do
			local var_17_6 = tonumber(iter_17_1)

			if var_17_6 ~= nil then
				var_17_4[iter_17_0] = var_17_6
			else
				var_17_4[iter_17_0] = 0
			end
		end

		if Engine.BHICADFIHA() then
			local var_17_7 = Dvar.BJJCJHDBII("LOQKPMTMRS")
			local var_17_8 = Dvar.BJJCJHDBII("LNRTLSMOSR")
			local var_17_9 = Dvar.BJJCJHDBII("MRPNKMRKPM")

			var_17_4.xRotationCenter = tonumber(var_17_4.xRotationCenter) + var_17_7
			var_17_4.yRotationCenter = tonumber(var_17_4.yRotationCenter) + var_17_8
			var_17_4.zRotationCenter = tonumber(var_17_4.zRotationCenter) + var_17_9
		end

		return var_17_4
	else
		return {
			xOffset = 0,
			zOffset = 0,
			zRotationCenter = 0,
			roll = 0,
			yaw = 0,
			xRotationCenter = 0,
			yRotationCenter = 0,
			pitch = 0,
			yOffset = 0
		}
	end
end

function FrontEndScene.SetWeaponModel(arg_18_0, arg_18_1, arg_18_2)
	ClientWeapon.BCBABJCDFG(arg_18_0, arg_18_1)
end

function FrontEndScene.HideWeaponModels()
	for iter_19_0 = 0, FrontEndScene.NumWeaponModels - 1 do
		ClientWeapon.BHDGACCFEF(iter_19_0, false)
	end
end

function FrontEndScene.SetExclusiveWeaponModels(arg_20_0)
	FrontEndScene.HideWeaponModels()

	for iter_20_0, iter_20_1 in ipairs(arg_20_0) do
		ClientWeapon.BHDGACCFEF(iter_20_1, true)
	end
end

function FrontEndScene.PlayIdleForSuper(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_1 == Cac.superNoneValue then
		arg_21_1 = Cac.noneSuper[arg_21_2]
	end

	local var_21_0 = StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_21_1, CSV.supers.cols.rigIdleAnim)

	if ClientCharacter.EACGJBFDCA(arg_21_0, "mp_warfighter_body_mco") then
		var_21_0 = var_21_0 .. "_omar"
	end

	if var_21_0 and var_21_0 ~= "" then
		ClientCharacter.CAECDIHFCF(arg_21_0, var_21_0)
	else
		DebugPrint("ERROR: FrontEndScene.PlayIdleForSuper - Unable to find idle anim for super " .. arg_21_1)
	end
end

function FrontEndScene.GetWeaponAnimFromClass(arg_22_0)
	local var_22_0 = arg_22_0

	if var_22_0 == 0 then
		return "assault_rifle"
	elseif var_22_0 == 1 then
		return "smg"
	elseif var_22_0 == 2 then
		return "lmg"
	elseif var_22_0 == 3 then
		return "sniper"
	elseif var_22_0 == 4 then
		return "shotgun"
	else
		return "not_primary"
	end
end

function FrontEndScene.GetCharacterEntityNum(arg_23_0)
	return ClientCharacter.DBDJAAEGDH(arg_23_0)
end

function FrontEndScene.PlayFacialIdleAnim(arg_24_0)
	local var_24_0 = "iw7_mp_frontend_facial_loop01"

	if ClientCharacter.EACGJBFDCA(arg_24_0, "mp_synaptic_ethan_body") then
		var_24_0 = var_24_0 .. "_eth3n"
	end

	if var_24_0 and var_24_0 ~= "" then
		ClientCharacter.CAGDDGEFAJ(arg_24_0, var_24_0)
	else
		DebugPrint("ERROR: FrontEndScene.PlayFacialIdle - Unable to find idle anim for face ")
	end
end

function FrontEndScene.SetWeaponForSuper(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_1 == Cac.superNoneValue then
		arg_25_1 = Cac.noneSuper[arg_25_2]
	end

	local var_25_0 = StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_25_1, CSV.supers.cols.frontEndWeaponModel)

	if var_25_0 and var_25_0 ~= "" then
		ClientCharacter.BFCIBJIIAB(arg_25_0, false)
		ClientCharacter.FHCIHJDAB(arg_25_0, var_25_0)
		ClientCharacter.DGGEBHHGJG(arg_25_0, true)
	else
		ClientCharacter.FHCIHJDAB(arg_25_0, nil)
	end
end

function FrontEndScene.SetCustomizationWeaponForSuper(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_1 == Cac.superNoneValue then
		arg_26_1 = Cac.noneSuper[arg_26_2]
	end

	local var_26_0 = StringTable.DIFCHIGDFB(CSV.supers.file, CSV.supers.cols.ref, arg_26_1, CSV.supers.cols.customizationWeaponModel)

	if var_26_0 and var_26_0 ~= "" then
		ClientCharacter.BFCIBJIIAB(arg_26_0, false)
		ClientCharacter.FHCIHJDAB(arg_26_0, var_26_0)
	else
		ClientCharacter.FHCIHJDAB(arg_26_0, nil)
	end
end

function FrontEndScene.PlayQuarterMasterAnim(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	assert(arg_27_0)

	if arg_27_2 and arg_27_2 ~= "" then
		ClientCharacter.CAECDIHFCF(FrontEndScene.ClientCharacters.quarterMaster, arg_27_2, 0.2)
		ClientCharacter.BHJJGDDGFI(FrontEndScene.ClientCharacters.quarterMaster, "iw7_mp_quartermaster_idle_01", 0.2)
	end

	if arg_27_3 and arg_27_3 ~= "" then
		if arg_27_4 and arg_27_4 > 0 then
			arg_27_0:Wait(arg_27_4).onComplete = function()
				arg_27_0.lastQuartermasterSoundID = Engine.BJDBIAGIDA(arg_27_3)
			end
		else
			arg_27_0.lastQuartermasterSoundID = Engine.BJDBIAGIDA(arg_27_3)
		end
	end
end

function FrontEndScene.PlayQuarterMasterRandomAnim(arg_29_0, arg_29_1)
	local var_29_0 = StringTable.BFHCAIIDA(arg_29_1)

	if var_29_0 > 0 then
		local var_29_1 = math.random(0, var_29_0 - 1)
		local var_29_2 = StringTable.CBGJCDIHCE(arg_29_1, var_29_1, CSV.quartermasterAnims.cols.anim)
		local var_29_3 = StringTable.CBGJCDIHCE(arg_29_1, var_29_1, CSV.quartermasterAnims.cols.audio)
		local var_29_4 = tonumber(StringTable.CBGJCDIHCE(arg_29_1, var_29_1, CSV.quartermasterAnims.cols.audioDelay))

		FrontEndScene.PlayQuarterMasterAnim(arg_29_0, FrontEndScene.ClientCharacters.quarterMaster, var_29_2, var_29_3, var_29_4)
	end
end

function FrontEndScene.PlayQuarterMasterQualityReaction(arg_30_0, arg_30_1)
	return
end

function FrontEndScene.PlayCustomizationIdle(arg_31_0, arg_31_1)
	local var_31_0 = Cac.GetRigFrontEndCustomizationIdleAnim(arg_31_1)

	ClientCharacter.CAECDIHFCF(arg_31_0, var_31_0, 0)
end

function FrontEndScene.EnableStreaming()
	if not Streaming.BACFJGBIC() then
		Streaming.BDDBGGIC(true)
	end
end

function FrontEndScene.RequestBodyModels(arg_33_0)
	FrontEndScene.EnableStreaming()
	Streaming.BBJEEBCIA(arg_33_0)
end

function FrontEndScene.RequestHeadModels(arg_34_0)
	FrontEndScene.EnableStreaming()
	Streaming.DBGCBBJIAG(arg_34_0)
end

function FrontEndScene.RequestHandViewModels(arg_35_0, arg_35_1)
	FrontEndScene.EnableStreaming()
	Streaming.CDEFABDIBG(arg_35_0, arg_35_1)
end

function FrontEndScene.RequestWeaponWorldModels(arg_36_0)
	FrontEndScene.EnableStreaming()
	Streaming.GHDFFFCGE(arg_36_0)
end

function FrontEndScene.RequestWeaponViewModels(arg_37_0, arg_37_1)
	FrontEndScene.EnableStreaming()
	Streaming.CHBBDIBHIH(arg_37_0, arg_37_1)
end
