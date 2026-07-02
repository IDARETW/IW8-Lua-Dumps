module(..., package.seeall)

function TeamInfo(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 660 * _1080p, 0, 275 * _1080p)

	var_1_0.id = "TeamInfo"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Watermark"

	var_1_4:SetScale(-0.25, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16.74, _1080p * 235.61, _1080p * 212.38, _1080p * 272.83)

	local function var_1_5()
		local var_2_0 = var_1_0:GetDataSource().watermark:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_4:setImage(RegisterMaterial(var_2_0), 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "watermark", var_1_5)
	var_1_0:addElement(var_1_4)

	var_1_0.Watermark = var_1_4

	local var_1_6
	local var_1_7 = LUI.UIImage.new()

	var_1_7.id = "TeamLogo"

	var_1_7:SetScale(-0.4, 0)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -28.64, _1080p * 280.99, _1080p * -29.53, _1080p * 280.1)

	local function var_1_8()
		local var_3_0 = var_1_0:GetDataSource().logo:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_7:setImage(RegisterMaterial(var_3_0), 0)
		end
	end

	var_1_7:SubscribeToModelThroughElement(var_1_0, "logo", var_1_8)
	var_1_0:addElement(var_1_7)

	var_1_0.TeamLogo = var_1_7

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "Score"

	var_1_10:SetScale(0.2, 0)
	var_1_10:setText("100", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -371, _1080p * -20, _1080p * 118.79, _1080p * 223.79)
	var_1_0:addElement(var_1_10)

	var_1_0.Score = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "TimeToBeat"

	var_1_12:SetAlpha(0, 0)
	var_1_12:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -321.72, _1080p * -48.89, _1080p * 148.79, _1080p * 193.79)
	var_1_0:addElement(var_1_12)

	var_1_0.TimeToBeat = var_1_12

	local function var_1_13()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14 = {
		{
			value = 0.7,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("IsLosingTeam", var_1_14)

	local var_1_15 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("IsLosingTeam", var_1_15)

	local var_1_16 = {
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = -0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("IsLosingTeam", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("IsLosingTeam")
		var_1_7:AnimateSequence("IsLosingTeam")
		var_1_10:AnimateSequence("IsLosingTeam")
	end

	var_1_0._sequences.IsLosingTeam = var_1_17

	local var_1_18 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("IsWinningTeam", var_1_18)

	local var_1_19 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_7:RegisterAnimationSequence("IsWinningTeam", var_1_19)

	local var_1_20 = {
		{
			value = -0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("IsWinningTeam", var_1_20)

	local function var_1_21()
		var_1_4:AnimateSequence("IsWinningTeam")
		var_1_7:AnimateSequence("IsWinningTeam")
		var_1_10:AnimateSequence("IsWinningTeam")
	end

	var_1_0._sequences.IsWinningTeam = var_1_21

	local var_1_22 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ShowTimeToBeat", var_1_22)

	local var_1_23 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("ShowTimeToBeat", var_1_23)

	local function var_1_24()
		var_1_10:AnimateSequence("ShowTimeToBeat")
		var_1_12:AnimateSequence("ShowTimeToBeat")
	end

	var_1_0._sequences.ShowTimeToBeat = var_1_24

	return var_1_0
end

MenuBuilder.registerType("TeamInfo", TeamInfo)
LockTable(_M)
