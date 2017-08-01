
; ASM FILE data\maps\entries\map14\mapsetups\s3.asm :
; 0x58E48..0x58EBA : 
ms_map14_ZoneEvents:
		dc.b $2D
		dc.b 5
		dc.w sub_58E50-ms_map14_ZoneEvents
		dc.w $FD00
		dc.w return_58E5A-ms_map14_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_58E50:
		lea     cs_58E5C(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $101
return_58E5A:
		rts

	; End of function sub_58E50

cs_58E5C:       textCursor $8D5         ; Initial text line $8D5 : "Bring up the plank?"
		nextText $FF,$FF        ; "Bring up the plank?"
		yesNo                   ; 0011 STORY YESNO PROMPT
		jumpIfFlagClear $59,cs_58EB8; YES/NO prompt answer
		hideText                ; 0009 HIDE TEXTBOX AND PORTRAIT
		moveEntity $0,$FF,$3,$1 ; 002D MOVE ENTITY 0 FF 3 1
		endMove $8080
		csWait $28              ; WAIT 28
		setActscript $83,$FF,eas_46172; 0015 SET ACTSCRIPT 83 FF 46172
		setActscript $84,$FF,eas_46172; 0015 SET ACTSCRIPT 84 FF 46172
		setActscript $85,$FF,eas_46172; 0015 SET ACTSCRIPT 85 FF 46172
		moveEntity $0,$0,$3,$3  ; 002D MOVE ENTITY 0 0 3 3
		endMove $8080
		moveEntity $83,$0,$3,$3 ; 002D MOVE ENTITY 83 0 3 3
		endMove $8080
		moveEntity $84,$0,$3,$3 ; 002D MOVE ENTITY 84 0 3 3
		endMove $8080
		moveEntity $85,$FF,$3,$3; 002D MOVE ENTITY 85 FF 3 3
		endMove $8080
		mapSysEvent $E0D0B03    ; 0007 EXECUTE MAP SYSTEM EVENT E0D0B03
cs_58EB8:       csc_end                 ; END OF CUTSCENE SCRIPT
