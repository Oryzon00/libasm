NAME 		= 	libasm

LIB 		= 	libasm.a

SRC_DIR		=	src

FILES 		=	ft_read.s		\
				ft_write.s		\
				ft_strlen.s		\
				ft_strcpy.s		\

SRCS 		= 	$(addprefix $(SRC_DIR)/, $(FILES))

NASM 		= 	nasm 

ASMFLAGS	=	-f elf64

OBJ 		= 	$(SRCS:.s=.o)

%.o			: 	%.s
#				a tester le @printf
				@printf "Generating object... %s\n" $@
				@printf "\n"
				@$(NASM) $(ASMFLAGS) $< -o $@
				echo "Objects generated."

	
all 		: 	$(NAME)

$(NAME)		: 	$(OBJ)
			  	@ar rcs $(LIB) $(OBJ)
				@echo "Lib generated"

# test 		: 	
# 				make -C ./tester

clean		:
# 			 	@rm -f main.o
		      	@rm -f $(OBJ)
				@echo "Objects deleted."

fclean		:	clean
				@rm -f $(LIB)
				@echo "Lib deleted."
				@rm -f a.out
				@rm -f libasm
				@echo "Executable deleted."

re			:	fclean all

.PHONY		:
				all test clean fclean re
