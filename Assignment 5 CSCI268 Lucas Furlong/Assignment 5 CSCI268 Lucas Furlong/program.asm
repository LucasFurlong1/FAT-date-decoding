; 
; Assembly Language Project  
;

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
include irvine32.inc
.data

intro BYTE "Date entered: ", 0
m BYTE "Month: ", 0
d BYTE "Day: ", 0
y BYTE "Year: ", 0
day BYTE 0
month BYTE 0
year WORD 0
tmp BYTE 0

.code
FATDate proc

push ecx
push esi
push edi
push esp
push ebp

mov bl, al
and bl, 31
ror ax, 5
mov bh, al
and bh, 15
ror ax, 4
mov tmp, al
movzx dx, tmp
and dx, 127

pop ebp
pop esp
pop edi
pop esi
pop ecx
ret

FATDate endp

main proc

mov edx, OFFSET intro
call WriteString
call Crlf
mov ax, 3285h ; April 5th 2005
;mov ax, 54ffh ; July 31 2022
call FATDate
mov day, bl
mov month, bh
mov year, dx
mov edx, OFFSET m
call WriteString
movzx eax, month
call WriteInt
call Crlf
mov edx, OFFSET d
call WriteString
movzx eax, day
call WriteInt
call Crlf
mov edx, OFFSET y
call WriteString
add year, 1980
movzx eax, year
call WriteInt
call Crlf


	invoke ExitProcess,0
main endp
end main