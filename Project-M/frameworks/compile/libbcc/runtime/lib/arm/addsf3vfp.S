//===-- addsf3vfp.S - Implement addsf3vfp ---------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "../assembly.h"

//
// extern float __addsf3vfp(float a, float b);
//
// Adds two single precision floating point numbers using the Darwin
// calling convention where single arguments are passsed in GPRs
//
DEFINE_COMPILERRT_FUNCTION(__addsf3vfp)
	fmsr	s14, r0		// move first param from r0 into float register
	fmsr	s15, r1		// move second param from r1 into float register
	fadds	s14, s14, s15
	fmrs	r0, s14		// move result back to r0
	bx	lr
