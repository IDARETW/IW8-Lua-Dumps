CODTV = CODTV or {}
CODTV.VIDEO_STATUS = {
	LOADING = 1,
	PLAYING = 2,
	OFF = 0,
	FINISHED = 4,
	ERROR = 3
}
CODTV.VIDEO_TYPE = {
	STREAM = 0,
	VOD = 1
}

function CODTV.IsCODTVEnabled()
	return Dvar.IsConsoleGame() and Dvar.IBEGCHEFE("LTOPSLTRKM") and Dvar.IBEGCHEFE("OKMOPRLSNR")
end
