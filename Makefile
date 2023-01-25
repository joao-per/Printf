# Variables
NAME = libftprintf.a

SRC = ft_printf variables
OBJ_DIR = Obj

CC = gcc
CFLAGS = -Wall -Werror -Wextra -I.

RM = rm -f

# Colors

DEFAULT = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

all:$(NAME)

$(NAME): $(OBJ_DIR) $(SRC:=.o)
		@ar rcs $(NAME) $(OBJ_DIR)/*.o
		@echo "$(GREEN)ft_printf compiled!$(DEFAULT)"

$(OBJ_DIR):
		@mkdir -p $(OBJ_DIR)

$(SRC:=.o): %.o: %.c
		$(CC) $(CFLAGS) -c $< -o $(OBJ_DIR)/$@

bonus: fclean all

clean:
		$(RM) $(OBJ_DIR)/*.o
		@echo "$(BLUE)ft_printf object files cleaned!$(DEFAULT)"

fclean: clean
		$(RM) $(NAME)
		$(RM) -r $(OBJ_DIR)
		@echo "$(CYAN)libft executable file cleaned!$(DEFAULT)"
		@echo "$(RED)ft_printf objects folder deleted!$(DEFAULT)"

re: 	fclean $(NAME)
		@echo "$(GREEN)Cleaned and rebuilt everything for ft_printf!$(DEFAULT)"

.PHONY:		all clean fclean re