SRCS := main.c
EXEC := ropme

.PHONY: all

all:
	$(CC) -w -fno-stack-protector -o $(EXEC) $(SRCS)
	execstack -s $(EXEC)

dep:
	$(CC) -M $(SRCS) >.dep

-include .dep

clean:
	rm -rf *.[os] *.core $(EXEC) .dep
