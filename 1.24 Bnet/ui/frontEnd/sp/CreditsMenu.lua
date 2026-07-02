module(..., package.seeall)

CreditsType = {
	blank = "blank",
	string = "string"
}
CreditsType.Properties = {
	image = {
		defaultWidth = 256,
		fadeWaitTime = 5000,
		defaultIntervalTime = 6000,
		defaultHeight = 256
	},
	logo = {
		defaultWidth = 256,
		fadeWaitTime = 5000,
		defaultIntervalTime = 6000,
		defaultHeight = 256
	},
	logotext = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 72,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainBold.File),
		style = CoD.TextStyle.Shadowed
	},
	string = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed
	},
	single = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed
	},
	center = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed
	},
	leftname = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed
	},
	leftname_thread = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed
	},
	rightname = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed
	},
	rightname_thread = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed
	},
	castleft = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed,
		alignment = LUI.Alignment.Right
	},
	castright = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 24,
		defaultWidth = 0,
		font = FONTS.GetFont(FONTS.MainRegular.File),
		style = CoD.TextStyle.Shadowed,
		alignment = LUI.Alignment.Left
	},
	dept = {
		defaultIntervalTime = 600,
		fadeWaitTime = 5000,
		lineSpacing = 90,
		defaultHeight = 42,
		defaultWidth = 800,
		font = FONTS.GetFont(FONTS.MainBold.File),
		style = CoD.TextStyle.Shadowed
	},
	blank = {
		defaultIntervalTime = 500
	}
}

local var_0_0 = {
	logo_hms_2019 = "image_logo_hms",
	logo_beenox_2019 = "image_beenox_2019",
	logo_demonware_2019 = "image_logo_demonware_2019",
	logo_atvi_2019 = "image_logo_atvi_2019",
	logo_dolby_2019 = "image_dolby_2019",
	logo_iw_2019 = "image_logo_iw",
	logo_raven_2019 = "image_logo_raven_2019",
	logo_shg_2019 = "image_shg_2019",
	logo_havok_2019 = "image_havok_2019"
}

local function var_0_1(arg_1_0)
	arg_1_0.skipTo = ""
	arg_1_0.startPosY = 0
	arg_1_0.offScreenPosition = 980
	arg_1_0.timeToReachOffscreenPosition = 7000
	arg_1_0.glitchTime = 200
	arg_1_0.fadeInTime = 1000
	arg_1_0.fadeOutTime = 1000
	arg_1_0.glitchThreshhold = 0.8
	arg_1_0.glitchRandMinWait = 1000
	arg_1_0.glitchRandMaxWait = 10000
	arg_1_0.revertGlitchRandMinWait = 100
	arg_1_0.revertGlitchRandMaxWait = 300
	arg_1_0.returnToFrontEndWaitTime = 15000
	arg_1_0.returningToMainMenu = false
	arg_1_0.csvRows = {}
	arg_1_0.csvRowIndex = 0
	arg_1_0.csvNextProcessTime = 0
	arg_1_0.printNamesList = false
	arg_1_0.namesList = {}
	arg_1_0.namesListColumnSize = 1
	arg_1_0.time = 0
	arg_1_0.lastElement = nil
	arg_1_0.columnSize = 1
	arg_1_0.columnSpacing = 180
	arg_1_0.superWide = false
	arg_1_0.lastRowType = ""
	arg_1_0.uniqueID = 0
	arg_1_0.lineWaitTime = 150
	arg_1_0.ignoreLastElementMove = false

	local var_1_0 = LUI.UIImage.new()

	var_1_0:SetRGBFromTable({
		g = 0,
		b = 0,
		r = 0
	})
	var_1_0:SetAlpha(1, 0)
	arg_1_0:addElement(var_1_0)
	ACTIONS.ScaleFullscreen(var_1_0)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_3 = arg_2_3 or {}
	arg_2_0.uniqueID = arg_2_0.uniqueID + 1

	local var_2_0 = LUI.UIImage.new()

	var_2_0.id = "image " .. tostring(arg_2_0.uniqueID)
	arg_2_1 = tostring(arg_2_1)

	var_2_0:setImage(RegisterMaterial(arg_2_1), 0)
	var_2_0:SetAnchorsAndPosition(0.5, 0.5, 1, 0, arg_2_2.left, arg_2_2.right, arg_2_2.top, arg_2_2.bottom)
	var_2_0:SetAlpha(0, 0)
	var_2_0:SetAlpha(1, arg_2_0.fadeInTime)

	return var_2_0
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_3 = arg_3_3 or {}
	arg_3_3.style = arg_3_3.style or CoD.TextStyle.Shadowed
	arg_3_3.font = arg_3_3.font or FONTS.GetFont(FONTS.MainRegular.File)

	local var_3_0 = arg_3_3.alignment ~= nil and arg_3_3.alignment or LUI.Alignment.Center

	arg_3_0.uniqueID = arg_3_0.uniqueID + 1

	local var_3_1 = LUI.UIText.new()

	var_3_1.id = "TextElement " .. tostring(arg_3_0.uniqueID)

	var_3_1:SetAlignment(var_3_0)
	var_3_1:SetWordWrap(false)
	var_3_1:setText(arg_3_1, 0)
	var_3_1:setTextStyle(arg_3_3.style)
	var_3_1:SetFont(arg_3_3.font)
	var_3_1:SetRGBFromTable({
		g = 1,
		b = 1,
		r = 1
	})
	var_3_1:SetAnchorsAndPosition(0.5, 0.5, 1, 0, arg_3_2.left, arg_3_2.right, arg_3_2.top, arg_3_2.bottom)
	var_3_1:SetAlpha(0, 0)
	var_3_1:SetAlpha(1, arg_3_0.fadeInTime)

	return var_3_1
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = arg_4_1:SetTop(-arg_4_0.offScreenPosition, arg_4_0.timeToReachOffscreenPosition)

	arg_4_1:SetBottom(-arg_4_0.offScreenPosition + arg_4_3.bottom, arg_4_0.timeToReachOffscreenPosition)

	function var_4_0.onComplete()
		arg_4_1:closeTree()
	end

	arg_4_1:Wait(CreditsType.Properties[arg_4_2].fadeWaitTime).onComplete = function()
		arg_4_1:SetAlpha(0, arg_4_0.fadeOutTime)
	end
end

local function var_0_5(arg_7_0)
	if Engine.DDJFBBJAIG() or arg_7_0._openedFromCredits then
		LUI.FlowManager.RequestLeaveMenu(arg_7_0)
	else
		Dvar.DHEGHJJJHI("NMMPTOSMKQ", true)
		Engine.EBIDFIDHIE("disconnect")
	end
end

local function var_0_6(arg_8_0)
	arg_8_0.namesList = {}
	arg_8_0.namesListColumnSize = 1
end

local function var_0_7(arg_9_0, arg_9_1)
	return string.sub(arg_9_0, 1, string.len(arg_9_1)) == arg_9_1
end

local function var_0_8(arg_10_0)
	return var_0_0[arg_10_0]
end

local function var_0_9(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = {}
	local var_11_1 = CreditsType.Properties[arg_11_2]

	if not var_11_1.alignment then
		local var_11_2 = -1
	end

	local var_11_3 = false

	if var_0_7(arg_11_1, "CREDITS/") then
		var_11_3 = true
		arg_11_1 = Engine.CBBHFCGDIC(arg_11_1)
	end

	local var_11_4
	local var_11_5
	local var_11_7

	if var_11_3 ~= true and (arg_11_2 == "logo" or arg_11_2 == "image") then
		local var_11_6 = var_0_8(arg_11_1)

		var_11_4 = arg_11_0:CreateImage(var_11_6, arg_11_3)
		var_11_7 = "logo"
	else
		var_11_4 = arg_11_0:CreateText(arg_11_1, arg_11_3, var_11_1)
		var_11_7 = "string"
	end

	arg_11_0:ApplyTweens(var_11_4, var_11_7, arg_11_3)
	arg_11_0:addElement(var_11_4)

	arg_11_0.lastElement = var_11_4
end

local function var_0_10(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = {
		top = arg_12_0.startPosY
	}

	if arg_12_1 == "castright" or arg_12_1 == "castleft" then
		arg_12_2 = 0
		arg_12_3 = 0
	else
		local var_12_1 = 2

		arg_12_2 = arg_12_2 ~= "" and arg_12_2 * (var_12_1 * 0.5) or 0
		arg_12_3 = arg_12_3 ~= "" and arg_12_3 * var_12_1 or 0
	end

	var_12_0.left = arg_12_2 ~= 0 and -arg_12_2 or -CreditsType.Properties[arg_12_1].defaultWidth
	var_12_0.right = arg_12_2 ~= 0 and arg_12_2 or CreditsType.Properties[arg_12_1].defaultWidth
	var_12_0.bottom = var_12_0.top + (arg_12_3 ~= 0 and arg_12_3 or CreditsType.Properties[arg_12_1].defaultHeight)

	return var_12_0
end

local function var_0_11(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = {}

	if arg_13_2 == "cast" then
		local var_13_1 = var_0_10(arg_13_0, "castright")

		var_13_1.left = var_13_1.left + 10
		var_13_1.right = var_13_1.right + 10

		var_0_9(arg_13_0, arg_13_1.ref, "castright", var_13_1)

		local var_13_2 = {}
		local var_13_3 = var_0_10(arg_13_0, "castleft")

		var_13_3.left = var_13_3.left - 10
		var_13_3.right = var_13_3.right - 10

		var_0_9(arg_13_0, arg_13_1.extra, "castleft", var_13_3)

		return
	end

	local var_13_4 = var_0_10(arg_13_0, arg_13_1.type, arg_13_1.width, arg_13_1.height)
	local var_13_5 = 0

	if arg_13_0.superWide then
		var_13_5 = 50
	end

	if arg_13_1.ref == "logo_havok_2019" or arg_13_2 == "leftname_thread" or arg_13_2 == "leftname" or arg_13_2 == "left" then
		var_13_4.left = var_13_4.left - arg_13_0.columnSpacing - var_13_5
		var_13_4.right = var_13_4.right - arg_13_0.columnSpacing - var_13_5
	elseif arg_13_1.ref == "logo_dolby_2019" or arg_13_2 == "rightname_thread" or arg_13_2 == "rightname" or arg_13_2 == "right" then
		var_13_4.left = var_13_4.left + arg_13_0.columnSpacing + var_13_5
		var_13_4.right = var_13_4.right + arg_13_0.columnSpacing + var_13_5
	elseif arg_13_2 == "left_wide" then
		var_13_4.left = var_13_4.left - math.floor(arg_13_0.columnSpacing * 2)
		var_13_4.right = var_13_4.right - math.floor(arg_13_0.columnSpacing * 2)
	elseif arg_13_2 == "right_wide" then
		var_13_4.left = var_13_4.left + math.floor(arg_13_0.columnSpacing * 2)
		var_13_4.right = var_13_4.right + math.floor(arg_13_0.columnSpacing * 2)
	end

	var_0_9(arg_13_0, arg_13_1.ref, arg_13_1.type, var_13_4)
end

local function var_0_12(arg_14_0)
	return
end

local function var_0_13(arg_15_0)
	arg_15_0.time = arg_15_0.time + arg_15_0.creditsNextTimer.interval

	local var_15_0
	local var_15_1
	local var_15_2

	if arg_15_0.time < arg_15_0.csvNextProcessTime then
		return
	end

	if arg_15_0.returningToMainMenu then
		var_0_5()
	end

	if table.getn(arg_15_0.namesList) > 0 then
		for iter_15_0 = 0, arg_15_0.columnSize - 1 do
			if table.getn(arg_15_0.namesList) == 0 then
				break
			end

			if arg_15_0.columnSize == 3 then
				if iter_15_0 % 3 == 2 then
					arg_15_0:CreditLine(arg_15_0.namesList[1], "right_wide")
				elseif iter_15_0 % 3 == 1 then
					arg_15_0:CreditLine(arg_15_0.namesList[1], "center")
				elseif table.getn(arg_15_0.namesList) == 1 then
					arg_15_0:CreditLine(arg_15_0.namesList[1], "center")
				else
					arg_15_0:CreditLine(arg_15_0.namesList[1], "left_wide")
				end
			elseif arg_15_0.columnSize == 2 then
				if iter_15_0 % 2 == 1 then
					arg_15_0:CreditLine(arg_15_0.namesList[1], "right")
				else
					arg_15_0:CreditLine(arg_15_0.namesList[1], "left")
				end
			else
				arg_15_0:CreditLine(arg_15_0.namesList[1], "center")
			end

			table.remove(arg_15_0.namesList, 1)
		end

		if table.getn(arg_15_0.namesList) == 0 then
			arg_15_0.csvNextProcessTime = arg_15_0.time + arg_15_0.lineWaitTime + 500

			arg_15_0:ResetNamesList()
		else
			arg_15_0.csvNextProcessTime = arg_15_0.time + arg_15_0.lineWaitTime
		end

		return
	end

	arg_15_0.csvRowIndex = arg_15_0.csvRowIndex + 1

	local var_15_3 = {}
	local var_15_4 = arg_15_0.csvRows[arg_15_0.csvRowIndex]

	if var_15_4 == nil then
		arg_15_0.returningToMainMenu = true
		arg_15_0.csvNextProcessTime = arg_15_0.time + 7500

		return
	end

	if var_15_4.ref == "superwide" or var_15_4.ref == "superwide_stop" then
		arg_15_0.superWide = var_15_4.ref == "superwide"
		arg_15_0.csvRowIndex = arg_15_0.csvRowIndex + 1
		var_15_4 = arg_15_0.csvRows[arg_15_0.csvRowIndex]
	end

	arg_15_0.lastRowType = var_15_4.type

	if var_15_4.ref == "BLANK" then
		arg_15_0.csvNextProcessTime = arg_15_0.time + arg_15_0.lineWaitTime
		arg_15_0.skipTillBlank = False
	elseif var_15_4.ref == "BLANKLONG" then
		arg_15_0.csvNextProcessTime = arg_15_0.time + 3000 + arg_15_0.lineWaitTime
		arg_15_0.skipTillBlank = False
	else
		while var_15_4.type == "string" do
			local var_15_5 = 0

			table.insert(var_15_3, var_15_4)

			arg_15_0.csvRowIndex = arg_15_0.csvRowIndex + 1
			var_15_4 = arg_15_0.csvRows[arg_15_0.csvRowIndex]
		end

		if not arg_15_0.skipTillBlank and table.getn(var_15_3) > 0 then
			arg_15_0.csvRowIndex = arg_15_0.csvRowIndex - 1

			if table.getn(var_15_3) > 40 then
				arg_15_0.columnSize = 3
			elseif table.getn(var_15_3) > 4 then
				arg_15_0.columnSize = 2
			else
				arg_15_0.columnSize = 1
			end

			arg_15_0.namesList = var_15_3

			local var_15_6 = {}

			return
		end

		if Engine.HDGDBCJFG() and not arg_15_0.skipTillBlank and (var_15_4.ref == "NVIDIA" or var_15_4.ref == "INTEL" or var_15_4.ref == "AMD") then
			arg_15_0.skipTillBlank = true
		end

		if not arg_15_0.skipTillBlank then
			if var_15_4.ref == "logo_havok_2019" then
				arg_15_0:CreditLine(var_15_4, "logo")

				arg_15_0.csvRowIndex = arg_15_0.csvRowIndex + 1
				var_15_4 = arg_15_0.csvRows[arg_15_0.csvRowIndex]

				arg_15_0:CreditLine(var_15_4, "logo")

				arg_15_0.csvNextProcessTime = arg_15_0.time + arg_15_0.lineWaitTime + 700
			elseif var_15_4.type == "logo" then
				arg_15_0:CreditLine(var_15_4, var_15_4.type)

				arg_15_0.csvNextProcessTime = arg_15_0.time + 1000
			elseif var_15_4.type == "logotext" then
				arg_15_0:CreditLine(var_15_4, var_15_4.type)

				arg_15_0.csvNextProcessTime = arg_15_0.time + 800
			elseif var_15_4.type == "cast" then
				arg_15_0:CreditLine(var_15_4, "cast")

				if arg_15_0.csvRows[arg_15_0.csvRowIndex + 1].type ~= "cast" then
					arg_15_0.csvNextProcessTime = arg_15_0.time + 400
				else
					arg_15_0.csvNextProcessTime = arg_15_0.time + arg_15_0.lineWaitTime
				end
			else
				arg_15_0:CreditLine(var_15_4, var_15_4.type)

				if var_15_4.type == "leftname_thread" then
					arg_15_0.csvRowIndex = arg_15_0.csvRowIndex + 1
					var_15_4 = arg_15_0.csvRows[arg_15_0.csvRowIndex]

					if var_15_4.ref == "BLANK" then
						arg_15_0.csvNextProcessTime = arg_15_0.time + arg_15_0.lineWaitTime
					else
						arg_15_0:CreditLine(var_15_4, var_15_4.type)
					end
				end

				if var_15_4.type == "dept" then
					arg_15_0.csvNextProcessTime = arg_15_0.time + arg_15_0.lineWaitTime + 200
				else
					arg_15_0.csvNextProcessTime = arg_15_0.time + arg_15_0.lineWaitTime
				end
			end
		end
	end
end

local function var_0_14(arg_16_0)
	local var_16_0 = true
	local var_16_1 = 0

	while var_16_0 do
		local var_16_2 = CSV.ReadRow(CSV.credits, var_16_1)

		var_16_1 = var_16_1 + 1

		if #var_16_2.ref > 0 then
			if arg_16_0.skipTo ~= "" then
				if arg_16_0.skipTo == var_16_2.ref then
					arg_16_0.skipTo = ""

					table.insert(arg_16_0.csvRows, var_16_2)
				end
			else
				table.insert(arg_16_0.csvRows, var_16_2)
			end
		else
			var_16_0 = false
		end
	end
end

function CreditsMenu(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_0 and not Engine.DDJFBBJAIG() then
		var_17_0 = self:getRootController()
	end

	assert(var_17_0)

	local var_17_1 = LUI.UIElement.new()

	var_17_1.id = "CreditsMenu"
	var_17_1.skipTillBlank = False
	var_17_1._openedFromCredits = arg_17_1.openedFromCredits
	var_17_1.InitializeProperties = var_0_1
	var_17_1.CreateText = var_0_3
	var_17_1.CreateImage = var_0_2
	var_17_1.OnCreditsFinished = var_0_5
	var_17_1.ApplyTweens = var_0_4

	var_17_1:InitializeProperties()

	local var_17_2
	local var_17_3 = LUI.UITimer.new({
		interval = 2000,
		event = "update_credits"
	})

	var_17_3.id = "creditsTimer"

	var_17_1:addElement(var_17_3)

	var_17_1.creditsTimer = var_17_3
	var_17_1.CreditLine = var_0_11
	var_17_1.parseCSV = var_0_14
	var_17_1.ResetNamesList = var_0_6

	var_17_1:parseCSV()

	local var_17_4
	local var_17_5 = LUI.UITimer.new({
		interval = 50,
		event = "update_creditline"
	})

	var_17_5.id = "creditsNextLine"

	var_17_1:addElement(var_17_5)

	var_17_1.creditsNextTimer = var_17_5
	var_17_1.UpdateNextCredits = var_0_13

	var_17_1:registerEventHandler("update_creditline", function(arg_18_0, arg_18_1)
		arg_18_0:UpdateNextCredits()
	end)

	local function var_17_6()
		return function()
			var_17_1:OnCreditsFinished()
		end
	end

	var_17_1.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_17_0
	})
	var_17_1.HelperBar.id = "HelperBar"

	var_17_1.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_17_1.HelperBar:setPriority(0)
	var_17_1:addElement(var_17_1.HelperBar)
	var_17_1.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_17_7 = LUI.UIBindButton.new()

	var_17_7.id = "selfBindButton"

	var_17_1:addElement(var_17_7)

	var_17_1.bindButton = var_17_7

	var_17_1.bindButton:addEventHandler("button_secondary", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_17_0
		end

		var_17_1:OnCreditsFinished()
	end)
	LUI.TextChat.SetupMenuForNoChat(var_17_1)
	LAYOUT.AddAspectRatioFadeFrame(var_17_1, var_17_0)

	return var_17_1
end

MenuBuilder.registerType("CreditsMenu", CreditsMenu)
LockTable(_M)
