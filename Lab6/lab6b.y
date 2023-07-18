%{
#include <stdio.h>
#include <stdlib.h>
int id = 0, dig = 0, key = 0, op = 0;
%}

%token DIGIT ID KEY OP

%%

input :
	DIGIT input { dig++; }
	| ID input { id++; }
	| KEY input { key++; }
	| OP input { op++; }
	| DIGIT { dig++; }
	| ID { id++; }
	| KEY { key++; }
	| OP { op++; }
	;

%%

extern int yylex();
extern FILE* yyin;

int main(int argc, char* argv[]) {
	if (argc != 2) {
		printf("\nUsage: <exec> <input file>\n");
		exit(1);
	}

	FILE* myfile = fopen(argv[1], "r");
	if (!myfile) {
		printf("\nCannot open input file");
		return -1;
	}

	yyin = myfile;
	do {
		yyparse();
	} while (!feof(yyin));

	printf("Numbers = %d, IDs = %d, Keys = %d, OPs = %d\n", dig, id, key, op);
	return 0;
}

void yyerror(const char* message) {
	printf("\nError while parsing: %s\n", message);
	exit(1);
}

