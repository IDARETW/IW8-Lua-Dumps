function LocalizeString(arg_1_0)
	return Engine.CBBHFCGDIC(arg_1_0)
end

function LocalizeLongString(arg_2_0)
	return Engine.DDFHCEDJEA(arg_2_0)
end

function LocalizeIntoString(arg_3_0, arg_3_1)
	return Engine.CBBHFCGDIC(arg_3_1, arg_3_0)
end

function ToString(arg_4_0)
	return tostring(arg_4_0)
end

function StripColorMarkers(arg_5_0)
	return arg_5_0:gsub("%^.", "")
end

function StripFromPattern(arg_6_0, arg_6_1)
	return arg_6_0:gsub(arg_6_1, "")
end

function MarkLocalized(arg_7_0)
	return Engine.JCBDICCAH(arg_7_0)
end

function AddPercentSymbol(arg_8_0)
	return arg_8_0 .. "%"
end

function Add(arg_9_0, arg_9_1)
	return arg_9_0 + arg_9_1
end

function Subtract(arg_10_0, arg_10_1)
	return arg_10_0 - arg_10_1
end

function Divide(arg_11_0, arg_11_1)
	assert(arg_11_1 ~= 0)

	return arg_11_0 / arg_11_1
end

function Multiply(arg_12_0, arg_12_1)
	return arg_12_0 * arg_12_1
end

function Clamp(arg_13_0, arg_13_1, arg_13_2)
	return LUI.clamp(arg_13_0, arg_13_1, arg_13_2)
end

function Mirror(arg_14_0, arg_14_1, arg_14_2)
	return arg_14_1 + (arg_14_2 - arg_14_0)
end

function MapValueToNewDomain(arg_15_0, arg_15_1, arg_15_2)
	return (arg_15_0 - arg_15_1.min) * ((arg_15_2.max - arg_15_2.min) / (arg_15_1.max - arg_15_1.min)) + arg_15_2.min
end

function MillisecondsToCountdownString(arg_16_0)
	return Engine.BFBIAHJJFA(tonumber(arg_16_0))
end

function ToUpperCase(arg_17_0)
	return Engine.CBEAHDFCFC(arg_17_0)
end

function Not(arg_18_0)
	return not arg_18_0
end

function Lerp(arg_19_0, arg_19_1, arg_19_2)
	return LUI.Lerp(arg_19_1, arg_19_2, arg_19_0)
end

function GetWeaponUnlockText(arg_20_0)
	if Engine.EAIICIFIFA() then
		return Cac.GetUnlockText(CSV.zomWeaponUnlockTable, arg_20_0)
	end

	return Cac.GetUnlockText(CSV.weaponUnlockTable, arg_20_0)
end

function GetDeckSlotUnlockText(arg_21_0)
	return Cac.GetUnlockText(CSV.fateDeckSizeUnlockTable, arg_21_0)
end

function GetCardUnlockText(arg_22_0)
	return Cac.GetUnlockText(CSV.cardUnlockTable, arg_22_0)
end

function GetStreakUnlockText(arg_23_0)
	return Cac.GetUnlockText(CSV.streakUnlockTable, arg_23_0)
end

function GetPick10UnlockText(arg_24_0)
	return Cac.GetUnlockText(CSV.pick10UnlockTable, arg_24_0)
end

function GetLoadoutUnlockText(arg_25_0)
	return Cac.GetUnlockText(CSV.loadoutUnlockTable, "loadoutslot" .. arg_25_0)
end

function GetChallengeUnlockText(arg_26_0)
	return Cac.GetUnlockText(CSV.challengeUnlockTable, arg_26_0)
end

function SubtractForSplitscreen(arg_27_0, arg_27_1)
	return CONDITIONS.IsSplitscreen() and arg_27_0 - arg_27_1 or arg_27_0
end

function MultiplyIfSplitscreen(arg_28_0, arg_28_1)
	return CONDITIONS.IsSplitscreen() and arg_28_0 * arg_28_1 or arg_28_0
end
