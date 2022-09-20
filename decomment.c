#include <stdio.h>
#include <stdlib.h>

/*  enumerate all state types */
enum StateType {BASE, COMMENT, POTENTIALCOM, POTENTIALOUTCOM, STR, 
CHR, STRBACK, CHRBACK};

/* takes char c and returns state w base state logic */
int handleBase(int c) {
  enum StateType state = BASE;
  if (c == '/') {
    state = POTENTIALCOM;
  } else if (c == '"') {
    state = STR;
  } else if (c == '\'') {
    state = CHR;
  }
  if (state != POTENTIALCOM) {
    putchar(c);
  }
  return state;
}

/* takes char c and returns state w potentially entering comment 
logic */
int handlePotentialComment(int c) {
  enum StateType state = BASE;
  if (c == '*') {
    putchar(' ');
    state = COMMENT;
  } else if (c == '/') {
    putchar('/');
    state = POTENTIALCOM;
  } else if (c == '"') {
    state = STR;
  } else if (c == '\'') {
    state = CHR;
  }
  if (state != COMMENT && state != POTENTIALCOM) {
    putchar('/');
    putchar(c);
  }
  return state;
}

/* takes char c and returns state w in comment logic */
int handleComment(int c) {
  enum StateType state = COMMENT;
  if (c == '*') {
    state = POTENTIALOUTCOM;
  } else if (c == '\n') {
    putchar('\n');
  }
  return state;
}

/* takes char c and returns state w potentially leaving comment 
logic */
int handlePotentialOutComment(int c) {
  enum StateType state = COMMENT;
  if (c == '/') {
    state = BASE;
  } else if (c == '*') {
    state = POTENTIALOUTCOM;
  } else if (c == '\n') {
    putchar('\n');
  }
  return state;
}

/* takes char c and returns state w in string literal logic */
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

/* takes char c and returns to string literal state */
int handleStrBackslash(int c) {
  putchar(c);
  return STR;
}

/* takes char c and returns state w in char literal logic */
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

/* takes char c and returns to char literal state */
int handleChrBackslash(int c) {
  putchar(c);
  return CHR;
}

int main(void) {

  /* start state off in the base state and as a succesful exit */
  enum StateType state = BASE;
  int exitStatus = EXIT_SUCCESS;
  int lines = 1;
  int commentStart;
  int c;
  while ((c = getchar()) != EOF) {
    /* handle each state */
    switch (state) {
      case BASE:
        state = handleBase(c);
        break;
      case POTENTIALCOM:
        state = handlePotentialComment(c);
        /* update to latest line where comment starts */
        if (state == COMMENT) {
          commentStart = lines;
        }
        break;
      case COMMENT:
        state = handleComment(c);
        break;
      case POTENTIALOUTCOM:
        state = handlePotentialOutComment(c);
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
  if (state == POTENTIALCOM) {
    putchar('/');
  }
  /* output errors to stderr */
  if (state == COMMENT || state == POTENTIALOUTCOM) {
    fprintf(stderr, "Error: line %i: unterminated comment\n", commentStart);
    exit(EXIT_FAILURE);
  }

  return exitStatus;
}
