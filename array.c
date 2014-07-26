//Hello world program

#include<stdio.h>

int main(){
 int n,a[50],i;
 printf("Insert end value: ");
 scanf("%d",&n);
 for(i=0;i<n;i++){
	 printf("Insert value #%d: ", i+1);
	 scanf("%d",&a[i]);
 }
 for(i=0;i<n;i++){
   printf("%d\n", a[i]);
 }
 return 0;
}
