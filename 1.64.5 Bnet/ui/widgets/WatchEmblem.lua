module(..., package.seeall)

local var_0_0 = 15000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(var_0_0).onComplete = var_1_1

		arg_1_0.Time:setText(var_2_0)
	end

	var_1_1()

	local var_1_2 = Engine.EBCIHGAFBB(Engine.DCJHCAFIIA())

	arg_1_0.Date:setText(var_1_2)

	if Engine.DDJFBBJAIG() then
		local var_1_3 = PlayerData.BFFBGAJGD(arg_1_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup
		local var_1_4 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
		local var_1_5 = LUI.DataSourceInControllerModel.new(var_1_4 .. ".emblemIndex"):GetValue(arg_1_1)
		local var_1_6 = EmblemEditorUtils.GetEmblemImageFromID(var_1_5)

		if var_1_6 ~= "" then
			arg_1_0.Emblem:setImage(RegisterMaterial(var_1_6))
		end
	elseif Engine.EAIICIFIFA() then
		local var_1_7 = DataSources.inGame.currentPlayerStateClientNum
		local var_1_8 = Game.DBACJGFHDD(arg_1_1)

		local function var_1_9()
			local var_3_0 = var_1_7:GetValue(arg_1_1)

			if CONDITIONS.IsSpectating(arg_1_1) then
				var_1_8 = var_3_0
			else
				var_1_8 = Game.DBACJGFHDD(arg_1_1)
			end

			local var_3_1 = Game.BBCDHAEBHD(var_1_8)
			local var_3_2 = var_3_1 and #var_3_1 > 0 and not Engine.EBCDCFCBE(var_3_1) and not killswitch and Engine.DAGCEEFBBI(arg_1_0._controllerIndex, var_3_1)
			local var_3_3 = var_3_2 and Game.DFIJAJICCC(var_1_8)

			if var_3_2 and var_3_3 then
				arg_1_0.Emblem:SetupUserEmblem({
					xuid = var_3_1
				})
			else
				arg_1_0.Emblem:setupUIImage()

				local var_3_4 = Game.BDEDHJGEGI(var_1_8)

				if var_3_4 == nil or #var_3_4 == 0 then
					var_3_4 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
				end

				arg_1_0.Emblem:setImage(RegisterMaterial(var_3_4))
			end
		end

		arg_1_0:SubscribeToModel(var_1_7:GetModel(arg_1_1), var_1_9)

		local var_1_10 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_10:GetModel(arg_1_1), function(arg_4_0)
			if DataModel.JJEHAEBDF(arg_4_0) ~= nil then
				ACTIONS.AnimateSequence(arg_1_0, "Interact")
			end
		end)
	else
		local var_1_11 = LUI.DataSourceFromOmnvar.new("ui_killcam_killedby_id")
		local var_1_12 = DataSources.inGame.currentPlayerStateClientNum
		local var_1_13 = Game.DBACJGFHDD(arg_1_1)

		local function var_1_14()
			local var_5_0 = var_1_11:GetValue(arg_1_1)
			local var_5_1 = var_1_12:GetValue(arg_1_1)

			if CONDITIONS.IsSpectating(arg_1_1) then
				var_1_13 = var_5_1
			elseif CONDITIONS.InKillCam(arg_1_1) then
				var_1_13 = var_5_0
			else
				var_1_13 = Game.DBACJGFHDD(arg_1_1)
			end

			local var_5_2 = Game.BBCDHAEBHD(var_1_13)
			local var_5_3 = var_5_2 and #var_5_2 > 0 and not Engine.EBCDCFCBE(var_5_2)
			local var_5_4 = Dvar.IBEGCHEFE("MNNLTTPSN") == true
			local var_5_5 = var_5_3 and not var_5_4 and Engine.DAGCEEFBBI(arg_1_0._controllerIndex, var_5_2)
			local var_5_6 = var_5_5 and Game.DFIJAJICCC(var_1_13)

			if var_5_5 and var_5_6 then
				arg_1_0.Emblem:SetupUserEmblem({
					xuid = var_5_2
				})
			else
				arg_1_0.Emblem:setupUIImage()

				local var_5_7 = Game.BDEDHJGEGI(var_1_13)

				if var_5_7 == nil or #var_5_7 == 0 then
					var_5_7 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
				end

				arg_1_0.Emblem:setImage(RegisterMaterial(var_5_7))
			end
		end

		arg_1_0:SubscribeToModel(var_1_12:GetModel(arg_1_1), var_1_14)
		arg_1_0:SubscribeToModel(var_1_11:GetModel(arg_1_1), var_1_14)

		local var_1_15 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_15:GetModel(arg_1_1), function(arg_6_0)
			if DataModel.JJEHAEBDF(arg_6_0) ~= nil then
				ACTIONS.AnimateSequence(arg_1_0, "Interact")
			end
		end)
	end
end

function WatchEmblem(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_7_0.id = "WatchEmblem"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetRGBFromInt(855309, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Grad"

	var_7_6:SetRGBFromInt(0, 0)
	var_7_6:setImage(RegisterMaterial("hud_buttongradient"), 0)
	var_7_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 256, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.Grad = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "Radi"

	var_7_8:SetAlpha(0.15, 0)
	var_7_8:SetPixelGridEnabled(true)
	var_7_8:SetPixelGridContrast(0.8, 0)
	var_7_8:SetPixelGridBlockWidth(8, 0)
	var_7_8:SetPixelGridBlockHeight(8, 0)
	var_7_8:SetPixelGridGutterWidth(2, 0)
	var_7_8:SetPixelGridGutterHeight(2, 0)
	var_7_8:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_7_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 30, _1080p * -30, _1080p * 30, _1080p * -30)
	var_7_0:addElement(var_7_8)

	var_7_0.Radi = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Emblem"

	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -154, _1080p * 154, _1080p * -218, _1080p * 90)
	var_7_0:addElement(var_7_10)

	var_7_0.Emblem = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIStyledText.new()

	var_7_12.id = "Time"

	var_7_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_7_12:setText("", 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_12:SetAlignment(LUI.Alignment.Center)
	var_7_12:SetOutlineMinDistance(0, 0)
	var_7_12:SetOutlineMaxDistance(0.2, 0)
	var_7_12:SetOutlineRGBFromInt(0, 0)
	var_7_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -107, _1080p * -37)
	var_7_0:addElement(var_7_12)

	var_7_0.Time = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIStyledText.new()

	var_7_14.id = "Date"

	var_7_14:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_7_14:setText("", 0)
	var_7_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_14:SetAlignment(LUI.Alignment.Center)
	var_7_14:SetOutlineRGBFromInt(0, 0)
	var_7_14:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -175, _1080p * -105)
	var_7_0:addElement(var_7_14)

	var_7_0.Date = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "Line"

	var_7_16:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_7_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -256, _1080p * 256, _1080p * -106, _1080p * -102)
	var_7_0:addElement(var_7_16)

	var_7_0.Line = var_7_16

	local function var_7_17()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_17

	local var_7_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("NoEmblem", var_7_18)

	local var_7_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -294
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -224
		}
	}

	var_7_12:RegisterAnimationSequence("NoEmblem", var_7_19)

	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -280
		}
	}

	var_7_14:RegisterAnimationSequence("NoEmblem", var_7_20)

	local function var_7_21()
		var_7_10:AnimateSequence("NoEmblem")
		var_7_12:AnimateSequence("NoEmblem")
		var_7_14:AnimateSequence("NoEmblem")
	end

	var_7_0._sequences.NoEmblem = var_7_21

	local var_7_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 5000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Interact", var_7_22)

	local var_7_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 5000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Interact", var_7_23)

	local var_7_24 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.15,
			duration = 5000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("Interact", var_7_24)

	local function var_7_25()
		var_7_4:AnimateSequence("Interact")
		var_7_6:AnimateSequence("Interact")
		var_7_8:AnimateSequence("Interact")
	end

	var_7_0._sequences.Interact = var_7_25

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("WatchEmblem", WatchEmblem)
LockTable(_M)
