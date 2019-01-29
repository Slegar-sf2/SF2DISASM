
; ASM FILE data\maps\entries\map61\mapsetups\s3.asm :
; 0x5C696..0x5C6BE : 
ms_map61_ZoneEvents:
		msZoneEvent 4, 9, Map61_ZoneEvent0-ms_map61_ZoneEvents
		msZoneEvent 5, 9, Map61_ZoneEvent0-ms_map61_ZoneEvents
		msZoneEvent 6, 9, Map61_ZoneEvent0-ms_map61_ZoneEvents
		msDefaultZoneEvent 0, return_5C6BC-ms_map61_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map61_ZoneEvent0:
		
		 
		chkFlg  $2DA            ; set after the old man opens the door to the Woodel Panel shrine interior
		bne.s   return_5C6BC
		chkFlg  $4D             ; Old man is a follower
		beq.s   return_5C6BC
		script  cs_5C6CA
		setFlg  $2DA            ; set after the old man opens the door to the Woodel Panel shrine interior
return_5C6BC:
		rts

	; End of function Map61_ZoneEvent0

