; COMSC-142 - First Program in Assembly Language
; Doing the 'Happy Visage' from our first C program in assembly language
; Student Name: Koichi Nakata


; Define the system call and I/O ** CONSTANTS ** 
SYS_WRITE  equ  1          ; write text to stdout
SYS_EXIT   equ  60         ; terminate the program
STDIN      equ  0          ; standard input (not used here)
STDOUT     equ  1          ; standard output

section .data
msg1  db  10, " \\\\\\\\\\\\\\\\ " ; db = define byte--each char is 1 byte
msg2  db  10, " +\^\^\^\^\^\^\^+ " ; 10 = ASCII value for newline
msg3  db  10, "    (| o   o |)   "
msg4  db  10, "     |   ^   |    "
msg5  db  10, "     |  '-'  |    "
msg6  db  10, "     +-------+    "

; \\\\\\\\\\\\\\\\
; +\^\^\^\^\^\^\^+
;    (| o   o |)    
;     |   ^   | 
;     |  '-'  | 
;     +-------+


len1 equ $ - msg1
; $ = current location counter
; msg1 represent the offset memory location of the beginning of msg1
; Therefore, $ - msg1 yields the length of msg1 to msg6 in byte


global _start              ; The code always resides in the _start(s)
section .text   

_start:
  mov  rdx,  len1          ; rdx = len1--how many chars to display
  mov  rsi,  msg1          ; rsi = msg1--mem loc of beginning of msg1
  mov  rdi,  STDOUT        ; rdi = STDOUT identifier
  mov  rax,  SYS_WRITE     ; rax = WRITE identifier 

  syscall                  ; Invokes procedure stored in rax--WRITE
                           ; WRITE procedure takes 
                           ; 1. rdx: how many chars to display
                           ; 2. rsi: value's memory location
                           ; 3. rdi: STD Output identifier (isn't it obvious??)

  xor  rdi,  rdi           ; Want to assign 0 to rdi before succesfully exiting
                           ; Whatever rdi stores, XORing the same value yields 0
  mov  rax,  SYS_EXIT      ; rax = EXIT identifier to end the program
  syscall                  ; Invokes procedure stored in rax-Exit