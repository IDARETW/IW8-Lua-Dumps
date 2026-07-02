PersistentBackground = {}

function PersistentBackground.SetToDefault()
	PersistentBackground.Set(PersistentBackground.Variants.LetterboxOnlyBackground)
end

function PersistentBackground.Set(arg_2_0)
	local var_2_0 = Engine.DBFFAEEFGJ()

	if not var_2_0.background then
		local var_2_1 = LUI.UIElement.new()

		var_2_1.id = "persistent_bg_container"

		local var_2_2 = true

		var_2_1:setupLetterboxElement(var_2_2)

		var_2_0.background = var_2_1

		var_2_0.background:setPriority(-1000)
		var_2_0:addElement(var_2_1)
	end

	if arg_2_0 and arg_2_0 ~= PersistentBackground.current then
		PersistentBackground.current = arg_2_0

		local var_2_3 = arg_2_0()

		var_2_0.background:closeChildren()
		var_2_0.background:addElement(var_2_3)
	end
end

function PersistentBackground.ProcessEvent(arg_3_0)
	local var_3_0 = Engine.DBFFAEEFGJ()

	if var_3_0.background then
		var_3_0.background:processEvent(arg_3_0)
	end
end

function PersistentBackground.Hide(arg_4_0)
	local var_4_0 = Engine.DBFFAEEFGJ()

	if var_4_0.background then
		var_4_0.background:SetAlpha(0)
	end
end

function PersistentBackground.Show(arg_5_0)
	local var_5_0 = Engine.DBFFAEEFGJ()

	if var_5_0.background then
		var_5_0.background:SetAlpha(1)
	end
end

local function var_0_0()
	return (LUI.UIImage.new())
end

local function var_0_1()
	local var_7_0 = LUI.UIElement.new()

	var_7_0.id = "persistent_bg_letterbox"

	return var_7_0
end

PersistentBackground.Variants = {
	DebugBackground = var_0_0,
	LetterboxOnlyBackground = var_0_1
}
