run_switches:                           # @run_switches
        xor     eax, eax
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
        movsx   ecx, byte ptr [rdi]
        test    ecx, ecx
        je      .LBB0_6
        inc     rdi
        cmp     ecx, 112
        je      .LBB0_5
        cmp     ecx, 115
        jne     .LBB0_1
        inc     eax
        jmp     .LBB0_1
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
        dec     eax
        jmp     .LBB0_1
.LBB0_6:
        ret