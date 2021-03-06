.TH  ZLANGE 1 "November 2006" " LAPACK auxiliary routine (version 3.1) " " LAPACK auxiliary routine (version 3.1) " 
.SH NAME
ZLANGE - the value of the one norm, or the Frobenius norm, or the infinity norm, or the element of largest absolute value of a complex matrix A
.SH SYNOPSIS
.TP 17
DOUBLE PRECISION
FUNCTION ZLANGE( NORM, M, N, A, LDA, WORK )
.TP 17
.ti +4
CHARACTER
NORM
.TP 17
.ti +4
INTEGER
LDA, M, N
.TP 17
.ti +4
DOUBLE
PRECISION WORK( * )
.TP 17
.ti +4
COMPLEX*16
A( LDA, * )
.SH PURPOSE
ZLANGE  returns the value of the one norm,  or the Frobenius norm, or
the  infinity norm,  or the  element of  largest absolute value  of a
complex matrix A.

.SH DESCRIPTION
ZLANGE returns the value
.br

   ZLANGE = ( max(abs(A(i,j))), NORM = \(aqM\(aq or \(aqm\(aq
.br
            (
.br
            ( norm1(A),         NORM = \(aq1\(aq, \(aqO\(aq or \(aqo\(aq
.br
            (
.br
            ( normI(A),         NORM = \(aqI\(aq or \(aqi\(aq
.br
            (
.br
            ( normF(A),         NORM = \(aqF\(aq, \(aqf\(aq, \(aqE\(aq or \(aqe\(aq

where  norm1  denotes the  one norm of a matrix (maximum column sum),
normI  denotes the  infinity norm  of a matrix  (maximum row sum) and
normF  denotes the  Frobenius norm of a matrix (square root of sum of
squares).  Note that  max(abs(A(i,j)))  is not a consistent matrix norm.

.SH ARGUMENTS
.TP 8
NORM    (input) CHARACTER*1
Specifies the value to be returned in ZLANGE as described
above.
.TP 8
M       (input) INTEGER
The number of rows of the matrix A.  M >= 0.  When M = 0,
ZLANGE is set to zero.
.TP 8
N       (input) INTEGER
The number of columns of the matrix A.  N >= 0.  When N = 0,
ZLANGE is set to zero.
.TP 8
A       (input) COMPLEX*16 array, dimension (LDA,N)
The m by n matrix A.
.TP 8
LDA     (input) INTEGER
The leading dimension of the array A.  LDA >= max(M,1).
.TP 8
WORK    (workspace) DOUBLE PRECISION array, dimension (MAX(1,LWORK)),
where LWORK >= M when NORM = \(aqI\(aq; otherwise, WORK is not
referenced.
