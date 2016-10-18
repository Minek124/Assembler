#include <stdio.h>
#include "emmintrin.h"
#include "xmmintrin.h"
#include "pmmintrin.h"

//extern "C" void scaleSSE(float *,float *,int);

int main(void)
{
    float data[400][400],dum[200][200];
    unsigned char header[1078];
    unsigned char ch;
    int N=400,HL=1078;
    int i,j;
    FILE *strm;

    strm=fopen("circle.bmp","rb");
        for(i=0;i<HL;i++) header[i]=fgetc(strm);
        for(i=0;i<N;i++)
        for(j=0;j<N;j++)
            data[i][j]=(float)fgetc(strm);
    fclose(strm);
    
    //for(i=0;i<N/2;i++) scaleSSE(dum[i],data[2*i],N);
	float f[] = {4.0, 4.0, 4.0, 4.0};
	for(i=0;i<N/2;i++){
		__m128 four = _mm_loadu_ps(f);
		for(j=0; j < N;j +=4){
			__m128 a = _mm_loadu_ps(&data[2 * i][2 * j]);
			__m128 b = _mm_loadu_ps(&data[2 * i + 1][2 * j]);
			__m128 c = _mm_loadu_ps(&data[2 * i][2 * j + 4]);
			__m128 d = _mm_loadu_ps(&data[2 * i + 1][2 * j + 4]);
			a = _mm_add_ps (a, b);
			c = _mm_add_ps (c, d);
			a = _mm_hadd_ps (a, c);
			a = _mm_div_ps (a, four);
			_mm_storeu_ps (&dum[i][j], a);
		}
	}
    
    header[4]=0;
    header[3]=160;
    header[2]=118;
    
    header[18]=200;
    header[19]=0;
    header[22]=200;
    header[23]=0;
    
    strm=fopen("dum.bmp","wb");
        for(i=0;i<HL;i++) fputc(header[i],strm);
        for(i=0;i<N/2;i++)
        for(j=0;j<N/2;j++)
            fputc((unsigned char)dum[i][j],strm);
    fclose(strm);
           
}
