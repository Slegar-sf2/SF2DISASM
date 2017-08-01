
; ASM FILE data\battles\entries\battle39\cs_beforebattle.asm :
; 0x4E3D2..0x4E4DC : Cutscene before battle 39
bbcs_39:        textCursor $BD5         ; Initial text line $BD5 : "I just heard that Geshp{N}lost.{W2}"
		loadMapFadeIn $42,$3,$5
		loadMapEntities ce_4E4AC; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		entityPosDir $7,$9,$8,$3
		entityPosDir $1F,$7,$8,$3
		entityPosDir $1E,$8,$8,$3
		jumpIfFlagClear $4C,cs_4E40C; Zynk is a follower
		entityPosDir $1A,$8,$7,$3
cs_4E40C:       jumpIfFlagClear $47,cs_4E41A; Lemon is a follower
		entityPosDir $1C,$3F,$3E,$3
cs_4E41A:       fadeInB
		csc45 $30               ; (null)
		setCamDest $3,$12
		nextText $0,$80         ; "I just heard that Geshp{N}lost.{W2}"
		nextSingleText $0,$80   ; "All greater devils have been{N}defeated except for Odd Eye.{W1}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextText $0,$80         ; "This is a good chance for us{N}to become greater devils!{W2}"
		nextSingleText $0,$80   ; "I'm sure Zeon will promote{N}us if we can get the jewel.{W1}"
		setActscript $81,$0,eas_Jump
		setActscript $82,$0,eas_Jump
		setActscript $83,$0,eas_Jump
		setActscript $84,$FF,eas_Jump
		csWait $32
		moveEntity $83,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$83   ; "Look over there!{W1}"
		moveEntity $84,$FF,$1,$1
		endMove $8080
		setEntityDir $80,$1
		setCamDest $3,$5
		csWait $3C
		setCamDest $3,$12
		nextSingleText $0,$83   ; "They're coming!{W1}"
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$18 Y=$18
		dc.b $18
		dc.b $18
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$3,$3
		endMove $8080
		setEntityDir $80,$1
		nextSingleText $0,$80   ; "Excellent!{N}Welcome to your graveyard!{W1}"
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4E4AC:       dc.b   0
		dc.b   8
		dc.w 9
		dc.w 3
		dc.b 8
		dc.b $14
		dc.b 3
		dc.b $61
		dc.l eas_Init           
		dc.b 7
		dc.b $17
		dc.b 1
		dc.b $8A
		dc.l eas_Init           
		dc.b 9
		dc.b $17
		dc.b 1
		dc.b $94
		dc.l eas_Init           
		dc.b 6
		dc.b $17
		dc.b 1
		dc.b $81
		dc.l eas_Init           
		dc.b $A
		dc.b $17
		dc.b 1
		dc.b $5F
		dc.l eas_Init           
		dc.w $FFFF
