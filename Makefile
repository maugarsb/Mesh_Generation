

all :
	gfortran -c Src/block_manager.f90 -o Obj/block_manager.o
	gfortran -c Src/data_module.f90 -o Obj/data_module.o
	gfortran -c Src/function_vortex.f90 -o Obj/function_vortex.o
	gfortran -c Src/init_block.f90 -o Obj/init_block.o
	gfortran -c Src/compute_mesh.f90 -o Obj/compute_mesh.o
	gfortran -c Src/compute_mesh_center.f90 -o Obj/compute_mesh_center.o
	gfortran -c Src/main.f90 -o Obj/main.o
	gfortran -o Mesh.x Obj/*.o

p :
	gfortran -c Src/block_manager.f90 -o Obj/block_manager.o
	gfortran -c Src/data_module.f90 -o Obj/data_module.o
	gfortran -c Src/function_vortex.f90 -o Obj/function_vortex.o
	gfortran -c -fopenmp Src/init_block.f90 -o Obj/init_block.o
	gfortran -c -fopenmp Src/compute_mesh.f90 -o Obj/compute_mesh.o
	gfortran -c -fopenmp Src/compute_mesh_center.f90 -o Obj/compute_mesh_center.o
	gfortran -c Src/main.f90 -o Obj/main.o
	gfortran -fopenmp -o Meshp.x Obj/*.o

pc :
	gcc -c Src/block_manager.f90 -o Obj/block_manager.o
	gcc -c Src/data_module.f90 -o Obj/data_module.o
	gcc -c Src/function_vortex.f90 -o Obj/function_vortex.o
	gcc -c -fopenmp Src/init_block.f90 -o Obj/init_block.o
	gcc -c Src/compute_mesh.f90 -o Obj/compute_mesh.o
	gcc -c Src/compute_mesh_center.f90 -o Obj/compute_mesh_center.o
	gcc -c Src/main.f90 -o Obj/main.o
	gcc -o Mesh.x Obj/*.o
