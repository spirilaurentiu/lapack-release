.TH  SGEESX 1 "November 2006" " LAPACK driver routine (version 3.1) " " LAPACK driver routine (version 3.1) " 
.SH NAME
SGEESX - for an N-by-N real nonsymmetric matrix A, the eigenvalues, the real Schur form T, and, optionally, the matrix of Schur vectors Z
.SH SYNOPSIS
.TP 19
SUBROUTINE SGEESX(
JOBVS, SORT, SELECT, SENSE, N, A, LDA, SDIM,
WR, WI, VS, LDVS, RCONDE, RCONDV, WORK, LWORK,
IWORK, LIWORK, BWORK, INFO )
.TP 19
.ti +4
CHARACTER
JOBVS, SENSE, SORT
.TP 19
.ti +4
INTEGER
INFO, LDA, LDVS, LIWORK, LWORK, N, SDIM
.TP 19
.ti +4
REAL
RCONDE, RCONDV
.TP 19
.ti +4
LOGICAL
BWORK( * )
.TP 19
.ti +4
INTEGER
IWORK( * )
.TP 19
.ti +4
REAL
A( LDA, * ), VS( LDVS, * ), WI( * ), WORK( * ),
WR( * )
.TP 19
.ti +4
LOGICAL
SELECT
.TP 19
.ti +4
EXTERNAL
SELECT
.SH PURPOSE
SGEESX computes for an N-by-N real nonsymmetric matrix A, the
eigenvalues, the real Schur form T, and, optionally, the matrix of
Schur vectors Z.  This gives the Schur factorization A = Z*T*(Z**T).

Optionally, it also orders the eigenvalues on the diagonal of the
real Schur form so that selected eigenvalues are at the top left;
computes a reciprocal condition number for the average of the
selected eigenvalues (RCONDE); and computes a reciprocal condition
number for the right invariant subspace corresponding to the
selected eigenvalues (RCONDV).  The leading columns of Z form an
orthonormal basis for this invariant subspace.
.br

For further explanation of the reciprocal condition numbers RCONDE
and RCONDV, see Section 4.10 of the LAPACK Users\(aq Guide (where
these quantities are called s and sep respectively).
.br

A real matrix is in real Schur form if it is upper quasi-triangular
with 1-by-1 and 2-by-2 blocks. 2-by-2 blocks will be standardized in
the form
.br
          [  a  b  ]
.br
          [  c  a  ]
.br

where b*c < 0. The eigenvalues of such a block are a +- sqrt(bc).

.SH ARGUMENTS
.TP 8
JOBVS   (input) CHARACTER*1
= \(aqN\(aq: Schur vectors are not computed;
.br
= \(aqV\(aq: Schur vectors are computed.
.TP 8
SORT    (input) CHARACTER*1
Specifies whether or not to order the eigenvalues on the
diagonal of the Schur form.
= \(aqN\(aq: Eigenvalues are not ordered;
.br
= \(aqS\(aq: Eigenvalues are ordered (see SELECT).
.TP 8
SELECT  (external procedure) LOGICAL FUNCTION of two REAL arguments
SELECT must be declared EXTERNAL in the calling subroutine.
If SORT = \(aqS\(aq, SELECT is used to select eigenvalues to sort
to the top left of the Schur form.
If SORT = \(aqN\(aq, SELECT is not referenced.
An eigenvalue WR(j)+sqrt(-1)*WI(j) is selected if
SELECT(WR(j),WI(j)) is true; i.e., if either one of a
complex conjugate pair of eigenvalues is selected, then both
are.  Note that a selected complex eigenvalue may no longer
satisfy SELECT(WR(j),WI(j)) = .TRUE. after ordering, since
ordering may change the value of complex eigenvalues
(especially if the eigenvalue is ill-conditioned); in this
case INFO may be set to N+3 (see INFO below).
.TP 8
SENSE   (input) CHARACTER*1
Determines which reciprocal condition numbers are computed.
= \(aqN\(aq: None are computed;
.br
= \(aqE\(aq: Computed for average of selected eigenvalues only;
.br
= \(aqV\(aq: Computed for selected right invariant subspace only;
.br
= \(aqB\(aq: Computed for both.
If SENSE = \(aqE\(aq, \(aqV\(aq or \(aqB\(aq, SORT must equal \(aqS\(aq.
.TP 8
N       (input) INTEGER
The order of the matrix A. N >= 0.
.TP 8
A       (input/output) REAL array, dimension (LDA, N)
On entry, the N-by-N matrix A.
On exit, A is overwritten by its real Schur form T.
.TP 8
LDA     (input) INTEGER
The leading dimension of the array A.  LDA >= max(1,N).
.TP 8
SDIM    (output) INTEGER
If SORT = \(aqN\(aq, SDIM = 0.
If SORT = \(aqS\(aq, SDIM = number of eigenvalues (after sorting)
for which SELECT is true. (Complex conjugate
pairs for which SELECT is true for either
eigenvalue count as 2.)
.TP 8
WR      (output) REAL array, dimension (N)
WI      (output) REAL array, dimension (N)
WR and WI contain the real and imaginary parts, respectively,
of the computed eigenvalues, in the same order that they
appear on the diagonal of the output Schur form T.  Complex
conjugate pairs of eigenvalues appear consecutively with the
eigenvalue having the positive imaginary part first.
.TP 8
VS      (output) REAL array, dimension (LDVS,N)
If JOBVS = \(aqV\(aq, VS contains the orthogonal matrix Z of Schur
vectors.
If JOBVS = \(aqN\(aq, VS is not referenced.
.TP 8
LDVS    (input) INTEGER
The leading dimension of the array VS.  LDVS >= 1, and if
JOBVS = \(aqV\(aq, LDVS >= N.
.TP 8
RCONDE  (output) REAL
If SENSE = \(aqE\(aq or \(aqB\(aq, RCONDE contains the reciprocal
condition number for the average of the selected eigenvalues.
Not referenced if SENSE = \(aqN\(aq or \(aqV\(aq.
.TP 8
RCONDV  (output) REAL
If SENSE = \(aqV\(aq or \(aqB\(aq, RCONDV contains the reciprocal
condition number for the selected right invariant subspace.
Not referenced if SENSE = \(aqN\(aq or \(aqE\(aq.
.TP 8
WORK    (workspace/output) REAL array, dimension (MAX(1,LWORK))
On exit, if INFO = 0, WORK(1) returns the optimal LWORK.
.TP 8
LWORK   (input) INTEGER
The dimension of the array WORK.  LWORK >= max(1,3*N).
Also, if SENSE = \(aqE\(aq or \(aqV\(aq or \(aqB\(aq,
LWORK >= N+2*SDIM*(N-SDIM), where SDIM is the number of
selected eigenvalues computed by this routine.  Note that
N+2*SDIM*(N-SDIM) <= N+N*N/2. Note also that an error is only
returned if LWORK < max(1,3*N), but if SENSE = \(aqE\(aq or \(aqV\(aq or
\(aqB\(aq this may not be large enough.
For good performance, LWORK must generally be larger.

If LWORK = -1, then a workspace query is assumed; the routine
only calculates upper bounds on the optimal sizes of the
arrays WORK and IWORK, returns these values as the first
entries of the WORK and IWORK arrays, and no error messages
related to LWORK or LIWORK are issued by XERBLA.
.TP 8
IWORK   (workspace/output) INTEGER array, dimension (MAX(1,LIWORK))
On exit, if INFO = 0, IWORK(1) returns the optimal LIWORK.
.TP 8
LIWORK  (input) INTEGER
The dimension of the array IWORK.
LIWORK >= 1; if SENSE = \(aqV\(aq or \(aqB\(aq, LIWORK >= SDIM*(N-SDIM).
Note that SDIM*(N-SDIM) <= N*N/4. Note also that an error is
only returned if LIWORK < 1, but if SENSE = \(aqV\(aq or \(aqB\(aq this
may not be large enough.

If LIWORK = -1, then a workspace query is assumed; the
routine only calculates upper bounds on the optimal sizes of
the arrays WORK and IWORK, returns these values as the first
entries of the WORK and IWORK arrays, and no error messages
related to LWORK or LIWORK are issued by XERBLA.
.TP 8
BWORK   (workspace) LOGICAL array, dimension (N)
Not referenced if SORT = \(aqN\(aq.
.TP 8
INFO    (output) INTEGER
= 0: successful exit
.br
< 0: if INFO = -i, the i-th argument had an illegal value.
.br
> 0: if INFO = i, and i is
.br
<= N: the QR algorithm failed to compute all the
.br
eigenvalues; elements 1:ILO-1 and i+1:N of WR and WI
contain those eigenvalues which have converged; if
JOBVS = \(aqV\(aq, VS contains the transformation which
reduces A to its partially converged Schur form.
= N+1: the eigenvalues could not be reordered because some
eigenvalues were too close to separate (the problem
is very ill-conditioned);
= N+2: after reordering, roundoff changed values of some
complex eigenvalues so that leading eigenvalues in
the Schur form no longer satisfy SELECT=.TRUE.  This
could also be caused by underflow due to scaling.
