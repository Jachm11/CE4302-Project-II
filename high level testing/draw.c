#include <emmintrin.h>
#include <stdio.h>

void draw_line(int x0, int y0, int x1, int y1);
void draw_straight(int org, int end, int hor, int cons);

// to compile: gcc -msse4.1 -o draw draw.c
int main(int argc, char const *argv[])
{
    int x0 = 0;
    int y0 = 0;
    int x1 = 24;
    int y1 = 0;

    // draw_line(x0, y0, x1, y1);

    draw_straight(16, 24, 0, 0);

    return 0;
}

void draw_line(int x0, int y0, int x1, int y1)
{
    // Restar v0 v1 dv ---------------
    __m128i xmm_v0 = _mm_set_epi32(0, 0, y0, x0);
    __m128i xmm_v1 = _mm_set_epi32(0, 0, y1, x1);
    __m128i xmm_dv = _mm_sub_epi32(xmm_v1, xmm_v0);
    int dv[4];
    _mm_storeu_si128((__m128i *)dv, xmm_dv);
    // ------------------------------

    // abs dv
    if (dv[0] < 0)
    {
        dv[0] = -dv[0];
    }

    if (dv[1] < 0)
    {
        dv[1] = -dv[1];
    }
    // -------

    int steep = dv[1] > dv[0];

    if (steep)
    {
        int temp = x0;
        x0 = y0;
        y0 = temp;

        temp = x1;
        x1 = y1;
        y1 = temp;
    }

    if (x0 > x1)
    {
        int temp = x0;
        x0 = x1;
        x1 = temp;

        temp = y0;
        y0 = y1;
        y1 = temp;
    }

    // Restar v0 v1 dv ---------------
    xmm_v0 = _mm_set_epi32(0, 0, y0, x0);
    xmm_v1 = _mm_set_epi32(0, 0, y1, x1);
    xmm_dv = _mm_sub_epi32(xmm_v1, xmm_v0);
    _mm_storeu_si128((__m128i *)dv, xmm_dv);
    // ------------------------------

    // abs dv
    if (dv[0] < 0)
    {
        dv[0] = -dv[0];
    }

    if (dv[1] < 0)
    {
        dv[1] = -dv[1];
    }
    // -------

    int error = dv[0];
    int ystep = -1;
    if (y0 < y1)
    {
        ystep = 1;
    }

    int y = y0;

    printf("v0 = (%d,%d)\n", x0, y0);
    printf("v1 = (%d,%d)\n", x1, y1);

    for (int x = x0; x <= x1; x++)
    {
        if (steep)
        {
            printf("(%d,%d), ", y, x);
        }
        else
        {
            printf("(%d,%d), ", x, y);
        }
        error = error - dv[1];

        if (error < 0)
        {
            y = y + ystep;
            error = error + dv[0];
        }
    }

    printf("\n");
}

// (end > org) and (end - org) % 4 = 0 and (end - org)/4 > 2
// Tambien requeriria una forma de guardar los vectores en direcciones "custom"
void draw_straight(int org, int end, int hor, int cons)
{

    int o1 = org + 1;
    int o2 = org + 2;
    int o3 = org + 3;
    int o4 = org + 4;

    // STR 5 puntos
    if (hor)
    {
        printf("(%d,%d), ", org, cons);
        printf("(%d,%d), ", o1, cons);
        printf("(%d,%d), ", o2, cons);
        printf("(%d,%d), ", o3, cons);
        printf("(%d,%d), ", o4, cons);
    }
    else
    {
        printf("(%d,%d), ", cons, org);
        printf("(%d,%d), ", cons, o1);
        printf("(%d,%d), ", cons, o2);
        printf("(%d,%d), ", cons, o3);
        printf("(%d,%d), ", cons, o4);
    }

    __m128i xmm_v = _mm_set_epi32(o4, o3, o2, o1);
    __m128i xmm_offset = _mm_set_epi32(4, 4, 4, 4);

    for (int i = 4; i < end - org; i = i + 4)
    {

        xmm_v = _mm_add_epi32(xmm_v, xmm_offset);
        int points[4];
        _mm_storeu_si128((__m128i *)points, xmm_v);
        if (hor)
        {
            printf("(%d,%d), ", points[0], cons);
            printf("(%d,%d), ", points[1], cons);
            printf("(%d,%d), ", points[2], cons);
            printf("(%d,%d), ", points[3], cons);
        }
        else
        {
            printf("(%d,%d), ", cons, points[0]);
            printf("(%d,%d), ", cons, points[1]);
            printf("(%d,%d), ", cons, points[2]);
            printf("(%d,%d), ", cons, points[3]);
        }
    }
    printf("\n");
}