SUBROUTINE COMPUTE_MESH_CENTER(Blk)
  USE BLOCK_MANAGER
  IMPLICIT NONE
  !*************************************************************
  TYPE(BLOCK) :: Blk
  INTEGER :: im,jm
  INTEGER :: i,j
  !*************************************************************
  
  im = Blk%im
  jm = Blk%jm
  
  DO j=-1,jm+1
     DO i=-1,im+1        
        Blk%X_Center(i,j) = 0.25D0*(Blk%X(i,j)+Blk%X(i+1,j)+Blk%X(i,j+1)+Blk%X(i+1,j+1))
        Blk%Y_Center(i,j) = 0.25D0*(Blk%Y(i,j)+Blk%Y(i+1,j)+Blk%Y(i,j+1)+Blk%Y(i+1,j+1))
     END DO
  END DO  
  
END SUBROUTINE COMPUTE_MESH_CENTER
