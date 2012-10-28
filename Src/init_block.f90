SUBROUTINE INIT_BLOCK(Blk)
  USE BLOCK_MANAGER
  USE DATA_MANAGER
  USE OMP_LIB
  IMPLICIT NONE
  !*************************************************************
  TYPE(BLOCK) :: Blk
  INTEGER :: im,jm
  INTEGER :: i,j
  DOUBLE PRECISION :: fRho,fRhoU,fRhoV,fRhoW,fRhoE
  ! OpenMp Variables
  INTEGER :: i_min,imax,rang,nb_taches,id
  !*************************************************************
  
  im = Blk%im
  jm = Blk%jm

  !$OMP PARALLEL DO
  DO j=-1,jm+1
     !$OMP PARALLEL DO
     DO i=-1,im+1
        
        Blk%ro(i,j) = fRho(Blk%X_Center(i,j),Blk%Y_Center(i,j))
        Blk%rou(i,j) = fRhoU(Blk%X_Center(i,j),Blk%Y_Center(i,j))
        Blk%rov(i,j) = fRhoV(Blk%X_Center(i,j),Blk%Y_Center(i,j))
        Blk%row(i,j) = fRhoW(Blk%X_Center(i,j),Blk%Y_Center(i,j))
        Blk%roE(i,j) = fRhoE(Blk%X_Center(i,j),Blk%Y_Center(i,j))
        
     END DO
     !$OMP END PARALLEL DO
  END DO
  !$OMP END PARALLEL DO
  
END SUBROUTINE INIT_BLOCK
