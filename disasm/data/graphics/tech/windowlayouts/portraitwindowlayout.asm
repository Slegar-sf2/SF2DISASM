
; ASM FILE data\graphics\tech\windowlayouts\portraitwindowlayout.asm :
; 0x126EE..0x1278E : Member screen portrait window layout
PortraitWindowLayout:
                
                ; 1st line
                dc.w VDPTILE_PORTRAIT_WINDOW_CORNER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_CORNER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 2nd line
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $7C5|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7C4|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7C3|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7C2|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7C1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7C0|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 3rd line
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $7CD|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7CC|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7CB|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7CA|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7C9|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7C8|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 4th line
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $7D5|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7D4|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7D3|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7D2|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7D1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7D0|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 5th line
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $7DD|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7DC|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7DB|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7DA|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7D9|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7D8|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 6th line
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $7E5|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7E4|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7E3|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7E2|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7E1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7E0|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 7th line
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $7ED|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7EC|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7EB|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7EA|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7E9|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7E8|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 8th line
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $7F5|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7F4|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7F3|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7F2|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7F1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7F0|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 8th line
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $7FD|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7FC|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7FB|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7FA|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7F9|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w $7F8|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE2|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 9th line
                dc.w VDPTILE_PORTRAIT_WINDOW_CORNER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_PORTRAIT_WINDOW_CORNER|VDPTILE_MIRRORED_BIT|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT