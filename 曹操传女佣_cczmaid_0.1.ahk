#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/* README

1. 战场界面Z存档，V读档；按下L开启疯狂S/L，读最近的自动档并自动确认。
2. 右击鼠标或者按下ESC关闭武将头像、仓库等弹出窗口；滑动滚轮切换武将界面的上一武将、下一武将，存档界面的上一页、下一页。
3. 存档时移动鼠标到某个栏位无需左击，按下滚轮可以快速确认，连点“是”和“OK”；按下鼠标左键同时滑动滚轮可以在存档界面切换上一百页、下一百页；按下数字1~9键即可快速选择第一页到第九页存档。

*/

;BETTER COMPATIBILITY
;SetControlDelay -1
;SetTitleMatchMode, 2
;SetTitleMatchMode, slow

setmousedelay 22
setkeydelay 11
GroupAdd, ccz, ahk_class SOUSOU ;6.2 6.3陆抗传【三国异陆抗传】
GroupAdd, ccz, ahk_class 三国志姜维传 ;6.1&改
return

;GLODBAL HOTKEY
!q::suspend ;suspend hotkey
!s::pause ;pause click
!g::exitapp
!r::reload
!e::edit

;;;; module 1 main save&load&quickload

#ifwinactive ahk_group ccz

z:: ;save
;click 50,66
controlclick, x44 y66,, ,l , 1,na
return

v:: ;load
;click 69,66
controlclick, x77 y66,, ,l , 1,na
return


l:: ;quickload
sleep 333
;controlclick, x525 y216,, , l, 1, na 	;<<< homepage lukang,other version?
controlclick, x77 y66,, , l, 1, na ;toptoolbar
winwait, ahk_class #32770,, 0.5 ;wait for seconds
click 333,332       ;controlclick, x300 y333,, , l, 1, na >>>> invalid
;msgbox, %errorlevel%
sleep 111
controlclick, 是, ahk_class #32770, , l, 1, na
return

#ifwinactive ;end of main win

;;;; module 2 daily confirm&cancel

#ifwinactive ahk_class #32770

esc::
controlclick, 取消, ahk_class #32770, , l, 1, na
controlclick, 结束, ahk_class #32770, , l, 1, na
controlclick, 否, ahk_class #32770, , l, 1, na
controlclick, 旧档界面, ahk_class #32770, ,l , 1, na
return

wheelup::
;x::
controlclick, 上一页, ahk_class #32770, ,l , 1,na
controlclick, 上一武将, ahk_class #32770, ,l , 1,na
return

wheeldown::
;c::
controlclick, 下一页, ahk_class #32770, ,l , 1,na
controlclick, 下一武将, ahk_class #32770, ,l , 1,na
return

$rbutton::
;w::
keywait, rbutton,,T0.2
if errorlevel
{
	rbutton & wheelup:: 									;~~TODO~~ rbutton
	controlclick, 上一百页, ahk_class #32770, ,l , 1,na
	return

	rbutton & wheeldown:: 										 
	controlclick, 下一百页, ahk_class #32770, ,l , 1,na
	return
}
controlclick, 取消, ahk_class #32770, ,l , 1,na
controlclick, 结束, ahk_class #32770, ,l , 1,na
controlclick, 否, ahk_class #32770, ,l , 1,na
controlclick, 旧档界面, ahk_class #32770, ,l , 1,na
controlclick, 确定, ahk_class #32770, ,l , 1,na 					;;;; ★★★
controlclick, 确认, ahk_class #32770, ,l , 1,na 					;;;; ★★★
return

mbutton::
click 												;;; MIND SLIDING CURSOR
sleep 111
controlclick, 是, ahk_class #32770, ,l , 1,na ;;;; ★★★
sleep 111
controlclick, OK, ahk_class #32770, ,l , 1,na ;;;; ★★★
return

#ifwinactive ;end of #32770 save/load win

;;;; module 3 swtich s/l page

#ifwinactive ahk_group ccz ahk_class #32770
1::controlclick, 第一页, ahk_class #32770, ,l , 1,na
2::controlclick, 第二页, ahk_class #32770, ,l , 1,na
3::controlclick, 第三页, ahk_class #32770, ,l , 1,na
4::controlclick, 第四页, ahk_class #32770, ,l , 1,na
5::controlclick, 第五页, ahk_class #32770, ,l , 1,na
6::controlclick, 第六页, ahk_class #32770, ,l , 1,na
7::controlclick, 第七页, ahk_class #32770, ,l , 1,na
8::controlclick, 第八页, ahk_class #32770, ,l , 1,na
9::controlclick, 第九页, ahk_class #32770, ,l , 1,na




#ifwinactive ;end of #32770 save/load win

;PostMessage, 0x112, 0xF030,,, A