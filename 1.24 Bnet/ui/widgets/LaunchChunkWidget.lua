module(..., package.seeall)

local var_0_0 = 250
local var_0_1 = "check_content_status"
local var_0_2 = "lc_debug_status"

local function var_0_3(arg_1_0)
	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE(var_0_2) then
		local var_1_0 = 0.001

		arg_1_0._progress = arg_1_0._progress + var_1_0
	elseif Engine.ECHHDAIBD then
		arg_1_0._progress = Engine.ECHHDAIBD()
	end
end

local function var_0_4(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.InstallProgress)

	arg_2_0.ProgressBar = arg_2_0.InstallProgress.ProgressBar.Fill
	arg_2_0.ProgressText = arg_2_0.InstallProgress.Percentage
	arg_2_0._progress = 0
	arg_2_0._timer = LUI.UITimer.new({
		interval = var_0_0,
		event = var_0_1
	})

	arg_2_0:addElement(arg_2_0._timer)
	arg_2_0:registerEventHandler(var_0_1, function(arg_3_0, arg_3_1)
		var_0_3(arg_3_0)

		local var_3_0 = math.floor(arg_3_0._progress * 100)

		arg_3_0.ProgressText:setText(Engine.CBBHFCGDIC("LUA_MENU/PERCENTAGE_OF_COMPLETION", var_3_0))
		arg_3_0.ProgressBar:SetRightAnchor(1 - arg_3_0._progress, 250)

		if arg_3_0._progress >= 1 then
			arg_3_0._timer:closeTree()
			ACTIONS.AnimateSequence(arg_3_0.InstallProgress, "Complete")
		end
	end)
end

function LaunchChunkWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "LaunchChunkWidget"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("InstallProgress", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "InstallProgress"

	var_4_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -444, _1080p * -96, _1080p * 54, _1080p * 86)
	var_4_0:addElement(var_4_4)

	var_4_0.InstallProgress = var_4_4

	local var_4_5 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -444
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_5)

	local function var_4_6()
		var_4_4:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.ShowNewPhase = var_4_7

	local function var_4_8()
		return
	end

	var_4_0._sequences.HideNewPhase = var_4_8

	var_0_4(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("LaunchChunkWidget", LaunchChunkWidget)
LockTable(_M)
