#Up:: ; Win+Up to Maximize
WinGet, winStatus, MinMax, A
If winStatus = 0
{
	WinMaximize, A
}
Return

#Down:: ; Win+Down to Restore/Minimize
WinGet, winStatus, MinMax, A

If winStatus = 1
{
	WinRestore, A
}
Else If winStatus = 0
{
	WinMinimize, A
}
Return

#Left:: ; Win+Left to dock left
	SysGet, MonitorWorkArea, MonitorWorkArea
	scrnWidth  := MonitorWorkAreaRight - MonitorWorkAreaLeft
	scrnHeight := MonitorWorkAreaBottom - MonitorWorkAreaTop
	
	winNewWidth := scrnWidth / 2
	winNewHeight := scrnHeight

	WinGet, winStatus, MinMax, A
	If winStatus = 1
	{
		; Unmaximize first, otherwise the window will think it's still maximized later.
		WinRestore, A
	}
	WinMove, A, , %MonitorWorkAreaLeft%, %MonitorWorkAreaTop%, %winNewWidth%, %winNewHeight%
Return

#Right:: ; Win+Right to dock right
	SysGet, MonitorWorkArea, MonitorWorkArea
	scrnWidth  := MonitorWorkAreaRight - MonitorWorkAreaLeft
	scrnHeight := MonitorWorkAreaBottom - MonitorWorkAreaTop
	
	winNewPoint  := scrnWidth / 2
	winNewWidth  := scrnWidth / 2
	winNewHeight := scrnHeight

	WinGet, winStatus, MinMax, A
	If winStatus = 1
	{
		; Unmaximize first, otherwise the window will think it's still maximized later.
		WinRestore, A
	}
	WinMove, A, , %winNewPoint%, %MonitorWorkAreaTop%, %winNewWidth%, %winNewHeight%
Return