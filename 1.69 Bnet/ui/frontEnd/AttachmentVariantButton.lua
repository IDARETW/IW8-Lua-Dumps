module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._data = arg_1_1

	local var_1_0 = ATTACHMENT.GetRef(arg_1_0._data.baseRef, arg_1_3)

	arg_1_0.Text:setText(GUNSMITH.GetVariantName(arg_1_0._data.variantID, arg_1_0._data.lootID))
	ACTIONS.AnimateSequence(arg_1_0, "NoIcon")
	arg_1_0.Selected:SetEquipped(arg_1_2)

	if not arg_1_0._handlersAdded then
		arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
			arg_1_0:dispatchEventToCurrentMenu({
				name = "update_showcase",
				variantData = arg_2_0._data
			})
		end)
		arg_1_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			arg_1_0:dispatchEventToCurrentMenu({
				name = "equip_attachment",
				variantData = arg_3_0._data
			})
		end)

		arg_1_0._handlersAdded = true
	end
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Text)
	assert(arg_4_0.Selected)

	arg_4_0.Setup = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function AttachmentVariantButton(arg_5_0, arg_5_1)
	local var_5_0 = MenuBuilder.BuildRegisteredType("ProgressionItemButton", arg_5_1)

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 62 * _1080p)

	var_5_0.id = "AttachmentVariantButton"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("AttachmentVariantButton", AttachmentVariantButton)
LockTable(_M)
