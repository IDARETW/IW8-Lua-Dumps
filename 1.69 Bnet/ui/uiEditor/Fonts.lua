local var_0_0 = GetCurrentLanguage()
local var_0_1

var_0_1 = var_0_0 == "LANGUAGE_JAPANESE_FULL" or var_0_0 == "LANGUAGE_JAPANESE_PARTIAL"

local var_0_2

var_0_2 = var_0_0 == "LANGUAGE_SIMPLIFIED_CHINESE"

local var_0_3

var_0_3 = var_0_0 == "LANGUAGE_TRADITIONAL_CHINESE"

local var_0_4

var_0_4 = var_0_0 == "LANGUAGE_SAFE_CHINESE"

local var_0_5

var_0_5 = var_0_0 == "LANGUAGE_ARABIC"

local var_0_6

var_0_6 = var_0_0 == "LANGUAGE_KOREAN_FULL" or var_0_0 == "LANGUAGE_KOREAN_PARTIAL"

local var_0_7

var_0_7 = var_0_0 == "LANGUAGE_POLISH_FULL" or var_0_0 == "LANGUAGE_POLISH_PARTIAL"

local var_0_8

var_0_8 = var_0_0 == "LANGUAGE_RUSSIAN_FULL" or var_0_0 == "LANGUAGE_RUSSIAN_PARTIAL"
FONTS = {}
FONTS.MainRegular = {
	File = "fonts/main_regular.ttf"
}
FONTS.MainLight = {
	File = "fonts/main_light.ttf"
}
FONTS.MainBold = {
	File = "fonts/main_bold.ttf"
}
FONTS.StreakRegular = {
	File = "fonts/killstreak_regular.ttf"
}
FONTS.BodyRegular = {
	File = "fonts/body_regular.ttf"
}
FONTS.BattleNetRegular = {
	File = "fonts/NotoSans_SemiCondensedMedium.ttf;fonts/NotoSansCJK-Regular.otf;fonts/NotoSansThai_Regular.ttf;fonts/main_regular.ttf"
}
FONTS.BattleNetBold = {
	File = "fonts/NotoSans_SemiCondensedBold.ttf;fonts/NotoSansCJK-Regular.otf;fonts/NotoSansThai_Regular.ttf;fonts/main_bold.ttf"
}
FONTS.Dev = {
	File = "fonts/fira_mono_regular.ttf"
}

function PreCacheGlyphs()
	local var_1_0 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 0123456789[]_-/*+?!.,;:{}'\""
	local var_1_1 = FONT_PRESETS.fonts

	Engine.BIIFFHIFCJ()

	for iter_1_0 = 1, #var_1_1 do
		Engine.DFBCEFIHEJ(var_1_1[iter_1_0].font, var_1_1[iter_1_0].size, var_1_0)
	end
end

function FONTS.GetFont(arg_2_0)
	return RegisterFont(arg_2_0)
end

FONTS.GetFontAtSize = FONTS.GetFont
