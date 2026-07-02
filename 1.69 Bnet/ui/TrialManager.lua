LUI.TrialManager = LUI.Class(LUI.UIElement)
LUI.TrialManager.MenusBlockedInTrial = {
	"CampaignMenu",
	"CampaignMenuOffline",
	"CPMainMenu",
	"CPSystemLinkMenu"
}
LUI.TrialManager.NotifiedTimesInSeconds = {
	86400,
	43200,
	21600,
	10800,
	3600,
	1800,
	300
}

local var_0_0 = 305

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = TIME.FormatSeconds(arg_1_2, TIME.Format.READABLE, {
		hour = true,
		second = true,
		minute = true
	})
	local var_1_1 = {
		displayTime = 5000,
		icon = "logo_mw",
		header = Engine.CBBHFCGDIC("TRIAL/MP_TRIAL_VERSION"),
		description = Engine.CBBHFCGDIC("TRIAL/TRIAL_ENDS_IN", var_1_0),
		controllerIndex = arg_1_1
	}

	arg_1_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_1_1
	})
	Social.BEFGJDEHCF(arg_1_1, Engine.CBBHFCGDIC("TRIAL/TRIAL_ENDS_IN", var_1_0))
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = {
		displayTime = 10000,
		icon = "logo_mw",
		header = Engine.CBBHFCGDIC("TRIAL/TRIAL_ENDED"),
		description = Engine.CBBHFCGDIC("TRIAL/LAST_GAME"),
		controllerIndex = arg_2_1
	}

	arg_2_0:dispatchEventToRoot({
		name = "send_toast_notification",
		immediate = true,
		options = var_2_0
	})
	Social.BEFGJDEHCF(arg_2_1, Engine.CBBHFCGDIC("TRIAL/LAST_GAME"))
end

local function var_0_3(arg_3_0, arg_3_1)
	local var_3_0 = {
		title = Engine.CBBHFCGDIC("TRIAL/TRIAL_ENDED"),
		message = Engine.CBBHFCGDIC("TRIAL/TO_PLAY_FURTHER_PLEASE_PURCHASE")
	}

	var_3_0.cancelClosesPopup = false
	var_3_0.buttons = {
		{
			label = Engine.CBBHFCGDIC("TRIAL/PURCHASE_FULL_GAME"),
			action = function(arg_4_0)
				LUI.FlowManager.RequestAddMenu("MPBattlenetStoreMenu")
			end
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
			action = function()
				Engine.DJEDDFJEIG()
			end
		}
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupMessageAndButtons", true, arg_3_1, false, var_3_0)
end

local function var_0_4(arg_6_0)
	local var_6_0 = {
		title = Engine.CBBHFCGDIC("TRIAL/NOT_AVAILABLE_IN_TRIAL"),
		message = Engine.CBBHFCGDIC("TRIAL/MENU_BLOCKED"),
		buttons = {
			{
				label = Engine.CBBHFCGDIC("TRIAL/PURCHASE_FULL_GAME"),
				action = function(arg_7_0)
					LUI.FlowManager.RequestAddMenu("MPBattlenetStoreMenu")
				end
			},
			{
				label = Engine.CBBHFCGDIC("MENU/BACK"),
				action = function()
					return
				end
			}
		}
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupMessageAndButtons", true, arg_6_0, false, var_6_0)
end

function LUI.TrialManager.InitTrialMode()
	LUI.TrialManager.InTrialMode = not Engine.HHGGGGB() and Engine.CGABICJHAI() and false
	LUI.TrialManager.TrialEndTime = Engine.DEIDGHDBHD() + var_0_0
end

function LUI.TrialManager.GetTrialRemainingTime(arg_10_0)
	local var_10_0 = Engine.DEIDGHDBHD()

	return arg_10_0.TrialEndTime - var_10_0
end

function LUI.TrialManager.TrialHasEnded(arg_11_0)
	if arg_11_0.InTrialMode then
		return arg_11_0:GetTrialRemainingTime() <= 0
	else
		return false
	end
end

function LUI.TrialManager.HandleTrialHasEnded(arg_12_0, arg_12_1)
	if arg_12_0.InTrialMode and arg_12_0:TrialHasEnded() then
		if Engine.DDJFBBJAIG() then
			var_0_3(arg_12_0, arg_12_1)
		else
			var_0_2(arg_12_0, arg_12_1)
		end

		return true
	end

	return false
end

function LUI.TrialManager.HandleMenuBlocked(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0.InTrialMode then
		local var_13_0
		local var_13_1 = type(arg_13_1)

		if var_13_1 == "number" and LUI.FlowManager.FlowMenus[arg_13_1] then
			var_13_0 = LUI.FlowManager.FlowMenus[arg_13_1]
		elseif var_13_1 == "string" then
			var_13_0 = arg_13_1
		else
			return false
		end

		for iter_13_0, iter_13_1 in ipairs(LUI.TrialManager.MenusBlockedInTrial) do
			if iter_13_1 == var_13_0 then
				var_0_4(arg_13_2)

				return true
			end
		end
	end

	return false
end

function LUI.TrialManager.InitLayer(arg_14_0)
	arg_14_0._controllerIndex = Engine.IJEBHJIJF()

	if arg_14_0.InTrialMode then
		arg_14_0.trialTimer = LUI.UITimer.new({
			interval = 1000,
			event = "trial_tick"
		})

		arg_14_0:addElement(arg_14_0.trialTimer)
		arg_14_0:registerEventHandler("trial_tick", function(arg_15_0, arg_15_1)
			if arg_15_0:HandleTrialHasEnded(arg_15_0._controllerIndex) and arg_15_0.trialTimer then
				arg_15_0.trialTimer:closeTree()

				arg_15_0.trialTimer = nil
			end

			for iter_15_0, iter_15_1 in ipairs(arg_15_0.NotifiedTimesInSeconds) do
				if arg_15_0:GetTrialRemainingTime() == iter_15_1 then
					var_0_1(arg_15_0, arg_15_0._controllerIndex, iter_15_1)
				end
			end
		end)
	end
end

function LUI.TrialManager.ShouldBeVisible(arg_16_0)
	return LUI.TrialManager.InTrialMode
end

function LUI.TrialManager.ClearLayer(arg_17_0, arg_17_1)
	arg_17_0:closeChildren()
end

function LUI.TrialManager.GetLayer()
	return Engine.DBFFAEEFGJ().trialManager
end
