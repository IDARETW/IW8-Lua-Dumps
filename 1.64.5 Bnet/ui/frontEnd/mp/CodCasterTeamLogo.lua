module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().index:GetValue(arg_1_1)

		if var_2_0 ~= nil then
			arg_1_0.index = var_2_0

			local var_2_1 = arg_1_0:GetCurrentMenu()

			if var_2_1 then
				local var_2_2 = var_2_1.selectedLogoIndex
				local var_2_3 = var_2_1.lockedLogoIndex

				if arg_1_0.index == var_2_2 then
					ACTIONS.AnimateSequence(arg_1_0, "Selected")

					local var_2_4 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, var_2_2, CSV.teamLogoTable.cols.logoWhiteMaterial)
					local var_2_5 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, var_2_2, CSV.teamLogoTable.cols.logoColorMaterial)
					local var_2_6 = StringTable.CBGJCDIHCE(CSV.teamLogoTable.file, var_2_2, CSV.teamLogoTable.cols.teamName)

					if var_2_5 == "" then
						var_2_5 = var_2_4
					end

					var_2_1.selectedLogo = arg_1_0

					var_2_1.TeamLogoPreview:setImage(RegisterMaterial(var_2_5), 0)
					var_2_1.TeamLogoNamePreview:setText(ToUpperCase(Engine.CBBHFCGDIC(var_2_6)), 0)
				elseif arg_1_0.index == var_2_3 then
					ACTIONS.AnimateSequence(arg_1_0, "Locked")
					arg_1_0:SetButtonDisabled(true)
				else
					ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
					arg_1_0:SetButtonDisabled(false)
				end
			end
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "index", var_1_0)
	arg_1_0:addEventHandler("menu_create", var_1_0)

	local function var_1_1()
		local var_3_0 = arg_1_0:GetDataSource().logoWhiteMaterial:GetValue(arg_1_1)

		if var_3_0 ~= nil then
			arg_1_0.logoWhiteMaterial = var_3_0
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "logoWhiteMaterial", var_1_1)

	local function var_1_2()
		local var_4_0 = arg_1_0:GetDataSource().logoColorMaterial:GetValue(arg_1_1)

		if var_4_0 ~= nil then
			arg_1_0.logoColorMaterial = var_4_0
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "logoColorMaterial", var_1_2)

	local function var_1_3()
		local var_5_0 = arg_1_0:GetDataSource().teamName:GetValue(arg_1_1)

		if var_5_0 ~= nil then
			arg_1_0.logoName = var_5_0
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "teamName", var_1_3)
	arg_1_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		arg_6_0:dispatchEventToCurrentMenu({
			name = "logo_selected",
			index = arg_1_0.index,
			logoWhiteMaterial = arg_1_0.logoWhiteMaterial,
			logoColorMaterial = arg_1_0.logoColorMaterial,
			logoName = arg_1_0.logoName
		})
	end)
end

function CodCasterTeamLogo(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 140 * _1080p, 0, 140 * _1080p)

	var_7_0.id = "CodCasterTeamLogo"
	var_7_0._animationSets = {}
	var_7_0._sequences = {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "LoadoutItemButtonBackground"

	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.LoadoutItemButtonBackground = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "LogoImage"

	var_7_6:SetAlpha(0.5, 0)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 115, _1080p * 23, _1080p * 113)

	local function var_7_7()
		local var_8_0 = var_7_0:GetDataSource().logoColorMaterial:GetValue(var_7_1)

		if var_8_0 ~= nil then
			var_7_6:setImage(RegisterMaterial(var_8_0), 0)
		end
	end

	var_7_6:SubscribeToModelThroughElement(var_7_0, "logoColorMaterial", var_7_7)
	var_7_0:addElement(var_7_6)

	var_7_0.LogoImage = var_7_6

	local var_7_8
	local var_7_9 = LUI.UIImage.new()

	var_7_9.id = "LogoLocked"

	var_7_9:SetRGBFromTable(SWATCHES.HUD.disabled, 0)
	var_7_9:setImage(RegisterMaterial("icon_lock"), 0)
	var_7_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 39, _1080p * 101, _1080p * 39, _1080p * 101)
	var_7_0:addElement(var_7_9)

	var_7_0.LogoLocked = var_7_9

	local var_7_10
	local var_7_11 = LUI.UIImage.new()

	var_7_11.id = "ImageBG"

	var_7_11:SetRGBFromInt(8421504, 0)
	var_7_11:SetAlpha(0.2, 0)
	var_7_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -47, _1080p * 43)
	var_7_0:addElement(var_7_11)

	var_7_0.ImageBG = var_7_11

	local var_7_12
	local var_7_13 = LUI.UIImage.new()

	var_7_13.id = "Icon"

	var_7_13:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_7_13:SetAlpha(0.4, 0)
	var_7_13:setImage(RegisterMaterial("cac_equip_ring"), 0)
	var_7_13:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 117, _1080p * -3, _1080p * 115, _1080p * -5)
	var_7_0:addElement(var_7_13)

	var_7_0.Icon = var_7_13

	local var_7_14 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("DefaultSequence", var_7_14)

	local var_7_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_9:RegisterAnimationSequence("DefaultSequence", var_7_15)

	local var_7_16 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		}
	}

	var_7_13:RegisterAnimationSequence("DefaultSequence", var_7_16)

	local function var_7_17()
		var_7_6:AnimateSequence("DefaultSequence")
		var_7_9:AnimateSequence("DefaultSequence")
		var_7_13:AnimateSequence("DefaultSequence")
	end

	var_7_0._sequences.DefaultSequence = var_7_17

	local var_7_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Selected", var_7_18)

	local var_7_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_9:RegisterAnimationSequence("Selected", var_7_19)

	local var_7_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_13:RegisterAnimationSequence("Selected", var_7_20)

	local function var_7_21()
		var_7_6:AnimateSequence("Selected")
		var_7_9:AnimateSequence("Selected")
		var_7_13:AnimateSequence("Selected")
	end

	var_7_0._sequences.Selected = var_7_21

	local var_7_22 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Locked", var_7_22)

	local var_7_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_9:RegisterAnimationSequence("Locked", var_7_23)

	local var_7_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		}
	}

	var_7_13:RegisterAnimationSequence("Locked", var_7_24)

	local function var_7_25()
		var_7_6:AnimateSequence("Locked")
		var_7_9:AnimateSequence("Locked")
		var_7_13:AnimateSequence("Locked")
	end

	var_7_0._sequences.Locked = var_7_25

	var_0_0(var_7_0, var_7_1, arg_7_1)
	ACTIONS.AnimateSequence(var_7_0, "DefaultSequence")

	return var_7_0
end

MenuBuilder.registerType("CodCasterTeamLogo", CodCasterTeamLogo)
LockTable(_M)
