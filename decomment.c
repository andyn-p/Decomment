#include <stdio.h>
#include <stdlib.h>

/* ascii values of interest */
int NEWLINE      = 10;
int SPACE        = 32;
int STR_LITERAL  = 34;
int CHR_LITERAL  = 39;
int ASTERICK     = 42;
int FORWARDSLASH = 47;
int BACKSLASH    = 92;

/* store lines number as global so functions can access it */
int lines = 1;
int lastCommentLine;

/*  enumerate all state types */
enum StateType {BASE, COMMENT, INCOM, OUTCOM, STR, CHR, STRBACK, CHRBACK};

/* handles the base case state */
int handleBase(int c) {
  enum StateType state = BASE;
  if (c == FORWARDSLASH)     { 
    state = INCOM;
  } else if (c == STR_LITERAL) {
    putchar(c);
    state = STR;
  } else if (c == CHR_LITERAL) {
    putchar(c);
    state = CHR;
  } else {
    putchar(c);
  }
  return state;
}

/* handles potnetially entering comment */
int handleInComment(int c) {
  enum StateType state = BASE;
  if (c == ASTERICK) {
    putchar(SPACE);
    state = COMMENT;
    lastCommentLine = lines;
  } else if (c == FORWARDSLASH) {
    putchar(FORWARDSLASH);
    state = INCOM;
  } else if (c == STR_LITERAL) {
    putchar(FORWARDSLASH);
    putchar(c);
    state = STR;
  } else if (c == CHR_LITERAL) {
    putchar(FORWARDSLASH);
    putchar(c);
    state = CHR;
  } else {
    putchar(FORWARDSLASH);
    putchar(c);
  }
  return state;
}

/* handles the comment case state */
int handleComment(int c) {
  enum StateType state = COMMENT;
  if (c == ASTERICK) {
    state = OUTCOM;
  } else if (c == NEWLINE) {
    putchar(NEWLINE);
  }
  return state;
}

/* handles potentially leaving a comment */
int handleOutComment(int c) {
  enum StateType state = COMMENT;
  if (c == FORWARDSLASH) {
    state = BASE;
  } else if (c == ASTERICK) {
    state = OUTCOM;
  } else if (c == NEWLINE) {
    putchar(NEWLINE);
  }
  return state;
}

/* handles being in a string literal */
int handleStrLiteral(int c) {
  enum StateType state = STR;
  putchar(c);
  if (c == BACKSLASH) {
    state = STRBACK;
  } else if (c == STR_LITERAL) {
    state = BASE;
  } 
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
  putchar(c);
  if (c == BACKSLASH) {
    state = CHRBACK;
  } else if (c == CHR_LITERAL) {
    state = BASE;
  }
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
  int c;
  while ((c = getchar()) != EOF) {
    /* handle each state */
    switch (state) {
      case BASE:
        state = handleBase(c);
        break;
      case INCOM:
        state = handleInComment(c);
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
    if (c == NEWLINE) {
      lines++;
    }
  }
  /* corner case where code ends with a forwardslash */
  if (state == INCOM) {
    putchar(FORWARDSLASH);
  }
  /* output errors to stderr */
  if (state == COMMENT || state == OUTCOM) {
    fprintf(stderr, "Error: line %i: unterminated comment\n", lastCommentLine);
    exit(EXIT_FAILURE);
  }

  return exitStatus;
}
