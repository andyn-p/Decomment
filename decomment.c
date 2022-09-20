#include <stdio.h>
#include <stdlib.h>

/*  enumerate all state types */
enum StateType {BASE, COMMENT, INCOM, OUTCOM, STR, CHR, STRBACK, CHRBACK};

/* handles the base case state */
int handleBase(int c) {
  enum StateType state = BASE;
  if (c == '/') {
    state = INCOM;
  } else if (c == '"') {
    state = STR;
  } else if (c == '\'') {
    state = CHR;
  }
  if (state != INCOM) {
    putchar(c);
  }
  return state;
}

/* handles potentially entering comment */
int handleInComment(int c) {
  enum StateType state = BASE;
  if (c == '*') {
    putchar(' ');
    state = COMMENT;
  } else if (c == '/') {
    putchar('/');
    state = INCOM;
  } else if (c == '"') {
    state = STR;
  } else if (c == '\'') {
    state = CHR;
  }
  if (state != COMMENT && state != INCOM) {
    putchar('/');
    putchar(c);
  }
  return state;
}

/* handles the comment case state */
int handleComment(int c) {
  enum StateType state = COMMENT;
  if (c == '*') {
    state = OUTCOM;
  } else if (c == '\n') {
    putchar('\n');
  }
  return state;
}

/* handles potentially leaving a comment */
int handleOutComment(int c) {
  enum StateType state = COMMENT;
  if (c == '/') {
    state = BASE;
  } else if (c == '*') {
    state = OUTCOM;
  } else if (c == '\n') {
    putchar('\n');
  }
  return state;
}

/* handles being in a string literal */
int handleStrLiteral(int c) {
  enum StateType state = STR;
  if (c == '\\') {
    state = STRBACK;
  } else if (c == '"') {
    state = BASE;
  } 
  putchar(c);
  return state;
}

/* handles being in a string backslash */
int handleStrBackslash(int c) {
  putchar(c);
  return STR;
}

/* handles being in a character literal */
int handleChrLiteral(int c) {
  enum StateType state = CHR;
  if (c == '\\') {
    state = CHRBACK;
  } else if (c == '\'') {
    state = BASE;
  }
  putchar(c);
  return state;
}

/* handles being in a character literal */
int handleChrBackslash(int c) {
  putchar(c);
  return CHR;
}

int main(void) {

  /* start state off in the base state and as a succesful exit */
  enum StateType state = BASE;
  int exitStatus = EXIT_SUCCESS;
  int lines = 1;
  int commentStart = 1;
  int c;
  while ((c = getchar()) != EOF) {
    /* handle each state */
    switch (state) {
      case BASE:
        state = handleBase(c);
        break;
      case INCOM:
        state = handleInComment(c);
        if (state == COMMENT) {
          commentStart = lines;
        }
        break;
      case COMMENT:
        state = handleComment(c);
        break;
      case OUTCOM:
        state = handleOutComment(c);
        break;
      case STR:
        state = handleStrLiteral(c);
        break;
      case CHR:
        state = handleChrLiteral(c);
        break;
      case STRBACK:
        state = handleStrBackslash(c);
        break;
      case CHRBACK:
        state = handleChrBackslash(c);
    }
    /* increment line number each time a new line is read */
    if (c == '\n') {
      lines++;
    }
  }
  /* corner case where code ends with a forwardslash */
  if (state == INCOM) {
    putchar('/');
  }
  /* output errors to stderr */
  if (state == COMMENT || state == OUTCOM) {
    fprintf(stderr, "Error: line %i: unterminated comment\n", commentStart);
    exit(EXIT_FAILURE);
  }

  return exitStatus;
}
