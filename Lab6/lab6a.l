%{
#include <stdio.h>
int sl = 0, ml = 0;
%}

%%

"/*"([^*]|\*+[^*/])*"*"+"/" { ml++;/* Match multi-line comments */
                                 /* Do nothing, effectively removing the comment */
                              }

"//"(.)*\n                   { sl++;/* Match single-line comments */
                                 /* Do nothing, effectively removing the comment */
                              }

.                            { /* Copy non-comment lines to the output file */
                                 fprintf(yyout, "%s", yytext);
                              }

%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s input_file output_file\n", argv[0]);
        return 1;
    }

    FILE *inputFile = fopen(argv[1], "r");
    FILE *outputFile = fopen(argv[2], "w");

    if (inputFile == NULL || outputFile == NULL) {
        printf("Error opening files.\n");
        return 1;
    }

    yyin = inputFile;
    yyout = outputFile;

    yylex();

    printf("Total number of single line comments : %d\n",sl);
    printf("Total number of multiple line comments : %d\n",ml);

    fclose(inputFile);
    fclose(outputFile);

    return 0;
}

