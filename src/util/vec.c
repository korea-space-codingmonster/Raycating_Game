/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   vec.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: napark <napark@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/24 15:55:15 by napark            #+#    #+#             */
/*   Updated: 2021/04/28 17:16:32 by napark           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <cub3d.h>

t_vec	new_vec(float x, float y)
{
	t_vec	result;

	result.x = x;
	result.y = y;
	return (result);
}

t_ivec	new_ivec(int x, int y)
{
	t_ivec	result;

	result.x = x;
	result.y = y;
	return (result);
}

t_vec	rot_vec(t_vec v, float angle)
{
	t_vec result;
	t_vec rotate;

	if (angle == 0)
		return (v);
	rotate = new_vec(cos(angle), sin(angle));
	result.x = rotate.x * v.x - rotate.y * v.y;
	result.y = rotate.y * v.x + rotate.x * v.y;
	return (result);
}

void	normalise_pos(t_cube3d *s, t_vec *pos)
{
	if (pos->x < 0)
		pos->x = 0;
	else if (pos->x > s->v.width)
		pos->x = s->v.width - 1;
	if (pos->y < 0)
		pos->y = 0;
	else if (pos->y > s->v.height)
		pos->y = s->v.height - 1;
}

void	normalise_ipos(t_cube3d *s, t_ivec *pos)
{
	if (pos->x < 0)
		pos->x = 0;
	else if (pos->x > s->v.width)
		pos->x = s->v.width - 1;
	if (pos->y < 0)
		pos->y = 0;
	else if (pos->y > s->v.height)
		pos->y = s->v.height - 1;
}
