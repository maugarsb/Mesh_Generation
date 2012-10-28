PROGRAM MAIN
  USE BLOCK_MANAGER
  IMPLICIT NONE
  !*************************************************************
  TYPE(BLOCK)         :: Blk1
  CHARACTER(len=80)   :: InputDataFile
  
  !*************************************************************

  Blk1%im = 100
  Blk1%jm = 100
  Blk1%X_Start = -15.D0
  Blk1%Y_Start = -15.D0
  Blk1%X_End = 15.D0
  Blk1%Y_End = 15.D0

  CALL ALLOCATE_BLOCK(Blk1) ;

  CALL COMPUTE_MESH(Blk1)
  CALL EXTRACT_MESH(Blk1)



END PROGRAM MAIN
