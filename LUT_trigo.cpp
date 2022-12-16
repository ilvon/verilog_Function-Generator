#include <iostream>
#include <math.h>
#include <fstream>
using namespace std;

float result;
int intresult;
char resc[4];

void dec2hex_16b(int geval, char *hex){
    for(int i=0; i<4; i++){
        int temp = 0;
        temp = geval % 16;
        if(temp < 10){
            hex[3-i] = temp + 48;
        }else{
            hex[3-i] = temp + 55;
        }
        geval = geval/16;
    }
}

int main(){
    ofstream myfile;
    myfile.open ("sin.coe");
        myfile << "memory_initialization_radix=16;" << endl;
        myfile << "memory_initialization_vector=" << endl;
        for(int n = 0; n < 1000; n++){
            result = 32768 + 32768*sin(n*0.36*M_PI/180);
            intresult = floor(result);
            if(intresult == 65536){
                intresult = intresult - 1;
            }
            dec2hex_16b(intresult,resc); 
            if(n == 999){myfile << resc << ";";} 
            else{myfile << resc << "," << endl;}
        }
    myfile.close();
    cout << "DONE for sin()!" << endl;
/*==================================================================================*/
    myfile.open ("tan.coe");
        myfile << "memory_initialization_radix=16;" << endl;
        myfile << "memory_initialization_vector=" << endl;
        for(int n = 0; n < 1000; n++){
            result = 32768 + 2048*tan(n*0.36*M_PI/180);
            intresult = floor(result);
            if(intresult > 65535){
                intresult = 65535;
            }
            if(intresult < 0){
                intresult = 0;
            }
            dec2hex_16b(intresult,resc);
            if(n == 999){myfile << resc << ";";} 
            else{myfile << resc << "," << endl;}
        }
    myfile.close();
    cout << "DONE for tan()!" << endl;
    return 0;
}