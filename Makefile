

all :
	ifort -c Src/block_manager.f90 -o Obj/block_manager.o
	ifort -c Src/m_option_parser.F90 -o Obj/m_option_parser.o
	ifort -c Src/data_module.f90 -o Obj/data_module.o
	ifort -c Src/function_vortex.f90 -o Obj/function_vortex.o
	ifort -c Src/init_block.f90 -o Obj/init_block.o
	ifort -c Src/compute_mesh.f90 -o Obj/compute_mesh.o
	ifort -c Src/compute_mesh_center.f90 -o Obj/compute_mesh_center.o
	ifort -c Src/main.f90 -o Obj/main.o
	ifort -o Mesh.x Obj/*.o

ho :
	gfortran -c Src/block_manager.f90 -o Obj/block_manager.o
	gfortran -c Src/m_option_parser.F90 -o Obj/m_option_parser.o
	gfortran -c Src/data_module.f90 -o Obj/data_module.o
	gfortran -c Src/function_vortex.f90 -o Obj/function_vortex.o
	gfortran -c Src/init_block.f90 -o Obj/init_block.o
	gfortran -c Src/compute_mesh.f90 -o Obj/compute_mesh.o
	gfortran -c Src/compute_mesh_center.f90 -o Obj/compute_mesh_center.o
	gfortran -c Src/main.f90 -o Obj/main.o
	gfortran -o Mesh.x Obj/*.o
