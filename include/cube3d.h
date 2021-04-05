/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cube3d.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: napark <napark@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/30 17:44:15 by napark            #+#    #+#             */
/*   Updated: 2021/04/01 21:14:55 by napark           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <math.h>
#include "./libft/libft.h"
#include "./lib/minilibx-linux/mlx.h"

#define OFF 0
#define ON 1
#define EROOR 0
#define SUCCESS 1
#define NULL 0

# define NO 0
# define SO 1
# define WE 2
# define EA 3
# define S 4
# define F 5
# define C 6
# define R 7

typedef unsigned char t_uc;


extern  t_uc s_parse_check;

typedef struct s_window
{
    int width;
    int height;
}               t_window;

typedef struct  s_window_size
{
    int x;
    int y;
}               t_window_size;

//cubfile width, height
typedef struct s_ivec
{
    int     data_width;
    int     data_height;
}               t_ivec;

//realwindow width, height
typedef struct s_img
{
    int     width;
    int     height;
}               t_img;


typedef struct  s_cube3d
{
    t_window    tw;
    t_img       timg;
    void *mlx;
    void *win;
}               t_cube3d;