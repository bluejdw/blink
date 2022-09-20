	.section .text
	.syntax unified
	.cpu cortex-m4
	.thumb

	.weak vector_reset
	.type vector_reset, %function
vector_reset:
              LDR R0,=0xE000ED08 
              LDR R1,[R0]
              LDR R0,[R1]
              MOV SP, R0
              LDR R0,[R1, #4]
              BX R0
