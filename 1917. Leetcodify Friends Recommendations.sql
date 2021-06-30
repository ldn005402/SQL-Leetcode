with shared as (
    select a.user_id user_id, b.user_id recommended_id, a.day, count(distinct a.song_id) as total
        from listens a, listens b
        where a.user_id != b.user_id and a.day = b.day and a.song_id = b.song_id
        group by a.user_id, b.user_id, a.day
        having count(distinct a.song_id) >= 3
)

select distinct user_id, recommended_id
    from 
        (select a.user_id, recommended_id, user1_id
            from shared a
            left join friendship b
            on (a.user_id = b.user1_id and recommended_id = b.user2_id) or (a.user_id = b.user2_id and recommended_id = b.user1_id)
    ) a
    where user1_id is null;
