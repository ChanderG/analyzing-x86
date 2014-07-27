//Hello world program

#include<stdio.h>

int main(){
 int n,a[20][20],i,j;
 printf("Insert end value: ");
 scanf("%d",&n);
 for(i=0;i<n;i++){
   for(j=0;j<n;j++){
	   scanf("%d", &a[i][j]); 
   }
 }
 for(i=0;i<n;i++){
   for(j=0;j<n;j++){
     printf("%d ", a[i][j]);
   }
	 printf("\n");
 }
 return 0;
}
