CFLAGS  = -g -Wall -std=gnu99
LDFLAGS = -lm
EXEC	= calc
SRCS	= lexer.c parser.c functions.c main.c
CC		= gcc

calc:		$(SRCS)
			$(CC) $(CFLAGS) $(SRCS) -o $(EXEC)

%.o: 		%.c 
			$(CC) -c $(CFLAGS) -o $@ $<

lexer.c:	lexer.l
			flex lexer.l

parser.c:	parser.y lexer.c
			bison parser.y

clean:;		
			rm -f *.o *~ lexer.c lexer.h parser.c parser.h $(EXEC)
