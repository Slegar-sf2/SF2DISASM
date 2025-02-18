
; ASM FILE code\gameflow\battle\battle_s13_1.asm :
; 0x1AC29C..0x1AC9B8 : Battle init, terrain, AI stuff to split more properly

; =============== S U B R O U T I N E =======================================

; Generates font from basetile font.
; Stretches characters from 1 tile to 2 tiles vertically.
; Also creates a shadow effect using palette index 2.


LoadEndCreditsFont:
                
                movea.l (p_BaseTiles).l,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                lea     (byte_FF6C02).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                moveq   #$3F,d7 
loc_1AC2BA:
                
                moveq   #7,d6
loc_1AC2BC:
                
                move.l  (a0)+,d0
                andi.l  #$22222222,d0
                eori.l  #$22222222,d0
                lsr.l   #1,d0
                move.l  d0,(a1)
                addq.l  #8,a1
                dbf     d6,loc_1AC2BC
                dbf     d7,loc_1AC2BA
                lea     (TARGETS_REACHABLE_BY_ITEM_NUMBER).l,a1
                moveq   #$3F,d7 
loc_1AC2E0:
                
                moveq   #6,d6
loc_1AC2E2:
                
                moveq   #3,d5
loc_1AC2E4:
                
                clr.b   d0
                move.b  -4(a1),d1
                andi.b  #$10,d1
                beq.w   loc_1AC302
                move.b  4(a1),d1
                andi.b  #$10,d1
                beq.w   loc_1AC302
                ori.b   #$10,d0
loc_1AC302:
                
                move.b  -4(a1),d1
                andi.b  #1,d1
                beq.w   loc_1AC31E
                move.b  4(a1),d1
                andi.b  #1,d1
                beq.w   loc_1AC31E
                ori.b   #1,d0
loc_1AC31E:
                
                move.b  d0,(a1)+
                dbf     d5,loc_1AC2E4
                addq.l  #4,a1
                dbf     d6,loc_1AC2E2
                clr.l   (a1)+
                addq.l  #4,a1
                dbf     d7,loc_1AC2E0
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a1
                clr.l   (a1)+
                move.w  #$3FE,d7
loc_1AC344:
                
                move.l  (a0)+,d0
                lsr.l   #4,d0
                mulu.w  #2,d0
                move.l  d0,(a1)+
                dbf     d7,loc_1AC344
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     (BATTLE_ENTITY_MOVE_STRING).l,a1
                move.w  #$3FE,d7
loc_1AC362:
                
                move.l  (a0),d0
                andi.l  #$11111111,d0
                mulu.w  #$F,d0
                not.l   d0
                and.l   (a1)+,d0
                or.l    d0,(a0)+
                dbf     d7,loc_1AC362
                lea     (FF8804_LOADING_SPACE).l,a0
                lea     ($2000).w,a1    ; ?
                move.w  #$800,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                rts

    ; End of function LoadEndCreditsFont


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC38E:
                
                movem.l d0/d5-a6,-(sp)
                jsr     j_GetCombatantX
                move.w  d1,d3
                jsr     j_GetCombatantY
                move.w  d1,d4
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_1AC3C2
                cmpi.b  #$FF,d2
                bne.s   loc_1AC3BE
                move.b  #$FF,d1
                bra.w   loc_1AC434
                bra.s   loc_1AC3C0
loc_1AC3BE:
                
                move.b  d2,d0
loc_1AC3C0:
                
                bra.s   loc_1AC3C4
loc_1AC3C2:
                
                move.b  d1,d0
loc_1AC3C4:
                
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   loc_1AC3DC
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   loc_1AC3DC
                move.w  #$FFFF,d5
                bra.w   loc_1AC434
loc_1AC3DC:
                
                jsr     GetAiSpecialMoveOrderCoordinates
                clr.w   d5
                cmp.w   d3,d1
                bge.s   loc_1AC3EC
                bset    #0,d5
loc_1AC3EC:
                
                cmp.w   d4,d2
                blt.s   loc_1AC3F4
                bset    #1,d5
loc_1AC3F4:
                
                btst    #0,d5
                bne.s   loc_1AC406
                subi.w  #4,d3
                tst.w   d3
                bpl.s   loc_1AC404
                clr.w   d3
loc_1AC404:
                
                bra.s   loc_1AC414
loc_1AC406:
                
                addi.w  #4,d3
                cmpi.w  #$2F,d3 
                ble.s   loc_1AC414
                move.w  #$2F,d3 
loc_1AC414:
                
                btst    #1,d5
                beq.s   loc_1AC426
                subi.w  #4,d4
                tst.w   d4
                bpl.s   loc_1AC424
                clr.w   d4
loc_1AC424:
                
                bra.s   loc_1AC434
loc_1AC426:
                
                addi.w  #4,d4
                cmpi.w  #$2F,d4 
                ble.s   loc_1AC434
                move.w  #$2F,d4 
loc_1AC434:
                
                move.b  d5,d1
                movem.l (sp)+,d0/d5-a6
                rts

    ; End of function sub_1AC38E


; =============== S U B R O U T I N E =======================================

; used by AI


GetMoveListForEnemyTarget:
                
                module
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   @IsFollowOrder  
                bra.w   @Done
                bra.s   loc_1AC456      ; unreachable code
@IsFollowOrder:
                
                move.b  d1,d0           ; d0.w = AI special move order
loc_1AC456:
                
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   @Continue       ; continue is ordered to move into position
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Continue       ; continue if combatant to follow is alive
                bra.w   @Done
@Continue:
                
                jsr     GetAiSpecialMoveOrderCoordinates
                clr.l   d5
                clr.l   d6
                move.w  d1,d5
                move.w  d2,d6
                move.w  d7,d0
                jsr     j_GetMoveInfo
                move.w  d5,d3
                move.w  d6,d4
                jsr     j_PopulateTotalMovecostsAndMovableGridArrays
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                move.w  #0,d2
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                lea     (FF4D00_LOADING_SPACE).l,a1
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   loc_1AC4B4
                bra.w   @Next
loc_1AC4B4:
                
                move.l  d3,-(sp)
                move.w  d0,d3
                move.b  (a1,d1.w),d0
                btst    #7,d0
                beq.s   loc_1AC4D0
                move.w  d3,d0
                bset    #7,d0           ; set obstruction flag
                bset    #6,d0
                move.b  d0,(a0,d1.w)
loc_1AC4D0:
                
                move.l  (sp)+,d3
@Next:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a1
                addi.w  #1,d2
                dbf     d4,@OuterLoop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function GetMoveListForEnemyTarget

                modend

; =============== S U B R O U T I N E =======================================

; something with targetting grid or ???


sub_1AC4F0:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                clr.w   d1
                move.b  d0,d1
                lea     (AI_LAST_TARGET_TABLE).l,a0
                andi.b  #$7F,d1 
                move.b  (a0,d1.w),d1
                cmpi.b  #$FF,d1
                beq.s   loc_1AC516
                bsr.w   sub_1AC5AA      
                bra.w   loc_1AC5A4
loc_1AC516:
                
                move.w  d7,d0
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_1AC52A
                bra.w   loc_1AC5A4
                bra.s   loc_1AC52C
loc_1AC52A:
                
                move.b  d1,d0
loc_1AC52C:
                
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   loc_1AC540
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   loc_1AC540
                bra.w   loc_1AC5A4
loc_1AC540:
                
                jsr     GetAiSpecialMoveOrderCoordinates
                move.w  d1,d5
                move.w  d2,d6
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
loc_1AC554:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
loc_1AC55C:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   loc_1AC56A      
                bra.w   loc_1AC576
loc_1AC56A:
                
                bset    #7,d0           ; set obstruction flags
                bset    #6,d0
                move.b  d0,(a0,d1.w)
loc_1AC576:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC55C
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,loc_1AC554
                lea     byte_1AC848(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC84B(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC854(pc), a0
                nop
                bsr.w   sub_1AC7FE      
loc_1AC5A4:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC4F0


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC5AA:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                jsr     j_GetAiSpecialMoveOrders
                cmpi.b  #$FF,d1
                bne.s   loc_1AC5C2
                bra.w   loc_1AC64E
                bra.s   loc_1AC5C4
loc_1AC5C2:
                
                move.b  d1,d0
loc_1AC5C4:
                
                btst    #COMBATANT_BIT_SORT,d0
                bne.s   loc_1AC5D8
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   loc_1AC5D8
                bra.w   loc_1AC64E
loc_1AC5D8:
                
                bsr.w   GetAiSpecialMoveOrderCoordinates
                move.w  d1,d5
                move.w  d2,d6
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
loc_1AC5EA:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
loc_1AC5F2:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   loc_1AC600      
                bra.w   loc_1AC60C
loc_1AC600:
                
                bset    #7,d0           ; set obstruction flags
                bset    #6,d0
                move.b  d0,(a0,d1.w)
loc_1AC60C:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC5F2
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,loc_1AC5EA
                lea     byte_1AC848(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC84B(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC854(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC865(pc), a0
                nop
                bsr.w   sub_1AC7FE      
                lea     byte_1AC87E(pc), a0
                nop
                bsr.w   sub_1AC7FE      
loc_1AC64E:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC5AA


; =============== S U B R O U T I N E =======================================

; Clear upper two bits from all entries in terrain array.


ClearBattleTerrainArrayObstructionFlags:
                
                movem.l d0-a6,-(sp)
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @ClearFlags
                bra.w   @Next
@ClearFlags:
                
                bclr    #7,d0
                bclr    #6,d0
                move.b  d0,(a0,d1.w)
@Next:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,@OuterLoop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearBattleTerrainArrayObstructionFlags


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC69A:
                
                movem.l d0-a6,-(sp)
                clr.l   d7
                move.b  d0,d7
                bsr.w   sub_1AC38E      
                clr.l   d6
                clr.l   d5
                move.b  d1,d5
                tst.b   d5
                bne.s   loc_1AC6C8
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC6C8:
                
                cmpi.b  #1,d5
                bne.s   loc_1AC6E6
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC6E6:
                
                cmpi.b  #3,d5
                bne.s   loc_1AC704
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #3,d1
                bsr.w   sub_1AC728      
loc_1AC704:
                
                cmpi.b  #2,d5
                bne.s   loc_1AC722
                move.b  #0,d1
                bsr.w   sub_1AC728      
                move.b  #1,d1
                bsr.w   sub_1AC728      
                move.b  #2,d1
                bsr.w   sub_1AC728      
loc_1AC722:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC69A


; =============== S U B R O U T I N E =======================================

; AI-related

var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_1AC728:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.w  d3,d6
                move.w  d4,d7
                cmpi.b  #0,d1
                bne.s   loc_1AC74E
                move.b  #0,var_1(a6)
                move.b  d7,var_2(a6)
                move.b  d6,var_3(a6)
                move.b  #$2F,var_4(a6) 
loc_1AC74E:
                
                cmpi.b  #1,d1
                bne.s   loc_1AC768
                move.b  #0,var_1(a6)
                move.b  d7,var_2(a6)
                move.b  #0,var_3(a6)
                move.b  d6,var_4(a6)
loc_1AC768:
                
                cmpi.b  #2,d1
                bne.s   loc_1AC782
                move.b  d7,var_1(a6)
                move.b  #$2F,var_2(a6) 
                move.b  #0,var_3(a6)
                move.b  d6,var_4(a6)
loc_1AC782:
                
                cmpi.b  #3,d1
                bne.s   loc_1AC79C
                move.b  d7,var_1(a6)
                move.b  #$2F,var_2(a6) 
                move.b  d6,var_3(a6)
                move.b  #$2F,var_4(a6) 
loc_1AC79C:
                
                clr.w   d4
                move.b  var_2(a6),d4
                sub.b   var_1(a6),d4
                ext.w   d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                move.b  var_1(a6),d2
                ext.w   d2
loc_1AC7B4:
                
                move.b  var_3(a6),d1
                ext.w   d1
                move.b  var_4(a6),d3
                sub.b   var_3(a6),d3
                ext.w   d3
loc_1AC7C4:
                
                movea.l a0,a1
                move.l  d2,-(sp)
                mulu.w  #48,d2
                adda.w  d2,a1
                move.l  (sp)+,d2
                move.b  (a1,d1.w),d0
                cmpi.b  #$FF,d0
                beq.s   loc_1AC7E6
                bset    #7,d0
                bset    #6,d0
                move.b  d0,(a1,d1.w)
loc_1AC7E6:
                
                addi.w  #1,d1
                dbf     d3,loc_1AC7C4
                addi.w  #1,d2
                dbf     d4,loc_1AC7B4
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function sub_1AC728


; =============== S U B R O U T I N E =======================================

; AI-related
; 
;   In: a0 = pointer to relative coordinates list
;       d5.w,d6.w = X,Y


sub_1AC7FE:
                
                movem.l d0-a1,-(sp)
                clr.w   d7
                move.b  (a0)+,d7
                subq.w  #1,d7
@Loop:
                
                move.w  d6,d2
                add.b   1(a0),d2
                cmpi.w  #MAP_SIZE_MAXHEIGHT,d2
                bcc.w   @Next
                move.w  d5,d1
                add.b   (a0),d1
                cmpi.w  #MAP_SIZE_MAXWIDTH,d1
                bcc.w   @Next
                jsr     j_GetTerrain
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                beq.s   @Next
                bclr    #7,d0           ; clear obstructed flags
                bclr    #6,d0
                jsr     j_SetTerrain
@Next:
                
                addq.l  #2,a0
                dbf     d7,@Loop
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_1AC7FE

byte_1AC848:    dc.b 1                  ; AI-related relative coordinates list
                dc.b 0, 0
byte_1AC84B:    dc.b 4                  ; AI-related relative coordinates list
                dc.b 0, 1
                dc.b 1, 0
                dc.b 0, -1
                dc.b -1, 0
byte_1AC854:    dc.b 8                  ; AI-related relative coordinates list
                dc.b 0, -2
                dc.b -1, -1
                dc.b -2, 0
                dc.b -1, 1
                dc.b 0, 2
                dc.b 1, 1
                dc.b 2, 0
                dc.b 1, -1
byte_1AC865:    dc.b 12                 ; AI-related relative coordinates list
                dc.b 0, -3
                dc.b -1, -2
                dc.b -2, -1
                dc.b -3, 0
                dc.b -2, 1
                dc.b -1, 2
                dc.b 0, 3
                dc.b 1, 2
                dc.b 2, 1
                dc.b 3, 0
                dc.b 2, -1
                dc.b 1, -2
byte_1AC87E:    dc.b 16                 ; AI-related relative coordinates list
                dc.b 0, -4
                dc.b -1, -3
                dc.b -2, -2
                dc.b -3, -1
                dc.b -4, 0
                dc.b -3, 1
                dc.b -2, 2
                dc.b -1, 3
                dc.b 0, 4
                dc.b 1, 3
                dc.b 2, 2
                dc.b 3, 1
                dc.b 4, 0
                dc.b 3, -1
                dc.b 2, -2
                dc.b 1, -3
                
                align

; =============== S U B R O U T I N E =======================================

; AI-related


GetLaserFacing:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                clr.w   d2
                move.b  (a0),d2
                lea     tbl_BattlesWithLasers(pc), a0
                nop
                clr.w   d1
                move.b  (a0)+,d1
                subi.w  #1,d1
                clr.w   d3
@CheckBattle_Loop:
                
                move.b  (a0,d3.w),d0
                cmp.b   d0,d2
                bne.s   @NextBattle
                bra.w   @BattleHasLaser
@NextBattle:
                
                addi.w  #1,d3
                dbf     d1,@CheckBattle_Loop
                
                clr.w   d3
                bra.w   @Done
@BattleHasLaser:
                
                lea     pt_LaserEnemyFacingForBattle(pc), a0
                nop
                lsl.w   #2,d3           ; make into longword offset
                movea.l (a0,d3.w),a0
                clr.w   d0
                move.b  d7,d0
                andi.w  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                clr.w   d6
                move.b  (a0,d0.w),d6    ; get entity facing
                cmpi.b  #$FF,d6
                bne.s   @ContinueToFacing
                moveq   #0,d3           ; does not laser attack, no targets
                bra.w   @Done
@ContinueToFacing:
                
                clr.w   d0
                move.b  d7,d0
                jsr     j_GetCombatantY
                move.w  d1,d2
                jsr     j_GetCombatantX
                jsr     j_ClearTotalMovecostsAndMovableGridArrays
                tst.w   d6
                bne.s   @CheckFace_Up
                addi.w  #1,d1
@CheckFace_Up:
                
                cmpi.w  #UP,d6
                bne.s   @CheckFace_Left
                subi.w  #1,d2
@CheckFace_Left:
                
                cmpi.w  #LEFT,d6
                bne.s   @CheckFace_Down
                subi.w  #1,d1
@CheckFace_Down:
                
                cmpi.w  #DOWN,d6
                bne.s   @ContinueToTargets
                addi.w  #1,d2
@ContinueToTargets:
                
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d3
@CheckSpace_Loop:
                
                jsr     j_SetMovableSpace
                jsr     j_GetCombatantOccupyingSpace
                cmpi.b  #$FF,d0
                bne.s   @TargetOnSpace
                bra.w   @CheckIncrementSpace_Right
@TargetOnSpace:
                
                move.b  d0,(a0,d3.w)
                addi.w  #1,d3
@CheckIncrementSpace_Right:
                
                tst.w   d6
                bne.s   @CheckIncrementSpace_Up
                addi.w  #1,d1
                cmpi.w  #47,d1
                ble.s   @CheckIncrementSpace_Up
                bra.w   @Done
@CheckIncrementSpace_Up:
                
                cmpi.w  #UP,d6
                bne.s   @CheckIncrementSpace_Left
                subi.w  #1,d2
                tst.w   d2
                bpl.s   @CheckIncrementSpace_Left
                bra.w   @Done
@CheckIncrementSpace_Left:
                
                cmpi.w  #LEFT,d6
                bne.s   @CheckIncrementSpace_Down
                subi.w  #1,d1
                tst.w   d1
                bpl.s   @CheckIncrementSpace_Down
                bra.w   @Done
@CheckIncrementSpace_Down:
                
                cmpi.w  #DOWN,d6
                bne.s   @NextSpace
                addi.w  #1,d2
                cmpi.w  #47,d2
                ble.s   @NextSpace
                bra.w   @Done
@NextSpace:
                
                bra.s   @CheckSpace_Loop
@Done:
                
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  d3,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function GetLaserFacing

