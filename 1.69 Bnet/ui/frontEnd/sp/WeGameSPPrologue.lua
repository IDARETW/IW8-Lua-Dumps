module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(CONDITIONS.IsWeGame())

	arg_1_0:Wait(10000).onComplete = function()
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
		arg_1_2.callback()
	end

	local var_1_0 = FONTS.GetFont(FONTS.MainBold.File)
	local var_1_1 = 48
	local var_1_2 = 1000
	local var_1_3 = split(Engine.CBBHFCGDIC("WEGAME/PROLOGUE"), "\n")

	for iter_1_0, iter_1_1 in ipairs(var_1_3) do
		local var_1_4 = arg_1_0["PrologueLabel" .. tostring(iter_1_0)]

		if var_1_4 ~= nil then
			var_1_4:SetupChyronText("")

			arg_1_0:Wait(var_1_2 * (iter_1_0 - 1) + 1).onComplete = function()
				var_1_4:StartChyronEffect(arg_1_1, 1, iter_1_1, var_1_0, var_1_1)
			end
		end
	end
end

function WeGameSPPrologue(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "WeGameSPPrologue"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("ChyronText", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "PrologueLabel1"

	var_4_6.Text:setText("", 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 629, _1080p * 679)
	var_4_0:addElement(var_4_6)

	var_4_0.PrologueLabel1 = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("ChyronText", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "PrologueLabel2"

	var_4_8.Text:setText("", 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 679, _1080p * 729)
	var_4_0:addElement(var_4_8)

	var_4_0.PrologueLabel2 = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("ChyronText", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "PrologueLabel3"

	var_4_10.Text:setText("", 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 729, _1080p * 779)
	var_4_0:addElement(var_4_10)

	var_4_0.PrologueLabel3 = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("ChyronText", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "PrologueLabel4"

	var_4_12.Text:setText("", 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 779, _1080p * 829)
	var_4_0:addElement(var_4_12)

	var_4_0.PrologueLabel4 = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("ChyronText", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "PrologueLabel5"

	var_4_14.Text:setText("", 0)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 829, _1080p * 879)
	var_4_0:addElement(var_4_14)

	var_4_0.PrologueLabel5 = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("ChyronText", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "PrologueLabel6"

	var_4_16.Text:setText("", 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 879, _1080p * 929)
	var_4_0:addElement(var_4_16)

	var_4_0.PrologueLabel6 = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("ChyronText", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "PrologueLabel7"

	var_4_18.Text:setText("", 0)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 929, _1080p * 979)
	var_4_0:addElement(var_4_18)

	var_4_0.PrologueLabel7 = var_4_18

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WeGameSPPrologue", WeGameSPPrologue)
LockTable(_M)
