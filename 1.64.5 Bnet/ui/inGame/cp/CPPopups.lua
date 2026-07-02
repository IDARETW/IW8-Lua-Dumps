module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

function CPVideoOverlay(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1 or {}
	local var_1_1 = var_1_0.videoRef or "mp_alien_armory_intro"
	local var_1_2 = var_1_0.endEvent or nil
	local var_1_3 = LUI.UIElement.new()

	var_1_3.id = "video_root_id"

	local var_1_4 = 1000
	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Mask"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 0, _1080p * 1920, 0, _1080p * 1080)
	var_1_6:SetAlpha(0)

	var_1_3.Mask = var_1_6

	var_1_3:addElement(var_1_6)
	var_1_6:SetAlpha(1, var_1_4)
	ACTIONS.ScaleFullscreen(var_1_6)

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("Cinematic", {
		fullscreen = true,
		controllerIndex = controllerIndex
	})

	var_1_8.id = "Cinematic"

	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1920, 0, _1080p * 1080)
	var_1_3:addElement(var_1_8)

	var_1_3.Cinematic = var_1_8

	local var_1_9 = LUI.UIElement.new()

	var_1_9:SetupCinematicSubtitles()

	var_1_9.id = "subtitles"

	var_1_3:addElement(var_1_9)

	local var_1_10 = false

	var_1_3:registerEventHandler("exit_aliens_video", function(arg_2_0, arg_2_1)
		if var_1_2 and not var_1_10 then
			var_1_10 = true

			if var_1_2.target then
				var_1_2.target:processEvent(var_1_2)
			else
				arg_2_0:dispatchEventToRoot(var_1_2)
			end
		else
			LUI.FlowManager.RequestLeaveMenu(arg_2_0)
		end
	end)
	var_1_3:registerEventHandler("check_exit_aliens_video", function(arg_3_0, arg_3_1)
		if Engine.BCJJBCDGAC() then
			arg_3_0:processEvent({
				name = "exit_aliens_video"
			})
		end
	end)
	var_1_3:registerEventHandler("menu_create", function(arg_4_0, arg_4_1)
		arg_4_0:Wait(var_1_4).onComplete = function()
			var_1_8:SetAlpha(1, 1000)
			Engine.BEFHEEBHIA()
			Engine.DFCGFCGBFD(var_1_1)

			local var_5_0 = LUI.UITimer.new({
				interval = 66,
				broadcastToRoot = false,
				disposable = false,
				event = {
					name = "check_exit_aliens_video"
				},
				eventTarget = var_1_3
			})

			var_5_0.id = "check_exit_timer_id"

			arg_4_0:addElement(var_5_0)

			local var_5_1 = LUI.UITimer.new({
				interval = 2000,
				event = "fastfiles_loaded_poll"
			})

			var_5_1.id = "allowSkipTimer_id"

			var_1_3:addElement(var_5_1)

			local var_5_2 = false

			var_1_3:registerEventHandler("fastfiles_loaded_poll", function(arg_6_0, arg_6_1)
				if Engine.CHCAFBBGGD() and not var_5_2 then
					var_5_2 = true

					var_1_3:processEvent({
						name = "allow_skip"
					})
					var_5_1:closeTree()
				else
					Engine.CFGCDIGFIE()
				end
			end)
			var_1_3:processEvent({
				name = "fastfiles_loaded_poll"
			})
		end
	end)

	local var_1_11 = LUI.UIButton.new()

	var_1_11.id = "video_continue_button"

	var_1_11:registerEventHandler("allow_skip", function(arg_7_0, arg_7_1)
		local var_7_0 = MenuBuilder.BuildRegisteredType("BinkSkipPrompt", {
			onSkipInput = function()
				var_1_3:processEvent({
					name = "exit_aliens_video"
				})
			end
		})

		var_7_0:setPriority(5)
		var_1_3:addElement(var_7_0)
	end)
	var_1_3:addElement(var_1_11)

	return var_1_3
end

MenuBuilder.registerType("CPVideoOverlay", CPVideoOverlay)
LUI.FlowManager.RegisterStackPopBehaviour("CPVideoOverlay", CP.VideoOverlayPop)
LockTable(_M)
