// calculate area of triangle using inline function
#include <stdio.h>

// a definition of inline function
__inline float triangle_area(float base, float height)
{
	return (0.5 * base * height);
} 

int main(void)
{
	float b, h, a;

	b = 4;
	h = 6;
	a = triangle_area(b, h);

	printf("Area = (0.5*base*height)\n");
	printf("where, base = 4, height = 6\n");
	// compiler will substitute the inline function code.
	printf("\nArea =  %f\n", a);

	return 0;
}
