#include "libasm.h"

void	test_ft_read(void) {
	printf("--- Test of READ and FT_READ ---\n\n");

	int file = open("Makefile", O_RDONLY, 0666);
	if (file < 0) {
		perror("Unable to open file");
		exit(1);
	}

	char*	str_lib_asm = calloc((100), sizeof(char));
	char*	str_lib_c = calloc((100), sizeof(char));

	size_t read_len = 10;
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zd|\n", ft_read(file, str_lib_asm, read_len));

	close(file);
	file = open("Makefile", O_RDONLY, 0666);
	if (file < 0) {
		perror("Unable to open file");
		exit(1);
	}

	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zd|\n", read(file, str_lib_c, read_len));

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%s|\n", str_lib_asm);
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%s|\n\n", str_lib_c);

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zd|\n", ft_read(-42, str_lib_asm, read_len));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zd|\n", read(-42, str_lib_c, read_len));

	free(str_lib_asm);
	free(str_lib_c);

	close(file);
	printf("--------------------------------\n\n");

}

void	test_ft_write(void) {
	printf("--- Test of WRITE and FT_WRITE ---\n\n");

	char*	str1 = "Hello world!\n";
	char*	str2 = "z\n";
	char*	str3 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n";

	int file = open("test.txt", O_WRONLY | O_CREAT, 0666);
	if (file < 0) {
		perror("Unable to open file");
		exit(1);
	}

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zd|\n", ft_write(file, str1, strlen(str1)));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zd|\n", write(file, str1, strlen(str1)));

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zd|\n", ft_write(file, str2, strlen(str2)));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zd|\n", write(file, str2, strlen(str2)));

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zd|\n", ft_write(file, str3, strlen(str3)));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zd|\n", write(file, str3, strlen(str3)));

	close(file);

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%zd|\n", ft_write(-42, str1, strlen(str1)));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%zd|\n\n", write(-42, str1, strlen(str1)));

	printf("--------------------------------\n\n");
}

void	test_ft_strlen(void) {
	printf("--- Test of STRLEN and FT_STRLEN ---\n\n");

	char*	str1 = "Hello world!";
	char*	str2 = "z";
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

	char*	str1 = "Hello world!";
	char*	str2 = "z";
	char*	str3 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
	
	char*	str_lib_asm = calloc((10000), sizeof(char));
	char*	str_lib_c = calloc((10000), sizeof(char));

	ft_strcpy(str_lib_asm, str1);
	strcpy(str_lib_c, str1);
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%s|\n", str_lib_asm);
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%s|\n\n", str_lib_c);
	
	ft_strcpy(str_lib_asm, str2);
	strcpy(str_lib_c, str2);
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%s|\n", str_lib_asm);
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%s|\n\n", str_lib_c);

	ft_strcpy(str_lib_asm, str3);
	strcpy(str_lib_c, str3);
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%s|\n", str_lib_asm);
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%s|\n\n", str_lib_c);

	free(str_lib_asm);
	free(str_lib_c);

	printf("--------------------------------\n\n");
}

void	test_ft_strcmp(void) {
	printf("--- Test of STRCMP and FT_STRCMP ---\n\n");

	char*	str1 = "Hello world!";
	char*	str2 = "z";
	char*	str3 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%d|\n", ft_strcmp(str1, str1));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%d|\n\n", strcmp(str1, str1));
	
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%d|\n", ft_strcmp(str1, str2));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%d|\n\n", strcmp(str1, str2));

	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%d|\n", ft_strcmp(str1, str3));
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%d|\n\n", strcmp(str1, str3));

	printf("--------------------------------\n\n");
}

void	test_ft_strdup(void) {
	printf("--- Test of STRDUP and FT_STRDUP ---\n\n");

	char*	str1 = "Hello world!";
	char*	str2 = "z";
	char*	str3 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

	char*	str_lib_asm = ft_strdup(str1);
	char*	str_lib_c = strdup(str1);
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%s|\n", str_lib_asm);
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%s|\n\n", str_lib_c);

	free(str_lib_asm);
	free(str_lib_c);
	
	str_lib_asm = ft_strdup(str2);
	str_lib_c = strdup(str2);
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%s|\n", str_lib_asm);
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%s|\n\n", str_lib_c);

	free(str_lib_asm);
	free(str_lib_c);

	str_lib_asm = ft_strdup(str3);
	str_lib_c = strdup(str3);
	printf("\033[36mresultat libasm:\t\033[00m");
	printf("|%s|\n", str_lib_asm);
	printf("\033[32mresultat libc:\t\t\033[00m");
	printf("|%s|\n\n", str_lib_c);

	free(str_lib_asm);
	free(str_lib_c);

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
