	.text
	.file	"tailcall.ll"
	.globl	tailcaller
	.align	16, 0x90
	.type	tailcaller,@function
tailcaller:                             # @tailcaller
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp0:
	.cfi_def_cfa_offset 16
                                        # kill: ESI<def> ESI<kill> RSI<def>
                                        # kill: EDI<def> EDI<kill> RDI<def>
	leal	(%rdi,%rsi), %ecx
                                        # kill: ESI<def> ESI<kill> RSI<kill>
	movl	%edi, %edx
	popq	%rax
	jmp	tailcallee              # TAILCALL
.Lfunc_end0:
	.size	tailcaller, .Lfunc_end0-tailcaller
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
