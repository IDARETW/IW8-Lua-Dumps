Languages = {
	[0] = "LANGUAGE_ENGLISH",
	"LANGUAGE_ENGLISH_SAFE",
	"LANGUAGE_FRENCH",
	"LANGUAGE_GERMAN",
	"LANGUAGE_ITALIAN",
	"LANGUAGE_SPANISH",
	"LANGUAGE_RUSSIAN_FULL",
	"LANGUAGE_RUSSIAN_PARTIAL",
	"LANGUAGE_POLISH_FULL",
	"LANGUAGE_POLISH_PARTIAL",
	"LANGUAGE_KOREAN_FULL",
	"LANGUAGE_KOREAN_PARTIAL",
	"LANGUAGE_JAPANESE_FULL",
	"LANGUAGE_JAPANESE_PARTIAL",
	"LANGUAGE_SIMPLIFIED_CHINESE",
	"LANGUAGE_TRADITIONAL_CHINESE",
	"LANGUAGE_SAFE_CHINESE",
	"LANGUAGE_ARABIC",
	"LANGUAGE_CZECH",
	"LANGUAGE_SPANISHNA",
	"LANGUAGE_PORTUGUESE",
	"MAX_LANGUAGES"
}
LanguageInfo = {
	LANGUAGE_ENGLISH = {
		name = "LANGUAGE_SELECT/ENGLISH"
	},
	LANGUAGE_ENGLISH_SAFE = {
		name = "LANGUAGE_SELECT/ENGLISH"
	},
	LANGUAGE_FRENCH = {
		name = "LANGUAGE_SELECT/FRENCH"
	},
	LANGUAGE_GERMAN = {
		name = "LANGUAGE_SELECT/GERMAN"
	},
	LANGUAGE_ITALIAN = {
		name = "LANGUAGE_SELECT/ITALIAN"
	},
	LANGUAGE_SPANISH = {
		name = "LANGUAGE_SELECT/SPANISH"
	},
	LANGUAGE_RUSSIAN_FULL = {
		name = "LANGUAGE_SELECT/RUSSIAN"
	},
	LANGUAGE_RUSSIAN_PARTIAL = {
		baseLanguage = "LANGUAGE_SELECT/RUSSIAN",
		name = "LANGUAGE_SELECT/PARTIAL"
	},
	LANGUAGE_POLISH_FULL = {
		name = "LANGUAGE_SELECT/POLISH"
	},
	LANGUAGE_POLISH_PARTIAL = {
		baseLanguage = "LANGUAGE_SELECT/POLISH",
		name = "LANGUAGE_SELECT/PARTIAL"
	},
	LANGUAGE_KOREAN_FULL = {
		name = "LANGUAGE_SELECT/KOREAN"
	},
	LANGUAGE_KOREAN_PARTIAL = {
		baseLanguage = "LANGUAGE_SELECT/KOREAN",
		name = "LANGUAGE_SELECT/PARTIAL"
	},
	LANGUAGE_JAPANESE_FULL = {
		name = "LANGUAGE_SELECT/JAPANESE"
	},
	LANGUAGE_JAPANESE_PARTIAL = {
		baseLanguage = "LANGUAGE_SELECT/JAPANESE",
		name = "LANGUAGE_SELECT/PARTIAL"
	},
	LANGUAGE_SIMPLIFIED_CHINESE = {
		name = "LANGUAGE_SELECT/SIMPLIFIED_CHINESE"
	},
	LANGUAGE_SAFE_CHINESE = {
		name = "LANGUAGE_SELECT/SAFE_CHINESE"
	},
	LANGUAGE_TRADITIONAL_CHINESE = {
		name = "LANGUAGE_SELECT/TRADITIONAL_CHINESE"
	},
	LANGUAGE_ARABIC = {
		name = "LANGUAGE_SELECT/ARABIC"
	},
	LANGUAGE_CZECH = {
		name = "LANGUAGE_SELECT/CZECH"
	},
	LANGUAGE_SPANISHNA = {
		name = "LANGUAGE_SELECT/SPANISHNA"
	},
	LANGUAGE_PORTUGUESE = {
		name = "LANGUAGE_SELECT/PORTUGUESE"
	}
}
GenerallyLongLanguages = {
	LANGUAGE_PORTUGUESE = "LANGUAGE_PORTUGUESE",
	LANGUAGE_KOREAN_PARTIAL = "LANGUAGE_KOREAN_PARTIAL",
	LANGUAGE_RUSSIAN_FULL = "LANGUAGE_RUSSIAN_FULL",
	LANGUAGE_POLISH_PARTIAL = "LANGUAGE_POLISH_PARTIAL",
	LANGUAGE_SPANISHNA = "LANGUAGE_SPANISHNA",
	LANGUAGE_SPANISH = "LANGUAGE_SPANISH",
	LANGUAGE_KOREAN_FULL = "LANGUAGE_KOREAN_FULL",
	LANGUAGE_RUSSIAN_PARTIAL = "LANGUAGE_RUSSIAN_PARTIAL",
	LANGUAGE_FRENCH = "LANGUAGE_FRENCH",
	LANGUAGE_POLISH_FULL = "LANGUAGE_POLISH_FULL",
	LANGUAGE_GERMAN = "LANGUAGE_GERMAN",
	LANGUAGE_ITALIAN = "LANGUAGE_ITALIAN"
}
LocalizedLongNumberSeparators = {
	LANGUAGE_ENGLISH = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_ENGLISH_SAFE = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_FRENCH = {
		decimal = ",",
		thousands = " "
	},
	LANGUAGE_GERMAN = {
		decimal = ",",
		thousands = "."
	},
	LANGUAGE_ITALIAN = {
		decimal = ",",
		thousands = "."
	},
	LANGUAGE_SPANISH = {
		decimal = ",",
		thousands = " "
	},
	LANGUAGE_RUSSIAN_FULL = {
		decimal = ",",
		thousands = " "
	},
	LANGUAGE_RUSSIAN_PARTIAL = {
		decimal = ",",
		thousands = " "
	},
	LANGUAGE_POLISH_FULL = {
		decimal = ",",
		thousands = " "
	},
	LANGUAGE_POLISH_PARTIAL = {
		decimal = ",",
		thousands = " "
	},
	LANGUAGE_KOREAN_FULL = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_KOREAN_PARTIAL = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_JAPANESE_FULL = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_JAPANESE_PARTIAL = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_SIMPLIFIED_CHINESE = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_SAFE_CHINESE = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_TRADITIONAL_CHINESE = {
		decimal = ".",
		thousands = ","
	},
	LANGUAGE_ARABIC = {
		decimal = ",",
		thousands = " "
	},
	LANGUAGE_CZECH = {
		decimal = ",",
		thousands = " "
	},
	LANGUAGE_SPANISHNA = {
		decimal = ".",
		thousands = " "
	},
	LANGUAGE_PORTUGUESE = {
		decimal = ",",
		thousands = " "
	}
}
PS4Region = {
	PS4_REGION_SIEA_EN_ES = 1,
	PS4_REGION_SIEE_ES_IT = 5,
	PS4_REGION_SIEJ_JP = 9,
	PS4_REGION_SCEA_EN_FR = 0,
	PS4_REGION_SIEK_EN_KO = 10,
	PS4_REGION_SIEE_PL = 7,
	PS4_REGION_SIEA_EN_PT = 2,
	PS4_REGION_SIEE_RU = 6,
	PS4_REGION_SIEE_EN_DE = 4,
	PS4_REGION_SIEE_EN_FR = 3,
	PS4_REGION_SIEE_EN_AR = 8
}

function GetCurrentLanguage()
	local var_1_0 = Engine.DGAIDIEIAC()
	local var_1_1 = Languages[var_1_0]

	assert(var_1_1)

	return var_1_1
end

function GetLanguageDisplayName(arg_2_0)
	local var_2_0 = Languages[arg_2_0]

	assert(var_2_0)

	if LanguageInfo[var_2_0].baseLanguage then
		return Engine.CBBHFCGDIC(LanguageInfo[var_2_0].baseLanguage) .. " " .. Engine.CBBHFCGDIC(LanguageInfo[var_2_0].name)
	else
		return Engine.CBBHFCGDIC(LanguageInfo[var_2_0].name)
	end
end

function GetLanguageCode(arg_3_0)
	for iter_3_0 = 0, #Languages do
		if Languages[iter_3_0] == arg_3_0 then
			return iter_3_0
		end
	end
end

function IsLanguageEnglish()
	local var_4_0 = GetCurrentLanguage()

	return var_4_0 == "LANGUAGE_ENGLISH" or var_4_0 == "LANGUAGE_ENGLISH_SAFE"
end

function IsLanguageSpanish()
	local var_5_0 = GetCurrentLanguage()

	return var_5_0 == "LANGUAGE_SPANISH" or var_5_0 == "LANGUAGE_SPANISHNA"
end

function IsLanguagePortuguese()
	return GetCurrentLanguage() == "LANGUAGE_PORTUGUESE"
end

function IsLanguageFrench()
	return GetCurrentLanguage() == "LANGUAGE_FRENCH"
end

function IsLanguageRightToLeft(arg_8_0)
	return arg_8_0 == "LANGUAGE_ARABIC"
end

function IsLanguagePolish()
	local var_9_0 = GetCurrentLanguage()

	return var_9_0 == "LANGUAGE_POLISH_FULL" or var_9_0 == "LANGUAGE_POLISH_PARTIAL"
end

function IsLanguageJapanese()
	local var_10_0 = GetCurrentLanguage()

	return var_10_0 == "LANGUAGE_JAPANESE_FULL" or var_10_0 == "LANGUAGE_JAPANESE_PARTIAL"
end

function IsLanguageChinese()
	local var_11_0 = GetCurrentLanguage()

	return var_11_0 == "LANGUAGE_SIMPLIFIED_CHINESE" or var_11_0 == "LANGUAGE_TRADITIONAL_CHINESE" or var_11_0 == "LANGUAGE_SAFE_CHINESE"
end

function IsLanguageSimplifiedChinese()
	return GetCurrentLanguage() == "LANGUAGE_SIMPLIFIED_CHINESE"
end

function IsLanguageTraditionalChinese()
	return GetCurrentLanguage() == "LANGUAGE_TRADITIONAL_CHINESE"
end

function IsLanguageSafeChinese()
	return GetCurrentLanguage() == "LANGUAGE_SAFE_CHINESE"
end

function IsLanguageArabic()
	return GetCurrentLanguage() == "LANGUAGE_ARABIC"
end

function IsLanguageRussian()
	local var_16_0 = GetCurrentLanguage()

	return var_16_0 == "LANGUAGE_RUSSIAN_FULL" or var_16_0 == "LANGUAGE_RUSSIAN_PARTIAL"
end

function IsLanguageGerman()
	return GetCurrentLanguage() == "LANGUAGE_GERMAN"
end

function IsLanguageKorean()
	local var_18_0 = GetCurrentLanguage()

	return var_18_0 == "LANGUAGE_KOREAN_FULL" or var_18_0 == "LANGUAGE_KOREAN_PARTIAL"
end

function IsLanguageItalian()
	return GetCurrentLanguage() == "LANGUAGE_ITALIAN"
end

function IsLanguageOversizedFont()
	return IsLanguageChinese() or IsLanguageJapanese() or IsLanguageRussian()
end

function IsLanguageSubtitleOnByDefault()
	return not IsLanguageEnglish()
end

function IsLanguageNonLocalizeAudio()
	local var_22_0 = GetCurrentLanguage()

	return IsLanguageArabic() or IsLanguageChinese() or var_22_0 == "LANGUAGE_KOREAN_PARTIAL" or var_22_0 == "LANGUAGE_JAPANESE_PARTIAL"
end

function IsArabicSKU()
	local var_23_0 = GetCurrentLanguage()

	return var_23_0 == "LANGUAGE_ARABIC" or var_23_0 == "LANGUAGE_ENGLISH_SAFE"
end

function IsEuropeSKU()
	assert(Engine.CIEGIACHAE())

	if not Engine.CIEGIACHAE() then
		return false
	end

	local var_24_0 = Commerce.IFDAHCGFE()

	return var_24_0 == PS4Region.PS4_REGION_SIEE_EN_FR or var_24_0 == PS4Region.PS4_REGION_SIEE_EN_DE or var_24_0 == PS4Region.PS4_REGION_SIEE_ES_IT or var_24_0 == PS4Region.PS4_REGION_SIEE_RU or var_24_0 == PS4Region.PS4_REGION_SIEE_PL or var_24_0 == PS4Region.PS4_REGION_SIEE_EN_AR
end

function IsAmericaSKU()
	assert(Engine.CIEGIACHAE())

	if not Engine.CIEGIACHAE() then
		return false
	end

	if Engine.DCIFIBDGFI() then
		return true
	end

	local var_25_0 = Commerce.IFDAHCGFE()

	return var_25_0 == PS4Region.PS4_REGION_SCEA_EN_FR or var_25_0 == PS4Region.PS4_REGION_SIEA_EN_ES or var_25_0 == PS4Region.PS4_REGION_SIEA_EN_PT
end

function ArabicSequenceExist(arg_26_0, arg_26_1)
	return arg_26_0 and arg_26_0[tostring(arg_26_1 .. "Arabic")]
end

function GetNumberSeparatorsForCurrentLanguage()
	local var_27_0 = GetCurrentLanguage()

	if var_27_0 ~= nil and var_27_0 ~= "" then
		local var_27_1 = LocalizedLongNumberSeparators[var_27_0]

		return var_27_1.thousands, var_27_1.decimal
	end

	return nil, nil
end

function FormatLargeNumberForCurrentLanguage(arg_28_0)
	assert(tonumber(arg_28_0), "The formatted value must be a number. " .. type(arg_28_0) .. " received")

	local var_28_0, var_28_1 = GetNumberSeparatorsForCurrentLanguage()

	if var_28_0 ~= nil and var_28_1 ~= nil then
		local var_28_2, var_28_3, var_28_4 = string.match(tostring(arg_28_0):gsub("%.", var_28_1), "^([^%d]*%d)(%d*)(.-)$")

		if string.len(var_28_3) >= 4 then
			return var_28_2 .. var_28_3:reverse():gsub("(%d%d%d)", "%1" .. var_28_0):reverse() .. var_28_4
		else
			return var_28_2 .. var_28_3 .. var_28_4
		end
	end

	return tostring(arg_28_0)
end
