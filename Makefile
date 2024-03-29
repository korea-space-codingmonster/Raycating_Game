# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: napark <napark@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/24 15:05:32 by napark            #+#    #+#              #
#    Updated: 2021/04/28 18:18:09 by napark           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = cub3D

CC = gcc
#CFLAGS = -Wall -Wextra -Werror
CFLAGS := -g3 -fsanitize=address
ifneq ($(DEBUG),true)
	CFLAGS := -O3
endif

# libft
LIBFT = libft.a
LIBFT_DIR = lib/libft
LIBFT_FILE = $(LIBFT_DIR)/$(LIBFT)
LIBFT_INC_DIR = $(LIBFT_DIR)/include
LIBFT_FLAGS = -L./$(LIBFT_DIR) -lft
CINCLUDES += -I $(LIBFT_INC_DIR)

ifeq ($(DEBUG),true)
	CDEBUG = -g
endif

# minilibx
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	MLX_SUBMODULE = git submodule update --init
	MLX = libmlx.a
	MLX_DIR = lib/minilibx-linux
	MLX_FLAGS = -L./$(MLX_DIR) -lmlx -lXext -lX11 -lm
	MLX_NOTIC = @printf "✅ $(FG_TEXT_PRIMARY)If you having trouble building minilibx library, \
	try installing the package below.\n\
	$(FG_TEXT)$(CL_BOLD)gcc make xorg libxext-dev libbsd-dev$(NO_COLOR)\n"
endif
ifeq ($(UNAME_S),Darwin)
	MLX = libmlx.dylib
	MLX_DIR = lib/minilibx_mms_20200219
	MLX_FLAGS = -L./$(MLX_DIR) -lmlx
	MLX_CP = cp $(MLX_FILE) $(MLX)
	MLX_RM = rm -f $(MLX)
endif
MLX_FILE = $(MLX_DIR)/$(MLX)
MLX_INC_DIR = $(MLX_DIR)
CINCLUDES += -I $(MLX_INC_DIR)

RM = rm
RMFLAGS = -f

INC_DIR = include
CINCLUDES += -I $(INC_DIR)
SRC_DIR = src
OBJ_DIR = obj


HEADERS = $(wildcard $(INC_DIR)/*.h)

UTIL_DIR = $(SRC_DIR)/util
UTIL_SRCS = $(wildcard $(UTIL_DIR)/*.c)

INIT_DIR = $(SRC_DIR)/init
INIT_SRCS = $(wildcard $(INIT_DIR)/*.c)

RENDER_DIR = $(SRC_DIR)/render
RENDER_SRCS = $(wildcard $(RENDER_DIR)/*.c)

UPDATE_DIR = $(SRC_DIR)/update
UPDATE_SRCS = $(wildcard $(UPDATE_DIR)/*.c)

KEYEVENT_DIR = $(SRC_DIR)/key_event
KEYEVENT_SRCS = $(wildcard $(KEYEVENT_DIR)/*.c)

EXIT_DIR = $(SRC_DIR)/exit
EXIT_SRCS = $(wildcard $(EXIT_DIR)/*.c)

SAVE_DIR = $(SRC_DIR)/save
SAVE_SRCS = $(wildcard $(SAVE_DIR)/*.c)

MLXDISPLAY_DIR = $(SRC_DIR)/mlx_destroy_display
MLXDISPLAY_SRCS = $(wildcard $(MLXDISPLAY_DIR)/*.c)

SRCS = \
	$(wildcard $(SRC_DIR)/*.c) \
	$(INIT_SRCS) \
	$(UTIL_SRCS) \
	$(RENDER_SRCS) \
	$(UPDATE_SRCS) \
	$(KEYEVENT_SRCS) \
	$(MLXDISPLAY_SRCS) \


vpath %.c \
	$(SRC_DIR) \
	$(INIT_DIR)	\
	$(UTIL_DIR)	\
	$(RENDER_DIR) \
	$(UPDATE_DIR) \
	$(KEYEVENT_DIR) \
	$(MLXDISPLAY_DIR) \


ifeq ($(UNAME_S),Darwin)
	SRCS += $(wildcard $(SRC_DIR)/dummy_mac/*.c)
	BONUS_SRCS += $(wildcard $(SRC_BONUS_DIR)/dummy_mac/*.c)

	vpath %.c \
		$(SRC_DIR)/dummy_mac \
		$(SRC_BONUS_DIR)/dummy_mac
endif

OBJS = $(addprefix $(OBJ_DIR)/, $(notdir $(SRCS:.c=.o)))

# Color
CL_BOLD	 = \e[1m
CL_DIM	= \e[2m
CL_UDLINE = \e[4m

NO_COLOR = \e[0m

BG_TEXT = \e[48;2;45;55;72m
BG_BLACK = \e[48;2;30;31;33m

FG_WHITE = $(NO_COLOR)\e[0;37m
FG_TEXT = $(NO_COLOR)\e[38;2;189;147;249m
FG_TEXT_PRIMARY = $(NO_COLOR)$(CL_BOLD)\e[38;2;255;121;198m

LF = \e[1K\r$(NO_COLOR)
CRLF= \n$(LF)

all : $(NAME)

clean :
	@$(RM) $(RMFLAGS) $(OBJS) $(OBJS_BONUS)
	@printf "$(LF)🧹 $(FG_TEXT)Cleaning $(FG_TEXT_PRIMARY)$(NAME)'s Object files...\n"

fclean : clean
	@$(RM) $(RMFLAGS) $(NAME)
	@printf "$(LF)🧹 $(FG_TEXT)Cleaning $(FG_TEXT_PRIMARY)$(NAME)\n"

re : fclean all

lib_clean : $(LIBFT)_fclean $(MLX)_clean

$(OBJ_DIR) :
	@mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o : %.c | $(OBJ_DIR)
	@$(CC) $(CDEBUG) $(CFLAGS) $(CINCLUDES) -c $< -o $@
	@printf "$(LF)🚧 $(FG_TEXT)Create $(FG_TEXT_PRIMARY)$@ $(FG_TEXT)from $(FG_TEXT_PRIMARY)$<"

$(NAME) : $(MLX_FILE) $(LIBFT_FILE) $(HEADERS) $(OBJS)
	@printf "$(LF)🚀 $(FG_TEXT)Successfully Created $(FG_TEXT_PRIMARY)$(NAME)'s Object files $(FG_TEXT)!"
	@printf "$(CRLF)📚 $(FG_TEXT)Create $(FG_TEXT_PRIMARY)cub3D$(FG_TEXT)!\n"
	@$(CC) $(CDEBUG) $(CFLAGS) $(CINCLUDES) $(OBJS) -o $(NAME) $(LIBFT_FLAGS) $(MLX_FLAGS)
	@printf "$(LF)🎉 $(FG_TEXT)Successfully Created $(FG_TEXT_PRIMARY)$@ $(FG_TEXT)!\n$(NO_COLOR)"



# Libft
$(LIBFT) : $(LIBFT_FILE)

$(LIBFT_FILE) :
	@make --no-print-directory -C $(LIBFT_DIR)

$(LIBFT)_clean :
	@make --no-print-directory -C $(LIBFT_DIR) clean

$(LIBFT)_fclean :
	@make --no-print-directory -C $(LIBFT_DIR) fclean

# minilibx
$(MLX) : $(MLX_FILE)

$(MLX_FILE) :
	@printf "$(CRLF)📚 $(FG_TEXT)Create $(FG_TEXT_PRIMARY)minilibx$(FG_TEXT)!\n"
	$(MLX_SUBMODULE)
	@$(MLX_NOTIC)
	@make --no-print-directory -C $(MLX_DIR)
	@printf "$(CRLF)🎉 $(FG_TEXT)Successfully Created $(FG_TEXT_PRIMARY)minilibx $(FG_TEXT)!\n"
	@$(MLX_CP)

$(MLX)_clean :
	@make --no-print-directory -C $(MLX_DIR) clean
	@$(MLX_RM)

.PHONY: all clean fclean re test\
	$(LIBFT) $(LIBFT)_clean $(LIBFT)_fclean \
	$(MLX) $(MLX)_clean lib_clean
