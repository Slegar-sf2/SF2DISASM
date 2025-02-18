
; ASM FILE code\gameflow\battle\battlescenes\getbattlescenebackground.asm :
; 0x19DFE..0x19E5E : Get battlescene background function

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
; Out: d1.w = battlescene background index


GetBattlesceneBackground:
                
                movem.l d0/a0,-(sp)
                cmpi.w  #$FFFF,d0
                beq.s   @CheckCustomBackground
                cmpi.w  #COMBATANT_ENEMIES_START,d0
                bcs.s   @CheckCustomBackground
                jsr     j_GetEnemy
                cmpi.w  #ENEMY_ZEON,d1  ; HARDCODED : if enemy is Zeon, get his own background
                bne.s   @CheckCustomBackground
                moveq   #BATTLEBACKGROUND_VERSUS_ZEON,d1
                bra.w   @Done
@CheckCustomBackground:
                
                clr.w   d1
                move.b  ((CURRENT_BATTLE-$1000000)).w,d1
                lea     tbl_CustomBackgrounds(pc), a0
                move.b  (a0,d1.w),d1    ; get battle's own background if it has one
                cmpi.b  #$FF,d1
                bne.w   @Done
                cmpi.w  #$FFFF,d0
                bne.s   @GetTerrainBackground
                move.w  ((word_FFB3FE-$1000000)).w,d0
                cmpi.w  #$FFFF,d0
                bne.s   @GetTerrainBackground
                clr.w   d0
@GetTerrainBackground:
                
                jsr     j_GetCurrentTerrainType
                andi.w  #$F,d0          ; get background according to terrain type
                move.b  tbl_TerrainBackgrounds(pc,d0.w),d1
                ext.w   d1
@Done:
                
                movem.l (sp)+,d0/a0
                rts

    ; End of function GetBattlesceneBackground

