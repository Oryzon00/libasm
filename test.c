#include "libasm.h"

void	test_ft_read(void) {
	printf("--- Test of READ and FT_READ ---\n\n");

	printf("--------------------------------\n\n");

}

void	test_ft_write(void) {
	printf("--- Test of WRITE and FT_WRITE ---\n\n");

	printf("--------------------------------\n\n");
}

void	test_ft_strlen(void) {
	printf("--- Test of STRLEN and FT_STRLEN ---\n\n");

	char*	str1 = "Hello world!";
	char*	str2 = "a";
	char*	str3 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
	
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zu|\n", ft_strlen(str1));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zu|\n\n", strlen(str1));
	
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zu|\n", ft_strlen(str2));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zu|\n\n", strlen(str2));

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zu|\n", ft_strlen(str3));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zu|\n\n", strlen(str3));

	printf("--------------------------------\n\n");
}

void	test_ft_strcpy(void) {
	printf("--- Test of STRCPY and FT_STRCPY ---\n\n");

	printf("--------------------------------\n\n");
}

void	test_ft_strcmp(void) {
	printf("--- Test of STRCMP and FT_STRCMP ---\n\n");

	printf("--------------------------------\n\n");
}

void	test_ft_strdup(void) {
	printf("--- Test of STRDUP and FT_STRDUP ---\n\n");

	//test cpy

	//test free
	printf("--------------------------------\n\n");

}

int	main(void) {
	printf("This is a serie of test comparing my libasm and the lib c\n\n");
	test_ft_read();
	test_ft_write();
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_strdup();
	return (0);
}
