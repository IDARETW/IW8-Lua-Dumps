module(..., package.seeall)

SplashList = {
	{
		video = "startup"
	}
}

function SplashScreens()
	local var_1_0 = LUI.UIElement.new()

	var_1_0.id = "splashScreens"
	var_1_0.nextSplashNum = 1

	if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("NPLRKNKKOP") then
		LUI.FlowManager.RequestLeaveMenu(self, true, true)
		OpenTitleScreen()
		Engine.BBEEIGHJBA(CoD.Music.MainSPMusic)
	else
		local var_1_1 = LUI.UIImage.new()

		var_1_1:SetRGBFromInt(3355443, 0)
		var_1_1:SetAlpha(0)
		var_1_1:SetAlpha(1, 2000)

		var_1_1.id = "background"

		var_1_1:SetHandleMouse(true)
		var_1_0:addElement(var_1_1)

		local var_1_2 = LUI.UIImage.new()

		var_1_2:SetRGBFromInt(0)
		var_1_2:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

		var_1_2.id = "blackBackground"

		var_1_0:addElement(var_1_2)

		var_1_0.blackBackground = var_1_2
		var_1_0:Wait(250).onComplete = function()
			var_1_2:SetAlpha(0)
		end

		local var_1_3 = LUI.Cinematic.new()

		var_1_3.id = "display"

		var_1_0:addElement(var_1_3)

		local var_1_4 = LUI.UITimer.new({
			interval = 100,
			event = "refresh_video"
		})

		var_1_4.id = "timer"

		var_1_0:addElement(var_1_4)
		var_1_0:registerEventHandler("refresh_video", function(arg_3_0, arg_3_1)
			if not Engine.BCJJBCDGAC() then
				return
			end

			PlayNext(arg_3_0)
		end)
		PlayNext(var_1_0)

		if Engine.CGABICJHAI() and Dvar.IBEGCHEFE("MLNMPQOON") then
			var_1_0:registerEventHandler("gamepad_button", function(arg_4_0, arg_4_1)
				if arg_4_1.down then
					arg_4_0.blackBackground:SetAlpha(0)
					PlayNext(arg_4_0)
				end
			end)
			var_1_1:registerEventHandler("leftmousedown", function(arg_5_0, arg_5_1)
				var_1_0.blackBackground:SetAlpha(0)
				PlayNext(var_1_0)
			end)
		end

		if Engine.HDGDBCJFG() then
			var_1_0:registerEventHandler("gamepad_button", function(arg_6_0, arg_6_1)
				if arg_6_1.down then
					arg_6_0.blackBackground:SetAlpha(0)
					PlayNext(arg_6_0)
				end
			end)
			var_1_1:registerEventHandler("leftmousedown", function(arg_7_0, arg_7_1)
				var_1_0.blackBackground:SetAlpha(0)
				PlayNext(var_1_0)
			end)
		end
	end

	var_1_0.chatOptOut = true

	return var_1_0
end

function PlayNext(arg_8_0)
	assert(arg_8_0.nextSplashNum)

	local var_8_0 = SplashList[arg_8_0.nextSplashNum]

	if var_8_0 then
		assert(var_8_0.video)
		Engine.DFCGFCGBFD(var_8_0.video)

		arg_8_0.nextSplashNum = arg_8_0.nextSplashNum + 1
	else
		Dvar.DHEGHJJJHI("MLNMPQOON", true)
		Engine.EBCGADABJ()
		Engine.HDHJDCJGH()
		LUI.FlowManager.RequestLeaveMenu(arg_8_0, true, true)
		Engine.BBEEIGHJBA(CoD.Music.MainSPMusic)

		if Engine.ECAJCAJJGF() then
			if not WeGame.PopupHealthyTipsIfNeeded() then
				OpenTitleScreen()
			end
		else
			OpenTitleScreen()
		end
	end
end

MenuBuilder.registerType("splash_screens", SplashScreens)
LockTable(_M)
