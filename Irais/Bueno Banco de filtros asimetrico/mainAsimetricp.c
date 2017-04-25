#include <stdio.h>
#include <stdlib.h>

#define fases 3

#define Nc 4
#define Ne 8

float h_gen[Nc][Ne] = {     0.3536  ,  0.3536 ,   0.3536  ,  0.3536 ,   0.3536 ,   0.3536 ,   0.3536  ,  0.3536,
   -0.3536  , -0.3536   ,-0.3536 ,  -0.3536  ,  0.3536  ,  0.3536   , 0.3536  ,  0.3536,
   -0.5000 ,  -0.5000  ,  0.5000  ,  0.5000   ,      0  ,       0    ,     0    ,     0,
   -0.7071 ,   0.7071     ,    0       ,  0    ,     0   ,      0     ,    0    ,     0 
                    };

float g_gen[Nc][Ne] = {  0.3536   , 0.3536  ,  0.3536 ,   0.3536  ,  0.3536 ,   0.3536 ,   0.3536 ,   0.3536,
    0.3536 ,   0.3536 ,   0.3536 ,   0.3536 ,  -0.3536 ,  -0.3536 ,  -0.3536 ,  -0.3536,
         0     ,    0      ,   0   ,      0   , 0.5000  ,  0.5000,   -0.5000,   -0.5000,
         0      ,   0      ,   0   ,      0     ,    0      ,   0  ,  0.7071  , -0.7071
                    };
                    
void procesamiento( int x );

float buffer[Ne];
float buffsin[Nc][Ne];

float acu;
float res = 0;
float dp;
float ip;

int i;
int k;
/******************/
int multiplo = 0;
//int xxx = 4;
int matFactAna[Nc]={3 ,    3 ,    2  ,   1};
/******************/

int inf;

int par;

int main(int argc, char *argv[])
{
    
    int x[10] = {1,2,3,4,5,6,7,8,9,10};  
    int ind;
  
    for(ind = 0 ; ind < Ne ; ind++)
        buffer[ind] = 0;
      
    for(ind = 0 ; ind < Nc ; ind++)
        for(inf = 0 ; inf < Ne ; inf++)
            buffsin[ind][inf]=0;
 
  
    for(ind = 0 ; ind < 18 ; ind++){
      
        if(ind<10)   
            procesamiento(x[ind]);
        else
            procesamiento(0);
    }
  
  system("PAUSE");	
  return 0;
}

void procesamiento( int x ){
   
    //Pasamos señal de entrada 
    buffer[0] = x;
    
    for(i = 0 ; i < Nc ; i++){             
        
        //Filtro de analisis
        acu = 0;
        for(k = 0 ; k < Ne ; k++)
            acu = acu + buffer[k] * h_gen[i][k];
                
        //Diezmado
        if(multiplo%2^matFactAna[i] == 0){
            dp = acu;
            multiplo = 0;
        }
        else{
            dp = 0;
        }
        
        //Interpolado
/*        if(multiplo%2^matFactAna[i] == 0)
           ip = dp;
       else
          ip = 0;*/
        
        //Filtro de sintesis                
        buffsin[i][0] = dp;
        
        acu = 0;            
        for(k = 0 ; k < Ne ; k++ )
            acu = acu + buffsin[i][k]*g_gen[i][k];
        
        //Corrimiento de buffer de sintesis
        for(k = Ne - 1 ; k > 0 ; k-- )
            buffsin[i][k] = buffsin[i][k-1];

        
        res = res + acu;  
        
    }    
    
    //Corrimiento de buffer de nalisis
    for(k = Ne - 1 ; k > 0 ; k-- )
        buffer[k] = buffer[k-1];
    
    printf("res: %.2f\n", res);
    
    res = 0;
    multiplo++;
             
}

