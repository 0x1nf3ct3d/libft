# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hsabir <marvin@42lausanne.ch>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/08 09:06:42 by hsabir            #+#    #+#              #
#    Updated: 2022/01/27 14:49:02 by hsabir           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

# ****************************** #
#          COMPILER              #
# ****************************** #

CC = gcc
CFLAGS = -Wall -Wextra -Werror #-g3 -fsanitize=address
ARFLAGS = -rcs

# **************** #
#      PATHS       #
# **************** #

INCS_PATH = incs
SRCS_PATH = srcs
OBJS_PATH = objs

# ************************** #
#         SOURCES            #
# ************************** #

# SRCS DIRS
SRCS_CHAR_DIR = ft_chars
SRCS_STR_DIR = ft_strs
SRCS_MEM_DIR = ft_mems
SRCS_NBR_DIR = ft_nbrs
SRCS_FD_DIR = ft_fds
SRCS_LST_DIR = ft_lst
SRCS_PRINTF_DIR = ft_printf

# OBJS DIR
OBJS_DIRS_NAME =	$(SRCS_CHAR_DIR)	$(SRCS_STR_DIR)		$(SRCS_MEM_DIR)	\
					$(SRCS_NBR_DIR)		$(SRCS_FD_DIR)		$(SRCS_LST_DIR)	\
					$(SRCS_DLST_DIR)	$(SRCS_PRINTF_DIR)

# OBJS DIRS IN OBJ PATH
OBJS_DIRS = $(addprefix $(OBJS_PATH)/, $(OBJS_DIRS_NAME))

# SRC FILES
SRCS_CHAR =	ft_isalpha.c	ft_isdigit.c	ft_isalnum.c	ft_isascii.c\
		ft_isprint.c	ft_tolower.c	ft_toupper.c	ft_putchar.c\
		ft_isspace.c

SRCS_STR =  	ft_putstr.c	ft_strchr.c	ft_strjoin.c	ft_strlen.c\
		ft_strnstr.c	ft_substr.c	ft_strdup.c\
		ft_strlcat.c	ft_strmapi.c	ft_strrchr.c	ft_split.c\
		ft_striteri.c 	ft_strlcpy.c	ft_strncmp.c	ft_strtrim.c

SRCS_MEM =  	ft_bzero.c	ft_calloc.c	ft_memchr.c	ft_memcmp.c\
		ft_memcpy.c	ft_memmove.c	ft_memset.c

SRCS_NBR =	ft_atoi.c	ft_itoa.c	ft_atof.c

SRCS_FD =	ft_putchar_fd.c	ft_putendl_fd.c	ft_putnbr_fd.c\
		get_next_line.c ft_putstr_fd.c

SRCS_LST =	ft_lstnew.c	ft_lstadd_front.c	ft_lstsize.c	\
		ft_lstlast.c	ft_lstadd_back.c	ft_lstdelone.c	\
		ft_lstclear.c	ft_lstiter.c		ft_lstmap.c

SRCS_PRINTF = ft_print_c.c ft_print_nbr.c ft_print_str.c ft_printf.c utils.c

# SRC FILES AND SRCS DIRS
SRCS_NAME =	$(addprefix $(SRCS_CHAR_DIR)/, $(SRCS_CHAR))	\
			$(addprefix $(SRCS_STR_DIR)/, $(SRCS_STR))		\
			$(addprefix $(SRCS_MEM_DIR)/, $(SRCS_MEM))		\
			$(addprefix $(SRCS_NBR_DIR)/, $(SRCS_NBR))		\
			$(addprefix $(SRCS_FD_DIR)/, $(SRCS_FD))		\
			$(addprefix $(SRCS_LST_DIR)/, $(SRCS_LST))		\
			$(addprefix $(SRCS_DLST_DIR)/, $(SRCS_DLST))	\
			$(addprefix $(SRCS_PRINTF_DIR)/, $(SRCS_PRINTF))

# OBJS NAME
OBJS_NAME = $(SRCS_NAME:%.c=%.o)

# ADD PATH TO SRCS AND OBJS
SRCS = $(addprefix $(SRCS_PATH)/, $(SRCS_NAME));
OBJS = $(addprefix $(OBJS_PATH)/, $(OBJS_NAME));


.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJS)
	ar $(ARFLAGS) $@ $^

$(OBJS_PATH)/%.o: $(SRCS_PATH)/%.c | $(OBJS_DIRS)
	$(CC) $(CFLAGS) -c $< -o $@ -I $(INCS_PATH)

$(OBJS_DIRS): | $(OBJS_PATH)
	mkdir -p $(OBJS_DIRS) 2> /dev/null

$(OBJS_PATH):
	mkdir -p $(OBJS_PATH) 2> /dev/null

clean:
	rm -rf $(OBJS_PATH)

fclean: clean
	rm -rf $(NAME)

re: fclean all
