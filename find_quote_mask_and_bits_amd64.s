//+build !noasm !appengine
// AUTO-GENERATED BY C2GOASM -- DO NOT EDIT

DATA LCDATA1<>+0x000(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x008(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x010(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x018(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x020(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x028(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x030(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x038(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x040(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x048(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x050(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x058(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x060(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x068(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x070(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x078(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x080(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x088(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x090(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x098(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x0a0(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x0a8(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x0b0(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x0b8(SB)/8, $0xa0a0a0a0a0a0a0a0
GLOBL LCDATA1<>(SB), 8, $192

TEXT ·_find_quote_mask_and_bits(SB), $0-48

    MOVQ input+0(FP), DI
    MOVQ odd_ends+8(FP), DX
    MOVQ prev_iter_inside_quote+16(FP), CX
    MOVQ quote_bits+24(FP), R8
    MOVQ error_mask+32(FP), R9

    VMOVDQU    (DI), Y8          // load low 32-bytes
    VMOVDQU    0x20(DI), Y9      // load high 32-bytes

    CALL ·__find_quote_mask_and_bits(SB)

    VZEROUPPER
    MOVQ AX, quote_mask+40(FP)
    RET


TEXT ·__find_quote_mask_and_bits(SB), $0
    LEAQ LCDATA1<>(SB), BP

    VMOVDQA    Y8, Y0            // vmovdqu    ymm0, yword [rdi]
    VMOVDQA    Y9, Y1            // vmovdqu    ymm1, yword [rsi]
    VMOVDQA    (BP), Y2          // vmovdqa    ymm2, yword 0[rbp] /* [rip + LCPI0_0] */
    VPCMPEQB   Y2, Y0, Y3        // vpcmpeqb    ymm3, ymm0, ymm2
    VPMOVMSKB  Y3, AX            // vpmovmskb    eax, ymm3
    VPCMPEQB   Y2, Y1, Y2        // vpcmpeqb    ymm2, ymm1, ymm2
    VPMOVMSKB  Y2, SI            // vpmovmskb    esi, ymm2
    SHLQ       $32, SI           // shl    rsi, 32
    ORQ        AX, SI            // or    rsi, rax
    NOTQ       DX                // not    rdx
    ANDQ       SI, DX            // and    rdx, rsi
    MOVQ       DX, (R8)          // mov    qword [r8], rdx
    VMOVQ      DX, X2            // vmovq    xmm2, rdx
    VPCMPEQD   X3, X3, X3        // vpcmpeqd    xmm3, xmm3, xmm3
    VPCLMULQDQ $0, X3, X2, X2    // vpclmulqdq    xmm2, xmm2, xmm3, 0
    VMOVQ      X2, AX            // vmovq    rax, xmm2
    XORQ       (CX), AX          // xor    rax, qword [rcx]
    VMOVDQA    0x40(BP), Y2      // vmovdqa    ymm2, yword 32[rbp] /* [rip + LCPI0_1] */
    VPXOR      Y2, Y0, Y0        // vpxor    ymm0, ymm0, ymm2
    VMOVDQA    0x80(BP), Y3      // vmovdqa    ymm3, yword 64[rbp] /* [rip + LCPI0_2] */
    VPCMPGTB   Y0, Y3, Y0        // vpcmpgtb    ymm0, ymm3, ymm0
    VPMOVMSKB  Y0, DX            // vpmovmskb    edx, ymm0
    VPXOR      Y2, Y1, Y0        // vpxor    ymm0, ymm1, ymm2
    VPCMPGTB   Y0, Y3, Y0        // vpcmpgtb    ymm0, ymm3, ymm0
    VPMOVMSKB  Y0, SI            // vpmovmskb    esi, ymm0
    SHLQ       $32, SI           // shl    rsi, 32
    ORQ        DX, SI            // or    rsi, rdx
    ANDQ       AX, SI            // and    rsi, rax
    ORQ        SI, (R9)          // or    qword [r9], rsi
    MOVQ       AX, DX            // mov    rdx, rax
    SARQ       $63, DX           // sar    rdx, 63
    MOVQ       DX, (CX)          // mov    qword [rcx], rdx
    RET


TEXT ·_find_quote_mask_and_bits_avx512(SB), $0-48

    MOVQ input+0(FP), DI
    MOVQ odd_ends+8(FP), DX
    MOVQ prev_iter_inside_quote+16(FP), CX
    MOVQ quote_bits+24(FP), R8
    MOVQ error_mask+32(FP), R9

    VMOVDQU32    (DI), Z8

    CALL ·__find_quote_mask_and_bits_avx512(SB)

    VZEROUPPER
    MOVQ AX, quote_mask+40(FP)
    RET


TEXT ·__find_quote_mask_and_bits_avx512(SB), $0
    LEAQ LCDATA1<>(SB), BP

    VMOVDQA32  Z8, Z0
    VMOVDQU32  (BP), Z2
    VPCMPEQB   Z2, Z0, K1
    KMOVQ      K1, SI
    NOTQ       DX                // not    rdx
    ANDQ       SI, DX            // and    rdx, rsi
    MOVQ       DX, (R8)          // mov    qword [r8], rdx
    VMOVQ      DX, X2            // vmovq    xmm2, rdx
    VPCMPEQD   X3, X3, X3        // vpcmpeqd    xmm3, xmm3, xmm3
    VPCLMULQDQ $0, X3, X2, X2    // vpclmulqdq    xmm2, xmm2, xmm3, 0
    VMOVQ      X2, AX            // vmovq    rax, xmm2
    XORQ       (CX), AX          // xor    rax, qword [rcx]
    VMOVDQU32  0x40(BP), Z2
    VPXORD     Z2, Z0, Z0
    VMOVDQU32  0x80(BP), Z3
    VPCMPGTB   Z0, Z3, K1        // vpcmpgtb    ymm0, ymm3, ymm0
    KMOVQ      K1, SI            // or    rsi, rdx
    ANDQ       AX, SI            // and    rsi, rax
    ORQ        SI, (R9)          // or    qword [r9], rsi
    MOVQ       AX, DX            // mov    rdx, rax
    SARQ       $63, DX           // sar    rdx, 63
    MOVQ       DX, (CX)          // mov    qword [rcx], rdx
    RET
