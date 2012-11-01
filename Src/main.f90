PROGRAM MAIN
  USE BLOCK_MANAGER
  USE M_OPTION_PARSER
  IMPLICIT NONE
  !*************************************************************
  TYPE(BLOCK)                     :: Blk
  INTEGER                         :: err,test
  CHARACTER(len=256)              :: MeshFileName,InitFileName,SolFileName
  TYPE(OPTION_T),ALLOCATABLE      :: program_options(:)
  !*************************************************************

  ALLOCATE(program_options(9))

  !''''Config parseur''''!
  CALL SET_OPTION(program_options,"--im"  , "-i", 50    , "Taille maillage direction I")
  CALL SET_OPTION(program_options,"--jm"  , "-j", 50    , "Taille maillage direction J")
  CALL SET_OPTION(program_options,"--X_Start", "Xs", -15.D0, "X min")
  CALL SET_OPTION(program_options,"--X_End"  , "Xe",  15.D0, "X max")
  CALL SET_OPTION(program_options,"--Y_Start", "Ys", -15.D0, "Y min")
  CALL SET_OPTION(program_options,"--Y_End"  , "Ye",  15.D0, "Y max")

  CALL SET_OPTION(program_options,"--MeshFileName","-M","./mesh_default.tp","Fichier de sortie maillage")
  CALL SET_OPTION(program_options,"--InitFileName","In",'./ini_default.tp',"Fichier de sortie init") 
  CALL SET_OPTION(program_options,"--SolFileName" ,"So",'./sol_default.tp',"Fichier de sortie sol")
  !''''--------------''''!

  CALL CHECK_OPTIONS(program_options, err)
  IF(err /=0) stop

  CALL PARSE_OPTIONS(program_options)

  !*************************************************************
  CALL GET_OPTION_VALUE(program_options, "-i",Blk%im )
  CALL GET_OPTION_VALUE(program_options, "-i",test )
  CALL GET_OPTION_VALUE(program_options, "-j",Blk%jm )
  CALL GET_OPTION_VALUE(program_options, "Xs",Blk%X_Start)
  CALL GET_OPTION_VALUE(program_options, "Xe",Blk%X_End)
  CALL GET_OPTION_VALUE(program_options, "Ys",Blk%Y_Start)
  CALL GET_OPTION_VALUE(program_options, "Ye",Blk%Y_End)
  !*************************************************************
  CALL GET_OPTION_VALUE(program_options, "-M",MeshFileName)
  CALL GET_OPTION_VALUE(program_options, "In",InitFileName)
  CALL GET_OPTION_VALUE(program_options, "So",SolFileName)
  !*************************************************************

!!$  Blk1%im = 
!!$  Blk1%jm = 10
!!$  Blk1%X_Start = -15.D0
!!$  Blk1%Y_Start = -15.D0
!!$  Blk1%X_End = 15.D0
!!$  Blk1%Y_End = 15.D0

  CALL ALLOCATE_BLOCK(Blk) ;

  CALL COMPUTE_MESH(Blk)
  CALL COMPUTE_MESH_CENTER(Blk)

  CALL EXTRACT_MESH(Blk,'n',MeshFileName)
!!$  CALL EXTRACT_MESH(Blk,'center')

  CALL INIT_BLOCK(Blk)

  CALL EXTRACT_FIELD_CF(Blk,InitFileName)
  CALL EXTRACT_CELL_CENTER(Blk,InitFileName)


END PROGRAM MAIN
