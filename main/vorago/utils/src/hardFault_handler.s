	.section .text
	.syntax unified
	.cpu cortex-m4
	.thumb

	.weak HardFault_Handler_C
	.weak hfhandler_asm
	.type hfhandler_asm, %function
hfhandler_asm:
	          TST    LR, #4
	          ITE    EQ
	          MRSEQ  R0, MSP
	          MRSNE  R0, PSP
	          MOV    R1, LR
	          B     HardFault_Handler_C
