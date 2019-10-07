#include <math.h>
#include <stdio.h>

void relogio (int dh, int uh, int dm, int um, int ds, int us){
    while (1) {
        us = us + 1;
        if (us == 10){
            us = 0;
            ds = ds + 1;
        }
        if (ds == 6){
            ds = 0;
            um = um + 1;
        }
        if (um == 10){
            um = 0;
            dm = dm + 1;
        }
        if (dm == 6){
            dm = 0;
            uh = uh + 1;
        }
        if (uh == 10 ){
            uh = 0;
            dh =  dh + 1;
        } 
        if (dh == 2 && uh == 4){
                uh = 0;
                dh = 0;
        }
    }
}

int main (){
    int uh = 0;
    int dh = 0;
    int um = 0;
    int dm = 0;
    int us = 0;
    int ds = 0;
    relogio(dh,uh,dm,um,ds,us);
}



