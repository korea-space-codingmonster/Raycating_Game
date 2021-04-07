/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   store_map.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: napark <napark@student.42seoul.kr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/07 16:52:46 by napark            #+#    #+#             */
/*   Updated: 2021/04/07 17:33:27 by napark           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <cube3d.h>

void    store_map_information(t_cube3d *s, int fd, char *line, int *check)
{
    map_parsing(s, fd, line, check);
}

static  void    map_parsing(t_cube3d *s, int fd, char *line, int *check)
{
    int     line_str_count;
    t_list  *list;
    t_list  *curr;

    if (!(list = ft_lstnew(line)))//첫번째 list 생성
        ft_strexit("ERROR : Create list error!");
    
    line_str_count = 0;
    while (check = get_next_line(fd, &line) >= 0 && ft_strlen(line))
    {
        //새로운 노드 생성
        if ()sdfasdfasdf
    }
}