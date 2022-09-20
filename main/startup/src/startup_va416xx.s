	.syntax unified
	.arch armv7-m
	.section .stack
	.align 3
#ifdef __STACK_SIZE
	.equ	Stack_Size, __STACK_SIZE
#else
	.equ	Stack_Size, 0x00000400
#endif

	.globl __StackTop
	.globl __StackLimit
__StackLimit:
Stack_Mem:
	.space Stack_Size
	.size __StackLimit, . - __StackLimit
__StackTop:
	.size __StackTop, . - __StackTop
	.section .heap
	.align 3
#ifdef __HEAP_SIZE
	.equ	Heap_Size, __HEAP_SIZE
#else
	.equ	Heap_Size, 0x00000C00
#endif

	.globl	__HeapBase
	.globl	__HeapLimit

__HeapBase:
Heap_Mem:
	.if	Heap_Size
	.space	Heap_Size
	.endif
	.size	__HeapBase, . - __HeapBase
__HeapLimit:
	.size	__HeapLimit, . - __HeapLimit

	.section .vectors
	.align 2
	.globl	__Vectors

/* Vector Table Mapped to Address 0 at Reset */

__Vectors:
	        .long     __StackTop                /*  Top of Stack */
                .long     Reset_Handler             /*  Reset Handler */
                .long     NMI_Handler               /*  NMI Handler */
                .long     HardFault_Handler         /*  Hard Fault Handler */
                .long     MemManage_Handler         /*  MPU Fault Handler */
                .long     BusFault_Handler          /*  Bus Fault Handler */
                .long     UsageFault_Handler        /*  Usage Fault Handler */
                .long     0                         /*  Reserved */
                .long     0                         /*  Reserved */
                .long     0                         /*  Reserved */
                .long     0                         /*  Reserved */
                .long     SVC_Handler               /*  SVCall Handler */
                .long     DebugMon_Handler          /*  Debug Monitor Handler */
                .long     0                         /*  Reserved */
                .long     PendSV_Handler            /*  PendSV Handler */
                .long     SysTick_Handler           /*  SysTick Handler */

                /*  External Interrupts */
                .long     OC0_IRQHandler             /*   0: Always 0 */
                .long     OC1_IRQHandler             /*   1: Always 0 */
                .long     OC2_IRQHandler             /*   2: Always 0 */
                .long     OC3_IRQHandler             /*   3: Always 0 */
                .long     OC4_IRQHandler             /*   4: Always 0 */
                .long     OC5_IRQHandler             /*   5: Always 0 */
                .long     OC6_IRQHandler             /*   6: Always 0 */
                .long     OC7_IRQHandler             /*   7: Always 0 */
                .long     OC8_IRQHandler             /*   8: Always 0 */
                .long     OC9_IRQHandler             /*   9: Always 0 */
                .long     OC10_IRQHandler            /*  10: Always 0 */
                .long     OC11_IRQHandler            /*  11: Always 0 */
                .long     OC12_IRQHandler            /*  12: Always 0 */
                .long     OC13_IRQHandler            /*  13: Always 0 */
                .long     OC14_IRQHandler            /*  14: Always 0 */
                .long     OC15_IRQHandler            /*  15: Always 0 */
                .long     SPI0_TX_IRQHandler         /*  16: SPI0 TX */
                .long     SPI0_RX_IRQHandler         /*  17: SPI0 RX */
                .long     SPI1_TX_IRQHandler         /*  18: SPI1 TX */
                .long     SPI1_RX_IRQHandler         /*  19: SPI1 RX */
                .long     SPI2_TX_IRQHandler         /*  20: SPI2 TX */
                .long     SPI2_RX_IRQHandler         /*  21: SPI2 RX */
                .long     SPI3_TX_IRQHandler         /*  22: SPI3 TX */
                .long     SPI3_RX_IRQHandler         /*  23: SPI3 RX */
                .long     UART0_TX_IRQHandler        /*  24: UART0 TX */
                .long     UART0_RX_IRQHandler        /*  25: UART0 RX */
                .long     UART1_TX_IRQHandler        /*  26: UART1 TX */
                .long     UART1_RX_IRQHandler        /*  27: UART1 RX */
                .long     UART2_TX_IRQHandler        /*  28: UART2 TX */
                .long     UART2_RX_IRQHandler        /*  29: UART2 RX */
                .long     I2C0_MS_IRQHandler         /*  30: I2C0_MS */
                .long     I2C0_SL_IRQHandler         /*  31: I2C0_SL */
                .long     I2C1_MS_IRQHandler         /*  32: I2C1_MS */
                .long     I2C1_SL_IRQHandler         /*  33: I2C1_SL */
                .long     I2C2_MS_IRQHandler         /*  34: I2C2_MS */
                .long     I2C2_SL_IRQHandler         /*  35: I2C2_SL */
                .long     Ethernet_IRQHandler        /*  36: Ethernet TX */
                .long     OC37_IRQHandler            /*  37: Always 0 */
                .long     SpW_IRQHandler             /*  38: Space Wire */
                .long     OC39_IRQHandler            /*  39: Always 0 */
                .long     DAC0_IRQHandler            /*  40: DAC 0 */
                .long     DAC1_IRQHandler            /*  41: DAC 1 */
                .long     TRNG_IRQHandler            /*  42: Random Number Generator */
                .long     DMA_Error_IRQHandler       /*  43: DMA error */
                .long     ADC_IRQHandler             /*  44: ADC */
                .long     LoCLK_IRQHandler           /*  45: LoCLK */
                .long     LVD_IRQHandler             /*  46: LVD */
                .long     WDT_IRQHandler             /*  47: Watchdog */
                .long     TIM0_IRQHandler            /*  48: Timer 0 */
                .long     TIM1_IRQHandler            /*  49: Timer 1 */
                .long     TIM2_IRQHandler            /*  50: Timer 2 */
                .long     TIM3_IRQHandler            /*  51: Timer 3 */
                .long     TIM4_IRQHandler            /*  52: Timer 4 */
                .long     TIM5_IRQHandler            /*  53: Timer 5 */
                .long     TIM6_IRQHandler            /*  54: Timer 6 */
                .long     TIM7_IRQHandler            /*  55: Timer 7 */
                .long     TIM8_IRQHandler            /*  56: Timer 8 */
                .long     TIM9_IRQHandler            /*  57: Timer 9 */
                .long     TIM10_IRQHandler           /*  58: Timer 10 */
                .long     TIM11_IRQHandler           /*  59: Timer 11 */
                .long     TIM12_IRQHandler           /*  60: Timer 12 */
                .long     TIM13_IRQHandler           /*  61: Timer 13 */
                .long     TIM14_IRQHandler           /*  62: Timer 14 */
                .long     TIM15_IRQHandler           /*  63: Timer 15 */
                .long     TIM16_IRQHandler           /*  64: Timer 16 */
                .long     TIM17_IRQHandler           /*  65: Timer 17 */
                .long     TIM18_IRQHandler           /*  66: Timer 18 */
                .long     TIM19_IRQHandler           /*  67: Timer 19 */
                .long     TIM20_IRQHandler           /*  68: Timer 20 */
                .long     TIM21_IRQHandler           /*  69: Timer 21 */
                .long     TIM22_IRQHandler           /*  70: Timer 22 */
                .long     TIM23_IRQHandler           /*  71: Timer 23 */
                .long     CAN0_IRQHandler            /*  72: CAN 0 */
                .long     OC73_IRQHandler            /*  73: Always 0 */
                .long     CAN1_IRQHandler            /*  74: CAN 1 */
                .long     OC75_IRQHandler            /*  75: Always 0 */
                .long     EDAC_MBE_IRQHandler        /*  76: EDAC Multi Bit Error */
                .long     EDAC_SBE_IRQHandler        /*  77: EDAC Single Bit Error */
                .long     PA0_IRQHandler             /*  78: PORTA 0 */
                .long     PA1_IRQHandler             /*  79: PORTA 1 */
                .long     PA2_IRQHandler             /*  80: PORTA 2 */
                .long     PA3_IRQHandler             /*  81: PORTA 3 */
                .long     PA4_IRQHandler             /*  82: PORTA 4 */
                .long     PA5_IRQHandler             /*  83: PORTA 5 */
                .long     PA6_IRQHandler             /*  84: PORTA 6 */
                .long     PA7_IRQHandler             /*  85: PORTA 7 */
                .long     PA8_IRQHandler             /*  86: PORTA 8 */
                .long     PA9_IRQHandler             /*  87: PORTA 9 */
                .long     PA10_IRQHandler            /*  88: PORTA 10 */
                .long     PA11_IRQHandler            /*  89: PORTA 11 */
                .long     PA12_IRQHandler            /*  90: PORTA 12 */
                .long     PA13_IRQHandler            /*  91: PORTA 13 */
                .long     PA14_IRQHandler            /*  92: PORTA 14 */
                .long     PA15_IRQHandler            /*  93: PORTA 15 */
                .long     PB0_IRQHandler             /*  94: PORTB 0 */
                .long     PB1_IRQHandler             /*  95: PORTB 1 */
                .long     PB2_IRQHandler             /*  96: PORTB 2 */
                .long     PB3_IRQHandler             /*  97: PORTB 3 */
                .long     PB4_IRQHandler             /*  98: PORTB 4 */
                .long     PB5_IRQHandler             /*  99: PORTB 5 */
                .long     PB6_IRQHandler             /*  100: PORTB 6 */
                .long     PB7_IRQHandler             /*  101: PORTB 7 */
                .long     PB8_IRQHandler             /*  102: PORTB 8 */
                .long     PB9_IRQHandler             /*  103: PORTB 9 */
                .long     PB10_IRQHandler            /*  104: PORTB 10 */
                .long     PB11_IRQHandler            /*  105: PORTB 11 */
                .long     PB12_IRQHandler            /*  106: PORTB 12 */
                .long     PB13_IRQHandler            /*  107: PORTB 13 */
                .long     PB14_IRQHandler            /*  108: PORTB 14 */
                .long     PB15_IRQHandler            /*  109: PORTB 15 */
                .long     PC0_IRQHandler             /*  110: PORTC 0 */
                .long     PC1_IRQHandler             /*  111: PORTC 1 */
                .long     PC2_IRQHandler             /*  112: PORTC 2 */
                .long     PC3_IRQHandler             /*  113: PORTC 3 */
                .long     PC4_IRQHandler             /*  114: PORTC 4 */
                .long     PC5_IRQHandler             /*  115: PORTC 5 */
                .long     PC6_IRQHandler             /*  116: PORTC 6 */
                .long     PC7_IRQHandler             /*  117: PORTC 7 */
                .long     PC8_IRQHandler             /*  118: PORTC 8 */
                .long     PC9_IRQHandler             /*  119: PORTC 9 */
                .long     PC10_IRQHandler            /*  120: PORTC 10 */
                .long     PC11_IRQHandler            /*  121: PORTC 11 */
                .long     PC12_IRQHandler            /*  122: PORTC 12 */
                .long     PC13_IRQHandler            /*  123: PORTC 13 */
                .long     PC14_IRQHandler            /*  124: PORTC 14 */
                .long     PC15_IRQHandler            /*  125: PORTC 15 */
                .long     PD0_IRQHandler             /*  126: PORTD 0 */
                .long     PD1_IRQHandler             /*  127: PORTD 1 */
                .long     PD2_IRQHandler             /*  128: PORTD 2 */
                .long     PD3_IRQHandler             /*  129: PORTD 3 */
                .long     PD4_IRQHandler             /*  130: PORTD 4 */
                .long     PD5_IRQHandler             /*  131: PORTD 5 */
                .long     PD6_IRQHandler             /*  132: PORTD 6 */
                .long     PD7_IRQHandler             /*  133: PORTD 7 */
                .long     PD8_IRQHandler             /*  134: PORTD 8 */
                .long     PD9_IRQHandler             /*  135: PORTD 9 */
                .long     PD10_IRQHandler            /*  136: PORTD 10 */
                .long     PD11_IRQHandler            /*  137: PORTD 11 */
                .long     PD12_IRQHandler            /*  138: PORTD 12 */
                .long     PD13_IRQHandler            /*  139: PORTD 13 */
                .long     PD14_IRQHandler            /*  140: PORTD 14 */
                .long     PD15_IRQHandler            /*  141: PORTD 15 */
                .long     PE0_IRQHandler             /*  142: PORTE 0 */
                .long     PE1_IRQHandler             /*  143: PORTE 1 */
                .long     PE2_IRQHandler             /*  144: PORTE 2 */
                .long     PE3_IRQHandler             /*  145: PORTE 3 */
                .long     PE4_IRQHandler             /*  146: PORTE 4 */
                .long     PE5_IRQHandler             /*  147: PORTE 5 */
                .long     PE6_IRQHandler             /*  148: PORTE 6 */
                .long     PE7_IRQHandler             /*  149: PORTE 7 */
                .long     PE8_IRQHandler             /*  150: PORTE 8 */
                .long     PE9_IRQHandler             /*  151: PORTE 9 */
                .long     PE10_IRQHandler            /*  152: PORTE 10 */
                .long     PE11_IRQHandler            /*  153: PORTE 11 */
                .long     PE12_IRQHandler            /*  154: PORTE 12 */
                .long     PE13_IRQHandler            /*  155: PORTE 13 */
                .long     PE14_IRQHandler            /*  156: PORTE 14 */
                .long     PE15_IRQHandler            /*  157: PORTE 15 */
                .long     PF0_IRQHandler             /*  158: PORTF 0 */
                .long     PF1_IRQHandler             /*  159: PORTF 1 */
                .long     PF2_IRQHandler             /*  160: PORTF 2 */
                .long     PF3_IRQHandler             /*  161: PORTF 3 */
                .long     PF4_IRQHandler             /*  162: PORTF 4 */
                .long     PF5_IRQHandler             /*  163: PORTF 5 */
                .long     PF6_IRQHandler             /*  164: PORTF 6 */
                .long     PF7_IRQHandler             /*  165: PORTF 7 */
                .long     PF8_IRQHandler             /*  166: PORTF 8 */
                .long     PF9_IRQHandler             /*  167: PORTF 9 */
                .long     PF10_IRQHandler            /*  168: PORTF 10 */
                .long     PF11_IRQHandler            /*  169: PORTF 11 */
                .long     PF12_IRQHandler            /*  170: PORTF 12 */
                .long     PF13_IRQHandler            /*  171: PORTF 13 */
                .long     PF14_IRQHandler            /*  172: PORTF 14 */
                .long     PF15_IRQHandler            /*  173: PORTF 15 */
                .long     DMA_Active_0_IRQHandler    /*  174: DMA Active 0 */
                .long     DMA_Active_1_IRQHandler    /*  175: DMA Active 1 */
                .long     DMA_Active_2_IRQHandler    /*  176: DMA Active 2 */
                .long     DMA_Active_3_IRQHandler    /*  177: DMA Active 3 */
                .long     DMA_Done_0_IRQHandler      /*  178: DMA Done 0 */
                .long     DMA_Done_1_IRQHandler      /*  179: DMA Done 1 */
                .long     DMA_Done_2_IRQHandler      /*  180: DMA Done 2 */
                .long     DMA_Done_3_IRQHandler      /*  181: DMA Done 3 */
                .long     I2C0_MS_RX_IRQHandler      /*  182: I2C0 Master RX */
                .long     I2C0_MS_TX_IRQHandler      /*  183: I2C0 Master TX */
                .long     I2C0_SL_RX_IRQHandler      /*  184: I2C0 Slave RX */
                .long     I2C0_SL_TX_IRQHandler      /*  185: I2C0 Slave TX */
                .long     I2C1_MS_RX_IRQHandler      /*  186: I2C1 Master RX */
                .long     I2C1_MS_TX_IRQHandler      /*  187: I2C1 Master TX */
                .long     I2C1_SL_RX_IRQHandler      /*  188: I2C1 Slave RX */
                .long     I2C1_SL_TX_IRQHandler      /*  189: I2C1 Slave TX */
                .long     I2C2_MS_RX_IRQHandler      /*  190: I2C2 Master RX */
                .long     I2C2_MS_TX_IRQHandler      /*  191: I2C2 Master TX */
                .long     I2C2_SL_RX_IRQHandler      /*  192: I2C2 Slave RX */
                .long     I2C2_SL_TX_IRQHandler      /*  193: I2C2 Slave TX */
                .long     FPU_IRQHandler             /*  194: FPU */
                .long     TXEV_IRQHandler            /*  195: TXEV */
		.size	__Vectors, . - __Vectors

__Vectors_End:
		.equ	__Vectors_Size, . - __Vectors


		.section .text
		.thumb
		.thumb_func
		.align 2
		.globl	Reset_Handler
		.type	Reset_Handler, %function	

Reset_Handler:
                LDR     R0, =SystemInit
                BLX     R0

		LDR	R0, =main
                BX      R0
		.pool
		.size Reset_Handler, . - Reset_Handler


		.align 1
		.thumb_func
		.weak Default_Handler
		.type Default_Handler, %function
Default_Handler:
		B	.
		.size Default_Handler, . - Default_Handler


		/* macro for default handlers that dead-end to loops on themselves */

		.macro def_irq_handler	handler_name
		.weak	\handler_name
		.set	\handler_name,	Default_Handler
		.endm

		def_irq_handler NMI_Handler
               	def_irq_handler HardFault_Handler
                def_irq_handler MemManage_Handler
                def_irq_handler BusFault_Handler
                def_irq_handler UsageFault_Handler
                def_irq_handler SVC_Handler
                def_irq_handler DebugMon_Handler
                def_irq_handler PendSV_Handler

                def_irq_handler  OC0_IRQHandler
                def_irq_handler  OC1_IRQHandler
                def_irq_handler  OC2_IRQHandler
                def_irq_handler  OC3_IRQHandler
                def_irq_handler  OC4_IRQHandler
                def_irq_handler  OC5_IRQHandler
                def_irq_handler  OC6_IRQHandler
                def_irq_handler  OC7_IRQHandler
                def_irq_handler  OC8_IRQHandler
                def_irq_handler  OC9_IRQHandler
                def_irq_handler  OC10_IRQHandler
                def_irq_handler  OC11_IRQHandler
                def_irq_handler  OC12_IRQHandler
                def_irq_handler  OC13_IRQHandler
                def_irq_handler  OC14_IRQHandler
                def_irq_handler  OC15_IRQHandler
                def_irq_handler  SPI0_TX_IRQHandler
                def_irq_handler  SPI0_RX_IRQHandler
                def_irq_handler  SPI1_TX_IRQHandler
                def_irq_handler  SPI1_RX_IRQHandler
                def_irq_handler  SPI2_TX_IRQHandler
                def_irq_handler  SPI2_RX_IRQHandler
                def_irq_handler  SPI3_TX_IRQHandler
                def_irq_handler  SPI3_RX_IRQHandler
                def_irq_handler  UART0_TX_IRQHandler
                def_irq_handler  UART0_RX_IRQHandler
                def_irq_handler  UART1_TX_IRQHandler
                def_irq_handler  UART1_RX_IRQHandler
                def_irq_handler  UART2_TX_IRQHandler
                def_irq_handler  UART2_RX_IRQHandler
                def_irq_handler  I2C0_MS_IRQHandler
                def_irq_handler  I2C0_SL_IRQHandler
                def_irq_handler  I2C1_MS_IRQHandler
                def_irq_handler  I2C1_SL_IRQHandler
                def_irq_handler  I2C2_MS_IRQHandler
                def_irq_handler  I2C2_SL_IRQHandler
                def_irq_handler  Ethernet_IRQHandler
                def_irq_handler  OC37_IRQHandler
                def_irq_handler  SpW_IRQHandler
                def_irq_handler  OC39_IRQHandler
                def_irq_handler  DAC0_IRQHandler
                def_irq_handler  DAC1_IRQHandler
                def_irq_handler  TRNG_IRQHandler
                def_irq_handler  DMA_Error_IRQHandler
                def_irq_handler  ADC_IRQHandler
                def_irq_handler  LoCLK_IRQHandler
                def_irq_handler  LVD_IRQHandler
                def_irq_handler  WDT_IRQHandler
                def_irq_handler  TIM0_IRQHandler
                def_irq_handler  TIM1_IRQHandler
                def_irq_handler  TIM2_IRQHandler
                def_irq_handler  TIM3_IRQHandler
                def_irq_handler  TIM4_IRQHandler
                def_irq_handler  TIM5_IRQHandler
                def_irq_handler  TIM6_IRQHandler
                def_irq_handler  TIM7_IRQHandler
                def_irq_handler  TIM8_IRQHandler
                def_irq_handler  TIM9_IRQHandler
                def_irq_handler  TIM10_IRQHandler
                def_irq_handler  TIM11_IRQHandler
                def_irq_handler  TIM12_IRQHandler
                def_irq_handler  TIM13_IRQHandler
                def_irq_handler  TIM14_IRQHandler
                def_irq_handler  TIM15_IRQHandler
                def_irq_handler  TIM16_IRQHandler
                def_irq_handler  TIM17_IRQHandler
                def_irq_handler  TIM18_IRQHandler
                def_irq_handler  TIM19_IRQHandler
                def_irq_handler  TIM20_IRQHandler
                def_irq_handler  TIM21_IRQHandler
                def_irq_handler  TIM22_IRQHandler
                def_irq_handler  TIM23_IRQHandler
                def_irq_handler  CAN0_IRQHandler
                def_irq_handler  OC73_IRQHandler
                def_irq_handler  CAN1_IRQHandler
                def_irq_handler  OC75_IRQHandler
                def_irq_handler  EDAC_MBE_IRQHandler
                def_irq_handler  EDAC_SBE_IRQHandler
                def_irq_handler  PA0_IRQHandler
                def_irq_handler  PA1_IRQHandler
                def_irq_handler  PA2_IRQHandler
                def_irq_handler  PA3_IRQHandler
                def_irq_handler  PA4_IRQHandler
                def_irq_handler  PA5_IRQHandler
                def_irq_handler  PA6_IRQHandler
                def_irq_handler  PA7_IRQHandler
                def_irq_handler  PA8_IRQHandler
                def_irq_handler  PA9_IRQHandler
                def_irq_handler  PA10_IRQHandler
                def_irq_handler  PA11_IRQHandler
                def_irq_handler  PA12_IRQHandler
                def_irq_handler  PA13_IRQHandler
                def_irq_handler  PA14_IRQHandler
                def_irq_handler  PA15_IRQHandler
                def_irq_handler  PB0_IRQHandler
                def_irq_handler  PB1_IRQHandler
                def_irq_handler  PB2_IRQHandler
                def_irq_handler  PB3_IRQHandler
                def_irq_handler  PB4_IRQHandler
                def_irq_handler  PB5_IRQHandler
                def_irq_handler  PB6_IRQHandler
                def_irq_handler  PB7_IRQHandler
                def_irq_handler  PB8_IRQHandler
                def_irq_handler  PB9_IRQHandler
                def_irq_handler  PB10_IRQHandler
                def_irq_handler  PB11_IRQHandler
                def_irq_handler  PB12_IRQHandler
                def_irq_handler  PB13_IRQHandler
                def_irq_handler  PB14_IRQHandler
                def_irq_handler  PB15_IRQHandler
                def_irq_handler  PC0_IRQHandler
                def_irq_handler  PC1_IRQHandler
                def_irq_handler  PC2_IRQHandler
                def_irq_handler  PC3_IRQHandler
                def_irq_handler  PC4_IRQHandler
                def_irq_handler  PC5_IRQHandler
                def_irq_handler  PC6_IRQHandler
                def_irq_handler  PC7_IRQHandler
                def_irq_handler  PC8_IRQHandler
                def_irq_handler  PC9_IRQHandler
                def_irq_handler  PC10_IRQHandler
                def_irq_handler  PC11_IRQHandler
                def_irq_handler  PC12_IRQHandler
                def_irq_handler  PC13_IRQHandler
                def_irq_handler  PC14_IRQHandler
                def_irq_handler  PC15_IRQHandler
                def_irq_handler  PD0_IRQHandler
                def_irq_handler  PD1_IRQHandler
                def_irq_handler  PD2_IRQHandler
                def_irq_handler  PD3_IRQHandler
                def_irq_handler  PD4_IRQHandler
                def_irq_handler  PD5_IRQHandler
                def_irq_handler  PD6_IRQHandler
                def_irq_handler  PD7_IRQHandler
                def_irq_handler  PD8_IRQHandler
                def_irq_handler  PD9_IRQHandler
                def_irq_handler  PD10_IRQHandler
                def_irq_handler  PD11_IRQHandler
                def_irq_handler  PD12_IRQHandler
                def_irq_handler  PD13_IRQHandler
                def_irq_handler  PD14_IRQHandler
                def_irq_handler  PD15_IRQHandler
                def_irq_handler  PE0_IRQHandler
                def_irq_handler  PE1_IRQHandler
                def_irq_handler  PE2_IRQHandler
                def_irq_handler  PE3_IRQHandler
                def_irq_handler  PE4_IRQHandler
                def_irq_handler  PE5_IRQHandler
                def_irq_handler  PE6_IRQHandler
                def_irq_handler  PE7_IRQHandler
                def_irq_handler  PE8_IRQHandler
                def_irq_handler  PE9_IRQHandler
                def_irq_handler  PE10_IRQHandler
                def_irq_handler  PE11_IRQHandler
                def_irq_handler  PE12_IRQHandler
                def_irq_handler  PE13_IRQHandler
                def_irq_handler  PE14_IRQHandler
                def_irq_handler  PE15_IRQHandler
                def_irq_handler  PF0_IRQHandler
                def_irq_handler  PF1_IRQHandler
                def_irq_handler  PF2_IRQHandler
                def_irq_handler  PF3_IRQHandler
                def_irq_handler  PF4_IRQHandler
                def_irq_handler  PF5_IRQHandler
                def_irq_handler  PF6_IRQHandler
                def_irq_handler  PF7_IRQHandler
                def_irq_handler  PF8_IRQHandler
                def_irq_handler  PF9_IRQHandler
                def_irq_handler  PF10_IRQHandler
                def_irq_handler  PF11_IRQHandler
                def_irq_handler  PF12_IRQHandler
                def_irq_handler  PF13_IRQHandler
                def_irq_handler  PF14_IRQHandler
                def_irq_handler  PF15_IRQHandler
                def_irq_handler  DMA_Active_0_IRQHandler
                def_irq_handler  DMA_Active_1_IRQHandler
                def_irq_handler  DMA_Active_2_IRQHandler
                def_irq_handler  DMA_Active_3_IRQHandler
                def_irq_handler  DMA_Done_0_IRQHandler
                def_irq_handler  DMA_Done_1_IRQHandler
                def_irq_handler  DMA_Done_2_IRQHandler
                def_irq_handler  DMA_Done_3_IRQHandler
                def_irq_handler  I2C0_MS_RX_IRQHandler
                def_irq_handler  I2C0_MS_TX_IRQHandler
                def_irq_handler  I2C0_SL_RX_IRQHandler
                def_irq_handler  I2C0_SL_TX_IRQHandler
                def_irq_handler  I2C1_MS_RX_IRQHandler
                def_irq_handler  I2C1_MS_TX_IRQHandler
                def_irq_handler  I2C1_SL_RX_IRQHandler
                def_irq_handler  I2C1_SL_TX_IRQHandler
                def_irq_handler  I2C2_MS_RX_IRQHandler
                def_irq_handler  I2C2_MS_TX_IRQHandler
                def_irq_handler  I2C2_SL_RX_IRQHandler
                def_irq_handler  I2C2_SL_TX_IRQHandler
                def_irq_handler  FPU_IRQHandler
                def_irq_handler  TXEV_IRQHandler

/*  User Initial Stack & Heap */

/*
                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE
*/

/*
                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap
*/

		.thumb_func
		.align 2
		.globl __user_initial_stackheap
__user_initial_stackheap:
                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR
              	.pool 
		.size __user_initial_stackheap, . -  __user_initial_stackheap

		.end
