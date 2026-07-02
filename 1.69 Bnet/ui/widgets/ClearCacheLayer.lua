LUI.ClearCacheLayer = LUI.Class(LUI.UIElement)
CLEAR_CACHE_BANNER = CLEAR_CACHE_BANNER or {}
CLEAR_CACHE_BANNER = {
	BANNER_SHOW_DURATION = 5000,
	SLIDE_IN_OUT_TIME = 300,
	HEIGHT = 40,
	WIDTH = 435
}

function LUI.ClearCacheLayer.init(arg_1_0, arg_1_1)
	LUI.UIElement.init(arg_1_0)

	arg_1_0._controllerIndex = arg_1_1.controllerIndex or Engine.IJEBHJIJF()
	arg_1_0.id = "ClearCacheLayer"
	arg_1_0.isClearCacheBannerVisible = false
	arg_1_0.allowCacheClear = false
end

function LUI.ClearCacheLayer.ShouldBeVisible(arg_2_0)
	local var_2_0 = Engine.DBFFAEEFGJ().flowManager:GetStackTop()
	local var_2_1 = var_2_0 and var_2_0.name == "CinematicFullscreen"
	local var_2_2 = Engine.DIEEIEFCFF()
	local var_2_3 = Dvar.CFHDGABACF("MOKSKTKTLQ") == 0 and arg_2_0.allowCacheClear

	if not arg_2_0.isClearCacheBannerVisible then
		arg_2_0.isClearCacheBannerVisible = var_2_3
	end

	return Engine.CGABICJHAI() and Engine.DDJFBBJAIG() and not var_2_2 and arg_2_0.isClearCacheBannerVisible and not var_2_1
end

local function var_0_0(arg_3_0)
	Engine.DBFFAEEFGJ().clearCacheLayer.isClearCacheBannerVisible = arg_3_0
end

function LUI.ClearCacheLayer.SetAllowCacheClear(arg_4_0)
	Engine.DBFFAEEFGJ().clearCacheLayer.allowCacheClear = arg_4_0
end

local function var_0_1(arg_5_0, arg_5_1)
	local var_5_0 = Engine.DBFFAEEFGJ()
	local var_5_1 = var_5_0.shaderPreloadLayer._isShaderPreloadingVisible
	local var_5_2 = var_5_1 and CLEAR_CACHE_BANNER.HEIGHT * _1080p or 0 * _1080p
	local var_5_3 = var_5_1 and 2 * CLEAR_CACHE_BANNER.HEIGHT * _1080p or CLEAR_CACHE_BANNER.HEIGHT * _1080p
	local var_5_4 = MenuBuilder.BuildRegisteredType("ClearCacheProgressBanner", {
		controllerIndex = arg_5_1
	})

	var_5_4.id = "ClearCacheProgressBanner"

	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -CLEAR_CACHE_BANNER.WIDTH / 2, _1080p * CLEAR_CACHE_BANNER.WIDTH / 2, 0, 0)
	arg_5_0:addElement(var_5_4)

	arg_5_0.clearCacheProgressBanner = var_5_4
	arg_5_0.clearCacheProgressBanner.isClearCacheBannerVisible = true

	arg_5_0.clearCacheProgressBanner:MoveBanner(var_5_2, var_5_3, CLEAR_CACHE_BANNER.SLIDE_IN_OUT_TIME)

	arg_5_0.showBannerTimer = arg_5_0:Wait(CLEAR_CACHE_BANNER.BANNER_SHOW_DURATION)

	function arg_5_0.showBannerTimer.onComplete()
		if arg_5_0.clearCacheProgressBanner ~= nil then
			local var_6_0 = var_5_0.shaderPreloadLayer._isShaderPreloadingVisible and CLEAR_CACHE_BANNER.HEIGHT * _1080p or 0 * _1080p

			arg_5_0.clearCacheProgressBanner:SetBottom(var_6_0, CLEAR_CACHE_BANNER.SLIDE_IN_OUT_TIME)

			arg_5_0.removeBanner = arg_5_0:Wait(CLEAR_CACHE_BANNER.SLIDE_IN_OUT_TIME)

			function arg_5_0.removeBanner.onComplete()
				arg_5_0.allowCacheClear = false

				var_0_0(false)
			end
		end
	end
end

function LUI.ClearCacheLayer.InitLayer(arg_8_0)
	local var_8_0 = Engine.IJEBHJIJF()

	var_0_1(arg_8_0, var_8_0)
end

function LUI.ClearCacheLayer.ClearLayer(arg_9_0)
	arg_9_0.clearCacheProgressBanner:closeTree()

	arg_9_0.clearCacheProgressBanner = nil
end
