#include <R.h>
#include <Rembedded.h>

extern void F77_NAME(testit)(void);

int main(int ac, char **av) {
  Rf_initEmbeddedR(ac, av);
  testit_();
  Rf_endEmbeddedR(0);
  return 0;
}
