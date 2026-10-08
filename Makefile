# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alel-you <alel-you@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/09 21:17:16 by alel-you          #+#    #+#              #
#    Updated: 2024/11/20 01:54:53 by alel-you         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MANDATORY_FILES = mandatory/ft_isascii.c mandatory/ft_memmove.c mandatory/ft_split.c \
	mandatory/ft_strlcat.c mandatory/ft_atoi.c mandatory/ft_isdigit.c \
	mandatory/ft_memset.c mandatory/ft_strchr.c mandatory/ft_strlcpy.c \
	mandatory/ft_strtrim.c mandatory/ft_bzero.c mandatory/ft_isprint.c \
	mandatory/ft_putchar_fd.c mandatory/ft_strlen.c mandatory/ft_substr.c \
	mandatory/ft_strrchr.c mandatory/ft_calloc.c mandatory/ft_itoa.c \
	mandatory/ft_putendl_fd.c mandatory/ft_strdup.c mandatory/ft_strmapi.c \
	mandatory/ft_toupper.c mandatory/ft_isalnum.c mandatory/ft_memcmp.c \
	mandatory/ft_striteri.c mandatory/ft_strncmp.c mandatory/ft_strnstr.c \
	mandatory/ft_memchr.c mandatory/ft_isalpha.c mandatory/ft_memcpy.c \
	mandatory/ft_putstr_fd.c mandatory/ft_strjoin.c mandatory/ft_tolower.c \
	mandatory/ft_putnbr_fd.c

BONUS_FILES = bonus/ft_lstclear_bonus.c bonus/ft_lstiter_bonus.c \
	bonus/ft_lstsize_bonus.c bonus/ft_lstadd_front_bonus.c \
	bonus/ft_lstdelone_bonus.c bonus/ft_lstmap_bonus.c \
	bonus/ft_lstadd_back_bonus.c bonus/ft_lstnew_bonus.c bonus/ft_lstlast_bonus.c

OBJF = $(MANDATORY_FILES:.c=.o)
BONUS_OBJF = $(BONUS_FILES:.c=.o)

CC = cc

FLAGS = -Wall -Wextra -Werror -I.

NAME = libft.a

all: $(NAME)


$(NAME): $(OBJF)
	@ar rc $(NAME) $(OBJF)
	@echo libft.a created

%.o: %.c libft.h
	@$(CC) $(FLAGS) -c $< -o $@

bonus: $(OBJF) $(BONUS_OBJF)
	@ar rc $(NAME) $(OBJF) $(BONUS_OBJF)
	@echo BONUS_obj created

clean:
	@rm -rf $(OBJF) $(BONUS_OBJF)
	@echo CLEANED

fclean: clean
	@rm -rf $(NAME)
	@echo FCLEAN CALLED
	
re: fclean all

.PHONY: all bonus clean fclean re