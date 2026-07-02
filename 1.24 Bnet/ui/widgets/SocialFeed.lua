module(..., package.seeall)

function SocialFeed(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalNavigator.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "SocialFeed"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3

	if Engine.DDJFBBJAIG() then
		var_1_3 = LUI.UIBlur.new()
		var_1_3.id = "Blur"

		var_1_3:SetRGBFromInt(10066329, 0)
		var_1_3:SetBlurStrength(2.25, 0)
		var_1_3:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -819, _1080p * 1, _1080p * -1)
		var_1_0:addElement(var_1_3)

		var_1_0.Blur = var_1_3
	end

	local var_1_4

	if Engine.DDJFBBJAIG() then
		var_1_4 = LUI.UIBlur.new()
		var_1_4.id = "BlurNotch"

		var_1_4:SetRGBFromInt(10066329, 0)
		var_1_4:setImage(RegisterMaterial("wdg_slot_cut_out_1"), 0)
		var_1_4:SetBlurStrength(2.25, 0)
		var_1_4:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -819, _1080p * -792, _1080p * 1, _1080p * -1)
		var_1_0:addElement(var_1_4)

		var_1_0.BlurNotch = var_1_4
	end

	local var_1_5

	if Engine.DDJFBBJAIG() then
		var_1_5 = LUI.UIImage.new()
		var_1_5.id = "Notch"

		var_1_5:SetRGBFromInt(0, 0)
		var_1_5:SetZRotation(180, 0)
		var_1_5:setImage(RegisterMaterial("wdg_slot_cut_out_1"), 0)
		var_1_5:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 1101, _1080p * 1130, _1080p * 1, 0)
		var_1_0:addElement(var_1_5)

		var_1_0.Notch = var_1_5
	end

	local var_1_6

	if Engine.DDJFBBJAIG() then
		var_1_6 = LUI.UIImage.new()
		var_1_6.id = "NotchBody"

		var_1_6:SetRGBFromInt(0, 0)
		var_1_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -790, 0, _1080p * 1, 0)
		var_1_0:addElement(var_1_6)

		var_1_0.NotchBody = var_1_6
	end

	local var_1_7
	local var_1_8 = LUI.UIBlur.new()

	var_1_8.id = "Divider1"

	var_1_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_8:SetBlurStrength(2.75, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, _1080p * -819, _1080p * -1, 0)
	var_1_0:addElement(var_1_8)

	var_1_0.Divider1 = var_1_8

	local var_1_9

	if Engine.DDJFBBJAIG() then
		var_1_9 = LUI.UIBlur.new()
		var_1_9.id = "Divider2"

		var_1_9:SetRGBFromTable(SWATCHES.text.primaryText, 0)
		var_1_9:SetBlurStrength(2.78, 0)
		var_1_9:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1130, 0, 0, _1080p * 1)
		var_1_0:addElement(var_1_9)

		var_1_0.Divider2 = var_1_9
	end

	local var_1_10

	if Engine.DDJFBBJAIG() then
		var_1_10 = LUI.UIBlur.new()
		var_1_10.id = "DividerDiagonal"

		var_1_10:setImage(RegisterMaterial("wdg_helper_bar_diagonal"), 0)
		var_1_10:SetBlurStrength(2.75, 0)
		var_1_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 1100.5, _1080p * 1130, 0, 0)
		var_1_0:addElement(var_1_10)

		var_1_0.DividerDiagonal = var_1_10
	end

	local function var_1_11()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_11

	if Engine.DDJFBBJAIG() then
		local var_1_12 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_4:RegisterAnimationSequence("OnlineMode", var_1_12)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_13 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("OnlineMode", var_1_13)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_14 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_6:RegisterAnimationSequence("OnlineMode", var_1_14)
	end

	local var_1_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -819
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_8:RegisterAnimationSequence("OnlineMode", var_1_15)

	if Engine.DDJFBBJAIG() then
		local var_1_16 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_9:RegisterAnimationSequence("OnlineMode", var_1_16)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_17 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_10:RegisterAnimationSequence("OnlineMode", var_1_17)
	end

	local function var_1_18()
		if Engine.DDJFBBJAIG() then
			var_1_4:AnimateSequence("OnlineMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_5:AnimateSequence("OnlineMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_6:AnimateSequence("OnlineMode")
		end

		var_1_8:AnimateSequence("OnlineMode")

		if Engine.DDJFBBJAIG() then
			var_1_9:AnimateSequence("OnlineMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_10:AnimateSequence("OnlineMode")
		end
	end

	var_1_0._sequences.OnlineMode = var_1_18

	if Engine.DDJFBBJAIG() then
		local var_1_19 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_3:RegisterAnimationSequence("OfflineMode", var_1_19)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_20 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_4:RegisterAnimationSequence("OfflineMode", var_1_20)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_21 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("OfflineMode", var_1_21)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_22 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_6:RegisterAnimationSequence("OfflineMode", var_1_22)
	end

	local var_1_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -819
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_8:RegisterAnimationSequence("OfflineMode", var_1_23)

	if Engine.DDJFBBJAIG() then
		local var_1_24 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_9:RegisterAnimationSequence("OfflineMode", var_1_24)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_25 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_10:RegisterAnimationSequence("OfflineMode", var_1_25)
	end

	local function var_1_26()
		if Engine.DDJFBBJAIG() then
			var_1_3:AnimateSequence("OfflineMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_4:AnimateSequence("OfflineMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_5:AnimateSequence("OfflineMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_6:AnimateSequence("OfflineMode")
		end

		var_1_8:AnimateSequence("OfflineMode")

		if Engine.DDJFBBJAIG() then
			var_1_9:AnimateSequence("OfflineMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_10:AnimateSequence("OfflineMode")
		end
	end

	var_1_0._sequences.OfflineMode = var_1_26

	if Engine.DDJFBBJAIG() then
		local var_1_27 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_4:RegisterAnimationSequence("CampaignMode", var_1_27)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_28 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_5:RegisterAnimationSequence("CampaignMode", var_1_28)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_29 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_6:RegisterAnimationSequence("CampaignMode", var_1_29)
	end

	local var_1_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_8:RegisterAnimationSequence("CampaignMode", var_1_30)

	if Engine.DDJFBBJAIG() then
		local var_1_31 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_9:RegisterAnimationSequence("CampaignMode", var_1_31)
	end

	if Engine.DDJFBBJAIG() then
		local var_1_32 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_1_10:RegisterAnimationSequence("CampaignMode", var_1_32)
	end

	local function var_1_33()
		if Engine.DDJFBBJAIG() then
			var_1_4:AnimateSequence("CampaignMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_5:AnimateSequence("CampaignMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_6:AnimateSequence("CampaignMode")
		end

		var_1_8:AnimateSequence("CampaignMode")

		if Engine.DDJFBBJAIG() then
			var_1_9:AnimateSequence("CampaignMode")
		end

		if Engine.DDJFBBJAIG() then
			var_1_10:AnimateSequence("CampaignMode")
		end
	end

	var_1_0._sequences.CampaignMode = var_1_33

	if CONDITIONS.IsSingleplayer(var_1_0) or not CONDITIONS.InFrontend(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "CampaignMode")
	end

	if CONDITIONS.IsPublicMatch(var_1_0) and CONDITIONS.InFrontend(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "OnlineMode")
	end

	if not CONDITIONS.IsPublicMatch(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "OfflineMode")
	end

	return var_1_0
end

MenuBuilder.registerType("SocialFeed", SocialFeed)
LockTable(_M)
