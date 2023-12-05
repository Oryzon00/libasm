NAME 		= 	libasm

LIB 		= 	libasm.a

SRC_DIR		=	src

FILES 		=	ft_read.s		\
				ft_write.s		\
				ft_strlen.s		\
				ft_strcpy.s		\
				ft_strcmp.s 	\
				

SRCS 		= 	$(addprefix $(SRC_DIR)/, $(FILES))

NASM 		= 	nasm 

ASMFLAGS	=	-f elf64

OBJ 		= 	$(SRCS:.s=.o)

%.o			: 	%.s
#				a tester le @printf
				@printf "Generating %s\n" $@
				@$(NASM) $(ASMFLAGS) $< -o $@
				@printf "Object generated.\n\n"

	
all 		: 	$(NAME)

$(NAME)		: 	$(OBJ)
			  	@ar rcs $(LIB) $(OBJ)
				@echo "Done"

# test 		: 	
# 				make -C ./tester

clean		:
# 			 	@rm -f main.o
		      	@rm -f $(OBJ)
				@printf "Objects deleted.\n\n"

fclean		:	clean
				@rm -f $(LIB)
				@printf "Lib deleted.\n\n"

re			:	fclean all

.PHONY		:
				all test clean fclean re
