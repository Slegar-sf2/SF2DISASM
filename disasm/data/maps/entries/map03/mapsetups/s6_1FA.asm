
; ASM FILE data\maps\entries\map03\mapsetups\s6_1FA.asm :
; 0x51360..0x51382 : 

; =============== S U B R O U T I N E =======================================

ms_map3_flag1FA_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w 6                  ; Kiwi joined
		beq.s   loc_5136C
		lea     cs_51374(pc), a0
		trap    #6
loc_5136C:
		lea     cs_5137A(pc), a0
		trap    #6
		rts

	; End of function ms_map3_flag1FA_InitFunction

cs_51374:       hideEntity $6           ; 002E HIDE ENTITY 6
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5137A:       playSound MUSIC_SAD_THEME_2; 0005 PLAY SOUND MUSIC_SAD_THEME_2
		fadeInB                 ; 0039 FADE IN FROM BLACK
		csc_end                 ; END OF CUTSCENE SCRIPT
