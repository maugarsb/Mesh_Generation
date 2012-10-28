MODULE DATA_MANAGER
  IMPLICIT NONE
  !*************************************************************
  TYPE DATA
     DOUBLE PRECISION :: data
  END TYPE DATA
  DOUBLE PRECISION,PARAMETER :: beta = 5.D0
  DOUBLE PRECISION,PARAMETER :: gamma = 1.4D0
  DOUBLE PRECISION,PARAMETER :: pInf = 1.D0/gamma
  DOUBLE PRECISION,PARAMETER :: rhoInf = 1.D0
  DOUBLE PRECISION,PARAMETER :: tInf = pInf
  DOUBLE PRECISION,PARAMETER :: uInf = sqrt(2.D0)
  DOUBLE PRECISION,PARAMETER :: vinf = sqrt(2.D0)
  DOUBLE PRECISION,PARAMETER :: aInf = sqrt(gamma*pInf/rhoInf)
  DOUBLE PRECISION,PARAMETER :: machInf = uInf/aInf
  DOUBLE PRECISION,PARAMETER :: SInf = pInf/(rhoInf**gamma)
  DOUBLE PRECISION,PARAMETER :: x0 = -10.D0
  DOUBLE PRECISION,PARAMETER :: y0 = -10.D0
  DOUBLE PRECISION,PARAMETER :: pi = 4*atan(1.D0)
  !*************************************************************

CONTAINS


END MODULE DATA_MANAGER
