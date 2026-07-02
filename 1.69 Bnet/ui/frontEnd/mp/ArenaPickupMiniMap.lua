module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	if Dvar.DHEEJCCJBH("MOLPOSLOMO") == "arena" then
		local var_1_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
		local var_1_1 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_1_0, CSV.mpMapTable.cols.arenaMenuMinimap)

		if var_1_1 ~= "" then
			arg_1_0.MiniMap:SetMask(arg_1_0.MapMask)
			arg_1_0.MiniMap:setImage(RegisterMaterial(var_1_1))
			arg_1_0.MiniMap:SetAlpha(1, 0)

			local var_1_2
			local var_1_3
			local var_1_4
			local var_1_5
			local var_1_6

			for iter_1_0 = 0, StringTable.BFHCAIIDA(CSV.mpArenaPickupMapTable.file) do
				local var_1_7 = CSV.ReadRow(CSV.mpArenaPickupMapTable, iter_1_0)

				if var_1_7.mapRef == var_1_0 then
					local var_1_8 = "Image" .. tostring(iter_1_0)
					local var_1_9 = LUI.UIImage.new()

					var_1_9.id = var_1_9

					var_1_9:SetRGBFromTable(SWATCHES.HUD.background, 0)
					var_1_9:SetAlpha(0.7, 0)
					var_1_9:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10)
					arg_1_0:addElement(var_1_9)

					arg_1_0.Image = var_1_9

					local var_1_10 = var_1_7.xPercent + 0.0025
					local var_1_11 = 1 - var_1_10
					local var_1_12 = var_1_7.yPercent + 0.0025
					local var_1_13 = 1 - var_1_12

					arg_1_0.Image:SetAnchorsAndPosition(var_1_10, var_1_11, var_1_12, var_1_13, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10)

					local var_1_14 = "Label" .. tostring(iter_1_0)
					local var_1_15 = LUI.UIText.new()

					var_1_15.id = var_1_15

					var_1_15:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
					var_1_15:setText("", 0)
					var_1_15:SetFont(FONTS.GetFont(FONTS.StreakRegular.File))
					var_1_15:setTextStyle(CoD.TextStyle.ShadowedMore)
					var_1_15:SetAlignment(LUI.Alignment.Left)
					arg_1_0:addElement(var_1_15)

					arg_1_0.Label = var_1_15

					arg_1_0.Label:setText(var_1_7.weaponID, 0)
					arg_1_0.Label:SetAlpha(1, 0)

					local var_1_16 = var_1_7.xPercent + 0.005
					local var_1_17 = 1 - var_1_16
					local var_1_18 = var_1_7.yPercent + 0.005
					local var_1_19 = 1 - var_1_18

					if IsLanguageArabic() then
						arg_1_0.Label:SetAlignment(LUI.Alignment.Center)
						arg_1_0.Label:SetAnchorsAndPosition(var_1_16, var_1_17, var_1_18, var_1_19, _1080p * -10, _1080p * 10, _1080p * -20, _1080p * 12)
					else
						arg_1_0.Label:SetAnchorsAndPosition(var_1_16, var_1_17, var_1_18, var_1_19, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10)
					end
				end
			end
		end
	end
end

function ArenaPickupMiniMap(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 884 * _1080p, 0, 880 * _1080p)

	var_2_0.id = "ArenaPickupMiniMap"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:setUseStencil(true)

	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "MiniMap"

	var_2_4:setImage(RegisterMaterial("compass_map_mp_m_king"), 0)
	var_2_0:addElement(var_2_4)

	var_2_0.MiniMap = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "MapMask"

	var_2_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 1112, _1080p * -1088, _1080p * 114, _1080p * 776)
	var_2_0:addElement(var_2_6)

	var_2_0.MapMask = var_2_6

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ArenaPickupMiniMap", ArenaPickupMiniMap)
LockTable(_M)
