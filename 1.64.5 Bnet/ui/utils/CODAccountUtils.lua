CODACCOUNT = CODACCOUNT or {}
CODACCOUNT.AccountSettingsURL = "https://profile.callofduty.com/cod/announcement2FA"
CODACCOUNT.CountryCodes = {
	"US",
	"AU",
	"AT",
	"BE",
	"BR",
	"CA",
	"CZ",
	"DK",
	"FI",
	"FR",
	"DE",
	"GR",
	"HU",
	"IE",
	"IT",
	"KR",
	"MX",
	"NL",
	"NZ",
	"NO",
	"PL",
	"PT",
	"ES",
	"SE",
	"CH",
	"GB",
	"JP",
	"RU",
	"SA",
	"HK",
	"TW",
	"SG"
}
CODACCOUNT.ErrorCodes = {
	UNAUTHORIZED_ACCESS = 10,
	GENERIC_FIELD_INVALID = 6,
	PASSWORD_INVALID = 5,
	BUSY = 14,
	USERNAME_PROFANITY = 7,
	MERGE_CONFLICT = 9,
	GENERIC = 2,
	GENERIC_LOGIN = 3,
	NO_RENAME_TOKEN = 11,
	CANCELLED = 1,
	GUEST_ACCOUNT = 13,
	EMAIL_EXISTS = 8,
	MARKETPLACE_ERROR = 12,
	TOKEN_TIMED_OUT = 17,
	USERNAME_INVALID = 4,
	NEEDS_OTP = 15,
	OTP_THROTTLED = 16
}
CODACCOUNT.ErrorStrings = {
	[CODACCOUNT.ErrorCodes.CANCELLED] = "CODACCOUNT/CREATION_CANCELLED",
	[CODACCOUNT.ErrorCodes.GENERIC] = "CODACCOUNT/CODA_ERROR_GENERIC",
	[CODACCOUNT.ErrorCodes.GENERIC_LOGIN] = "CODACCOUNT/CODA_ERROR_GENERIC",
	[CODACCOUNT.ErrorCodes.USERNAME_INVALID] = "CODACCOUNT/USERNAME_INVALID",
	[CODACCOUNT.ErrorCodes.PASSWORD_INVALID] = "CODACCOUNT/PASSWORD_INVALID",
	[CODACCOUNT.ErrorCodes.GENERIC_FIELD_INVALID] = "CODACCOUNT/GENERIC_FIELD_INVALID",
	[CODACCOUNT.ErrorCodes.USERNAME_PROFANITY] = "CODACCOUNT/USERNAME_PROFANITY",
	[CODACCOUNT.ErrorCodes.EMAIL_EXISTS] = "CODACCOUNT/EMAIL_EXISTS",
	[CODACCOUNT.ErrorCodes.MERGE_CONFLICT] = "CODACCOUNT/MERGE_CONFLICT",
	[CODACCOUNT.ErrorCodes.UNAUTHORIZED_ACCESS] = "CODACCOUNT/UNAUTHORIZED_ACCESS",
	[CODACCOUNT.ErrorCodes.NO_RENAME_TOKEN] = "CODACCOUNT/NO_RENAME_TOKEN",
	[CODACCOUNT.ErrorCodes.MARKETPLACE_ERROR] = "CODACCOUNT/MARKETPLACE_ERROR",
	[CODACCOUNT.ErrorCodes.GUEST_ACCOUNT] = "CODACCOUNT/GUEST_ACCOUNT",
	[CODACCOUNT.ErrorCodes.BUSY] = "CODACCOUNT/BUSY"
}

function CODACCOUNT.GetCountryLabels()
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(CODACCOUNT.CountryCodes) do
		table.insert(var_1_0, Engine.CBBHFCGDIC("CODACCOUNT/CODA_COUNTRY_" .. iter_1_1))
	end

	return var_1_0
end

function CODACCOUNT.GetCountryCodeIndex(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(CODACCOUNT.CountryCodes) do
		if iter_2_1 == arg_2_0 then
			return iter_2_0
		end
	end

	return nil
end

function CODACCOUNT.IsEnabled()
	return Dvar.IBEGCHEFE("MNMLRKRSSL") == true
end

function CODACCOUNT.ForceAnonymousAccount()
	return Engine.ECAJCAJJGF()
end

function CODACCOUNT.AccountRegistrationEnabled()
	return CODACCOUNT.IsEnabled() and not CODACCOUNT.ForceAnonymousAccount()
end

function CODACCOUNT.GetErrorString(arg_6_0)
	return CODACCOUNT.ErrorStrings[arg_6_0]
end

function CODACCOUNT.FilterDisplayName(arg_7_0)
	if arg_7_0 and #arg_7_0 > 0 then
		return split(arg_7_0, "#")[1]
	else
		return ""
	end
end
