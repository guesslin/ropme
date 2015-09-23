#include <stdio.h> 

int banner();
int ropme();
int welcome();

int main(void) { 
	banner();
	ropme();
	return 0; 
}

int ropme() {
	char name[128];
	printf("%p\n", name); // print the buffer base address
	puts("What's your name?");
	gets(name);
	printf("Hello, %s!\n", name);
	return 0;
}

int banner() {
	printf("\n");
	printf("######                                   \n");
	printf("#     #  ####  #####        #    # ######\n");
	printf("#     # #    # #    #       ##  ## #     \n");
	printf("######  #    # #    # ##### # ## # ##### \n");
	printf("#   #   #    # #####        #    # #     \n");
	printf("#    #  #    # #            #    # #     \n");
	printf("#     #  ####  #            #    # ######\n");
	printf("\n");
}
