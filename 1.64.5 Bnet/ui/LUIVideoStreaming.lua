module(..., package.seeall)

local function var_0_0()
	Engine.BEFHEEBHIA()
	Engine.DAGIJBGAAE("http://sceerd.dl.playstation.net/sceerd/sceavplayer/streaming02.mp4")

	local var_1_0 = LUI.UIElement.new()

	var_1_0.id = "videoStreamingMenu"

	local var_1_1 = LUI.Cinematic.new({
		mp4 = true
	})

	var_1_1:SetAnchorsAndPosition(0, 1, 0, 1, 100, 640, 100, 360)

	var_1_1.id = "cinematic"

	var_1_0:addElement(var_1_1)

	local var_1_2 = MenuBuilder.BuildRegisteredType("generic_back_button")

	var_1_0:addElement(var_1_2)

	return var_1_0
end

local function var_0_1()
	Engine.ECIEABHFIC()
end

MenuBuilder.registerType("VideoStreaming", var_0_0)
LUI.FlowManager.RegisterStackPopBehaviour("VideoStreaming", var_0_1)
LockTable(_M)
