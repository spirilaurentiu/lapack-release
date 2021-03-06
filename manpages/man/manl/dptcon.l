.TH  DPTCON 1 "November 2006" " LAPACK routine (version 3.1) " " LAPACK routine (version 3.1) " 
.SH NAME
DPTCON - the reciprocal of the condition number (in the 1-norm) of a real symmetric positive definite tridiagonal matrix using the factorization A = L*D*L**T or A = U**T*D*U computed by DPTTRF
.SH SYNOPSIS
.TP 19
SUBROUTINE DPTCON(
N, D, E, ANORM, RCOND, WORK, INFO )
.TP 19
.ti +4
INTEGER
INFO, N
.TP 19
.ti +4
DOUBLE
PRECISION ANORM, RCOND
.TP 19
.ti +4
DOUBLE
PRECISION D( * ), E( * ), WORK( * )
.SH PURPOSE
DPTCON computes the reciprocal of the condition number (in the
1-norm) of a real symmetric positive definite tridiagonal matrix
using the factorization A = L*D*L**T or A = U**T*D*U computed by
DPTTRF.

Norm(inv(A)) is computed by a direct method, and the reciprocal of
the condition number is computed as
.br
             RCOND = 1 / (ANORM * norm(inv(A))).
.br

.SH ARGUMENTS
.TP 8
N       (input) INTEGER
The order of the matrix A.  N >= 0.
.TP 8
D       (input) DOUBLE PRECISION array, dimension (N)
The n diagonal elements of the diagonal matrix D from the
factorization of A, as computed by DPTTRF.
.TP 8
E       (input) DOUBLE PRECISION array, dimension (N-1)
The (n-1) off-diagonal elements of the unit bidiagonal factor
U or L from the factorization of A,  as computed by DPTTRF.
.TP 8
ANORM   (input) DOUBLE PRECISION
The 1-norm of the original matrix A.
.TP 8
RCOND   (output) DOUBLE PRECISION
The reciprocal of the condition number of the matrix A,
computed as RCOND = 1/(ANORM * AINVNM), where AINVNM is the
1-norm of inv(A) computed in this routine.
.TP 8
WORK    (workspace) DOUBLE PRECISION array, dimension (N)
.TP 8
INFO    (output) INTEGER
= 0:  successful exit
.br
< 0:  if INFO = -i, the i-th argument had an illegal value
.SH FURTHER DETAILS
The method used is described in Nicholas J. Higham, "Efficient
Algorithms for Computing the Condition Number of a Tridiagonal
Matrix", SIAM J. Sci. Stat. Comput., Vol. 7, No. 1, January 1986.

