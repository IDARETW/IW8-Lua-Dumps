module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.UnlockItem)

	if arg_1_2.name == nil or #arg_1_2.name == 0 or arg_1_2.icon == nil or #arg_1_2.icon == 0 or arg_1_2.type == nil or #arg_1_2.type == 0 then
		arg_1_0.UnlockItem:SetAlpha(0)
	else
		arg_1_0.UnlockItem:SetAlpha(1)
		arg_1_0.UnlockItem.Name:setText(arg_1_2.name)
		arg_1_0.UnlockItem.Type:setText(arg_1_2.type)
		arg_1_0.UnlockItem:SetupImage(arg_1_1, arg_1_2.icon)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.UnlockItem)

	if arg_2_2 == nil or arg_2_2.name == nil or #arg_2_2.name == 0 or arg_2_2.image == nil or #arg_2_2.image == 0 or arg_2_2.type == nil then
		arg_2_0.UnlockItem:SetAlpha(0)
	else
		arg_2_0.UnlockItem:SetAlpha(1)
		arg_2_0.UnlockItem:SetupLootReward(arg_2_1, arg_2_2)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if AAR.IsRankupUnlock(arg_3_3) then
		local var_3_0 = {
			name = "",
			title = "",
			type = ""
		}
		local var_3_1 = AAR.GetUnlockData(arg_3_1, arg_3_3)

		if var_3_1 then
			var_3_0.title = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/NEXT_UNLOCK"))
			var_3_0.name = var_3_1.name
			var_3_0.type = var_3_1.lootTypeName
			var_3_0.icon = var_3_1.icon
		end

		var_0_0(arg_3_0, arg_3_1, var_3_0)
	else
		local var_3_2 = LOOT.GetLootCardData(arg_3_1, arg_3_3)

		var_0_1(arg_3_0, arg_3_1, var_3_2)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.InitUnlock = var_0_2
	arg_4_0.SetUpUnlockData = var_0_0
end

function AARNextUnlocks(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 360 * _1080p)

	var_5_0.id = "AARNextUnlocks"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Background"

	var_5_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_5_4:SetAlpha(0.5, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("AARUnlockItem", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "UnlockItem"

	var_5_6:SetAlpha(0, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 47, _1080p * 317)
	var_5_0:addElement(var_5_6)

	var_5_0.UnlockItem = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "Title"

	var_5_8.Text:setText(Engine.CBBHFCGDIC("AAR/NEXT_UNLOCK"), 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_5_0:addElement(var_5_8)

	var_5_0.Title = var_5_8

	local function var_5_9()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_9

	local var_5_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_5_6:RegisterAnimationSequence("Intro", var_5_10)

	local function var_5_11()
		var_5_6:AnimateSequence("Intro")
	end

	var_5_0._sequences.Intro = var_5_11

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("AARNextUnlocks", AARNextUnlocks)
LockTable(_M)
