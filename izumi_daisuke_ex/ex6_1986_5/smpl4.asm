db "_SOS 01 8000 8000."

db 0xed
db 0x4b
db 0x12
db 0x80

db 0x21
db 0x14
db 0x80

db 0x11
db 0x00
db 0x90
; push DE
db 0xd5
; LDIR
db 0xed, 0xb0
; pop DE
db 0xd1
; jump 
db 0xcd
db 0xe8
db 0x1f
; ret
db 0xc9
; data
; 0x8012
dw 38
; 0x8014
db "BANG BANG MAXWELL'S "
db "SYLBER HAMMER ..."
db 0x0d
