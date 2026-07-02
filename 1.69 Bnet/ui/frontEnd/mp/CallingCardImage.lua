module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0)
		local var_2_0 = arg_2_0

		arg_1_0.LockStatusLabel:setText(var_2_0, 0)

		local var_2_1 = arg_1_0.LockStatusLabel:GetCurrentFont()
		local var_2_2, var_2_3, var_2_4, var_2_5 = arg_1_0.LockStatusLabel:getLocalRect()
		local var_2_6 = math.abs(var_2_3 - var_2_5)
		local var_2_7, var_2_8, var_2_9, var_2_10 = GetTextDimensions(var_2_0, var_2_1, var_2_6)
		local var_2_11 = (var_2_9 - var_2_7 + 36) / 2

		arg_1_0.LockStatusLabel:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 284 - var_2_11, _1080p * 486, _1080p * 85.5, _1080p * 105.5)
		arg_1_0.Padlock:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 243 - var_2_11, _1080p * 279 - var_2_11, _1080p * 77.5, _1080p * 113.5)
	end

	local function var_1_1()
		local var_3_0 = arg_1_0:GetDataSource()
		local var_3_1 = false

		if var_3_0.challengeInfo.isHiddenChallenge then
			var_3_1 = var_3_0.challengeInfo.isHiddenChallenge:GetValue(arg_1_1)
		end

		if var_3_0.challengeInfo.isCompleted:GetValue(arg_1_1) ~= nil and var_3_0.challengeInfo.isCompleted:GetValue(arg_1_1) == false then
			ACTIONS.AnimateSequence(arg_1_0, "Locked")

			if var_3_0.challengeInfo.tierCount:GetValue(arg_1_1) ~= nil then
				ACTIONS.AnimateSequence(arg_1_0, "ShowLockedStatus")
				var_1_0(Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_MAX_TIER"))
			else
				var_1_0("")
			end
		end

		if var_3_0.challengeInfo.isCompleted:GetValue(arg_1_1) ~= nil and var_3_0.challengeInfo.isCompleted:GetValue(arg_1_1) == true then
			ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")

			var_3_1 = false
		end

		if var_3_1 then
			arg_1_0.CallingCardTexture:SetAlpha(0)
		else
			arg_1_0.CallingCardTexture:SetAlpha(1)
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "challengeInfo.isCompleted", var_1_1)
end

function CallingCardImage(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 486 * _1080p, 0, 191 * _1080p)

	var_4_0.id = "CallingCardImage"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "CallingCardTexture"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 486, _1080p * 1, _1080p * -1)

	local function var_4_5()
		local var_5_0 = var_4_0:GetDataSource().texture:GetValue(var_4_1)

		if var_5_0 ~= nil then
			var_4_4:setImage(RegisterMaterial(var_5_0), 0)
		end
	end

	var_4_4:SubscribeToModelThroughElement(var_4_0, "texture", var_4_5)
	var_4_0:addElement(var_4_4)

	var_4_0.CallingCardTexture = var_4_4

	local var_4_6
	local var_4_7 = LUI.UIImage.new()

	var_4_7.id = "Darkening"

	var_4_7:SetRGBFromInt(0, 0)
	var_4_7:SetAlpha(0, 0)
	var_4_0:addElement(var_4_7)

	var_4_0.Darkening = var_4_7

	local var_4_8
	local var_4_9 = MenuBuilder.BuildRegisteredType("EmblemBoxLine", {
		controllerIndex = var_4_1
	})

	var_4_9.id = "TopLine"

	var_4_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_4_0:addElement(var_4_9)

	var_4_0.TopLine = var_4_9

	local var_4_10
	local var_4_11 = MenuBuilder.BuildRegisteredType("EmblemBoxLine", {
		controllerIndex = var_4_1
	})

	var_4_11.id = "BottomLine"

	var_4_11:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -1, 0)
	var_4_0:addElement(var_4_11)

	var_4_0.BottomLine = var_4_11

	local var_4_12
	local var_4_13 = LUI.UIImage.new()

	var_4_13.id = "BlackBarLockStatus"

	var_4_13:SetRGBFromInt(0, 0)
	var_4_13:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -20, _1080p * 20)
	var_4_0:addElement(var_4_13)

	var_4_0.BlackBarLockStatus = var_4_13

	local var_4_14
	local var_4_15 = LUI.UIText.new()

	var_4_15.id = "LockStatusLabel"

	var_4_15:setText(Engine.CBBHFCGDIC("LUA_MENU/UNLOCK_MAX_TIER"), 0)
	var_4_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_15:SetAlignment(LUI.Alignment.Left)
	var_4_15:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 284, _1080p * 482, _1080p * 85.5, _1080p * 105.5)
	var_4_0:addElement(var_4_15)

	var_4_0.LockStatusLabel = var_4_15

	local var_4_16
	local var_4_17 = LUI.UIImage.new()

	var_4_17.id = "Padlock"

	var_4_17:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_4_17:setImage(RegisterMaterial("icon_lock"), 0)
	var_4_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 243, _1080p * 279, _1080p * 77.5, _1080p * 113.5)
	var_4_0:addElement(var_4_17)

	var_4_0.Padlock = var_4_17

	local var_4_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_18)

	local var_4_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("DefaultSequence", var_4_19)

	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_13:RegisterAnimationSequence("DefaultSequence", var_4_20)

	local var_4_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("DefaultSequence", var_4_21)

	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_17:RegisterAnimationSequence("DefaultSequence", var_4_22)

	local function var_4_23()
		var_4_4:AnimateSequence("DefaultSequence")
		var_4_7:AnimateSequence("DefaultSequence")
		var_4_13:AnimateSequence("DefaultSequence")
		var_4_15:AnimateSequence("DefaultSequence")
		var_4_17:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_23

	local var_4_24 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Locked", var_4_24)

	local var_4_25 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_13:RegisterAnimationSequence("Locked", var_4_25)

	local var_4_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("Locked", var_4_26)

	local var_4_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_17:RegisterAnimationSequence("Locked", var_4_27)

	local function var_4_28()
		var_4_7:AnimateSequence("Locked")
		var_4_13:AnimateSequence("Locked")
		var_4_15:AnimateSequence("Locked")
		var_4_17:AnimateSequence("Locked")
	end

	var_4_0._sequences.Locked = var_4_28

	local var_4_29 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("ShowLockedStatus", var_4_29)

	local var_4_30 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_13:RegisterAnimationSequence("ShowLockedStatus", var_4_30)

	local var_4_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("ShowLockedStatus", var_4_31)

	local var_4_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_17:RegisterAnimationSequence("ShowLockedStatus", var_4_32)

	local function var_4_33()
		var_4_7:AnimateSequence("ShowLockedStatus")
		var_4_13:AnimateSequence("ShowLockedStatus")
		var_4_15:AnimateSequence("ShowLockedStatus")
		var_4_17:AnimateSequence("ShowLockedStatus")
	end

	var_4_0._sequences.ShowLockedStatus = var_4_33

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("CallingCardImage", CallingCardImage)
LockTable(_M)
