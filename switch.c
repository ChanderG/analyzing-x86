//Hello world program

#include<stdio.h>

int main(){
 int a,b;
 char c;
 int ans;
 printf("Insert a c b: ");
 scanf("%d %c %d",&a,&c,&b);
 ans = -1;
 switch(c){
   case '+': ans = a + b;
	           break;
   case '-': ans = a - b;
	           break;
   case '*': ans = a * b;
	           break;
   case '/': ans = a / b;
	           break;
   default: printf("Invalid input!\n"); 
 }
 printf("The answer is: %d\n", ans);
 return 0;
}
