EventRewards = EventRewards or {}
EventRewards.RewardEvents = {
	DOV = 1,
	VG_REVEAL = 2,
	LEP_DISRUPTOR = 3,
	TT = 4
}
EventRewards.RewardsTable = {
	[EventRewards.RewardEvents.DOV] = {
		challengeIds = {
			9174
		},
		ProcessRewards = function(arg_1_0, arg_1_1, arg_1_2)
			LUI.FlowManager.RequestPopupMenu(arg_1_0, "FutureTitleUpsellPopup", true, arg_1_1, false, {
				freeRewards = true
			})
		end
	},
	[EventRewards.RewardEvents.VG_REVEAL] = {
		challengeIds = {
			11455,
			11456,
			11457,
			11458,
			11459,
			11460,
			11461,
			11462,
			11463
		},
		ProcessRewards = function(arg_2_0, arg_2_1, arg_2_2)
			local var_2_0 = {
				icon = "hud_info_alert",
				displayTime = 3000,
				header = Engine.CBBHFCGDIC("MENU/NOTICE"),
				description = Engine.CBBHFCGDIC("STORE/VG_EVENT_REWARD_DESC")
			}

			LUI.FlowManager.RequestPopupMenu(arg_2_0, "ChallengeRewardsPopup", true, arg_2_1, false, {
				freeRewards = true,
				rewards = arg_2_2,
				toastNotificationDetails = var_2_0
			})
		end
	},
	[EventRewards.RewardEvents.LEP_DISRUPTOR] = {
		challengeIds = {
			21488,
			21489,
			21490
		},
		ProcessRewards = function(arg_3_0, arg_3_1, arg_3_2)
			local var_3_0 = {
				icon = "hud_info_alert",
				displayTime = 3000,
				header = Engine.CBBHFCGDIC("MENU/NOTICE"),
				description = Engine.CBBHFCGDIC("BR_LEP_EVENT/LEP_EVENT_REWARD_DESC")
			}

			LUI.FlowManager.RequestPopupMenu(arg_3_0, "ChallengeRewardsPopup", true, arg_3_1, false, {
				freeRewards = true,
				rewards = arg_3_2,
				toastNotificationDetails = var_3_0
			})
		end
	},
	[EventRewards.RewardEvents.TT] = {
		challengeIds = {
			11588,
			11589,
			11590,
			11591,
			11592,
			11593,
			11594,
			11595,
			11596,
			11597,
			11598,
			11599,
			11600,
			11601
		},
		ProcessRewards = function(arg_4_0, arg_4_1, arg_4_2)
			local var_4_0 = {
				icon = "hud_info_alert",
				displayTime = 3000,
				header = Engine.CBBHFCGDIC("MENU/NOTICE"),
				description = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ345/BR_TT_EVENT_REWARD_DESC")
			}

			LUI.FlowManager.RequestPopupMenu(arg_4_0, "ChallengeRewardsPopup", true, arg_4_1, false, {
				freeRewards = true,
				rewards = arg_4_2,
				toastNotificationDetails = var_4_0,
				description = var_4_0.description
			})
		end
	}
}

function EventRewards.IsChallengeIDApplicable(arg_5_0, arg_5_1)
	for iter_5_0 = 1, #arg_5_0 do
		if arg_5_1 == arg_5_0[iter_5_0] then
			return true
		end
	end

	return false
end

function EventRewards.BuildRewardsTable(arg_6_0, arg_6_1)
	local var_6_0 = OnlineAAR.BIJEDCBCBH(arg_6_0)
	local var_6_1 = {}

	if var_6_0 and var_6_0.Challenges then
		for iter_6_0 = 1, #var_6_0.Challenges do
			local var_6_2 = tonumber(var_6_0.Challenges[iter_6_0].ID)

			if EventRewards.IsChallengeIDApplicable(EventRewards.RewardsTable[arg_6_1].challengeIds, var_6_2) then
				table.insert(var_6_1, var_6_2)
			end
		end
	end

	return var_6_1
end

function EventRewards.HasSeenRewards(arg_7_0, arg_7_1)
	return LUI.DataSourceInGlobalModel.new("frontend.EventRewards" .. arg_7_1):GetValue(arg_7_0)
end

function EventRewards.MarkSeen(arg_8_0, arg_8_1)
	LUI.DataSourceInGlobalModel.new("frontend.EventRewards" .. arg_8_1):SetValue(arg_8_0, true)
end

function EventRewards.CheckAndProcessRewards(arg_9_0, arg_9_1)
	for iter_9_0 = 1, #EventRewards.RewardsTable do
		local var_9_0 = EventRewards.HasSeenRewards(arg_9_1, iter_9_0)
		local var_9_1 = EventRewards.BuildRewardsTable(arg_9_1, iter_9_0)

		if not var_9_0 and #var_9_1 > 0 then
			EventRewards.MarkSeen(arg_9_1, iter_9_0)
			EventRewards.RewardsTable[iter_9_0].ProcessRewards(arg_9_0, arg_9_1, var_9_1)
		end
	end
end
