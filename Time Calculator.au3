#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region
$Form1 = GUICreate("TIME CALCULATOR", 201, 105, 192, 124)
$InputSecs = GUICtrlCreateInput("", 72, 72, 121, 21)
$InputMins = GUICtrlCreateInput("", 72, 8, 121, 21)
$LabelMin = GUICtrlCreateLabel("Hours", 8, 8, 41, 17)
$LabelSec = GUICtrlCreateLabel("Minutes", 8, 80, 46, 17)
$ButtonConvert = GUICtrlCreateButton("Convert", 8, 40, 91, 25)
$ButtonClear = GUICtrlCreateButton("Clear", 104, 40, 91, 25)
$pos = WinGetPos($Form1)
WinMove($Form1, "", @DesktopWidth - $pos[2], @DesktopHeight - $pos[3] - 30) ;30 = START task/tray menu

GUISetState(@SW_SHOW)

#EndRegion

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ButtonConvert
			Convert()
		Case $ButtonClear
			Clear()
	EndSwitch
WEnd

Func Convert()
	$sMinutes = GUICtrlRead($InputMins)
	$sSeconds = GUICtrlRead($InputSecs)
	$sMinslength = StringLen($sMinutes)
	$sSecslength = StringLen($sSeconds)

	If $sMinslength <= 0 Then

		$answermins = $sSeconds / 60

		GUICtrlSetData($InputMins, $answermins)
	Else

		$answersecs = $sMinutes * 60

		GUICtrlSetData($InputSecs, $answersecs)
		GUICtrlSetData($InputSecs, $answersecs)
	EndIf
EndFunc   ;==>Convert


Func Clear()
	GUICtrlSetData($InputMins, "")
	GUICtrlSetData($InputSecs, "")
EndFunc   ;==>Clear
