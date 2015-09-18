SRCS := main.c
EXEC := ropme

.PHONY: all

all:
	$(CC) -w -ggdb -fno-stack-protector -o $(EXEC) $(SRCS)
	execstack -s $(EXEC)


clean:
	rm -rf *.[os] *.core $(EXEC)
