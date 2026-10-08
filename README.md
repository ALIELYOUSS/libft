# libft

<p align="center">
  <strong>C standard library, rebuilt from first principles.</strong>
</p>

<p align="center">
  A foundational project from the 42 curriculum by <a href="https://github.com/alel-you">alel-you</a>.
</p>

<p align="center">
  <a href="https://github.com/alel-you"><img src="https://img.shields.io/badge/author-alel--you-111827?style=flat-square" alt="Author: alel-you"></a>
  <img src="https://img.shields.io/badge/language-C-A8B9CC?style=flat-square&logo=c&logoColor=111827" alt="Language: C">
  <img src="https://img.shields.io/badge/school-42-000000?style=flat-square" alt="42 school">
  <img src="https://img.shields.io/badge/build-Makefile-2E7D32?style=flat-square" alt="Build system: Makefile">
</p>

## Overview

`libft` is a custom static C library that recreates a practical subset of the
standard C library and adds reusable utilities commonly needed throughout the
42 cursus. The project focuses on careful pointer manipulation, memory safety,
string handling, and clean low-level interfaces without relying on convenience
implementations from the standard library.

The result is a small, portable foundation that can be linked into future 42
projects such as `ft_printf`, `get_next_line`, and `minishell`.

## Highlights

- Character classification and case conversion
- Memory allocation, initialization, copying, moving, and comparison
- Safe string copying, concatenation, searching, trimming, and splitting
- Integer parsing and conversion
- File-descriptor output helpers
- Bonus singly linked-list operations
- Strict compilation with `-Wall -Wextra -Werror`
- Static archive output: `libft.a`

## Requirements

- A C compiler such as `cc` or `clang`
- GNU Make
- A Unix-like environment

## Build

```bash
# Build the mandatory library
make

# Build the mandatory library with bonus linked-list objects
make bonus

# Remove object files
make clean

# Remove object files and the archive
make fclean

# Rebuild from scratch
make re
```

The archive is generated as `libft.a` in the project root.

## Usage

Include the public header and link the archive when compiling your program:

```c
#include "libft.h"

#include <fcntl.h>

int main(void)
{
	char **words;

	words = ft_split("build with care", ' ');
	if (!words)
		return (1);

	ft_putendl_fd(words[0], STDOUT_FILENO);
	return (0);
}
```

```bash
cc -Wall -Wextra -Werror main.c -L. -lft -o demo
./demo
```

When using `ft_split`, remember to release the returned array and every string
inside it with a small project-specific cleanup helper.

## API

### Character checks and conversion

| Function | Purpose |
| --- | --- |
| `ft_isalpha` | Check for alphabetic characters |
| `ft_isdigit` | Check for decimal digits |
| `ft_isalnum` | Check for alphanumeric characters |
| `ft_isascii` | Check whether a value is in the ASCII range |
| `ft_isprint` | Check for printable characters |
| `ft_tolower` | Convert an uppercase character to lowercase |
| `ft_toupper` | Convert a lowercase character to uppercase |

### Memory

| Function | Purpose |
| --- | --- |
| `ft_calloc` | Allocate and zero-initialize an array |
| `ft_bzero` | Set a memory region to zero |
| `ft_memset` | Fill a memory region with a byte value |
| `ft_memcpy` | Copy non-overlapping memory |
| `ft_memmove` | Copy memory safely across overlapping regions |
| `ft_memchr` | Locate a byte in memory |
| `ft_memcmp` | Compare two memory regions |

### Strings

| Function | Purpose |
| --- | --- |
| `ft_strlen` | Measure a string |
| `ft_strdup` | Duplicate a string |
| `ft_strchr` / `ft_strrchr` | Find the first or last occurrence of a character |
| `ft_strncmp` | Compare up to `n` characters |
| `ft_strnstr` | Search for a string within a bounded string |
| `ft_strlcpy` / `ft_strlcat` | Bounded string copy and concatenation |
| `ft_substr` | Extract a substring |
| `ft_strjoin` | Join two strings |
| `ft_strtrim` | Remove selected characters from both ends |
| `ft_split` | Split a string by a delimiter |
| `ft_strmapi` | Map a function over a string |
| `ft_striteri` | Apply a function to each character in place |

### Conversion and output

| Function | Purpose |
| --- | --- |
| `ft_atoi` | Convert a string to an integer |
| `ft_itoa` | Convert an integer to a newly allocated string |
| `ft_putchar_fd` | Write one character to a file descriptor |
| `ft_putstr_fd` | Write a string to a file descriptor |
| `ft_putendl_fd` | Write a string and newline to a file descriptor |
| `ft_putnbr_fd` | Write an integer to a file descriptor |

### Bonus linked lists

The bonus implementation uses the following public type:

```c
typedef struct s_list
{
	void            *content;
	struct s_list   *next;
}   t_list;
```

Available operations include `ft_lstnew`, `ft_lstsize`, `ft_lstlast`,
`ft_lstadd_front`, `ft_lstadd_back`, `ft_lstdelone`, `ft_lstclear`,
`ft_lstiter`, and `ft_lstmap`.

## Project structure

```text
.
├── libft.h                 # Public API and linked-list type
├── Makefile                # Mandatory and bonus build targets
├── mandatory/              # Required library implementations
└── bonus/                  # Linked-list bonus implementations
```

## Learning outcomes

This project strengthened practical C fundamentals that matter in larger
systems projects:

- Designing and consuming a consistent C API
- Managing heap ownership and cleanup paths
- Handling boundary cases in string and memory routines
- Working with pointers, function pointers, and linked data structures
- Producing a reusable static library with a reproducible build

## Author

**alel-you**

- GitHub: [ALIELYOUSS](https://github.com/ALIELYOUSS)
- 42 student project

---

<p align="center"><sub>Built with C, Make, and a lot of attention to pointers.</sub></p>