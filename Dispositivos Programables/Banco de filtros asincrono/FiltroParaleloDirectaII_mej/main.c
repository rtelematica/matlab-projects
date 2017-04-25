#include <stdio.h>
#include <stdlib.h>

#define Nf 3
#define Nc 3

//Filtros en expancion por fracciones parciales para
// A = [1,2,3,4,5]
// B = [1,2,3,4,5]

float Num[Nf][Nc] = { 0.000000,  0.000000,  0.000000,  
                      0.000000,  0.000000,  0.000000,  
                      1.000000,  0.000000,  0.000000  
                    };

float Den[Nf][Nc] = { 1.000000,  2.575631,  2.394456,  
                      1.000000,  -0.575631,  2.088157,  
                      1.000000,  0.000000,  0.000000  
                    };
                    
int main(int argc, char *argv[])
{
 
    //Señal de entrada                  
    float x[10] = {1,2,3,4,5,6,7,8,9,10};  

    //Buffer
    float v[Nf][Nc];      

    //Variables de almacenamiento temporal
    float a1 = 0;
    float a2 = 0;
    float acu = 0;    
    
    //Variables de proposito generl
    int n = 0, j = 0, k = 0, i = 0;
    int numFil = 0;
    
    //Inicializamos buffer v
    for( j = 0 ; j < Nf ; j++ ){
        for( i = 0 ;  i < Nc ; i++ ){
             v[j][i]=0;                  
        }
    }
    
    
    //Inicio de simulacion    
    for(n = 0 ; n < 10 ; n++ ){
        
        for( numFil = 0 ; numFil < Nf ; numFil++){
        
            a1 = 0;
            a2 = 0;
        
            for(j = 1 ; j < Nc ; j++) 
                a1 = a1 + Den[numFil][j] * v[numFil][j-1];        
        
                
            for( k = Nc ; k > 0 ; k-- )
                v[numFil][k] = v[numFil][k-1];
                                     
                
            v[numFil][0] = x[n] - a1;
                            
            for(k = 0 ; k < Nc ; k++)             
                   a2 = a2 + Num[numFil][k] * v[numFil][k];                                        
            
            acu += a2;
                        
        }
        
        //En acu se encuentra el resultado
        printf("%f,", acu);  
        acu = 0;          
                 
    }
  
    system("PAUSE");	
    return 0;
    
}
