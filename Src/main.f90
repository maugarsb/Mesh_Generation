PROGRAM MAIN
  USE BLOCK_MANAGER
  IMPLICIT NONE
  !*************************************************************
  TYPE(BLOCK)         :: Blk1
  CHARACTER(len=80)   :: InputDataFile
  
  !*************************************************************

  Blk1%im = 1000
  Blk1%jm = 1000
  Blk1%X_Start = -15.D0
  Blk1%Y_Start = -15.D0
  Blk1%X_End = 15.D0
  Blk1%Y_End = 15.D0

  CALL ALLOCATE_BLOCK(Blk1) ;

  CALL COMPUTE_MESH(Blk1)
  CALL COMPUTE_MESH_CENTER(Blk1)

  CALL EXTRACT_MESH(Blk1,'n')
  CALL EXTRACT_MESH(Blk1,'center')

  CALL INIT_BLOCK(Blk1)

  CALL EXTRACT_FIELD_CF(Blk1)


END PROGRAM MAIN
