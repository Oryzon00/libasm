NAME 		= 	libasm

LIB 		= 	libasm.a

SRC_DIR		=	src

FILES 		=	ft_read.s\


SRCS 		= 	$(addprefix $(SRC_DIR)/, $(FILES))

NASM 		= 	nasm 

ASMFLAGS	=	-f elf64

OBJ 		= 	$(SRCS:.s=.o)

%.o			: 	%.s
#				a tester le @printf
				@printf "Generating object... %s\n" $@
				@printf "\n"
				@$(NASM) $(ASMFLAGS) $< -o $@

	
all 		: 	$(NAME)

$(NAME)		: 	$(OBJ)
			  	@ar rcs $(LIB) $(OBJ)
				@echo "Done!"

# test 		: 	
# 				make -C ./tester

clean		:
# 			 	@rm -f main.o
		      	@rm -f $(OBJ)
				@echo "Objects deleted."

fclean		:	
				clean
				@rm -f $(LIB)
				@echo " deleted."
				@rm -f a.out
				@rm -f libasm
				@echo "Lib and executable deleted."

re			:	
				fclean all

.PHONY		:
				all test clean fclean re
