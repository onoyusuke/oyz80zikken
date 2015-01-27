; #を_に変更。[HL]は_HL_に変更。#POKE@は_POKEatに変更。#PEEK@は_PEEKatに変更。

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



;#COLD: EQU 1FFDH ; メッセージ出力後、#USRに格納されているアドレスへ。
;#HOT: EQU 1FFAH ; #が出て入力待ちとなる。
;#VER: EQU 1FF7H ; version情報をHLレジスタに返す。
;#PRINT: EQU 1FF4H ; Aレジスタの内容をアスキーコードとみなし表示。Fレジスタ破壊。
;#PRINTS: EQU 1FF1H ; スペースをひとつ表示。Fレジスタ破壊。
;#LTNL: EQU 1FEEH ; 改行
;#NL
;#MSG
;#MSX: EQU 1FE5H ; (DE)から00Hまでをアスキーコードとみなして文字列として表示。Fレジスタ破壊。
;#FLGET: EQU 2021H
;#PRTHX: EQU 1FC1H ; Aレジスタの内容を16進数2桁で表示。AFレジスタ破壊。
;#PRTHL: EQU 1FBEH ; HLレジスタの内容を16進数4桁で表示。AFレジスタ破壊。

_USR:  EQU	1F7Eh ; -1F7Fh 	コールドスタート後にジャンプするアドレス。デフォルトは#HOT。
_DVSW:  EQU	1F7Dh ;  	テープフォーマット。0:共通 1:各機種 3:QD。P6版では1がデフォルト。
_LPSW:  EQU	1F7Ch ;  	0以外なら、表示ルーチンを呼ぶとプリンタにも出力する。
_PRCNT:  EQU	1F7Ah ; -1F7Bh 	改行後に表示した文字数を格納してあるアドレス。
_XYADR:  EQU	1F78h ; -1F79h 	カーソル座標が格納してあるアドレス。
_KBFAD:  EQU	1F76h ; -1F77h 	キー入力に使えるバッファのアドレス。LD DE,(#KBFAD) CALL #GETLなどとする。P6版では内部ワークに81バイトの領域を確保してある。
_IBFAD:  EQU	1F74h ; -1F75h 	ファイルのインフォメーションブロックの先頭アドレス。同時にファイル属性のアドレスでもある。
_SIZE:  EQU	1F72h ; -1F73h 	ファイルサイズ。
_DTADR:  EQU	1F70h ; -1F71h 	ファイルの先頭アドレス。
_EXADR:  EQU	1F6Eh ; -1F6Fh 	ファイルの実行アドレス。
_STKAD:  EQU	1F6Ch ; -1F6Dh 	スタックの初期値。P6版ではF900hがデフォルト。
_MEMAX:  EQU	1F6Ah ; -1F6Bh 	ユーザエリアの上限 (最終アドレス+1)。P6版ではD000hがデフォルト。
_WKSIZ:  EQU	1F68h ; -1F69h 	特殊ワークのサイズ。P6版では2800hがデフォルト。
_DIRNO:  EQU	1F67h ;  	#FCBで使用するワーク。何番目のファイルか。
_MXTRK:  EQU	1F66h ;  	使用できる最大トラック数。P6版では40。
_DTBUF:  EQU	1F64h ; -1F65h 	ディスクリード用バッファ (256Byte) の先頭アドレス。デフォルトは2F00h。
_FATBF:  EQU	1F62h ; -1F63h 	FATリード用バッファ (256Byte) の先頭アドレス。デフォルトは2E00h。
_DIRPS:  EQU	1F60h ; -1F61h 	ディレクトリの始まるレコード番号。デフォルトは0010h (1Dではトラック1セクタ1)。
_FATPS:  EQU	1F5Eh ; -1F5Fh 	FATのあるレコード番号。デフォルトは000Eh (トラック0セクタ15)。
_DSK:  EQU	1F5Dh ;  	アクセスしようとするデバイス名。
_WIDTH:  EQU	1F5Ch ;  	画面の桁数。P6版では40。
_MXLIN:  EQU	1F5Bh ;  	画面の行数。P6版では20か25。 
