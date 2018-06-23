
#include <stdlib.h>
#include <stdio.h>

extern void read_par(char*, int lensring);
int main(int argc, char *argv[])
{
	char str[256];
	int lensring;
	if (argc!=2) exit(1);
	printf("passing cstring to fortran\n");
	lensring=strlen(argv[1]);
	// strcpy(str,argv[1]);
	printf("cstring %s length is %d\n", argv[1],lensring);
	// printf("cstring %s length is %d\n", str,lensring);

	read_par(argv[1],lensring);
	printf("--------------------------\n");
	return 0;
}







