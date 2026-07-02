module(..., package.seeall)

local var_0_0 = hashset({
	"togglescores",
	"game_message",
	"obituary",
	"objectives_update",
	"objectives_ping",
	"target_markers_update",
	"playerstate_client_changed",
	"update_crm_data",
	"level_load",
	"prep_bootup",
	"bootup_hud",
	"update_input_type",
	"key_bindings_update",
	"social_challenge_update",
	"send_toast_notification",
	"button_focused",
	"add_message_splash_manager",
	"add_bullet_hit_marker",
	"opening_quick_access_menu",
	"closing_quick_access_menu",
	"kbm_notification_prompt_answer",
	"br_squad_message",
	"callout_marker_pings_update",
	"input_context_changed",
	"bnet_online_status_set",
	"ui_fly_by_wire",
	"objectives_ps_ping"
})
local var_0_1 = hashset({
	"number",
	"string",
	"table"
})

function isDirectDispatchEventType(arg_1_0)
	return var_0_0[arg_1_0]
end

function new()
	local var_2_0 = {}

	setmetatable(var_2_0, {
		__index = _M
	})

	var_2_0.direct_dispatch = {}
	var_2_0.omnvar_update = {}

	return var_2_0
end

function setupRoot(arg_3_0, arg_3_1)
	arg_3_1:registerEventHandler("omnvar_update", omnvarUpdateDispatcher)

	for iter_3_0, iter_3_1 in pairs(var_0_0) do
		arg_3_1:registerEventHandler(iter_3_0, directDispatcher)
	end
end

local var_0_2

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_0 == nil then
		return
	end

	arg_4_3 = arg_4_3 or "No ID"

	local var_4_0 = 1

	while true do
		local var_4_1, var_4_2 = debug.getupvalue(arg_4_0, var_4_0)

		if not var_4_1 then
			break
		end

		local var_4_3 = type(var_4_2)

		if not var_0_1[var_4_3] then
			local var_4_4 = arg_4_2 and "Event" or "Omnvar handler"

			assert(var_4_3 == "function", "WidgetID: " .. arg_4_3 .. ", " .. var_4_4 .. ": " .. arg_4_1 .. " using a local variable " .. var_4_1 .. ". This can leak")
			var_0_3(var_4_2, arg_4_1, arg_4_2, arg_4_3)
		end

		var_4_0 = var_4_0 + 1
	end
end

function registerOmnvarHandler(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	assert(type(arg_5_1) == "userdata")
	assert(type(arg_5_2) == "string")
	assert(type(arg_5_3) == "function")

	arg_5_0.omnvar_update[arg_5_2] = arg_5_0.omnvar_update[arg_5_2] or setmetatable({}, {
		__mode = "k"
	})
	arg_5_0.omnvar_update[arg_5_2][arg_5_1] = arg_5_3

	if Engine.BHICADFIHA() then
		var_0_3(arg_5_3, arg_5_2, false, arg_5_1.id)
	end
end

function omnvarUpdateDispatcher(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.eventCatcher.omnvar_update[arg_6_1.omnvar]

	if var_6_0 then
		for iter_6_0, iter_6_1 in pairs(var_6_0) do
			if not iter_6_0.__gccollected and not iter_6_0:IsClosed() then
				iter_6_1(iter_6_0, arg_6_1)
			end
		end
	end

	return true
end

function registerDirectDispatchHandler(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	assert(type(arg_7_1) == "userdata")
	assert(type(arg_7_2) == "string")
	assert(type(arg_7_3) == "function" or arg_7_3 == nil)

	arg_7_0.direct_dispatch[arg_7_2] = arg_7_0.direct_dispatch[arg_7_2] or setmetatable({}, {
		__mode = "k"
	})
	arg_7_0.direct_dispatch[arg_7_2][arg_7_1] = arg_7_3

	if Engine.BHICADFIHA() then
		var_0_3(arg_7_3, arg_7_2, true, arg_7_1.id)
	end
end

function directDispatcher(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.eventCatcher.direct_dispatch[arg_8_1.name]

	if var_8_0 then
		for iter_8_0, iter_8_1 in pairs(var_8_0) do
			if not iter_8_0.__gccollected and not iter_8_0:IsClosed() then
				assert(iter_8_0.m_eventHandlers[arg_8_1.name] == iter_8_1)
				iter_8_1(iter_8_0, arg_8_1)
			end
		end
	end

	return true
end

LockTable(_M)
