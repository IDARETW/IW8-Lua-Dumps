LUI.AchievementsManager = LUI.Class(LUI.UIElement)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 == nil or arg_1_0.achievementsList[arg_1_1] == nil then
		return
	end

	local var_1_0 = arg_1_0.achievementsList[arg_1_1]
	local var_1_1 = {
		displayTime = 3000,
		icon = var_1_0.image,
		header = Engine.CBBHFCGDIC("LUA_MENU/ACHIEVEMENT_UNLOCKED"),
		description = Engine.CBBHFCGDIC(var_1_0.name),
		type = LUI.ToastManager.NotificationType.AchievementUnlocked,
		controllerIndex = arg_1_0._controllerIndex
	}

	arg_1_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_1_1
	})
end

function LUI.AchievementsManager.init(arg_2_0, arg_2_1)
	LUI.UIElement.init(arg_2_0)

	arg_2_0._controllerIndex = arg_2_1.controllerIndex or Engine.IJEBHJIJF()
	arg_2_0.id = "AchievementsManager"
end

function LUI.AchievementsManager.ShouldBeVisible(arg_3_0)
	return true
end

function LUI.AchievementsManager.TrapsInput(arg_4_0)
	return false
end

function LUI.AchievementsManager.InitLayer(arg_5_0)
	if BuiltInAchievements == nil then
		return nil
	end

	local var_5_0 = CSV.pcAchievements
	local var_5_1 = BuiltInAchievements.BCFDGGJGAJ()
	local var_5_2 = {}

	for iter_5_0 = 0, var_5_1 - 1 do
		local var_5_3 = BuiltInAchievements.DCIAAGBJAG(iter_5_0)
		local var_5_4 = StringTable.CBGJCDIHCE(var_5_0.file, var_5_3, var_5_0.cols.id)

		if not BuiltInAchievements.BEEJICIGEG(var_5_4) then
			local var_5_5 = {
				id = var_5_4,
				gameMode = StringTable.CBGJCDIHCE(var_5_0.file, var_5_3, var_5_0.cols.gameMode),
				name = StringTable.CBGJCDIHCE(var_5_0.file, var_5_3, var_5_0.cols.name),
				description = StringTable.CBGJCDIHCE(var_5_0.file, var_5_3, var_5_0.cols.description),
				image = StringTable.CBGJCDIHCE(var_5_0.file, var_5_3, var_5_0.cols.image),
				score = StringTable.CBGJCDIHCE(var_5_0.file, var_5_3, var_5_0.cols.score)
			}

			if BuiltInAchievements.BBEIIEHECB(var_5_5.id) then
				var_5_5.isCompleted = true
			end

			var_5_2[iter_5_0 + 1] = var_5_5
		end
	end

	arg_5_0.achievementsList = var_5_2

	arg_5_0:registerEventHandler("achievement_unlocked", function(arg_6_0, arg_6_1)
		var_0_0(arg_6_0, arg_6_1.achievementIndex)
	end)
end

function LUI.AchievementsManager.ClearLayer(arg_7_0, arg_7_1)
	arg_7_0:closeChildren()
end

function LUI.AchievementsManager.GetLayer()
	return Engine.DBFFAEEFGJ().achievementsManager
end
