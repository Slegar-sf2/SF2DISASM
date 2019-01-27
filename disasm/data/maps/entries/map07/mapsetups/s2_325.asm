
; ASM FILE data\maps\entries\map07\mapsetups\s2_325.asm :
; 0x55584..0x5579E : 
ms_map7_flag325_EntityEvents:
		msEntityEvent 128, DOWN, sub_5561E-ms_map7_flag325_EntityEvents
		msEntityEvent 129, DOWN, sub_555E8-ms_map7_flag325_EntityEvents
		msEntityEvent 130, DOWN, sub_55648-ms_map7_flag325_EntityEvents
		msEntityEvent 131, UP, sub_5565E-ms_map7_flag325_EntityEvents
		msEntityEvent 132, DOWN, sub_55674-ms_map7_flag325_EntityEvents
		msEntityEvent 133, DOWN, sub_556B2-ms_map7_flag325_EntityEvents
		msEntityEvent 134, UP, sub_556E4-ms_map7_flag325_EntityEvents
		msEntityEvent 135, DOWN, sub_55702-ms_map7_flag325_EntityEvents
		msEntityEvent 136, DOWN, sub_55730-ms_map7_flag325_EntityEvents
		msEntityEvent 137, DOWN, sub_55776-ms_map7_flag325_EntityEvents
		msEntityEvent 138, DOWN, sub_5577C-ms_map7_flag325_EntityEvents
		msDefaultEntityEvent 0, entevdft_5579C-ms_map7_flag325_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_555B4:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   return_555E6
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   byte_555CE      
		txt $48A                ; "Time goes by very quickly....{W2}"
		txt $48B                ; "Those two jewels around{N}your neck will always{N}remind me of that...!{W2}"
		txt $48C                ; "The chain is made of{N}Mithril.  It can't be cut!{W1}"
		bra.s   return_555E6
byte_555CE:
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   byte_555E2      
		txt $4A4                ; "{LEADER}, you can't{N}understand my regret....{W2}"
		txt $4A5                ; "It was the last chance to see{N}Volcanon in my{N}lifetime!{W1}"
		setFlg $100             ; Temporary map setup flag 00
		bra.s   return_555E6
byte_555E2:
		txt $4A6                ; "{LEADER}, I expect{N}you to find a lot of{N}allies!{W1}"
return_555E6:
		rts

	; End of function sub_555B4


; =============== S U B R O U T I N E =======================================

sub_555E8:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_55618      
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   byte_55602      
		txt $484                ; "I feel Elis is still alive....{W2}"
		txt $485                ; "{LEADER}, please prepare{N}a ship for me.{W2}"
		txt $486                ; "I would like to go back to{N}Grans to find her.{W1}"
		bra.s   loc_55616
byte_55602:
		chkFlg $2BF             ; set after the scene where Bowie brings the plank above deck, also set after the initial Ribble scene, where the guy runs away
		bne.s   byte_55612      
		txt $4A7                ; "Gee, Parmecia is full{N}of wonders!{W2}"
		txt $4A8                ; "Phoenix, Volcanon...it's{N}like living a myth!{W1}"
		bra.s   loc_55616
byte_55612:
		txt $4A9                ; "Elis is alive.{N}I can feel it!{W1}"
loc_55616:
		bra.s   return_5561C
byte_55618:
		txt $4D5                ; "{LEADER}, please find{N}the Princess.{W1}"
return_5561C:
		rts

	; End of function sub_555E8


; =============== S U B R O U T I N E =======================================

sub_5561E:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_5563E      
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   byte_55638      
		txt $487                ; "Is everything OK,{N}{LEADER}?{W2}"
		txt $488                ; "Can these young men guard{N}our new town?{W2}"
		txt $489                ; "The King is no longer what{N}he was.{W1}"
		bra.s   loc_5563C
byte_55638:
		txt $4AA                ; "The prosperity of Granseal{N}rests in your hands!{W1}"
loc_5563C:
		bra.s   return_55646
byte_5563E:
		txt $4D6                ; "The King is unaware of{N}Sir Astral's idea.{W2}"
		txt $4D7                ; "The most important thing is{N}to defeat the devils!{W1}"
return_55646:
		rts

	; End of function sub_5561E


; =============== S U B R O U T I N E =======================================

sub_55648:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_55658      
		txt $495                ; "I'm told to stand watch{N}here.{W2}"
		txt $496                ; "But, look!  Nothing!{N}What am I watching?{W1}"
		bra.s   return_5565C
byte_55658:
		txt $4D8                ; "How long should I keep{N}guard here?{W1}"
return_5565C:
		rts

	; End of function sub_55648


; =============== S U B R O U T I N E =======================================

sub_5565E:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_5566E      
		txt $498                ; "I can't believe it!{N}This isn't Granseal!{W2}"
		txt $499                ; "I want to go back to{N}Grans Island.{W1}"
		bra.s   return_55672
byte_5566E:
		txt $4D9                ; "To Grans Island?  But, I{N}like Parmecia now!{W1}"
return_55672:
		rts

	; End of function sub_5565E


; =============== S U B R O U T I N E =======================================

sub_55674:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_556A0      
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   byte_5569A      
		chkFlg $2BD             ; set after the scene with Peter and the kids in New Granseal
		bne.s   byte_55694      
		txt $490                ; "I envy you, {LEADER}.{W2}"
		txt $491                ; "You can act freely, even{N}in the castle.{W2}"
		txt $492                ; "I have to stand here{N}everyday. {W1}"
		bra.s   loc_55698
byte_55694:
		txt $4A1                ; "{LEADER}, go see{N}Sir Astral!{W1}"
loc_55698:
		bra.s   loc_5569E
byte_5569A:
		txt $4AB                ; "While {LEADER} is away,{N}we'll guard the castle!{W1}"
loc_5569E:
		bra.s   return_556B0
byte_556A0:
		chkFlg $325             ; set after coming back to New Granseal after Creed's Mansion,when Astral joins
		bne.s   byte_556AC      
		txt $4A1                ; "{LEADER}, go see{N}Sir Astral!{W1}"
		bra.s   return_556B0
byte_556AC:
		txt $4DA                ; "We'll guard Granseal while{N}you're away!{W1}"
return_556B0:
		rts

	; End of function sub_55674


; =============== S U B R O U T I N E =======================================

sub_556B2:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_556DA      
		chkFlg $2BD             ; set after the scene with Peter and the kids in New Granseal
		bne.s   byte_556C4      
		txt $49A                ; "Granseal Castle!{N}Hee, hee...I'm cool!{W1}"
		bra.s   loc_556D8
byte_556C4:
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   byte_556D4      
		txt $49D                ; "Grans...oh!{W2}"
		txt $49E                ; "{LEADER}, you're here!{N}Sir Astral is waiting.{W1}"
		bra.s   loc_556D8
byte_556D4:
		txt $49A                ; "Granseal Castle!{N}Hee, hee...I'm cool!{W1}"
loc_556D8:
		bra.s   return_556E2
byte_556DA:
		txt $4DB                ; "Your pass, please!{W2}"
		txt $4DC                ; "Of course, you don't have to{N}show one, {LEADER}!{N}Go ahead!{W1}"
return_556E2:
		rts

	; End of function sub_556B2


; =============== S U B R O U T I N E =======================================

sub_556E4:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_556FC      
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   byte_556F6      
		txt $497                ; "Tactical Base!{N}Ah, you knew that?{W1}"
		bra.s   loc_556FA
byte_556F6:
		txt $4AC                ; "Tactical Base!{N}Nobody has visited here{N}lately....{W1}"
loc_556FA:
		bra.s   return_55700
byte_556FC:
		txt $4DD                ; "Tactical Base!{N}Why don't you talk to your{N}friends, {LEADER}?{W1}"
return_55700:
		rts

	; End of function sub_556E4


; =============== S U B R O U T I N E =======================================

sub_55702:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_5572A      
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   byte_55724      
		chkFlg $2BD             ; set after the scene with Peter and the kids in New Granseal
		bne.s   byte_5571E      
		txt $493                ; "At least there is no danger{N}in the castle.{W2}"
		txt $494                ; "I've never seen such strange{N}races!{W1}"
		bra.s   loc_55722
byte_5571E:
		txt $4A1                ; "{LEADER}, go see{N}Sir Astral!{W1}"
loc_55722:
		bra.s   loc_55728
byte_55724:
		txt $4AD                ; "I'll miss you, {LEADER}...{N}but do not worry!{W1}"
loc_55728:
		bra.s   return_5572E
byte_5572A:
		txt $4DE                ; "{LEADER}, you'll be{N}surprised to see the results{N}of my practice!{W1}"
return_5572E:
		rts

	; End of function sub_55702


; =============== S U B R O U T I N E =======================================

sub_55730:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_55760      
		chkFlg $2BD             ; set after the scene with Peter and the kids in New Granseal
		bne.s   byte_55746      
		txt $49B                ; "You need permission to enter!{W2}"
		txt $49C                ; "I was told to say that,{N}but nobody ever comes!{W1}"
		bra.s   loc_5575E
byte_55746:
		chkFlg $2BE             ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   byte_55756      
		txt $49F                ; "The Minister and Sir{N}Astral are inside.{W2}"
		txt $4A0                ; "They're giving a warm{N}reception to a guest.{W1}"
		bra.s   loc_5575E
byte_55756:
		txt $49B                ; "You need permission to enter!{W2}"
		txt $49C                ; "I was told to say that,{N}but nobody ever comes!{W1}"
loc_5575E:
		bra.s   return_55774
byte_55760:
		chkFlg $325             ; set after coming back to New Granseal after Creed's Mansion,when Astral joins
		bne.s   byte_5576C      
		txt $4DF                ; "Hello, {LEADER}.{N}The King is waiting.{W1}"
		bra.s   return_55774
byte_5576C:
		txt $49B                ; "You need permission to enter!{W2}"
		txt $49C                ; "I was told to say that,{N}but nobody ever comes!{W1}"
return_55774:
		rts

	; End of function sub_55730


; =============== S U B R O U T I N E =======================================

sub_55776:
		 
		txt $48D                ; "Oh, the King looks so sad.{W1}"
		rts

	; End of function sub_55776


; =============== S U B R O U T I N E =======================================

sub_5577C:
		 
		chkFlg $322             ; set after the event in the basement of Creed's Mansion
		bne.s   byte_5578C      
		txt $48E                ; "(Yaaawn)...Oh, excuse me.{N}I'm tired because of the{N}Minister.{W2}"
		txt $48F                ; "He and Sir Astral talk{N}late every night.{W1}"
		bra.s   return_55790
byte_5578C:
		txt $4E0                ; "See?  Our guards are getting{N}tougher day by day.{W1}"
return_55790:
		rts

	; End of function sub_5577C


; =============== S U B R O U T I N E =======================================

sub_55792:
		 
		txt $4A2                ; "{LEADER}, something{N}important is happening.{W1}"
		rts

	; End of function sub_55792


; =============== S U B R O U T I N E =======================================

sub_55798:
		 
		txt $4A3                ; "{LEADER}, Sir Astral is{N}over there. {W1}"
entevdft_5579C:
		
		rts

	; End of function sub_55798

