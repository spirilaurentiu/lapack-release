.TH  CSYCON 1 "November 2006" " LAPACK routine (version 3.1) " " LAPACK routine (version 3.1) " 
.SH NAME
CSYCON - the reciprocal of the condition number (in the 1-norm) of a complex symmetric matrix A using the factorization A = U*D*U**T or A = L*D*L**T computed by CSYTRF
.SH SYNOPSIS
.TP 19
SUBROUTINE CSYCON(
UPLO, N, A, LDA, IPIV, ANORM, RCOND, WORK,
INFO )
.TP 19
.ti +4
CHARACTER
UPLO
.TP 19
.ti +4
INTEGER
INFO, LDA, N
.TP 19
.ti +4
REAL
ANORM, RCOND
.TP 19
.ti +4
INTEGER
IPIV( * )
.TP 19
.ti +4
COMPLEX
A( LDA, * ), WORK( * )
.SH PURPOSE
CSYCON estimates the reciprocal of the condition number (in the
1-norm) of a complex symmetric matrix A using the factorization
A = U*D*U**T or A = L*D*L**T computed by CSYTRF.

An estimate is obtained for norm(inv(A)), and the reciprocal of the
condition number is computed as RCOND = 1 / (ANORM * norm(inv(A))).

.SH ARGUMENTS
.TP 8
UPLO    (input) CHARACTER*1
Specifies whether the details of the factorization are stored
as an upper or lower triangular matrix.
= \(aqU\(aq:  Upper triangular, form is A = U*D*U**T;
.br
= \(aqL\(aq:  Lower triangular, form is A = L*D*L**T.
.TP 8
N       (input) INTEGER
The order of the matrix A.  N >= 0.
.TP 8
A       (input) COMPLEX array, dimension (LDA,N)
The block diagonal matrix D and the multipliers used to
obtain the factor U or L as computed by CSYTRF.
.TP 8
LDA     (input) INTEGER
The leading dimension of the array A.  LDA >= max(1,N).
.TP 8
IPIV    (input) INTEGER array, dimension (N)
Details of the interchanges and the block structure of D
as determined by CSYTRF.
.TP 8
ANORM   (input) REAL
The 1-norm of the original matrix A.
.TP 8
RCOND   (output) REAL
The reciprocal of the condition number of the matrix A,
computed as RCOND = 1/(ANORM * AINVNM), where AINVNM is an
estimate of the 1-norm of inv(A) computed in this routine.
.TP 8
WORK    (workspace) COMPLEX array, dimension (2*N)
.TP 8
INFO    (output) INTEGER
= 0:  successful exit
.br
< 0:  if INFO = -i, the i-th argument had an illegal value
