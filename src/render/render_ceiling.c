/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   render_ceiling.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: napark <napark@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/25 02:32:08 by napark            #+#    #+#             */
/*   Updated: 2021/04/28 17:15:43 by napark           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <cub3d.h>

void	render_ceiling(t_cube3d *s)
{
	g_color = s->bg_color[C - F];
	rect(&s->v, new_vec(0, 0), s->v.width, s->v.height / 2);
}