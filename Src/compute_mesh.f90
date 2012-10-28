SUBROUTINE COMPUTE_MESH(Blk)
  USE BLOCK_MANAGER
  IMPLICIT NONE
  !*************************************************************
  TYPE(BLOCK) :: Blk
  INTEGER :: im,jm
  INTEGER :: i,j
  DOUBLE PRECISION :: Xs,Xe,Ys,Ye
  DOUBLE PRECISION :: dx,dy
  !*************************************************************
  
  im = Blk%im
  jm = Blk%jm
  
  !---------------------
  Xs = Blk%X_Start
  Xe = Blk%X_End
  Ys = Blk%Y_Start
  Ye = Blk%Y_End
  !---------------------
  dx = (Xe - Xs)/dble(im-1)
  dy = (Ye - Ys)/dble(jm-1)
  !---------------------
  Blk%dx = dx 
  Blk%dy = dy 
  !---------------------
  
  DO j=-1,jm+2
     DO i=-1,im+2
        
        Blk%X(i,j) = (Xs-2*dx) + dx*(i+1)
        Blk%Y(i,j) = (Ys-2*dy) + dy*(j+1)
        

     END DO
  END DO
  
  
  
END SUBROUTINE COMPUTE_MESH
