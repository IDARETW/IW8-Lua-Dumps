module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

function BuildDecodeBlock(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 100, 600, 100, 268)

	var_1_0.id = "UIDecodeBlock"

	assert(arg_1_1)
	assert(arg_1_1.sourceFile)

	arg_1_1.textFont = arg_1_1.textFont or FONTS.GetFont(FONTS.MainBold.File)
	arg_1_1.textAlign = arg_1_1.textAlign or LUI.Alignment.Left
	arg_1_1.feedHorizontalAlign = arg_1_1.feedHorizontalAlign or LUI.Alignment.Left
	arg_1_1.feedVerticalAlign = arg_1_1.feedVerticalAlign or LUI.Alignment.Top
	arg_1_1.textHeight = arg_1_1.textHeight or 21
	arg_1_1.textLineDelay = arg_1_1.textLineDelay or 300
	arg_1_1.blockFadeTime = arg_1_1.blockFadeTime or 400
	arg_1_1.decodeLetterSpeed = arg_1_1.decodeLetterSpeed or arg_1_1.chyronLetterSpeed
	arg_1_1.decodeRandChars = arg_1_1.decodeRandChars or arg_1_1.chyronRandChars
	arg_1_1.decodeUpdatesPerLetter = arg_1_1.decodeUpdatesPerLetter or arg_1_1.chyronUpdatesPerLetter

	if not arg_1_1.decodeLetterSpeed then
		local var_1_1 = 10
	end

	if not arg_1_1.decodeRandChars then
		local var_1_2 = 1
	end

	if not arg_1_1.decodeUpdatesPerLetter then
		local var_1_3 = 4
	end

	var_1_0:SetupChyronBlock(arg_1_1)

	return var_1_0
end

MenuBuilder.registerType("DecodeBlock", BuildDecodeBlock)
MenuBuilder.registerType("ChyronBlock", BuildDecodeBlock)
LockTable(_M)
