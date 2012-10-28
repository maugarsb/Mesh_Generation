MODULE BLOCK_MANAGER
  IMPLICIT NONE
  !*************************************************************
  TYPE BLOCK
     INTEGER                                     :: im,jm
     DOUBLE PRECISION                            :: X_Start,X_End
     DOUBLE PRECISION                            :: Y_Start,Y_End
     DOUBLE PRECISION,DIMENSION(:,:),ALLOCATABLE :: X,Y
     DOUBLE PRECISION,DIMENSION(:,:),ALLOCATABLE :: X_Center,Y_Center
     DOUBLE PRECISION,DIMENSION(:,:),ALLOCATABLE :: ro,rou,rov,row,roE
  END TYPE BLOCK
  !*************************************************************


CONTAINS

  !=============================================================

  SUBROUTINE ALLOCATE_BLOCK(Blk)
    IMPLICIT NONE
    !*************************************************************
    TYPE(BLOCK) :: Blk
    INTEGER :: im,jm
    !*************************************************************

    im = Blk%im
    jm = Blk%jm

    ALLOCATE(Blk%X(-1:im+2,-1:jm+2));ALLOCATE(Blk%Y(-1:im+2,-1:jm+2))
    ALLOCATE(Blk%X_Center(-1:im+2,-1:jm+2));ALLOCATE(Blk%Y_Center(-1:im+2,-1:jm+2))

    ALLOCATE(Blk%ro(-1:im+2,-1:jm+2));
    ALLOCATE(Blk%rou(-1:im+2,-1:jm+2));
    ALLOCATE(Blk%rov(-1:im+2,-1:jm+2));
    ALLOCATE(Blk%row(-1:im+2,-1:jm+2));
    ALLOCATE(Blk%roE(-1:im+2,-1:jm+2));

  END SUBROUTINE ALLOCATE_BLOCK

  !=============================================================
  !=============================================================

  SUBROUTINE EXTRACT_MESH(Blk,ExtractType)
    IMPLICIT NONE
    !*************************************************************
    TYPE(BLOCK) :: Blk
    INTEGER :: im,jm
    INTEGER :: i,j
    CHARACTER(len=*) :: ExtractType
    !*************************************************************

    im = Blk%im
    jm = Blk%jm


    IF(ExtractType.EQ.'n')THEN
       write(*,'(A19,A)') "Ecriture du fichier : ", './mesh.tp'
       open(unit=1,file='./mesh.tp',status='replace',action='write')
       write(1,*) 'TITLE="Maillage "'
       write(1,*) 'VARIABLES = "X" "Y"'
       write(1,*) 'ZONE T= " ", I=',im,'J=',jm,'F=BLOCK'
       write(1,*) ((Blk%X(i,j),i=1,im),j=1,jm)
       write(1,*) ((Blk%Y(i,j),i=1,im),j=1,jm)
       close(1)
    ELSEIF(ExtractType.EQ.'center')THEN
       write(*,'(A19,A)') "Ecriture du fichier : ", './meshcenter.tp'
       open(unit=1,file='./meshcenter.tp',status='replace',action='write')
       write(1,*) 'TITLE="Maillage "'
       write(1,*) 'VARIABLES = "X" "Y"'
       write(1,*) 'ZONE T= " ", I=',im,'J=',jm,'F=BLOCK'
       write(1,*) ((Blk%X_Center(i,j),i=1,im),j=1,jm)
       write(1,*) ((Blk%Y_Center(i,j),i=1,im),j=1,jm)
       close(1)
    END IF

  END SUBROUTINE EXTRACT_MESH

  !=============================================================

  SUBROUTINE EXTRACT_FIELD_CF(Blk)
    IMPLICIT NONE
    !*************************************************************
    TYPE(BLOCK) :: Blk
    INTEGER :: im,jm
    !*************************************************************

    im = Blk%im
    jm = Blk%jm

  END SUBROUTINE EXTRACT_FIELD_CF

  !=============================================================

END MODULE BLOCK_MANAGER
