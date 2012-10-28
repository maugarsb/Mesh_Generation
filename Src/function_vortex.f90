DOUBLE PRECISION FUNCTION fRho(x1,x2)
  USE DATA_MANAGER
  IMPLICIT NONE
  !************************************************
  DOUBLE PRECISION,INTENT(in) :: x1,x2
  DOUBLE PRECISION :: x,y
  DOUBLE PRECISION :: r,t
  !************************************************
  
  !------------------
  x = x1 - x0
  y = x2 - y0
  !------------------
  r = SQRT(x**2+y**2)
  t = tInf-(gamma-1.D0)*beta**2/(8.D0*gamma*pi**2)*EXP(1-r**2)
  !------------------
  fRho = (t/SInf)**(1.D0/(gamma-1.D0))  

END FUNCTION fRho

!================================================================

DOUBLE PRECISION FUNCTION fRhoU(x1,x2)
  USE DATA_MANAGER
  IMPLICIT NONE
  !************************************************
  DOUBLE PRECISION,INTENT(in) :: x1,x2
  DOUBLE PRECISION :: x,y
  DOUBLE PRECISION :: r,t
  DOUBLE PRECISION :: rho
  DOUBLE PRECISION :: u
  !************************************************
  
  !------------------
  x = x1 - x0
  y = x2 - y0
  !------------------
  r = SQRT(x**2+y**2)
  t = tInf-(gamma-1.D0)*beta**2/(8.D0*gamma*pi**2)*EXP(1-r**2)
  !------------------
  rho = (t/SInf)**(1.D0/(gamma-1.D0))
  u = (uInf-beta/(2*pi)*y*EXP(0.5D0*(1.D0-r**2)))
  !------------------
  fRhoU = rho*u

END FUNCTION fRhoU

!================================================================

DOUBLE PRECISION FUNCTION fRhoV(x1,x2)
  USE DATA_MANAGER
  IMPLICIT NONE
  !************************************************
  DOUBLE PRECISION,INTENT(in) :: x1,x2
  DOUBLE PRECISION :: x,y
  DOUBLE PRECISION :: r,t
  DOUBLE PRECISION :: rho
  DOUBLE PRECISION :: v
  !************************************************
  
  !------------------
  x = x1 - x0
  y = x2 - y0
  !------------------
  r = SQRT(x**2+y**2)
  t = tInf-(gamma-1.D0)*beta**2/(8.D0*gamma*pi**2)*EXP(1-r**2)
  !------------------
  rho = (t/SInf)**(1.D0/(gamma-1.D0))
  v = (vInf+beta/(2*pi)*x*EXP(0.5D0*(1.D0-r**2)))
  !------------------
  fRhoV = rho*v

END FUNCTION fRhoV

!================================================================

DOUBLE PRECISION FUNCTION fRhoW(x1,x2)
  USE DATA_MANAGER
  IMPLICIT NONE
  !************************************************
  DOUBLE PRECISION,INTENT(in) :: x1,x2
  DOUBLE PRECISION :: x,y
  !************************************************

  fRhoW = 0.D0

END FUNCTION fRhoW

!================================================================

DOUBLE PRECISION FUNCTION fRhoE(x1,x2)
  USE DATA_MANAGER
  IMPLICIT NONE
  !************************************************
  DOUBLE PRECISION,INTENT(in) :: x1,x2
  DOUBLE PRECISION :: x,y
  DOUBLE PRECISION :: r,t
  DOUBLE PRECISION :: rho
  DOUBLE PRECISION :: u,v
  DOUBLE PRECISION :: p
  !************************************************
  
  !------------------
  x = x1 - x0
  y = x2 - y0
  !------------------
  r = SQRT(x**2+y**2)
  t = tInf-(gamma-1.D0)*beta**2/(8.D0*gamma*pi**2)*EXP(1-r**2)
  !------------------
  rho = (t/SInf)**(1.D0/(gamma-1.D0))
  u = (uInf-beta/(2*pi)*y*EXP(0.5D0*(1.D0-r**2)))
  v = (vInf+beta/(2*pi)*x*EXP(0.5D0*(1.D0-r**2)))
  p = SInf*rho**gamma
  !------------------
  fRhoE = p/(gamma-1.D0)+0.5D0*rho*(u**2+v**2)

END FUNCTION fRhoE

!================================================================
