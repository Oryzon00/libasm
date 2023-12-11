#ifndef LIBASM_H
# define LIBASM_H

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

ssize_t	ft_read(int fd, void *buf, size_t count);
ssize_t	ft_write(int fd, const void *buf, size_t count);
size_t	ft_strlen(const char *s);
char *	ft_strdup(const char *str);
char *	ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);

#endif
