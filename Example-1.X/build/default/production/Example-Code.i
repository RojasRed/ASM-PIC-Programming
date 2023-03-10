# 1 "Example-Code.asm"
# 1 "<built-in>" 1
# 1 "Example-Code.asm" 2
;###############################################################################
;## ##
;## Example ASM PIC18F4550 ##
;## Autor: M.C. Javier Rojas Juan ##
;## ##
;###############################################################################
LIST P = 18F4550
INCLUDE "P18F4550.INC"
; PIC18F4550 Configuration Bit Settings
; Assembly source line config statements
;Configuracion del PIC
; CONFIG1H
  CONFIG OSC = XT ; Oscillator Selection bits (XT oscillator)
  CONFIG FCMEN = OFF ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
  CONFIG IESO = OFF ; Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)
; CONFIG2L
  CONFIG PWRT = OFF ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG BOREN = SBORDIS ; Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))
  CONFIG BORV = 3 ; Brown Out Reset Voltage bits (Minimum setting)
; CONFIG2H
  CONFIG WDT = ON ; Watchdog Timer Enable bit (WDT enabled)
  CONFIG WDTPS = 32768 ; Watchdog Timer Postscale Select bits (1:32768)
; CONFIG3H
  CONFIG CCP2MX = PORTC ; CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
  CONFIG PBADEN = ON ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as analog input channels on Reset)
  CONFIG LPT1OSC = OFF ; Low-Power Timer1 Oscillator Enable bit (Timer1 configured for higher power operation)
  CONFIG MCLRE = ON ; MCLR Pin Enable bit (MCLR pin enabled; RE3 input pin disabled)
; CONFIG4L
  CONFIG STVREN = ON ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG LVP = ON ; Single-Supply ICSP Enable bit (Single-Supply ICSP enabled)
  CONFIG XINST = OFF ; Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))
; CONFIG5L
  CONFIG CP0 = OFF ; Code Protection bit (Block 0 (000800-001FFFh) not code-protected)
  CONFIG CP1 = OFF ; Code Protection bit (Block 1 (002000-003FFFh) not code-protected)
  CONFIG CP2 = OFF ; Code Protection bit (Block 2 (004000-005FFFh) not code-protected)
  CONFIG CP3 = OFF ; Code Protection bit (Block 3 (006000-007FFFh) not code-protected)
; CONFIG5H
  CONFIG CPB = OFF ; Boot Block Code Protection bit (Boot block (000000-0007FFh) not code-protected)
  CONFIG CPD = OFF ; Data EEPROM Code Protection bit (Data EEPROM not code-protected)
; CONFIG6L
  CONFIG WRT0 = OFF ; Write Protection bit (Block 0 (000800-001FFFh) not write-protected)
  CONFIG WRT1 = OFF ; Write Protection bit (Block 1 (002000-003FFFh) not write-protected)
  CONFIG WRT2 = OFF ; Write Protection bit (Block 2 (004000-005FFFh) not write-protected)
  CONFIG WRT3 = OFF ; Write Protection bit (Block 3 (006000-007FFFh) not write-protected)
; CONFIG6H
  CONFIG WRTC = OFF ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) not write-protected)
  CONFIG WRTB = OFF ; Boot Block Write Protection bit (Boot block (000000-0007FFh) not write-protected)
  CONFIG WRTD = OFF ; Data EEPROM Write Protection bit (Data EEPROM not write-protected)
; CONFIG7L
  CONFIG EBTR0 = OFF ; Table Read Protection bit (Block 0 (000800-001FFFh) not protected from table reads executed in other blocks)
  CONFIG EBTR1 = OFF ; Table Read Protection bit (Block 1 (002000-003FFFh) not protected from table reads executed in other blocks)
  CONFIG EBTR2 = OFF ; Table Read Protection bit (Block 2 (004000-005FFFh) not protected from table reads executed in other blocks)
  CONFIG EBTR3 = OFF ; Table Read Protection bit (Block 3 (006000-007FFFh) not protected from table reads executed in other blocks)
; CONFIG7H
  CONFIG EBTRB = OFF ; Boot Block Table Read Protection bit (Boot block (000000-0007FFh) not protected from table reads executed in other blocks)

;Declaricion de variables
 CBLOCK
     Dato
 ENDC

;Area de Codigo
V_RESET ORG 0x00 ; Register Initialization

;Configuracion de Oscilador
        BANKSEL OSCCON
        movlw b'01100100' ;Revisar Tabla de configuracion OSCCON
        movwf OSCCON
;Configuracion del pic
 CLRF TRISB ;Configura el puerto B como salidas, donde del bit 0 a 7, tenemos 0000 000, (0 Output, 1 input)
 CLRF PORTB ;Limpia el puerto B
;Programacion principal

;Inico es una etiqueta para la linea de codigo
 goto Inicio ;Va al inicio el programa por si ocurre un error al ejecutar el programa.
Inicio MOVLW 0xFF ;Carga 255 en Hexadecimal en el registro W, se puede usar b'11111111' o d'255'
 MOVWF PORTB ;Carga del registro W al puerto B, es decir, coloca todos los pines en 1.
 MOVLW b'000000001' ;Carga 1 al registro W.
 MOVLW PORTB ;Mueve del registro W al puerto B, solo enciende el primer bit ó PORTB,0
 goto Inicio ;Aqui se indica que se regresara al inicio para crear un bucle infinito es como un while().

;INCLUDE <Libreria.INC> ;INCLUDE sirve es para incluir libreras externas
END ;Fin del programa
