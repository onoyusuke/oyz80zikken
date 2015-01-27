; sample - 2
;
_COLD: EQU 	1FFDh	; 	- 	コールドスタート。初期化後、(#USR)に格納されたアドレス(初期値は#HOT)へ。
_HOT: EQU 	1FFAh	; 	- 	ホットスタート。共通モニタ起動。
_VER: EQU 	1FF7h	; 	HL 	Hに機種識別値、LにS-OSのバージョンを返す。(SWORDはL=20h)
_PRINT: EQU 	1FF4h	; 	F 	AccをASCIIコードとみなして表示。
_PRNTS: EQU 	1FF1h	; 	F 	スペースをひとつ表示。
_LTNL: EQU 	1FEEh	; 	なし 	改行。
_NL: EQU 	1FEBh	; 	なし 	行の先頭以外なら改行。
_MSG: EQU 	1FE8h	; 	F 	DEの示すアドレスから0Dhがあるまで表示。
_MSX: EQU 	1FE5h	; 	F 	DEの示すアドレスから00hがあるまで表示。
_MPRNT: EQU 	1FE2h	; 	AF,DE 	コールした次のアドレスから00hがあるまで表示。
_TAB: EQU 	1FDFh	; 	AF 	Bの値とX座標の差だけスペースを表示。
_LPRNT: EQU 	1FDCh	; 	AF 	AccをASCIIコードとみなしてプリンタに出力。(P6版では未実装)
_LPTON: EQU 	1FD9h	; 	なし 	#LPTSWをセットし、表示関連ルーチンでプリンタにも出力されるようにする。
_LPTOF: EQU 	1FD6h	; 	なし 	#LPTSWをリセット。
_GETL: EQU 	1FD3h	; 	AF 	1行入力。DEにバッファアドレスを入れてコール。00hで終端される。
_GETKY: EQU 	1FD0h	; 	AF 	リアルタイムキー入力。Accに返す。何も押されていなければ00h。
_BRKEY: EQU 	1FCDh	; 	AF 	ブレイクキー(P6版ではSTOPキー)が押されていればZフラグがセットされる。
_INKEY: EQU 	1FCAh	; 	AF 	キーが押されるまで待ってAccに返す。
_PAUSE: EQU 	1FC7h	; 	AF 	スペースで一時待機。STOPが押されればコールした次のアドレスに書かれたアドレスにジャンプ。
_BELL: EQU 	1FC4h	; 	AF 	ベルを鳴らす。
_PRTHX: EQU 	1FC1h	; 	AF 	Accを16進表示。
_PRTHL: EQU 	1FBEh	; 	AF 	HLを16進表示。
_ASC: EQU 	1FBBh	; 	AF 	Accの下位4ビットを"0"～"F"のASCIIコードに変換。
_HEX: EQU 	1FB8h	; 	AF 	Accを"0"～"F"のASCIIコードとみなして数値に変換。
_2HEX: EQU 	1FB5h	; 	AF,DE(+2) 	DEの示すアドレスから2バイトを16進数ASCIIコードとみなして数値に変換しAccに入れる。
_HLHEX: EQU 	1FB2h	; 	AF,HL,DE(+4) 	DEの示すアドレスから4バイトを16進数ASCIIコードとみなして数値に変換しHLに入れる。
_WOPEN: EQU 	1FAFh	; 	AF,BC,DE,HL 	#FILEでセットされた情報をヘッダやディレクトリとしてデバイスに書き込む。
_WRD: EQU 	1FACh	; 	AF,BC,DE,HL 	#FILEでセットされた情報に従ってデバイスにデータを書き込む。
_FCB: EQU 	1FA9h	; 	AF,BC,DE,HL 	デバイスからディレクトリ情報を(#IBFAD)に読み込む。ディスクの場合は(#DIRNO)の値に従って読み、インクリメントする。
_RDD: EQU 	1FA6h	; 	AF,BC,DE,HL 	ファイルを読み込む。
_FILE: EQU 	1FA3h	; 	AF,BC,DE,HL 	Accにファイル属性、DEにファイル名の入っているアドレスを入れてコールすると(#IBFAD)と(#DSK)のセットを行う。
_FSAME: EQU 	1FA0h	; 	AF,BC,DE,HL 	Accに入れたファイル属性とDEから始まるファイル名を、#FILEでセットしたものと比較する。一致すればZフラグセット。
_FPRNT: EQU 	1F9Dh	; 	AF,BC,DE,HL 	読み込んだファイル名を表示する。スペースキーで一時停止。
_POKE: EQU 	1F9Ah	; 	なし 	HLをオフセットとして、特殊ワークにAccの内容を書き込む。
_POKEat: EQU 	1F97h	; 	AF,BC,DE,HL 	メモリから特殊ワークへの転送。HLがアドレス、DEが特殊ワークオフセット、BCがバイト数。
_PEEK: EQU 	1F94h	; 	AF 	HLをオフセットとして、特殊ワークの内容をAccの内容に読み出す。
_PEEKat: EQU 	1F91h	; 	AF,BC,DE,HL 	特殊ワークからメモリへの転送。HLがアドレス、DEが特殊ワークオフセット、BCがバイト数。
_MON: EQU 	1F8Eh	; 	- 	各機種のモニタにジャンプ。
_HL_: EQU 	1F81h	; 	なし 	CALL [HL]として間接コールを行う。
_GETPC: EQU 	1F80h	; 	HL 	プログラムカウンタの値をHLにコピーする。
_DRDSB: EQU 	2000h	; 	AF,AF' 	連続セクタリード。DEが先頭レコード番号 (0から始まるセクタの通し番号)、Aがレコード数、HLが先頭アドレス。(#DSK)にデバイスA～Dをセットしてコールする。
_DWTSB: EQU 	2003h	; 	AF,AF' 	連続セクタライト。DEが先頭レコード番号、Aがレコード数、HLが先頭アドレス。(#DSK)にデバイスA～Dをセットしてコールする。
_DIR: EQU 	2006h	; 	AF,BC,DE,HL 	(#DSK)で指定したデバイスのディレクトリを表示する。
_ROPEN: EQU 	2009h	; 	AF,BC,DE,HL 	テープの場合は、#FILEでセットしたファイル名と読み込んだヘッダを比較し、同一ならZフラグセットでリターン。ディスクの場合は、ファイルが存在するかチェックする。
_SET: EQU 	200Ch	; 	AF,BC,DE,HL 	(#IBFAD)にある情報と一致するファイルをライトプロテクトする。
_RESET: EQU 	200Fh	; 	AF,BC,DE,HL 	(#IBFAD)にある情報と一致するファイルのライトプロテクトを外す。
_NAME: EQU 	2012h	; 	AF,BC,DE,HL 	#FILEでセットしたファイル名を、DEが示すメモリ上のデータに変える。
_KILL: EQU 	2015h	; 	AF,BC,DE,HL 	(#IBFAD)にある情報と一致するファイルを削除する。
_CSR: EQU 	2018h	; 	HL 	カーソル位置を読み出す。(L,H)=(X,Y)
_SCRN: EQU 	201Bh	; 	AF 	(X,Y)=(L,H)に相当する位置のキャラクタをAccに読み出す。
_LOC: EQU 	201Eh	; 	AF 	(X,Y)=(L,H)に相当する位置にカーソルを移動する。
_FLGET: EQU 	2021h	; 	AF 	カーソル位置で、カーソル点滅1文字入力を行いAccに返す。
_RDVSW: EQU 	2024h	; 	A 	デフォルトデバイスをAccに読み出す。
_SDVSW: EQU 	2027h	; 	AF 	Accに入れた値にデフォルトデバイスをセットする。
_INP: EQU 	202Ah	; 	AF 	共通I/Oポートの(ポートアドレスC)からAccに読み込む。
_OUT: EQU 	202Dh	; 	なし 	共通I/Oポートの(ポートアドレスC)にAccの値を書き込む。
_WIDCH: EQU 	2030h	; 	AF,BC,DE,HL 	画面の桁数を切り替える。Accが40以下なら40桁、40より大きいと80桁。P6版では何も起こらない。
_ERROR: EQU 	2033h	; 	AF,BC,DE,HL 	Accの値に該当するエラーメッセージを表示する。 




 org 8000h
 ;
start:
	ld	de,title 	
	call 	_msx
	;
dump:
	ld	hl,0400h
	call	_loc
	ld	hl,(ADRS)
	ld	c,16 ;	lines
dump1:	call	lndmp
	call	_ltnl
	dec	c
	jr	nz,dump1
	ret
	;
lndmp:
 push hl
 call _prthl
 pop hl
 ld b,8 ; bites
 ld e,0 ; clr sum
lndmp1: call _prnts
 ld a,(hl)
 inc hl
 ld d,a ; save a
 call _prthx
 ;
 ld a,d ; load a
 add a,e
 ld e,a ; line sum
 ;
 djnz lndmp1
 call _prnts
 ld a,':'
 call _print
 ld a,e
 call _prthx
 ret
Title:	defb	0ch ; CLear Screen
	defm	"DUMP & EDIT"

	defb	0dh,0dh
	defm	"ADRS +0 +1 +2 +3 +4 +5 +6 +7 :SUM"

	defb 	0dh,0dh
	defb	0

adrs:	defw 	8000h
