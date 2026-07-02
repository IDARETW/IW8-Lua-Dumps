module(..., package.seeall)

FenceSignIn = LUI.Class(LUI.Fence)
FenceSignIn.ACCOUNT_PICKER_STATE = {
	picking = 2,
	inactive = 1
}
FenceSignIn.BattleNetSignInState = {
	signedIn = 2,
	error = 3,
	idle = 0,
	signingIn = 1
}

function FenceSignIn.init(arg_1_0)
	LUI.Fence.init(arg_1_0)

	arg_1_0._perController = {}

	for iter_1_0 = 0, Engine.DCJGJDDEHE() - 1 do
		arg_1_0._perController[iter_1_0] = {
			accountPickerState = FenceSignIn.ACCOUNT_PICKER_STATE.inactive
		}
	end
end

function FenceSignIn.Start(arg_2_0)
	DebugPrint("FenceSignIn.Start")
end

function FenceSignIn.Stop(arg_3_0)
	DebugPrint("FenceSignIn.Stop")
end

function FenceSignIn.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail and Fences.BDEBEIHECI() then
		LUI.FlowManager.RequestPopupMenu(nil, "popup_signin_error", false, nil, false, {}, nil, false, true)
	end
end

function PopupSignInQueue(arg_5_0, arg_5_1)
	assert(arg_5_1)

	local var_5_0 = {
		message = Engine.CBBHFCGDIC("LUA_MENU_MP/SERVER_QUEUE"),
		description = Engine.CBBHFCGDIC("PLATFORM/BNET_SERVER_QUEUE_MSG"),
		buttons = {
			label = Engine.CBBHFCGDIC(Engine.CGABICJHAI() and "LUA_MENU/QUIT_DESKTOP" or "MENU/EXIT"),
			alignment = LUI.Alignment.Center,
			action = function()
				if Engine.CGABICJHAI() then
					Engine.DJEDDFJEIG()
				else
					LUI.FlowManager.RequestLeaveMenu()
				end
			end
		},
		controllerIndex = arg_5_1.controllerIndex or Engine.IJEBHJIJF()
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("FenceSigninQueueDialogPopup", var_5_0)

	var_5_1.id = "popup_signin_queue"

	return var_5_1
end

function FenceSignIn.OpenSignInQueuedPopup(arg_7_0)
	local var_7_0 = arg_7_0
	local var_7_1 = {
		onCancel = function(arg_8_0, arg_8_1)
			var_7_0._perController[arg_8_1].isCancelling = true
		end
	}

	LUI.FlowManager.RequestPopupMenu(nil, "popup_signin_queue", false, nil, false, var_7_1, nil, true, true)

	arg_7_0._openedWaitPopup = "popup_signin_queue"
end

function FenceSignIn.UpdateState(arg_9_0)
	assert(arg_9_0._state ~= LUI.Fence.STATE.fail)

	arg_9_0._state = LUI.Fence.STATE.pass

	if Engine.EAAHJIGHHI() then
		arg_9_0._state = LUI.Fence.STATE.pass

		return
	end

	if Engine.DBFCJBDJEC() then
		local var_9_0 = 0

		if not Engine.CDCCDDJAJJ(var_9_0) then
			local var_9_1 = Engine.BIBHHEJBIB()

			local function var_9_2(arg_10_0)
				if arg_9_0._openedWaitPopup ~= nil and arg_9_0._openedWaitPopup ~= arg_10_0 then
					LUI.FlowManager.RequestLeaveMenuByName(arg_9_0._openedWaitPopup, true)

					arg_9_0._openedWaitPopup = nil

					return true
				elseif arg_9_0._openedWaitPopup == nil then
					return true
				end

				return false
			end

			if var_9_1 then
				if var_9_2("popup_signin_queue") then
					arg_9_0:OpenSignInQueuedPopup()
				end
			elseif arg_9_0._openedWaitPopup then
				LUI.FlowManager.RequestLeaveMenuByName(arg_9_0._openedWaitPopup, true)

				arg_9_0._openedWaitPopup = nil
			end

			local var_9_3 = Engine.BDJHIJJHGG(var_9_0)

			if var_9_3 == FenceSignIn.BattleNetSignInState.error then
				arg_9_0._state = LUI.Fence.STATE.fail
			elseif var_9_3 ~= FenceSignIn.BattleNetSignInState.signedIn then
				arg_9_0._state = LUI.Fence.STATE.block
			end
		end

		return
	end

	if Engine.JIFHCDAFB() then
		arg_9_0._state = LUI.Fence.STATE.block

		return
	end

	for iter_9_0 = 0, Engine.DCJGJDDEHE() - 1 do
		local var_9_4 = Engine.BBHAECABBD(iter_9_0)
		local var_9_5 = Engine.CDCCDDJAJJ(iter_9_0)

		if var_9_4 and not var_9_5 then
			assert(Engine.BAHIIBFDDG() or Engine.BEFACAIFDD())

			if arg_9_0._perController[iter_9_0].accountPickerState == FenceSignIn.ACCOUNT_PICKER_STATE.inactive then
				arg_9_0._state = LUI.Fence.STATE.block
				arg_9_0._perController[iter_9_0].accountPickerState = FenceSignIn.ACCOUNT_PICKER_STATE.picking

				Engine.BGEFGFACEH(iter_9_0, false)

				return
			end
		end
	end

	local var_9_6 = 0
	local var_9_7 = 0

	for iter_9_1 = 0, Engine.DCJGJDDEHE() - 1 do
		local var_9_8 = Engine.BBHAECABBD(iter_9_1)
		local var_9_9 = Engine.CDCCDDJAJJ(iter_9_1)

		if var_9_8 and var_9_9 then
			var_9_6 = var_9_6 + 1

			if not Engine.DBAEJAHFGJ(iter_9_1) then
				var_9_7 = var_9_7 + 1
			end
		end
	end

	local var_9_10 = false

	if Dvar.IBEGCHEFE("LPSPMQSNPQ") and Engine.CIEGIACHAE() and var_9_6 > 0 then
		var_9_10 = true
	end

	if var_9_6 > 0 and var_9_7 > 0 then
		var_9_10 = true
	end

	if var_9_10 then
		for iter_9_2 = 0, Engine.DCJGJDDEHE() - 1 do
			local var_9_11 = Engine.BBHAECABBD(iter_9_2)
			local var_9_12 = Engine.CDCCDDJAJJ(iter_9_2)

			if var_9_11 and not var_9_12 then
				Engine.CIHFHAIIHC(iter_9_2)

				arg_9_0._perController[iter_9_2].accountPickerState = FenceSignIn.ACCOUNT_PICKER_STATE.inactive
			end
		end
	else
		arg_9_0._state = LUI.Fence.STATE.fail
	end
end

function PopupSignInError(arg_11_0, arg_11_1)
	local var_11_0 = "LUA_MENU/PROFILE_NOT_SIGNED_IN"

	if Engine.CIEGIACHAE() then
		var_11_0 = "PLATFORM/NOT_SIGNED_IN"
	end

	if Engine.EAAHGICFBD() then
		var_11_0 = "XBOXLIVE/MUSTLOGIN"
	end

	local var_11_1 = {
		controllerIndex = arg_11_1.controllerIndex,
		title = Engine.CBBHFCGDIC("MENU/SIGN_IN"),
		message = Engine.CBBHFCGDIC(var_11_0),
		buttons = {
			{
				label = Engine.CBBHFCGDIC("MENU/OK")
			}
		}
	}

	if Engine.DBFCJBDJEC() then
		var_11_1.message = Engine.DJHABIGCGE()
		var_11_1.buttons[1].label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP")
		var_11_1.buttons[1].action = function()
			Engine.DJEDDFJEIG()
		end

		if Engine.EDFJDAHID() then
			local var_11_2 = {
				label = Engine.CBBHFCGDIC("PLATFORM/GO_TO_BLIZZARD_ACCOUNT_SETTINGS"),
				action = function()
					Engine.BHECIAHGC(arg_11_1.controllerIndex, 0, "https://account.blizzard.com/details#phone-number")
				end
			}

			table.insert(var_11_1.buttons, 1, var_11_2)
		end

		if Engine.DBDHEJCHCI() then
			var_11_1.title = Engine.CBBHFCGDIC("EXE/SERVER_DISCONNECTED")
		end
	end

	local var_11_3 = MenuBuilder.BuildRegisteredType("GenericImagePopup", var_11_1)

	var_11_3.id = "popup_signin_error"

	var_11_3:registerEventHandler("not_below_blocking_fence", function(arg_14_0, arg_14_1)
		if Engine.BAHIIBFDDG() then
			Engine.CEEHHDEHJB("Sign in fence failed")
			Dvar.DHEGHJJJHI("splitscreen", false)
		end
	end)

	return var_11_3
end

MenuBuilder.registerType("popup_signin_queue", PopupSignInQueue)
MenuBuilder.registerType("popup_signin_error", PopupSignInError)
LUI.Fence.Register("signIn", FenceSignIn)
LockTable(_M)
