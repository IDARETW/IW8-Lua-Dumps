module(..., package.seeall)

FenceKoreanRating = LUI.Class(LUI.Fence)

function FenceKoreanRating.init(arg_1_0)
	LUI.Fence.init(arg_1_0)
end

function FenceKoreanRating.Start(arg_2_0)
	DebugPrint("FenceKoreanRating.Start")
end

function FenceKoreanRating.Stop(arg_3_0)
	DebugPrint("FenceKoreanRating.Stop")
end

function FenceKoreanRating.UpdateState(arg_4_0)
	arg_4_0._state = LUI.Fence.STATE.pass

	if Engine.DDHFCGHJEA() and not Dvar.IBEGCHEFE("MKRKLLSKSP") then
		arg_4_0._state = LUI.Fence.STATE.block

		if not arg_4_0._openedKoreanRating then
			arg_4_0._openedKoreanRating = true

			LUI.FlowManager.RequestPopupMenu(nil, "KoreanRatingPopup", false, nil, false, {}, nil, true, true)
		end

		if not LUI.FlowManager.IsInStack("KoreanRatingPopup") then
			arg_4_0._state = LUI.Fence.STATE.fail
		end
	end
end

LUI.Fence.Register("koreanRating", FenceKoreanRating)
LockTable(_M)
