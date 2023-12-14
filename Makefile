NAME 		= 	libasm

LIB 		= 	libasm.a

SRC_DIR		=	src

FILES 		=	ft_read.s		\
				ft_write.s		\
				ft_strlen.s		\
				ft_strcpy.s		\
				ft_strcmp.s 	\
				ft_strdup.s		\
				

SRCS 		= 	$(addprefix $(SRC_DIR)/, $(FILES))

NASM 		= 	nasm 

ASMFLAGS	=	-f elf64

CC			=	gcc

CFLAGS		= -Wall -Wextra -Werror

OBJ 		= 	$(SRCS:.s=.o)

%.o			: 	%.s
				@printf "Generating %s\n" $@
				@$(NASM) $(ASMFLAGS) $< -o $@
				@printf "Object generated.\n\n"

	
all 		: 	$(NAME)

$(NAME)		: 	$(OBJ)
			  	@ar rcs $(LIB) $(OBJ)
				@printf "Done\n\n"

test 		: 	all
				@$(CC) $(CFLAGS) main.c -L. -lasm
				@printf "Tester ready\n"


clean		:
				@rm -f main.o
		      	@rm -f $(OBJ)
				@printf "Objects deleted.\n\n"

fclean		:	clean
				@rm -f $(LIB)
				@rm -rf a.out
				@rm -rf test.txt
				@printf "Lib deleted.\n\n"

re			:	fclean all

.PHONY		:
				all test clean fclean re
