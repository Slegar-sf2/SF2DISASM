
; ASM FILE data\maps\entries\map56\mapsetups\s2.asm :
; 0x614AA..0x614D6 : 
ms_map56_EntityEvents:
		msEntityEvent 128, UP, sub_614B2-ms_map56_EntityEvents
		msDefaultEntityEvent 0, entevdft_614D4-ms_map56_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_614B2:
		 
		chkFlg $387             ; set after the first time you talk to Creed on path up Ancient Tower
		bne.s   byte_614C2      
		lea     cs_6150A(pc), a0
		trap    #6
		setFlg $387             ; set after the first time you talk to Creed on path up Ancient Tower
byte_614C2:
		txt $E1B                ; "There is no church around{N}here.  Think of me as a{N}priest.{W1}"
		txt $E1C                ; "Now, what can I do for you?{W1}"
		clsTxt
		jmp     j_ChurchActions
entevdft_614D4:
		
		rts

	; End of function sub_614B2

