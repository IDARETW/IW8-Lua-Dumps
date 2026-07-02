REGISTRATION = REGISTRATION or {}
REGISTRATION.UserNameRulesConstants = {
	MAX_LENGTH = 65,
	MAX_GLYPHS_WITH_NUMBER = 24,
	MIN_LENGTH = 2,
	MAX_GLYPHS = 16,
	GLYPH_BYTE_LIMIT = 3,
	MIN_GLYPHS = 2
}
REGISTRATION.EmailRulesConstants = {
	MAX_LENGTH = 255,
	MIN_LENGTH = 5,
	REQUIRED_SYMBOLS = {
		"@",
		"."
	}
}
REGISTRATION.PasswordRulesConstants = {
	MAX_SEQUENTIAL_GLYPHS = 2,
	MIN_LENGTH = 8,
	MAX_GLYPHS = 20,
	MAX_LENGTH = 80,
	MIN_GLYPHS = 8,
	MAX_CONSECUTIVE_GLYPHS = 2
}
REGISTRATION.OTPPasswordMaxValue = 999999
REGISTRATION.UserNameRuleIDs = {
	UTF8_SINGLE_GLYPH_BYTE_LIMIT = 3,
	UTF8_GLYPH_LIMIT = 4,
	ILLEGAL_CHARACTER = 2,
	LENGTH = 1
}
REGISTRATION.UserNameRules = {
	[REGISTRATION.UserNameRuleIDs.LENGTH] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/USERNAME_REQ_LENGTH", REGISTRATION.UserNameRulesConstants.MIN_GLYPHS, REGISTRATION.UserNameRulesConstants.MAX_GLYPHS)
		end
	},
	[REGISTRATION.UserNameRuleIDs.ILLEGAL_CHARACTER] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/USERNAME_REQ_SINGLE_GLYPH_LIMIT")
		end
	},
	[REGISTRATION.UserNameRuleIDs.UTF8_SINGLE_GLYPH_BYTE_LIMIT] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/USERNAME_REQ_SINGLE_GLYPH_LIMIT")
		end
	},
	[REGISTRATION.UserNameRuleIDs.UTF8_GLYPH_LIMIT] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/USERNAME_REQ_LENGTH", REGISTRATION.UserNameRulesConstants.MIN_GLYPHS, REGISTRATION.UserNameRulesConstants.MAX_GLYPHS)
		end
	}
}
REGISTRATION.EmailRuleIDs = {
	MUST_CONTAIN_SYMBOLS = 2,
	LENGTH = 1
}
REGISTRATION.EmailRules = {
	[REGISTRATION.EmailRuleIDs.LENGTH] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/EMAIL_REQ_LENGTH", REGISTRATION.EmailRulesConstants.MIN_LENGTH, REGISTRATION.EmailRulesConstants.MAX_LENGTH)
		end
	},
	[REGISTRATION.EmailRuleIDs.MUST_CONTAIN_SYMBOLS] = {
		isPassing = false,
		GetLocalizedString = function()
			local var_6_0 = ""

			for iter_6_0, iter_6_1 in ipairs(REGISTRATION.EmailRulesConstants.REQUIRED_SYMBOLS) do
				var_6_0 = var_6_0 .. iter_6_1
			end

			return Engine.CBBHFCGDIC("CODACCOUNT/EMAIL_REQ_SYMBOLS", Engine.JCBDICCAH(var_6_0))
		end
	}
}
REGISTRATION.PasswordRuleIDs = {
	CHAR_NUMBER = 2,
	SEQUENTIAL = 3,
	CONSECUTIVE = 4,
	LENGTH = 1
}
REGISTRATION.PasswordRules = {
	[REGISTRATION.PasswordRuleIDs.LENGTH] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD_REQ_LENGTH", REGISTRATION.PasswordRulesConstants.MIN_GLYPHS, REGISTRATION.PasswordRulesConstants.MAX_GLYPHS)
		end
	},
	[REGISTRATION.PasswordRuleIDs.CHAR_NUMBER] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD_REQ_CHAR_NUMBER")
		end
	},
	[REGISTRATION.PasswordRuleIDs.SEQUENTIAL] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD_REQ_SEQUENTIAL")
		end
	},
	[REGISTRATION.PasswordRuleIDs.CONSECUTIVE] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD_REQ_CONSECUTIVE")
		end
	}
}
REGISTRATION.PasswordRulesLogin = {
	[REGISTRATION.PasswordRuleIDs.LENGTH] = {
		isPassing = false,
		GetLocalizedString = function()
			return Engine.CBBHFCGDIC("CODACCOUNT/PASSWORD_REQ_LENGTH", REGISTRATION.PasswordRulesConstants.MIN_GLYPHS, REGISTRATION.PasswordRulesConstants.MAX_GLYPHS)
		end
	}
}

function REGISTRATION.IsASCIIByte(arg_12_0)
	return not Engine.CHJJIAHHGE(arg_12_0, 7)
end

function REGISTRATION.IsUTF8StartByte(arg_13_0)
	return Engine.CHJJIAHHGE(arg_13_0, 7) and Engine.CHJJIAHHGE(arg_13_0, 6)
end

function REGISTRATION.CountUTF8Glyphs(arg_14_0)
	local var_14_0 = 0

	for iter_14_0 = 1, #arg_14_0 do
		local var_14_1 = arg_14_0:byte(iter_14_0)

		if REGISTRATION.IsASCIIByte(var_14_1) or REGISTRATION.IsUTF8StartByte(var_14_1) then
			var_14_0 = var_14_0 + 1
		end
	end

	return var_14_0
end

function REGISTRATION.CheckInvalidUTF8GlyphLength(arg_15_0)
	local var_15_0 = false

	for iter_15_0 = 1, #arg_15_0 do
		local var_15_1 = arg_15_0:byte(iter_15_0)

		if REGISTRATION.IsUTF8StartByte(var_15_1) then
			local var_15_2 = false

			for iter_15_1 = iter_15_0 + 1, iter_15_0 + REGISTRATION.UserNameRulesConstants.GLYPH_BYTE_LIMIT do
				local var_15_3 = arg_15_0:byte(iter_15_1)

				if iter_15_1 > #arg_15_0 or var_15_3 == 0 or REGISTRATION.IsASCIIByte(var_15_3) or REGISTRATION.IsUTF8StartByte(var_15_3) then
					var_15_2 = true

					break
				end
			end

			if not var_15_2 then
				var_15_0 = true

				break
			end
		end
	end

	return var_15_0
end

function REGISTRATION.CheckRulesOnUserName(arg_16_0, arg_16_1)
	local var_16_0 = #arg_16_0
	local var_16_1 = var_16_0 >= REGISTRATION.UserNameRulesConstants.MIN_LENGTH and var_16_0 < REGISTRATION.UserNameRulesConstants.MAX_LENGTH

	REGISTRATION.UserNameRules[REGISTRATION.UserNameRuleIDs.LENGTH].isPassing = var_16_1
	arg_16_1 = arg_16_1 or false

	local var_16_2 = AccountRegistration.DFDBHJBGBI(arg_16_0, arg_16_1)

	REGISTRATION.UserNameRules[REGISTRATION.UserNameRuleIDs.ILLEGAL_CHARACTER].isPassing = var_16_2.legal
	REGISTRATION.UserNameRules[REGISTRATION.UserNameRuleIDs.UTF8_SINGLE_GLYPH_BYTE_LIMIT].isPassing = not REGISTRATION.CheckInvalidUTF8GlyphLength(arg_16_0)

	local var_16_3 = REGISTRATION.CountUTF8Glyphs(arg_16_0)
	local var_16_4 = var_16_3 >= REGISTRATION.UserNameRulesConstants.MIN_GLYPHS and var_16_3 <= (arg_16_1 and REGISTRATION.UserNameRulesConstants.MAX_GLYPHS_WITH_NUMBER or REGISTRATION.UserNameRulesConstants.MAX_GLYPHS)

	REGISTRATION.UserNameRules[REGISTRATION.UserNameRuleIDs.UTF8_GLYPH_LIMIT].isPassing = var_16_4
end

function REGISTRATION.CheckRulesOnEmail(arg_17_0)
	local var_17_0 = #arg_17_0
	local var_17_1 = var_17_0 >= REGISTRATION.EmailRulesConstants.MIN_LENGTH and var_17_0 < REGISTRATION.EmailRulesConstants.MAX_LENGTH

	REGISTRATION.EmailRules[REGISTRATION.EmailRuleIDs.LENGTH].isPassing = var_17_1

	local var_17_2 = {}

	for iter_17_0 = 1, var_17_0 do
		local var_17_3 = arg_17_0:byte(iter_17_0)

		for iter_17_1 = 1, #REGISTRATION.EmailRulesConstants.REQUIRED_SYMBOLS do
			if var_17_3 == string.byte(REGISTRATION.EmailRulesConstants.REQUIRED_SYMBOLS[iter_17_1]) then
				var_17_2[iter_17_1] = true
			end
		end
	end

	local var_17_4 = #var_17_2 == #REGISTRATION.EmailRulesConstants.REQUIRED_SYMBOLS

	REGISTRATION.EmailRules[REGISTRATION.EmailRuleIDs.MUST_CONTAIN_SYMBOLS].isPassing = var_17_4
end

function REGISTRATION.CheckRulesOnPassword(arg_18_0)
	local var_18_0 = REGISTRATION.CountUTF8Glyphs(arg_18_0)
	local var_18_1 = var_18_0 >= REGISTRATION.PasswordRulesConstants.MIN_GLYPHS and var_18_0 <= REGISTRATION.PasswordRulesConstants.MAX_GLYPHS

	REGISTRATION.PasswordRules[REGISTRATION.PasswordRuleIDs.LENGTH].isPassing = var_18_1

	local var_18_2 = 0

	for iter_18_0 = 1, #arg_18_0 do
		local var_18_3 = arg_18_0:byte(iter_18_0)

		if REGISTRATION.IsASCIIByte(var_18_3) and var_18_3 >= string.byte("0") and var_18_3 <= string.byte("9") then
			var_18_2 = var_18_2 + 1
		end
	end

	REGISTRATION.PasswordRules[REGISTRATION.PasswordRuleIDs.CHAR_NUMBER].isPassing = var_18_2 > 0 and var_18_2 < var_18_0

	local var_18_4 = -1
	local var_18_5 = {}

	for iter_18_1 = 1, #arg_18_0 do
		local var_18_6 = arg_18_0:byte(iter_18_1)

		if REGISTRATION.IsASCIIByte(var_18_6) then
			table.insert(var_18_5, var_18_6)

			var_18_4 = -1
		elseif REGISTRATION.IsUTF8StartByte(var_18_6) then
			if var_18_4 ~= -1 then
				table.insert(var_18_5, var_18_4)
			end

			var_18_4 = var_18_6
		else
			var_18_4 = var_18_4 + var_18_6

			if iter_18_1 == #arg_18_0 then
				table.insert(var_18_5, var_18_4)
			end
		end
	end

	local var_18_7 = 0
	local var_18_8 = 0
	local var_18_9 = {
		Forward = 1,
		Reverse = -1,
		None = 0
	}
	local var_18_10 = var_18_9.None
	local var_18_11 = 0
	local var_18_12 = 0
	local var_18_13 = 0

	for iter_18_2, iter_18_3 in ipairs(var_18_5) do
		if var_18_13 == iter_18_3 + 1 then
			if var_18_10 <= var_18_9.None then
				var_18_7 = var_18_7 + 1
			end

			var_18_10 = var_18_9.Reverse
		elseif var_18_13 == iter_18_3 - 1 then
			if var_18_10 >= var_18_9.None then
				var_18_7 = var_18_7 + 1
			end

			var_18_10 = var_18_9.Forward
		else
			var_18_7 = 0
			var_18_10 = var_18_9.None
		end

		if var_18_13 == iter_18_3 then
			var_18_11 = var_18_11 + 1
		else
			var_18_11 = 0
		end

		var_18_8 = math.max(var_18_8, var_18_7)
		var_18_12 = math.max(var_18_12, var_18_11)
		var_18_13 = iter_18_3
	end

	REGISTRATION.PasswordRules[REGISTRATION.PasswordRuleIDs.SEQUENTIAL].isPassing = var_18_8 < REGISTRATION.PasswordRulesConstants.MAX_SEQUENTIAL_GLYPHS
	REGISTRATION.PasswordRules[REGISTRATION.PasswordRuleIDs.CONSECUTIVE].isPassing = var_18_12 < REGISTRATION.PasswordRulesConstants.MAX_CONSECUTIVE_GLYPHS
end

function REGISTRATION.CheckRulesOnPasswordLogin(arg_19_0)
	local var_19_0 = REGISTRATION.CountUTF8Glyphs(arg_19_0)
	local var_19_1 = var_19_0 >= REGISTRATION.PasswordRulesConstants.MIN_GLYPHS and var_19_0 <= REGISTRATION.PasswordRulesConstants.MAX_GLYPHS

	REGISTRATION.PasswordRulesLogin[REGISTRATION.PasswordRuleIDs.LENGTH].isPassing = var_19_1
end

function REGISTRATION.CheckIsPassing(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0) do
		if not iter_20_1.isPassing then
			return false, iter_20_1.GetLocalizedString()
		end
	end

	return true
end

function REGISTRATION.UpdateUserName(arg_21_0, arg_21_1)
	REGISTRATION.CheckRulesOnUserName(arg_21_0, arg_21_1)
end

function REGISTRATION.UpdateEmail(arg_22_0)
	REGISTRATION.CheckRulesOnEmail(arg_22_0)
end

function REGISTRATION.UpdatePassword(arg_23_0)
	REGISTRATION.CheckRulesOnPassword(arg_23_0)
end

function REGISTRATION.UpdatePasswordLogin(arg_24_0)
	REGISTRATION.CheckRulesOnPasswordLogin(arg_24_0)
end
