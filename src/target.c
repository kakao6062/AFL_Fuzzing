#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    char buf[8];
    if (read(0, buf, sizeof(buf)) < 0) exit(1);

    printf(buf);
    exit(0);
}
