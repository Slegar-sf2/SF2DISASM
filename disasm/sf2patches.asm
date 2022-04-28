; ROM expansions
EXPANDED_ROM: equ 1                         ; 0 = OFF, 1 = ON. Build a 4MB ROM and manage SRAM mapping.
EXTENDED_SSF_MAPPER: equ 1                  ; 0 = OFF, 1 = ON. Build a 6MB ROM and manage ROM and SRAM mapping.
EXPANDED_SRAM: equ 1                        ; 0 = OFF, 1 = ON. Expands SRAM from 8KB to 32KB.
RELOCATED_SAVED_DATA_TO_SRAM: equ 1         ; 0 = OFF, 1 = ON. Relocates currently loaded saved data from system RAM to cartridge SRAM.
OPTIMIZED_ROM_LAYOUT: equ 1                 ; 0 = OFF, 1 = ON. Word align ROM sections to consolidate free space.

; Assembler optimizations
OPTIMIZED_PC_RELATIVE_ADDRESSING: equ 1     ; 0 = OFF, 1 = ON. Optimize to PC relative addressing.
OPTIMIZED_SHORT_BRANCHES: equ 1             ; 0 = OFF, 1 = ON. Optimize short branches.
OPTIMIZED_ABSOLUTE_LONG_ADDRESSING: equ 1   ; 0 = OFF, 1 = ON. Optimize absolute long addressing.
OPTIMIZED_ZERO_DISPLACEMENTS: equ 1         ; 0 = OFF, 1 = ON. Optimize zero displacements.
OPTIMIZED_ADDS_TO_QUICK_FORM: equ 1         ; 0 = OFF, 1 = ON. Optimize adds to quick form.
OPTIMIZED_SUBS_TO_QUICK_FORM: equ 1         ; 0 = OFF, 1 = ON. Optimize subtract to quick form.
OPTIMIZED_MOVE_TO_QUICK_FORM: equ 1         ; 0 = OFF, 1 = ON. Optimize move to quick form.


    ; If standard build, and either EXPANDED_ROM or EXTENDED_SSF_MAPPER are enabled, build an expanded ROM.
    if (STANDARD_BUILD&(EXPANDED_ROM!EXTENDED_SSF_MAPPER)=1)
expandedRom = 1
    else
expandedRom = 0
    endif
    
    ; If either EXPANDED_SRAM or RELOCATED_SAVED_DATA_TO_SRAM are enabled, expand SRAM.
    if (EXPANDED_SRAM!RELOCATED_SAVED_DATA_TO_SRAM=1)
expandedSram = 1
    else
expandedSram = 0
    endif
    
    
    ; Apply optional assembler optimizations.
    if (STANDARD_BUILD&OPTIMIZED_PC_RELATIVE_ADDRESSING=1)
        opt op+     ; Switches to PC relative addressing from absolute long addressing if this is permissible in the current code context.
    endif
    if (STANDARD_BUILD&OPTIMIZED_SHORT_BRANCHES=1)
        opt os+     ; Backwards relative branches will use the short form if this is permissible in the current code context.
    endif
    if (STANDARD_BUILD&OPTIMIZED_ABSOLUTE_LONG_ADDRESSING=1)
        opt ow+     ; If the absolute long addressing mode is used but the address will only occupy a word, the Assembler will switch to the short form.
    endif
    if (STANDARD_BUILD&OPTIMIZED_ZERO_DISPLACEMENTS=1)
        opt oz+     ; If the address register is used with a zero displacement, the Assembler will switch to the address register indirect mode.
    endif
    
    ; When these options are enabled, provided that it is permissible in the current code context, all ADD, SUB and MOVE instructions are coded as quick forms.
    if (STANDARD_BUILD&OPTIMIZED_ADDS_TO_QUICK_FORM=1)
        opt oaq+
    endif
    if (STANDARD_BUILD&OPTIMIZED_SUBS_TO_QUICK_FORM=1)
        opt osq+
    endif
    if (STANDARD_BUILD&OPTIMIZED_MOVE_TO_QUICK_FORM=1)
        opt omq+
    endif
