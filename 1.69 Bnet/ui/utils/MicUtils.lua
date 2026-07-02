Mic = {}
Mic.states = {
	micOn = 1,
	noMic = 0,
	micTalking = 2,
	micMuted = 3
}
Mic.icons = {
	"specialty_ks_null",
	"icon_mic_on",
	"icon_mic_talking",
	"icon_mic_muted"
}

function Mic.GetIcon(arg_1_0)
	return Mic.icons[arg_1_0 + 1]
end

function Mic.GetIconAlpha(arg_2_0)
	return arg_2_0 ~= Mic.states.noMic and 1 or 0
end
