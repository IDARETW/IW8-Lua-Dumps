module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = 0
	local var_1_1 = split(arg_1_0, ".")
	local var_1_2 = var_1_1[1]
	local var_1_3 = var_1_1[2]
	local var_1_4 = var_1_1[3]

	if var_1_2 == "SWATCHES" then
		return SWATCHES[var_1_3][var_1_4]
	elseif var_1_2 == "COLORS" then
		return COLORS[var_1_3]
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(arg_2_2, "A Bullet List cannot be made without Bullet Points. Please add bullet points to the bulletListOptions.")

	if arg_2_0._options.textColor then
		arg_2_0._options.textColor = var_0_0(arg_2_0._options.textColor)
	end

	if arg_2_0._options.bulletColor then
		arg_2_0._options.bulletColor = var_0_0(arg_2_0._options.bulletColor)
	end

	for iter_2_0 = 1, #arg_2_2 do
		local var_2_0 = MenuBuilder.BuildRegisteredType("BulletText", {
			controllerIndex = arg_2_1,
			options = arg_2_3
		})

		var_2_0.id = "bullet" .. iter_2_0

		var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * arg_2_0._options.fontSize)
		arg_2_0:addElement(var_2_0)

		arg_2_0.bullet = var_2_0

		arg_2_0.bullet:SetupBullet(iter_2_0, arg_2_2[iter_2_0], arg_2_0._options)

		local var_2_1 = arg_2_0.bullet.Text:GetCurrentAnchorsAndPositions()
		local var_2_2 = arg_2_0:GetCurrentAnchorsAndPositions()
		local var_2_3 = var_2_2.right - var_2_2.left

		if IsLanguageArabic() and not arg_2_3 then
			arg_2_0.bullet.Text:SetLeft(-var_2_3)
		else
			arg_2_0.bullet.Text:SetRight(var_2_3)
		end

		arg_2_0.bullet:SetRight(var_2_3)

		local var_2_4 = LAYOUT.GetTextHeightWithWrapping(arg_2_0.bullet.Text, arg_2_0.bullet.Text:getText())
		local var_2_5 = arg_2_0.bullet:GetCurrentAnchorsAndPositions()

		arg_2_0.bullet:SetBottom(var_2_5.top + var_2_4)

		arg_2_0.ListHeight = arg_2_0.ListHeight + var_2_4
	end

	local var_2_6 = (arg_2_0._options.spacing or 5) * _1080p

	arg_2_0.ListHeight = arg_2_0.ListHeight + var_2_6 * (#arg_2_2 - 1)

	arg_2_0:SetSpacing(var_2_6)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupBullets = var_0_1
	arg_3_0.ListHeight = 0
	arg_3_0._options = arg_3_2
end

function BulletList(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalStackedLayout.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 200 * _1080p)

	var_4_0.id = "BulletList"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:SetSpacing(4 * _1080p)
	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BulletList", BulletList)
LockTable(_M)
