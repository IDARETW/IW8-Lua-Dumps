module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.ExpandButton.ExpandMe

	var_1_0:setText(Engine.CBBHFCGDIC("CODCASTER/SHOW_FOLLOWERS"))

	local var_1_1 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODCASTER/HIDE_FOLLOWERS")
		}
	}

	var_1_0:RegisterAnimationSequence("Expanded", var_1_1)

	local var_1_2 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("CODCASTER/SHOW_FOLLOWERS")
		}
	}

	var_1_0:RegisterAnimationSequence("Collapsed", var_1_2)
	LUI.AddGridOptimizedExpanderLogic(arg_1_0, arg_1_1, {
		isExpandButtonBelow = true,
		numRows = 0,
		headerHeight = 48 * _1080p,
		footerHeight = 28 * _1080p,
		rowHeight = 38 * _1080p,
		rowSpacing = 4 * _1080p,
		buildFunction = function(arg_2_0)
			if arg_2_0 >= 0 then
				local var_2_0 = MenuBuilder.BuildRegisteredType("LobbyMember", {
					controllerIndex = arg_1_1
				})

				var_2_0.id = arg_1_0.id .. "_follower" .. arg_2_0

				var_2_0:SetDataSource(arg_1_0.followers[arg_2_0 + 1], arg_1_1)

				return var_2_0
			end
		end,
		refreshFunction = function(arg_3_0, arg_3_1)
			arg_3_0:SetDataSource(arg_1_0.followers[arg_3_1 + 1], arg_1_1)
		end,
		expandButton = arg_1_0.ExpandButton,
		replaceDummyChildrenContainer = arg_1_0.DummyChildrenContainer
	})
end

local function var_0_1(arg_4_0)
	local var_4_0 = arg_4_0.YouIndicatorRight:GetCurrentAnchorsAndPositions()
	local var_4_1 = var_4_0.bottom - var_4_0.top

	if arg_4_0.isMyPlayerInExpander then
		local var_4_2 = arg_4_0.LobbyMember:getHeight()
		local var_4_3 = arg_4_0._collapseDuration

		if arg_4_0:IsExpanded() then
			for iter_4_0 = 0, #arg_4_0.followers - 1 do
				if arg_4_0.followers[iter_4_0 + 1].isMyPlayer:GetValue() then
					var_4_3 = arg_4_0._expandDuration
					var_4_2 = var_4_2 + (arg_4_0.lobbyMemberHeight + arg_4_0.rowSpacing) * _1080p * iter_4_0 + 4

					break
				end
			end
		end

		arg_4_0.YouIndicatorRight:SetAnchorsAndPosition(var_4_0.leftAnchor, var_4_0.rightAnchor, var_4_0.topAnchor, var_4_0.bottomAnchor, var_4_0.left, var_4_0.right, var_4_2, var_4_2 + var_4_1, var_4_3)
	else
		arg_4_0.YouIndicatorRight:SetAnchorsAndPosition(var_4_0.leftAnchor, var_4_0.rightAnchor, var_4_0.topAnchor, var_4_0.bottomAnchor, var_4_0.left, var_4_0.right, 4, 4 + var_4_1, 0)
	end
end

local function var_0_2(arg_5_0, arg_5_1)
	local var_5_0, var_5_1 = Lobby.GetMembersListDataSource()
	local var_5_2 = var_5_1:GetDataSourceAtIndex(arg_5_0.memberIndex)

	arg_5_0:SetDataSource(var_5_2, arg_5_1)

	arg_5_0.isMyPlayerInExpander = false

	local var_5_3 = var_5_2.followersCount:GetValue(arg_5_1)
	local var_5_4 = {}

	for iter_5_0 = 0, var_5_3 - 1 do
		local var_5_5 = var_5_2.followers[iter_5_0]:GetValue(arg_5_1)
		local var_5_6 = var_5_1:GetDataSourceAtIndex(var_5_5)

		table.insert(var_5_4, var_5_6)

		if var_5_6.isMyPlayer:GetValue(arg_5_1) then
			arg_5_0.isMyPlayerInExpander = true
		end
	end

	arg_5_0.followers = var_5_4

	local var_5_7 = arg_5_0:GetNumRows()

	arg_5_0:SetNumRows(var_5_3)
	arg_5_0:RefreshContent()

	local var_5_8 = Engine.CBBHFCGDIC("CODCASTER/SHOW_FOLLOWERS") .. " (" .. var_5_3 .. ")"
	local var_5_9 = arg_5_0.ExpandButton.ExpandMe
	local var_5_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = var_5_8
		}
	}

	var_5_9:RegisterAnimationSequence("Collapsed", var_5_10)

	if not arg_5_0:IsExpanded() then
		var_5_9:setText(var_5_8)
	end

	local var_5_11 = arg_5_0:GetCurrentAnchorsAndPositions()

	if var_5_3 == 0 then
		arg_5_0:SetAnchorsAndPosition(var_5_11.leftAnchor, var_5_11.rightAnchor, var_5_11.topAnchor, var_5_11.bottomAnchor, var_5_11.left, var_5_11.right, var_5_11.top, var_5_11.top + _1080p * arg_5_0.lobbyMemberHeight, 0)

		if arg_5_0:IsExpanded() then
			arg_5_0.ExpandOrCollapse(arg_5_0, false)
		end

		arg_5_0.ExpandButton:SetMouseFocusBlocker(true)
		ACTIONS.AnimateSequence(arg_5_0, "NoFollowers")
	elseif var_5_7 == 0 then
		arg_5_0:SetAnchorsAndPosition(var_5_11.leftAnchor, var_5_11.rightAnchor, var_5_11.topAnchor, var_5_11.bottomAnchor, var_5_11.left, var_5_11.right, var_5_11.top, var_5_11.top + _1080p * arg_5_0.lobbyMemberWithExpanderHeight, 0)
		arg_5_0.ExpandButton:SetMouseFocusBlocker(false)
		ACTIONS.AnimateSequence(arg_5_0, "HasFollowers")
	end

	if var_5_2.isMyPlayer:GetValue(arg_5_1) or arg_5_0.isMyPlayerInExpander then
		var_0_1(arg_5_0)
		ACTIONS.AnimateSequence(arg_5_0, "IsMyPlayer")

		local var_5_12 = var_5_2.controllerIndex:GetValue(arg_5_1)

		arg_5_0.YouIndicatorRight:UpdateForSplitscreen(var_5_12)
	else
		ACTIONS.AnimateSequence(arg_5_0, "IsNotMyPlayer")
	end
end

function RefreshExpander(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = arg_6_0:GetDataSource()

	arg_6_0.memberIndex = arg_6_2
	arg_6_0.listIndex = arg_6_3

	arg_6_0:SubscribeToModel(var_6_0.followersCount:GetModel(arg_6_1), function()
		arg_6_0:UpdateFollowers(arg_6_1)
	end)
	arg_6_0:SubscribeToModel(var_6_0.isMyPlayer:GetModel(arg_6_1), function()
		arg_6_0:UpdateFollowers(arg_6_1)
	end)
	arg_6_0:SubscribeToModel(var_6_0.memberIndex:GetModel(arg_6_1), function()
		if var_6_0.isMyPlayer:GetValue(arg_6_1) then
			local var_9_0 = var_6_0.controllerIndex:GetValue(arg_6_1)

			arg_6_0.YouIndicatorRight:UpdateForSplitscreen(var_9_0)
		end
	end)
end

local function var_0_3(arg_10_0, arg_10_1)
	if arg_10_0:GetNumRows() == 0 then
		arg_10_0.LobbyMember:processEvent({
			name = "gain_focus"
		})

		return true
	end

	local var_10_0 = arg_10_1.direction

	if var_10_0 and var_10_0 == "up" then
		arg_10_0.ExpandButton:processEvent({
			name = "gain_focus"
		})

		return true
	end

	arg_10_0.LobbyMember:processEvent({
		name = "gain_focus"
	})

	return true
end

local function var_0_4(arg_11_0)
	local var_11_0
	local var_11_1

	for iter_11_0, iter_11_1 in pairs(arg_11_0._allocatedRows) do
		if iter_11_1:isInFocus() then
			var_11_0 = iter_11_0
			var_11_1 = iter_11_1

			break
		end
	end

	return var_11_0, var_11_1
end

local function var_0_5(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = 0
	local var_12_1 = arg_12_0:GetNumRows() - 1
	local var_12_2 = 1

	if not arg_12_1 then
		var_12_0 = var_12_1
		var_12_1 = 0
		var_12_2 = -1
	end

	if arg_12_2:isInFocus() then
		arg_12_2:processEvent({
			name = "lose_focus"
		})

		if arg_12_0:IsExpanded() then
			arg_12_0:FocusChild(var_12_0)
		else
			arg_12_3:processEvent({
				name = "gain_focus"
			})
		end

		return true
	end

	local var_12_3, var_12_4 = var_0_4(arg_12_0)

	if var_12_4 then
		var_12_4:processEvent({
			name = "lose_focus"
		})

		if var_12_3 == var_12_1 then
			arg_12_3:processEvent({
				name = "gain_focus"
			})
		else
			arg_12_0:FocusChild(var_12_3 + var_12_2)
		end

		return true
	end

	return false
end

local function var_0_6(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5)
	if arg_13_2 ~= "up" and arg_13_2 ~= "down" or arg_13_0:GetNumRows() == 0 then
		return arg_13_0:getParent():FocusNextElement(arg_13_0, arg_13_2, arg_13_3, arg_13_4, arg_13_5)
	end

	if arg_13_2 == "down" then
		if var_0_5(arg_13_0, true, arg_13_0.LobbyMember, arg_13_0.ExpandButton) then
			return true
		end
	elseif var_0_5(arg_13_0, false, arg_13_0.ExpandButton, arg_13_0.LobbyMember) then
		return true
	end

	return arg_13_0:getParent():FocusNextElement(arg_13_0, arg_13_2, arg_13_3, arg_13_4, arg_13_5)
end

function PostLoadFunc(arg_14_0, arg_14_1)
	var_0_0(arg_14_0, arg_14_1)

	arg_14_0.lobbyMemberHeight = 38
	arg_14_0.rowSpacing = 4
	arg_14_0.lobbyMemberWithExpanderHeight = 70
	arg_14_0.isMyPlayerInExpander = false
	arg_14_0.FocusNextElement = var_0_6
	arg_14_0.memberIndex = nil
	arg_14_0.listIndex = nil
	arg_14_0.isFollower = false
	arg_14_0.RefreshExpander = RefreshExpander
	arg_14_0.UpdateFollowers = var_0_2

	arg_14_0:registerEventHandler("gain_focus", var_0_3)
	arg_14_0:addEventHandler("expander_expand", var_0_1)
	arg_14_0:addEventHandler("expander_collapse", var_0_1)
	arg_14_0.ExpandButton.Background.Backer:SetAlpha(0.45)

	local var_14_0 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	arg_14_0.ExpandButton.Background.Backer:RegisterAnimationSequence("ButtonUp", var_14_0)
end

function LobbyMemberExpander(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 770 * _1080p, 0, 70 * _1080p)

	var_15_0.id = "LobbyMemberExpander"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "DummyChildrenContainer"

	var_15_4:SetRGBFromInt(16711680, 0)
	var_15_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 180, 0, _1080p * 42, _1080p * 42)
	var_15_0:addElement(var_15_4)

	var_15_0.DummyChildrenContainer = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("LobbyMember", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "LobbyMember"

	var_15_6:SetDataSourceThroughElement(var_15_0, nil)
	var_15_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 770, 0, _1080p * 38)
	var_15_0:addElement(var_15_6)

	var_15_0.LobbyMember = var_15_6

	local var_15_7
	local var_15_8 = MenuBuilder.BuildRegisteredType("GenericExpanderExpandWidget", {
		controllerIndex = var_15_1
	})

	var_15_8.id = "ExpandButton"

	var_15_8.ExpandMe:setText(Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_ADVANCED"), 0)
	var_15_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 180, _1080p * 770, _1080p * 42, _1080p * 70)
	var_15_0:addElement(var_15_8)

	var_15_0.ExpandButton = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIImage.new()

	var_15_10.id = "ChildLineHorz"

	var_15_10:SetRGBFromTable(SWATCHES.CAC.nodeFrame, 0)
	var_15_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 165, _1080p * 180, _1080p * -15, _1080p * -13)
	var_15_0:addElement(var_15_10)

	var_15_0.ChildLineHorz = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIImage.new()

	var_15_12.id = "ChildLineVert"

	var_15_12:SetRGBFromTable(SWATCHES.CAC.nodeFrame, 0)
	var_15_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 163, _1080p * 165, _1080p * 38, _1080p * -13)
	var_15_0:addElement(var_15_12)

	var_15_0.ChildLineVert = var_15_12

	local var_15_13
	local var_15_14 = MenuBuilder.BuildRegisteredType("YouIndicatorRight", {
		controllerIndex = var_15_1
	})

	var_15_14.id = "YouIndicatorRight"

	var_15_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 145, _1080p * 4, _1080p * 34)
	var_15_0:addElement(var_15_14)

	var_15_0.YouIndicatorRight = var_15_14

	local function var_15_15()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_15

	local var_15_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("NoFollowers", var_15_16)

	local var_15_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("NoFollowers", var_15_17)

	local var_15_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("NoFollowers", var_15_18)

	local function var_15_19()
		var_15_8:AnimateSequence("NoFollowers")
		var_15_10:AnimateSequence("NoFollowers")
		var_15_12:AnimateSequence("NoFollowers")
	end

	var_15_0._sequences.NoFollowers = var_15_19

	local var_15_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("HasFollowers", var_15_20)

	local var_15_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("HasFollowers", var_15_21)

	local var_15_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("HasFollowers", var_15_22)

	local function var_15_23()
		var_15_8:AnimateSequence("HasFollowers")
		var_15_10:AnimateSequence("HasFollowers")
		var_15_12:AnimateSequence("HasFollowers")
	end

	var_15_0._sequences.HasFollowers = var_15_23

	local var_15_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("IsMyPlayer", var_15_24)

	local function var_15_25()
		var_15_14:AnimateSequence("IsMyPlayer")
	end

	var_15_0._sequences.IsMyPlayer = var_15_25

	local var_15_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("IsNotMyPlayer", var_15_26)

	local function var_15_27()
		var_15_14:AnimateSequence("IsNotMyPlayer")
	end

	var_15_0._sequences.IsNotMyPlayer = var_15_27

	var_15_6:SetDataSourceThroughElement(var_15_0, nil)
	PostLoadFunc(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("LobbyMemberExpander", LobbyMemberExpander)
LockTable(_M)
