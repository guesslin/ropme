#include <stdio.h> 
#include <stdlib.h>

void banner();
void commands(char *);
void get_address(char *);
int ropme();
void show_commands();

int main(void) { 
	banner();
	ropme();
	return 0; 
}

void banner() {
	printf("\n");
	printf("######                                   \n");
	printf("#     #  ####  #####        #    # ######\n");
	printf("#     # #    # #    #       ##  ## #     \n");
	printf("######  #    # #    # ##### # ## # ##### \n");
	printf("#   #   #    # #####        #    # #     \n");
	printf("#    #  #    # #            #    # #     \n");
	printf("#     #  ####  #            #    # ######\n");
	printf("\n");
	fflush(stdout);
}

void commands(char *name) {
	char select[64];
	int option;
	while(1) {
		show_commands();
		fgets(select, 64, stdin);
		option = atoi(select);
		switch(option){
		case 1:
			get_address(name); // print the buffer base address
			break;
		case 2:
			printf("The flag located at /opt/flag \n");
			break;
		case 3:
			return;
		default:
			break;
		}
	}
}

void get_address(char *cptr) {
	printf("%p\n", cptr);
}

int ropme() {
	char name[64];
	puts("What's your name?");
	fflush(stdout);
	gets(name);
	printf("Hello, %s!\n", name);
	commands(name);
	return 0;
}

void show_commands() {
	printf("1) I want to stand\n");
	printf("2) show me the flag\n");
	printf("3) exit.\n");
	printf("Please choose command: ");
	fflush(stdout);
}
