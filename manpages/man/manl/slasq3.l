.TH  SLASQ3 1 "November 2006" " LAPACK auxiliary routine (version 3.1) " " LAPACK auxiliary routine (version 3.1) " 
.SH NAME
SLASQ3 - for deflation, computes a shift (TAU) and calls dqds
.SH SYNOPSIS
.TP 19
SUBROUTINE SLASQ3(
I0, N0, Z, PP, DMIN, SIGMA, DESIG, QMAX, NFAIL,
ITER, NDIV, IEEE )
.TP 19
.ti +4
LOGICAL
IEEE
.TP 19
.ti +4
INTEGER
I0, ITER, N0, NDIV, NFAIL, PP
.TP 19
.ti +4
REAL
DESIG, DMIN, QMAX, SIGMA
.TP 19
.ti +4
REAL
Z( * )
.SH PURPOSE
SLASQ3 checks for deflation, computes a shift (TAU) and calls dqds.
In case of failure it changes shifts, and tries again until output
is positive.
.br

.SH ARGUMENTS
.TP 7
I0     (input) INTEGER
First index.
.TP 7
N0     (input) INTEGER
Last index.
.TP 7
Z      (input) REAL array, dimension ( 4*N )
Z holds the qd array.
.TP 7
PP     (input) INTEGER
PP=0 for ping, PP=1 for pong.
.TP 7
DMIN   (output) REAL
Minimum value of d.
.TP 7
SIGMA  (output) REAL
Sum of shifts used in current segment.
.TP 7
DESIG  (input/output) REAL
Lower order part of SIGMA
.TP 7
QMAX   (input) REAL
Maximum value of q.
.TP 7
NFAIL  (output) INTEGER
Number of times shift was too big.
.TP 7
ITER   (output) INTEGER
Number of iterations.
.TP 7
NDIV   (output) INTEGER
Number of divisions.
.TP 7
TTYPE  (output) INTEGER
Shift type.
.TP 7
IEEE   (input) LOGICAL
Flag for IEEE or non IEEE arithmetic (passed to SLASQ5).
