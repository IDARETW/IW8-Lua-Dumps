module(..., package.seeall)

function LobbyStatus(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1 and arg_1_1.controllerIndex

	assert(var_1_0)

	local var_1_1 = arg_1_1.alignment or LUI.Alignment.Left
	local var_1_2 = 24 * _1080p
	local var_1_3 = 1 * _1080p
	local var_1_4 = LUI.UIElement.new()

	var_1_4:SetAnchorsAndPosition(0, 1, 1, 0, 0, 500 * _1080p, 0, 86 * _1080p)

	var_1_4.id = "LobbyStatus"

	local var_1_5 = LUI.UIImage.new()

	var_1_5:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, -23, 0)
	var_1_5:SetRGBFromInt(0)
	var_1_5:SetAlpha(1)
	var_1_5:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)

	var_1_5.id = "bg"

	var_1_4:addElement(var_1_5)

	var_1_4.bg = var_1_5

	local var_1_6 = LUI.UIElement.new()

	var_1_6.id = "stencil"

	var_1_6:setUseStencil(true)
	var_1_4:addElement(var_1_6)

	function var_1_4.Minimize(arg_2_0)
		if arg_2_0.bg then
			arg_2_0.bg:closeTree()

			arg_2_0.bg = nil
		end
	end

	function var_1_4.UpdateMessage(arg_3_0)
		local var_3_0, var_3_1, var_3_2 = Lobby.GetStatusString(var_1_0)

		if var_3_0 == arg_3_0._lastText then
			return
		end

		arg_3_0._lastText = var_3_0

		local var_3_3 = arg_3_0._lastState == var_3_2

		arg_3_0._lastState = var_3_2

		local var_3_4
		local var_3_5 = arg_3_0._currentMessage ~= nil

		if var_3_5 then
			local var_3_6 = arg_3_0._currentMessage

			if not var_3_3 then
				local var_3_7 = var_3_6:SetAlpha(0, 200, LUI.EASING.inQuadratic)

				if var_3_7 then
					function var_3_7.onComplete()
						var_3_6:closeTree()
					end
				end

				arg_3_0._currentMessage = nil
			else
				var_3_4 = var_3_6
			end
		end

		if not var_3_4 then
			var_3_4 = LUI.UIText.new()
			var_3_4.id = "newMessage"

			var_3_4:SetRGBFromTable(COLORS.grey179)
			var_3_4:SetAlpha(1)
			var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
			var_3_4:SetAlignment(var_1_1)
			var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 12, 0, var_1_3, var_1_3 + var_1_2)
			var_3_4:SetWordWrap(false)
			var_3_4:SetOptOutRightToLeftAlignmentFlip(true)

			arg_3_0._currentMessage = var_3_4

			var_1_6:addElement(var_3_4)

			function var_3_4.UpdateText(arg_5_0, arg_5_1)
				if var_3_1 then
					arg_5_0._variantIndex = 1
					arg_5_0._textVariants = {
						arg_5_1 .. "",
						arg_5_1 .. "",
						arg_5_1 .. ".",
						arg_5_1 .. "..",
						arg_5_1 .. "...",
						arg_5_1 .. "...",
						arg_5_1 .. "..."
					}

					arg_5_0:setText(arg_5_0._textVariants[arg_5_0._variantIndex])
				else
					arg_5_0:setText(arg_5_1)
				end
			end

			var_3_4:UpdateText(var_3_0)

			if var_3_1 then
				local var_3_8

				local function var_3_9()
					local var_6_0 = var_3_4
					local var_6_1 = var_6_0._textVariants[var_6_0._variantIndex]

					var_6_0:setText(var_6_1)

					var_6_0:Wait(200).onComplete = var_3_9
					var_6_0._variantIndex = 1 + var_6_0._variantIndex % #var_6_0._textVariants
				end

				var_3_9()
			end
		end

		var_3_4:UpdateText(var_3_0)

		if var_3_5 and not var_3_3 then
			var_3_4:SetAlpha(0)

			var_3_4:Wait(100).onComplete = function()
				var_3_4:SetAlpha(1, 200, LUI.EASING.inOutQuadratic)
			end
		end
	end

	local var_1_7 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_status"
	})

	var_1_7.id = "lobbyStatusTimer"

	var_1_4:addElement(var_1_7)
	var_1_4:registerEventHandler("update_lobby_status", function(arg_8_0, arg_8_1)
		arg_8_0:UpdateMessage()
	end)
	var_1_4:UpdateMessage()

	return var_1_4
end

MenuBuilder.registerType("LobbyStatus", LobbyStatus)
LockTable(_M)
