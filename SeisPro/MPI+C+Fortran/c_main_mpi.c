
#include "cwp.h"
#include "su.h"
#include "mpi.h"

extern void f_sub(char*,int);
int main(int argc, char** argv)
{
	int myid,nprocs;
	
	MPI_Init(&argc,&argv);
	MPI_Comm_size(MPI_COMM_WORLD,&nprocs);
	MPI_Comm_rank(MPI_COMM_WORLD,&myid);
	
	
	if (argc!=2) exit(1);
	lens=strlen(argv[1]);
	f_sub(argv[1],lens);
	
	MPI_Finalize();

	
	return(CWP_Exit());
}

