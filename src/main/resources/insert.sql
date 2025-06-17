--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;

SET lock_timeout = 0;

SET idle_in_transaction_session_timeout = 0;

SET transaction_timeout = 0;

SET client_encoding = 'UTF8';

SET standard_conforming_strings = ON;

SELECT pg_catalog.set_config ('search_path', '', FALSE);

SET check_function_bodies = FALSE;

SET xmloption = content;

SET client_min_messages = warning;

SET row_security = off;

--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: inssider
--

INSERT INTO
    public.accounts (
        is_deleted,
        created_at,
        deleted_at,
        id,
        updated_at,
        account_type,
        email,
        password,
        provider_user_id,
        role
    )
VALUES (
        FALSE,
        '2025-06-13 02:45:09.268854',
        NULL,
        1,
        '2025-06-13 02:45:09.268854',
        'PASSWORD',
        'cju@zso.kaq',
        '{bcrypt}$2a$10$/P3jvnc418ic0vkd1QsJb.7lhx/QDE/HhNJExx1IJTNMwj8IziZmG',
        NULL,
        'USER'
    );

INSERT INTO
    public.accounts (
        is_deleted,
        created_at,
        deleted_at,
        id,
        updated_at,
        account_type,
        email,
        password,
        provider_user_id,
        role
    )
VALUES (
        FALSE,
        '2025-06-13 02:45:50.439018',
        NULL,
        2,
        '2025-06-13 02:45:50.439018',
        'PASSWORD',
        'smd@caq.fvt',
        '{bcrypt}$2a$10$4WBLpsM.TIPuTXivPBGZ7eERfAnqi0hSrrGW4yUJSeH2snySUMxvq',
        NULL,
        'USER'
    );

INSERT INTO
    public.accounts (
        is_deleted,
        created_at,
        deleted_at,
        id,
        updated_at,
        account_type,
        email,
        password,
        provider_user_id,
        role
    )
VALUES (
        FALSE,
        '2025-06-13 02:46:37.288995',
        NULL,
        52,
        '2025-06-13 02:46:37.288995',
        'PASSWORD',
        'rbb@cnx.pvy',
        '{bcrypt}$2a$10$sQecKaQC2jVLwHVn4fkEneo05sNr3Czl0hrHn6vUgnsIeC.wxdgjW',
        NULL,
        'USER'
    );

INSERT INTO
    public.accounts (
        is_deleted,
        created_at,
        deleted_at,
        id,
        updated_at,
        account_type,
        email,
        password,
        provider_user_id,
        role
    )
VALUES (
        FALSE,
        '2025-06-15 16:00:26.617661',
        NULL,
        102,
        '2025-06-15 16:00:26.617661',
        'PASSWORD',
        'dbwnghks08@gmail.com',
        '{bcrypt}$2a$10$s7rBcFzj/MAhQJbjutHU7.RJhkQffo/Fam.ZdXRDM/Hcu5clyOP.q',
        NULL,
        'USER'
    );

--
-- Data for Name: authorization_codes; Type: TABLE DATA; Schema: public; Owner: inssider
--

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: inssider
--

INSERT INTO public.categories (id, type) VALUES (1, 'KPOP');

INSERT INTO public.categories (id, type) VALUES (2, 'ENTERTAINMENT');

INSERT INTO public.categories (id, type) VALUES (3, 'DRAMA');

INSERT INTO public.categories (id, type) VALUES (4, 'INFLUENCER');

INSERT INTO public.categories (id, type) VALUES (5, 'NEWS');

INSERT INTO public.categories (id, type) VALUES (6, 'MOVIE');

INSERT INTO public.categories (id, type) VALUES (7, 'ANIMATION');

INSERT INTO public.categories (id, type) VALUES (8, 'CHALLENGE');

INSERT INTO public.categories (id, type) VALUES (9, 'NEW_SLANG');

INSERT INTO public.categories (id, type) VALUES (10, 'TRENDING');

INSERT INTO public.categories (id, type) VALUES (99, 'ETC');

INSERT INTO
    public.categories (id, type)
VALUES (999, 'USER_CONTENTS');

--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: inssider
--

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.196',
        NULL,
        1,
        '2024-02-03 02:00:21',
        '2025-06-02 12:22:02.196',
        '이거 다 알면 드라마 중독임 ㅋㅋㅋㅋㅋ
ㄴ(삐삑 검거 완)

-

자세한 내용이 궁금하다면?
프로필 링크 속 브랜더쿠 홈페이지를 확인하세요! 👆',
        'https://www.youtube.com/watch?v=j0cpk88cY58',
        '이거 다 알면 드라마 중독 ㅇㅇ 드라마 밈 TOP10 #shorts #밈 #트렌드 #호박고구마'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        2,
        '2023-01-10 05:55:14',
        '2025-06-02 12:22:02.197',
        '#밈 #유행어 #추억 #2010년대 #2000년대 #짤방

00:00 2005년
01:19 2006년
02:29 2007년
04:07 2008년
06:19 2009년
08:21 2010년
09:30 2011년
10:57 2012년
12:52 2013년
15:31 2014년
17:45 2015년
19:37 2016년
21:00 2017년
21:55 2018년
22:48 2019년
24:05 2020년
25:35 2021년
27:15 2022년',
        'https://www.youtube.com/watch?v=thpZloYjF8k',
        '(개정판) K MEME의 역사 | 2005-2022 추억의 유행어, 짤방, 밈 복습하기'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        3,
        '2024-04-19 22:00:01',
        '2025-06-02 12:22:02.197',
        '#snl #snl코리아 #하이라이트 #레전드 #명장면 #shorts',
        'https://www.youtube.com/watch?v=3x0ZQJ4UDA0',
        '이병헌의 본인 밈 활용법 #snl'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        4,
        '2023-12-29 08:15:00',
        '2025-06-02 12:22:02.197',
        '2023 밈/유행어 Quiz

올한해 마무리를 밈과 유행어로 알아보세요!
 (#신서유기 #지구오락실 #MT게임 #야유회 #술자리게임)',
        'https://www.youtube.com/watch?v=AU8pD8aJiBM',
        '2023 밈/유행어 Quiz (#신서유기 #지구오락실 #MT게임 #야유회 #술자리게임#밈 #meme )'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        5,
        '2025-03-28 08:00:20',
        '2025-06-02 12:22:02.197',
        '스브스 드라마 속 밈(meme) 모아보기👀

0:00 전설의 익룡짤 #웃어요엄마
0:30 그거 아세요? 조인성씨... 입에 주먹 넣은 적 없다는 사실😂 #발리에서생긴일
01:47 강쥐 둥절🐶 #신기생뎐
02:03 레이저 빔 #신기생뎐
04:23 공포의 회전목마 #천국의계단
04:50 사랑은 돌아오는 거야 #천국의계단
05:18 뚝심있는 두한의 사달라💸 #야인시대
07:11내가 고자라니....!!! #야인시대
09:15 스토리는 내가 짤게, 글씨는 누가 ',
        'https://www.youtube.com/watch?v=LNnr8kz4oLw',
        '[#또보장] 😂웃음 참기 챌린지💦 스브스 드라마 밈(meme) 총 정리 #드라마밈'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        6,
        '2020-05-09 07:22:28',
        '2025-06-02 12:22:02.197',
        '한국의 영화와 드라마에 등장한 각종 밈 50가지를 모아봤습니다.
명장면들이죠.
저번에 올렸던 영상에서 짤렸던 부분과 새로운 밈을 추가하였습니다.
구독과 좋아요 부탁드립니다!',
        'https://www.youtube.com/watch?v=katZLFHWbGo',
        '[K-Meme] 한국 드라마/영화 각종 밈 모음 50'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        7,
        '2024-06-27 06:53:23',
        '2025-06-02 12:22:02.197',
        '#궁예 #견훤 #사극밈 #밈 #경종 #천추태후 #야인시대 #합필갤러리 #태조왕건 #태왕사신기 #광개토대왕 #허준 지 눈으로 똑똑히 봤슈 #풍악을울려라 우왕좌왕',
        'https://www.youtube.com/watch?v=onmrfU0Ihe8',
        '사극에서 쏟아진 밈 #드라마쇼츠'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        8,
        '2024-08-22 13:00:28',
        '2025-06-02 12:22:02.197',
        '세상 모든 영화짤들 모여라 #모여짤





#영화 #영화쇼츠 #드라마 #해바라기 #kdrama #숏무비 #영화추천',
        'https://www.youtube.com/watch?v=8EdxaAI9Oio',
        '모든 대사가 밈이된 해바라기 명장면 #해바라기'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        9,
        '2023-01-11 09:00:23',
        '2025-06-02 12:22:02.197',
        '"이따 5시에 호떡집에 불이 날 거예요." | 2000년대생들만 알 수 있다는 장면 | 미래를 보는 소년 제2화 비밀을 말해줘 #shorts #memes #드라마',
        'https://www.youtube.com/watch?v=tjDpdvJu02s',
        '2000년대생들만 아는 밈이라고? #shorts #memes'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        10,
        '2024-10-31 22:30:13',
        '2025-06-02 12:22:02.197',
        '#신병 #군대썰 #군대 #장삐쭈 #신병2 #드라마',
        'https://www.youtube.com/watch?v=qJkxq-v4-7w',
        '밈을 탄생시킨 전설의 명장면 #신병'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        11,
        '2022-12-24 09:00:11',
        '2025-06-02 12:22:02.197',
        '백 구십사째로 알아볼 것은 ''밈이 된 예능의 순간들''입니다.
지금이야 TV시대의 종언이니, 유튜브의 전성시대니 하지만
그래도 옛날에는 예능이 문화를 지배하다시피 했거든요
개중에는 여전히 쓰이는 밈을 만들어낸 순간들이 있습니다.

00:00 인트로
00:22 들어가기 앞서
00:59 ㄱ - 그린라이트
03:00 ㄴ - 나만 아니면 돼
04:58 ㄷ - 두뇌 풀 가동!
07:08 ㄹ - Laughing Guy
09:15 ㅁ - 무식한 사람이 신념을 가지',
        'https://www.youtube.com/watch?v=A7iJ3-5urC8',
        '밈이 된 예능의 순간들 : 옛날에는 임마 예능이 잘 나갔어!'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        12,
        '2023-05-08 09:02:38',
        '2025-06-02 12:22:02.197',
        '[엔믹스] 이 세상 모든 밈 다 알고 있는 오해원 ㅋㅋㅋㅋ

원본 : https://www.youtube.com/watch?v=jugL1CObJ7Q

#엔믹스 #NMIXX #해원 #릴리 #설윤 #배이 #지우 #규진',
        'https://www.youtube.com/watch?v=vqin1XB_Ytc',
        '[엔믹스] 이 세상 모든 밈 다 알고 있는 오해원 ㅋㅋㅋㅋ'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        13,
        '2023-01-07 09:00:07',
        '2025-06-02 12:22:02.197',
        '백 구십오째로 알아볼 것은 ''밈이 된 예능의 순간들 EP 2''입니다.
이러나 저러나해도 가장 인기 있는 프로그램, 예능
그 예능이 남긴 밈은 어떤 것들이 있을까요?

00:00 ㅇ - Young한데? 완전 MZ인데요?
04:08 ㅈ - 절대 이 분들을 놀라게 하면 안 돼
06:35 ㅊ - 췍!
08:42 ㅋ - 컴피티션
10:45 ㅎ - 햄을 김치에 싸서 드셔보세요
12:41 마무리

#예능 #밈 #유행어

BGM 정보 ::

Track: Retro',
        'https://www.youtube.com/watch?v=Ldb5Ik-PvwA',
        '밈이 된 예능의 순간들을 ㄱ~ㅎ순으로 알아보자📺'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        14,
        '2023-08-10 08:31:00',
        '2025-06-02 12:22:02.197',
        '〈유퀴즈 온더블럭〉 매주 수 오후 8시 45분 tvN에서!
TVING으로 다시보기 👉 https://www.tving.com/contents/P000643144',
        'https://www.youtube.com/watch?v=Hq91p6TjUcY',
        '밈의 축복이 끝이 없는 이병헌'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.197',
        NULL,
        15,
        '2025-01-03 05:00:19',
        '2025-06-02 12:22:02.197',
        '#TVPP #라디오스타 #해원

ⓒ MBC&iMBC 무단 전재, 재배포 및 이용(AI학습 포함) 금지',
        'https://www.youtube.com/watch?v=PqtdvsUNK9U',
        '밈 천재 오해원 아껴주시고 성원해주시고.. | 라디오스타 | TVPP | MBC 240828 방송'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        16,
        '2024-11-21 12:00:00',
        '2025-06-02 12:22:02.198',
        'KPOP 아이돌의 알바 도전기 🌚워크돌🌚

매주 목요일 오후 7시
알바생 엔믹스 해원과 찾아옵니다🔥 많관부💕

#워크돌 #엔믹스 #NMIXX #해원 #아이돌 #알바 #shorts #haewon #workdol',
        'https://www.youtube.com/watch?v=a534fL716SM',
        '이 밈 아는 순간 음지행'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        17,
        '2024-08-17 08:30:08',
        '2025-06-02 12:22:02.198',
        '#오분순삭 #무한도전

*무한도전 다시 보기 
✔ WAVVE : 
https://deep.wavve.com/content/M_T72108G
✔ iMBC : 
https://program.imbc.com/challenge


ⓒ MBC&iMBC 무단 전재, 재배포 및 이용(AI학습 포함)금지',
        'https://www.youtube.com/watch?v=QIPRgcctdYg',
        '[#무한도전] 화려한 짤이 채팅방을 감싸네✨ 모르는 사람 없는 추억의 무도짤 대방출🤗 4탄 | 무한도전⏱오분순삭 MBC100925방송'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        101,
        '2025-04-25 12:01:06',
        '2025-06-02 12:24:35.566',
        '#피식대학 #김민수 #유튜브
✅ 피식대학 장학생으로 입학하여 혜택을 누려보세요! 
https://www.youtube.com/channel/UCGX5sP4ehBkihHwt5bs5wvg/join',
        'https://www.youtube.com/watch?v=YjnLsyIjmkg',
        '유행어 제조기 김민수'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        18,
        '2021-03-06 09:00:15',
        '2025-06-02 12:22:02.198',
        '백십일 번째로 알아볼 것은 ''무한도전의 유산'' 입니다.
종영된지 3년이 넘었음에도 아직도 끊임없이 밈을 쏟아내는 무한도전
그들이 남긴 밈은 어떤것들이 있을까요?

#무야호 #쩌리 #10점이요 #히트다히트

00:00~00:36 인트로
00:37~01:59 형이 왜 거기서 나와?
02:00~03:00 쩌리
03:01~03:53 홍철 없는 홍철팀
03:54~04:42 쌩얼
04:43~05:12 깨알같다
05:13~06:17 행쇼
06:18~07:40 어',
        'https://www.youtube.com/watch?v=q-lmc9eMPmo',
        '무한도전의 유산 : 국민예능이 남기고 간 밈들'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        19,
        '2025-04-08 03:00:44',
        '2025-06-02 12:22:02.198',
        'SNL 커피 브랜드로 서열 정리하는 김원훈 #shorts #snl7 #쿠팡플레이',
        'https://www.youtube.com/watch?v=nXg6oJNXHO0',
        'SNL 서열 정리 밈 실사화 #shorts #snl7 #쿠팡플레이'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        20,
        '2022-04-06 02:54:43',
        '2025-06-02 12:22:02.198',
        '',
        'https://www.youtube.com/watch?v=BjsN4cLDExw',
        '봐도봐도 웃긴 대파사건'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        21,
        '2024-10-16 08:12:28',
        '2025-06-02 12:22:02.198',
        '실제 승무원이 저런분이 있으면 즐거운 비행될거같아요.
원본영상은 ''워크돌'' 채널에서 보실 수 있습니다😍
#워크돌 #엔믹스 #오해원 #밈 #shorts',
        'https://www.youtube.com/watch?v=59uU9sSJK2c',
        '(엔믹스) 오해원은 밈 여왕이었다. #shorts'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        22,
        '2024-12-25 11:00:26',
        '2025-06-02 12:22:02.198',
        '',
        'https://www.youtube.com/watch?v=FUmtLAXVU_4',
        '1분만에 보는 2024 아이돌 밈 총결산'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        23,
        '2024-09-21 03:00:26',
        '2025-06-02 12:22:02.198',
        '#엔시티 #마크 #라이즈 #쇼타로 #성찬 #뉴진스 #하니 

& 좋아요 & 알람 설정 
[ 유튜 ] 에서 연예 이슈 확인하기 ▶ https://youtu.co/',
        'https://www.youtube.com/watch?v=Q0COzABx9_4',
        '밈 제조기라는 아이돌 TOP3 #shorts'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        24,
        '2025-01-03 04:00:02',
        '2025-06-02 12:22:02.198',
        '#밈 #헤어지자고 #꽁냥이 #한강고양이 #카리나 #츄 #티라미수케익 #마루챌린지 #마루 #옴브리뉴 #챌린지',
        'https://www.youtube.com/watch?v=2SMC-iqjf4o',
        '모르면 한국인 아니라는 2024 밈 모음'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        25,
        '2024-09-07 11:31:00',
        '2025-06-02 12:22:02.198',
        '📥 비즈니스 문의 : issue.meal@gmail.com

#kpop #케이팝 #뉴진스 #아이브 #아일릿 #아이유 #세븐틴 #오마이걸',
        'https://www.youtube.com/watch?v=dEWWaZl5EXc',
        '어느 순간 밈이 된 한국 노래 가사 TOP9'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        26,
        '2024-06-13 09:00:25',
        '2025-06-02 12:22:02.198',
        '#세븐틴 #아이브 #뉴진스 #스키즈 #에스파',
        'https://www.youtube.com/watch?v=gTnX0oyrbYE',
        '아이돌이 최초로 만들어낸 유행밈 TOP3 #세븐틴 #아이브 #뉴진스 #스키즈 #에스파'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        27,
        '2024-12-31 08:00:14',
        '2025-06-02 12:22:02.198',
        '#2024 #리와인드 #노래 #리믹스 #신년 
이 영상은 2024년에 유행 또는 이슈였던 자료들을 모아 만든 영상입니다. 문제가 있을 시 삭제 하겠습니다.
2024년 밈, 이슈, 노래 모음집/리와인드 rewind

사용한 영상/음악 출처:
마라탕후루
https://youtu.be/jtHqPohjG6w?si=4Ens4rcnKO_sfkVS
완전 럭키비키 잖아?
https://youtu.be/8edBj5uy4Tc?si=W9z9Y6D72ZUGKJcA
잘자요 아',
        'https://www.youtube.com/watch?v=u5Ke0fsjQK8',
        '2024년을 노래로 만들어 보았다'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        28,
        '2023-12-25 14:15:37',
        '2025-06-02 12:22:02.198',
        '이 영상은 2023년에 유행했던 음악, 영상, 밈, 이슈 등 모아서 제작한 영상입니다.
#2023 #리와인드 #노래 #리믹스 #신년 

사용한 영상/음악 출처:
[MV] NewJeans (뉴진스) Ditto
https://youtu.be/Km71Rr9K-Bw?si=zdzJ3nFn5b2hI6Ny
뉴진스의 하입보이요
https://youtube.com/shorts/zYrQbb-KxzQ?si=_cX_jyDiabjABxG7
[MV] NewJeans (뉴진스) ',
        'https://www.youtube.com/watch?v=j1qFr_lMj0A',
        '2023년을 노래로 만들어 보았다'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        29,
        '2022-12-20 08:29:36',
        '2025-06-02 12:22:02.198',
        '#2022 #월드컵
이 영상은 2022년에 유행했던 음악, 영상, 이슈 등 모아서 제작한 영상입니다.

사용한 영상/음악 출처:
[MV] PSY (싸이) That That 
https://youtu.be/8dJyRm2jJ-U
[MV] BLACKPINK (블랙핑크) Pink Venom 
https://youtu.be/gQlMMD8auMs
[MV] Jessi (제시) Zoom
https://youtu.be/6j928wBZ_Bo
[MV] ITZY (있지) S',
        'https://www.youtube.com/watch?v=Kl1X32BugRk',
        '2022년을 노래로 만들어 보았다'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        30,
        '2020-12-30 08:37:42',
        '2025-06-02 12:22:02.198',
        '2020년에 일어났던 모든일을 노래로 만들기
2020년 노래
2020년 노래 매쉬업
유튜브 2020년 리와인드



*사용된 영상 소스
[MV] 블랙핑크 Lovesick Girls 
https://youtu.be/dyRsYk0LyA8
[MV] 창모 메테오 
https://youtu.be/lOrU0MH0bMk
[MV] 쇼미더머니 9 VVS 
https://youtu.be/mZInUHwmzN8
[MV] 릴보이 내일이오면 
https://youtu.be/Ww',
        'https://www.youtube.com/watch?v=A_IsgKPH8Gk',
        '2020년을 노래로 만들어 보았다'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        31,
        '2023-01-03 07:55:31',
        '2025-06-02 12:22:02.198',
        '',
        'https://www.youtube.com/watch?v=7C0xHGQkhYc',
        '2022년 뇌절밈 모음 #shorts #뇌절밈'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        32,
        '2022-06-18 09:00:15',
        '2025-06-02 12:22:02.198',
        '백 육십구번째로 알아볼 것은 ''밈이 된 뉴스 2'' 입니다.

국민들의 알권리와 웃음을 동시에 책임지는 뉴스!
밈이 된 뉴스는 또 어떤 것들이 있을까요?


#밈 #뉴스


BGM 정보 ::


Track: RetroVision - Campfire [NCS Release]
Music provided by NoCopyrightSounds.
Watch: https://youtu.be/geOGWGe0aB8
Free Download / Stream: http',
        'https://www.youtube.com/watch?v=18ZDO4iS7F8',
        '밈이 되어버린 뉴스📺를 ㄱ~ㅎ 순으로 알아보자'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.198',
        NULL,
        33,
        '2022-06-25 09:00:13',
        '2025-06-02 12:22:02.198',
        '백 칠십번째로 알아볼 것은 ''밈이 된 뉴스 3'' 입니다.
재미있는 기자, 웃긴 인터뷰, 아찔한 방송사고
그리고 개평쉰같은 뉴스의 내용 등등
뉴스인 채로만 두기엔 너무 아까운 뉴스들

#밈 #뉴스

BGM 정보 ::

Track: RetroVision - Campfire [NCS Release]
Music provided by NoCopyrightSounds.
Watch: https://youtu.be/geOGWGe0aB8
Free Download /',
        'https://www.youtube.com/watch?v=w0RBzOz4B9M',
        '밈이 된 뉴스 : 뉴스로만 남기에는 너무 아깝다!'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        34,
        '2024-04-23 01:47:47',
        '2025-06-02 12:22:02.199',
        '【 앵커멘트 】
  인터넷에서 유행이 되는 2차, 3차 제작 콘텐츠를 ''밈''이라고 부르죠. 
  올 초 ''힙한'' 트렌드를 주도하며 화제가 된 밈의 소재는 놀랍게도 MBN의 3년 전 보도 영상인데요. 밈의 세계, 김문영 기자가 취재했습니다.


【 기자 】
  지난 2021년 강추위 보도에 등장한 고양이. 

  뉴스에서 보기 어려운 귀여운 장면이 누리꾼들 사이에서 화제가 됐습니다.

  방송 직후 트위터의 전신인 X에서 70만 조회수를 넘더니 올',
        'https://www.youtube.com/watch?v=3ZNqdxh-_qc',
        '카리나도 ''꽁냥이'' 챌린지…뉴스도 밈이 된다 [굿모닝 MBN]'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        35,
        '2022-06-11 10:30:10',
        '2025-06-02 12:22:02.199',
        '백 육십팔번째로 알아볼 것은 ''밈이 된 뉴스'' 입니다.
언론은 아직도 약간 엄근진한 느낌이 어느정도 있는데
그래서 그런가 여기서 웃긴게 나오면 따블로 웃긴 느낌이란 말이죠?
덕분에 밈까지 되어버린 뉴스는 어떤 것들이 있을까요?

#밈 #뉴스

BGM 정보 ::

Track: RetroVision - Campfire [NCS Release]
Music provided by NoCopyrightSounds.
Watch: https://youtu.be/g',
        'https://www.youtube.com/watch?v=dQDENar3tmQ',
        '밈이 된 뉴스 : 역시 진지한 애들이 웃길 때가 제일 재밌어 ㄹㅇㅋㅋ'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        36,
        '2022-03-09 06:07:16',
        '2025-06-02 12:22:02.199',
        '李 ‘부스터슛’·尹 ‘어퍼컷’…후보들의 ‘밈’ 대결

온라인상에서 유행해 다양한 모습으로 복제되는 사진과 동영상을 ''밈''이라고 하죠. 이번 대선에서는 2030 세대들이 대선 후보들을 활용한 ''밈''을 만들어 즐기는 걸 볼 수 있었습니다. 후보들도 표 구애에 이런 밈을 적극 활용했는데요. 2022년 대선 밈 대결을 안보겸 기자가 정리해드립니다. 
목됩니다. 

○ 기사 보기
http://www.ichannela.com/news/main/news_de',
        'https://www.youtube.com/watch?v=0l-9Jxxhq40',
        '李 ‘부스터슛’·尹 ‘어퍼컷’…후보들의 ‘밈’ 대결 | 뉴스A 라이브'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        37,
        '2024-07-28 11:12:13',
        '2025-06-02 12:22:02.199',
        '[세계를 보다]MZ 유권자 파고드는 정치인 밈

요즘 미국 대선판은 인터넷 유행 컨텐츠를 뜻하는 ''밈'' 전쟁이 한창입니다. 이상한데 웃긴 각종 밈 영상에 젊은 세대들이 열광하고 있는겁니다. 세계를보다, 최수연 기자입니다. 

○ 기사 보기
https://www.ichannela.com/news/main/news_detailPage.do?publishId=000000423895

▶채널A뉴스 구독
https://www.youtube.com/tvchan',
        'https://www.youtube.com/watch?v=ghsfpyASGYo',
        '[세계를 보다]MZ 유권자 파고드는 정치인 밈 | 뉴스A'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        38,
        '2024-12-05 10:00:33',
        '2025-06-02 12:22:02.199',
        '#서울시 #2024밈 #10대뉴스',
        'https://www.youtube.com/watch?v=P81GHmuX2q4',
        '2024년 밈 총정리!'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        39,
        '2023-12-19 09:43:26',
        '2025-06-02 12:22:02.199',
        '"꽁꽁 얼어붙은 한강 위로 고양이가 걸어 다닙니다" 원본 영상 [shorts]🐺🐺

지하철역 동파사고로 출근길 물벼락…한강물도 곳곳 ''꽁꽁'' 
한강 위를 걷는 고양이, 2년 전 한파에 무슨 일이?

편집 :  조민수, 송청원, 조수연

#MBN #Shorts #꽁꽁얼어붙은한강위로고양이 #한강고양이 #한강고양이원본 #한강고양이뉴스 #한강위고양이 #겨울한강 #한강얼음고양이 #고양이 #쇼츠 #엠비엔뉴스 #MBNNEWS 


☞ MBN 유튜브 구독하기  ☞',
        'https://www.youtube.com/watch?v=_jKpx0qUqXw',
        '"꽁꽁 얼어붙은 한강 위로 고양이가 걸어 다닙니다" 원본 영상 [shorts]'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        40,
        '2022-07-17 05:38:35',
        '2025-06-02 12:22:02.199',
        '아 힘들었다',
        'https://www.youtube.com/watch?v=Emp_DzzfYmE',
        '생방송 웃참 중계 현장 #Shorts'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        41,
        '2023-05-19 02:42:14',
        '2025-06-02 12:22:02.199',
        '최근 서울에 하루살이 떼가 나타났습니다. 불빛만 있다면 온갖 곳에 몰려드는데요. 영상으로 볼 건데요. 벌레를 싫어하는 분들은 마음의 준비 먼저 해주시죠. 

📌 시리즈 더 보기 https://youtube.com/playlist?list=PL3Eb1N33oAXhXoDEuXiBlCRtivzPWiehd

▶ 기사 전문 https://news.jtbc.co.kr/article/article.aspx?news_id=NB12127005
▶ 시리즈 더 보기 htt',
        'https://www.youtube.com/watch?v=WUojCeq-NQ4',
        '10분 만에 온몸 뒤덮었다…현재 난리난 서울 상황 #JTBC #상암동클라스 #Shorts'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        42,
        '2025-04-25 15:01:34',
        '2025-06-02 12:22:02.199',
        '*본 영상은 AI를 이용한 가상의 콘텐츠로, 공식 영상이 아닙니다

#트랄랄레로 트랄랄라 #브르르브르르파타핌 #퉁퉁퉁사후르 #퉁퉁퉁 #사후르 #브레인롯 #트랄라 #트랄랄라 #brainrot #itallianbrainrot #tungtungtungsahur #tralalerotralala #brrr #funny #trailer #godzilla #kingkong #랜덤박스 #웃긴영상 #웃긴짤 #병맛 #ai #요즘 #vs',
        'https://www.youtube.com/watch?v=tK_ZWzEllKY',
        '자본이 들어간 트랄랄레로 밈'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        43,
        '2023-11-04 14:30:11',
        '2025-06-02 12:22:02.199',
        '#영화 #한국영화 #무비 #공공의적 #설경구 #밈',
        'https://www.youtube.com/watch?v=bsjlG6p-qKw',
        '전설의 밈의 등장'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        44,
        '2025-01-04 03:30:23',
        '2025-06-02 12:22:02.199',
        '이거 의도된 거 맞음? ㅋㅋㅋㅋㅋ',
        'https://www.youtube.com/watch?v=ktXJMF6dQZQ',
        '오겜2 레전드 장면 #오겜2 #오징어게임 #밈 #레전드 #재미'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        45,
        '2023-08-05 04:01:30',
        '2025-06-02 12:22:02.199',
        '그 짤 원본 ㅋㅋㅋㅋㅋㅋ

#넷플릭스 #영화 #shorts',
        'https://www.youtube.com/watch?v=lzkTMpBnHi8',
        '''그 짤'' 원본 ㅋㅋㅋㅋㅋㅋㅋㅋ #shorts'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        46,
        '2024-07-27 10:27:20',
        '2025-06-02 12:22:02.199',
        '',
        'https://www.youtube.com/watch?v=2PgT1bxq0bg',
        'X박꼼 할아버지의 진실 #밈 #코미디 #개그'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        47,
        '2023-05-07 12:00:11',
        '2025-06-02 12:22:02.199',
        '',
        'https://www.youtube.com/watch?v=It2Fgv8ZO3g',
        'SNL | 섬세한 참스승 이병헌ㅋ'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        48,
        '2024-05-20 13:05:55',
        '2025-06-02 12:22:02.199',
        '역대 한국 드라마 명장면/명대사/밈/짤/유행어/OST 모음 영상입니다.

최대한 많은 드라마의 장면을 넣고자 장면마다의 길이가 짧을 수 있음을 참고 부탁드립니다.

또한, 영상에 나오지 않는 OST를 포함하여 드라마 OST 모음 영상을 추후 따로 제작하여 올릴 예정입니다.

※ OST 영상 링크 : https://youtu.be/YWAC7XJodFI?si=uImXJqM-kxhqfTTe

시청해 주셔서 정말 감사합니다.

#드라마 #명장면 #한국드라마',
        'https://www.youtube.com/watch?v=rDiS02bmcCE',
        '한국드라마 명장면/명대사/밈/짤/유행어/OST 모음 (1991~2024)'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:22:02.199',
        NULL,
        49,
        '2023-05-19 02:42:14',
        '2025-06-02 12:22:02.199',
        '최근 서울에 하루살이 떼가 나타났습니다. 불빛만 있다면 온갖 곳에 몰려드는데요. 영상으로 볼 건데요. 벌레를 싫어하는 분들은 마음의 준비 먼저 해주시죠. 

📌 시리즈 더 보기 https://youtube.com/playlist?list=PL3Eb1N33oAXhXoDEuXiBlCRtivzPWiehd

▶ 기사 전문 https://news.jtbc.co.kr/article/article.aspx?news_id=NB12127005
▶ 시리즈 더 보기 htt',
        'https://www.youtube.com/watch?v=WUojCeq-NQ4',
        '10분 만에 온몸 뒤덮었다…현재 난리난 서울 상황 #JTBC #상암동클라스 #Shorts'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        50,
        '2022-12-25 14:39:43',
        '2025-06-02 12:23:40.455',
        '#2022 #밈 #alliwantforchristmasisyou 
다들 한 해 보내시느라 수고하셨습니다!
2021년 12월~2022년 12월까지의 밈을 모아보았습니다',
        'https://www.youtube.com/watch?v=GjjG1QiRF-8',
        '2022년 밈으로 All I Want For Christmas Is You'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        51,
        '2022-12-31 09:00:28',
        '2025-06-02 12:23:40.455',
        '유튜브 볼 시간도 없는 바쁜 현대인을 위한 초간단 채널 "1분만"입니다.

여러분들의 시간을 아껴드리기 위해 재미있는 사실들을 덜도 말고 더도 말고 딱 1분만에 전달드리겠습니다.

저희가 더 재미있는 영상을 제작할 수 있도록 구독과 좋아요 그리고 알림 설정을 해서 도와주시면 정말 감사하겠습

#나는왜 #하나도 #모르겠냐',
        'https://www.youtube.com/watch?v=uaOlhUP4eXE',
        '2022년에는 어떤 밈들이 있었을까?'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        52,
        '2021-12-25 02:00:10',
        '2025-06-02 12:23:40.455',
        '2021년 한 해 동안 우리나라 사람들을 미치게 만들었던 밈과 유행을 총정리 해보았습니다. 맛있게 시청하세요!!♥

🎈 타임스낵 팬카페 구경하기 : https://cafe.naver.com/timesnackbox 🎈

🍪 우리 바삭이들 사랑해요 ㅎㅎ ♥
🍪 반죽이들도 구독해줄꺼죠? :) 
🍪 늘 재밌는 영상으로 보답할게요!!
🍪 타임스낵 부캐 유머스낵도 많이 사랑해주세요ㅎㅎ
🍪 제보와 문의는 [ timesnack24@gmail.com ] 으로 메일주세요',
        'https://www.youtube.com/watch?v=rnqf7o9W6RE',
        '🎄2021년 한국인들을 미치게 만들었던 밈 총정리🎄'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        53,
        '2024-11-02 03:00:51',
        '2025-06-02 12:23:40.455',
        '안녕하세요!
병맛노래를 만들고 있는 빨간내복야코입니다
재미있으셨다면 구독 한번 부탁드립니다!

야코 스튜디오
빨간내복야코, 십제곱, 은개, 재킴, 하푸, 최탱, 두부여자, 김말리, 려무, 교승인, 양배추릅, 갱마, 슥삭

Mixed & Mastered by 말티즈사운드

본 채널의 음악들은 직접 작곡/작사/편곡된 곡들로 모든 저작권은 빨간내복야코에게 있으며, 무단으로 사용을 금지합니다.

야코 악보 구매하기 https://bit.ly/yaco_music',
        'https://www.youtube.com/watch?v=zsGPU6PRg4I',
        '2024 밈으로 만든 노래'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        54,
        '2022-12-30 09:00:35',
        '2025-06-02 12:23:40.455',
        '',
        'https://www.youtube.com/watch?v=wOgX6lm1Zxw',
        '2022년 K-meme 밈 모음'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        55,
        '2022-12-31 13:00:32',
        '2025-06-02 12:23:40.455',
        '밈
밈 모움
밈 모음
meme compilation
웃긴영상
웃긴 영상
웃음참기
웃음 참기
웃긴영상 모음
뷁뷁
memes
you laugh you lose
밈 번역
meme translation',
        'https://www.youtube.com/watch?v=mD16GbQTn7M',
        '2022년 마지막 밈 모음 #2'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        56,
        '2024-12-14 03:00:04',
        '2025-06-02 12:23:40.455',
        '안녕하세요!
병맛노래를 만들고 있는 빨간내복야코입니다
재미있으셨다면 구독 한번 부탁드립니다!

야코 스튜디오
빨간내복야코, 십제곱, 은개, 재킴, 미키, 하푸, 최탱, 두부여자, 김말리, 려무, 교승인, 양배추릅, 갱마, 슥삭

Mixed & Mastered by 말티즈사운드

본 채널의 음악들은 직접 작곡/작사/편곡된 곡들로 모든 저작권은 빨간내복야코에게 있으며, 무단으로 사용을 금지합니다.

야코 악보 구매하기 https://bit.ly/yaco_m',
        'https://www.youtube.com/watch?v=6AhogCsIebk',
        '2024 밈으로 만든 노래 2'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        57,
        '2023-01-04 08:46:29',
        '2025-06-02 12:23:40.455',
        '#shorts #hypeboy',
        'https://www.youtube.com/watch?v=qwJjKxBdfzo',
        '2022년 연말결산 밈모음 #shorts #재밌는영상'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        58,
        '2021-12-18 03:38:59',
        '2025-06-02 12:23:40.455',
        '이 영상은 2021년에 핫했던 영상들을 모아서 만든 영상/노래 입니다

사용한 영상들:
The Kid LAROI, Justin Bieber - STAY [MV] 
https://youtu.be/kTJczUoc26U
롤린 무야호 
https://youtu.be/ZK2TuBxtT9M
멈춰밈 
https://youtu.be/aQyLhYC4E8Y
머니게임 인트로 
https://youtu.be/B2H0SIbSKqE
BTS - 버터 [MV] 
https://yo',
        'https://www.youtube.com/watch?v=YDAy1Q-gUN4',
        '2021년을 노래로 만들어 보았다'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        59,
        '2021-01-05 00:00:01',
        '2025-06-02 12:23:40.455',
        '#2020년 #2020Meme #당연히말이되죠 #죄송합니다 #너로피어오라

계속 올렸다 지웠다해서 죄송합니다. 몇 개 더 떠올라서 추가 및 재업로드합니다.
시간 순서대로 나열했는데 100% 정확하진 않습니다.

''번외''를 나누는 기준
: 대다수에게 알려졌다면 번외가 아님.
  덜 유명하거나, 유튜버 및 스트리머 덕분에 유명해진 밈은 번외로 분류함.

''요즘 유행하는 인사법''은 2019년 말에 유행한건지, 2020년 초에 유행한건지 모르겠어서 제외',
        'https://www.youtube.com/watch?v=6DO1oTvtbw8',
        '빠르게 알아보는 2020년 밈 모음 (38개)'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        60,
        '2021-02-21 14:47:46',
        '2025-06-02 12:23:40.455',
        '#밈 #유행어 #추억 #2010년대 #짤방',
        'https://www.youtube.com/watch?v=8Rr0BazxfY0',
        '2010년대 K-MEME | 2010~2020 추억의 유행어, 짤방, 밈 복습하기'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        61,
        '2020-09-18 09:04:47',
        '2025-06-02 12:23:40.455',
        '나레이션: 유튜버 ''원우주''
원우주님 채널도 많이 사랑해주세요!
https://www.youtube.com/c/원우주',
        'https://www.youtube.com/watch?v=oKQibXTSd1c',
        '한국 유튜브 유행의 변천사 (2012~2020)'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        62,
        '2024-11-28 09:01:01',
        '2025-06-02 12:23:40.455',
        '누구에게나 필요한 정보 [필요한 14]
이번 주제는? 
알고리즘을 점령했던 올해 #가장유행한밈 #트렌드',
        'https://www.youtube.com/watch?v=uRSSxyZOE2k',
        '몇 개나 알고 계신가요? 2024년 밈 총결산 #part1'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.455',
        NULL,
        63,
        '2024-02-29 08:20:43',
        '2025-06-02 12:23:40.455',
        '2018년 히트곡을 한 노래로 만들어보았다
2018년 히트곡 메들리/매쉬업

#2018 #히트곡 #매쉬업 #리믹스 #리와인드 #추억


이메일 - jeongdoyun1226@gmail.com',
        'https://www.youtube.com/watch?v=L2U0T9juuvk',
        '2018년 노래들이 레전드였던 이유'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        64,
        '2024-07-14 05:07:46',
        '2025-06-02 12:23:40.456',
        '',
        'https://www.youtube.com/watch?v=0hcAhYNNaaQ',
        '2025년 유행한 숏폼 챌린지 뭘까?(1월~ 6월)'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        65,
        '2025-01-09 11:45:36',
        '2025-06-02 12:23:40.456',
        '',
        'https://www.youtube.com/watch?v=knvwboPTxJc',
        '요즘 핫한 베트남 유행 괜찮아 딩딩딩딩딩🎶'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        66,
        '2025-04-12 07:41:06',
        '2025-06-02 12:23:40.456',
        '',
        'https://www.youtube.com/watch?v=wCDd9VB56yk',
        '요즘 유행하는 어지러운 ai밈 수준'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        67,
        '2017-07-10 20:19:45',
        '2025-06-02 12:23:40.456',
        '구독과 좋아요 부탁드립니다.',
        'https://www.youtube.com/watch?v=XfzK0Yk9Usc',
        '나루토 페인의 신라천정'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        68,
        '2017-10-07 05:33:30',
        '2025-06-02 12:23:40.456',
        'Subscribe & More Videos: https://goo.gl/uR8eaY
Thank for watching, Please Like Share And SUBSCRIBE!!!
#, #',
        'https://www.youtube.com/watch?v=4MAd-adsYdo',
        '사스케 용서해라, 이게 마지막이다..'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        69,
        '2024-12-20 14:12:43',
        '2025-06-02 12:23:40.456',
        '비즈니스 문의 : l76202060@gmail.com


#애니소개 #애니추천
#애니리뷰#명작#원피스 #루피 #조로 #니카 #샹크스',
        'https://www.youtube.com/watch?v=lIEduivyQqk',
        '편집하다 울어버렸습니다...'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        70,
        '2024-09-08 07:44:25',
        '2025-06-02 12:23:40.456',
        '',
        'https://www.youtube.com/watch?v=0mSwx2fHFTM',
        '🔥어른이 되야 이해하는 그 시절 명대사🔥'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        71,
        '2024-12-06 15:05:23',
        '2025-06-02 12:23:40.456',
        '비즈니스 문의 : l76202060@gmail.com


#애니소개 #애니추천
#애니리뷰#명작#원피스 #루피 #조로 #니카 #샹크스',
        'https://www.youtube.com/watch?v=VduWQtUS4-Q',
        '팬들이 평생 잊지 못한 가슴을 울려버리는 원피스 10가지 명대사'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        72,
        '2016-06-04 02:01:51',
        '2025-06-02 12:23:40.456',
        '勝者だけが正義だ',
        'https://www.youtube.com/watch?v=0tBDVBhKf-I',
        '[원피스] 도플라밍고 - "승자만이 정의다."'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        73,
        '2021-03-22 08:17:50',
        '2025-06-02 12:23:40.456',
        '',
        'https://www.youtube.com/watch?v=FYtlgVhjmy0',
        '키자루 코와이네~'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        74,
        '2022-11-24 12:48:32',
        '2025-06-02 12:23:40.456',
        '#short#원피스#원피스명대사#루피#느려',
        'https://www.youtube.com/watch?v=xdScAXm36i4',
        '루피 명대사'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        75,
        '2024-05-29 10:00:27',
        '2025-06-02 12:23:40.456',
        '#shorts #애니 #원피스 #onepiece',
        'https://www.youtube.com/watch?v=QxX-HABWUzk',
        '사황하고 술먹을 정도로 강력했던 슈퍼루키 에이스의 인싸력 수준 #원피스'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        76,
        '2022-04-25 09:48:26',
        '2025-06-02 12:23:40.456',
        '이번 원피스 1015화 마지막 장면을 간단하게 자막을 넣어봤습니다!

그저 취미로 올릴 뿐인 영상입니다!',
        'https://www.youtube.com/watch?v=GBQDFAG37YQ',
        '원피스 1015화 (자막)中 - [ 나는 몽키 D. 루피 『해적왕』이 될 남자다! ]'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        77,
        '2024-04-06 21:49:17',
        '2025-06-02 12:23:40.456',
        '',
        'https://www.youtube.com/watch?v=eCzEF_wTSNE',
        '루피 레전드 대사 모음'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        78,
        '2025-01-21 14:50:47',
        '2025-06-02 12:23:40.456',
        '매주 토요일일요일 랜덤댄스 버스킹 을 진행하여서 재미난 챌린지 영상잉 올라갑니다^^ 구독과좋아요부탁드립니다^^
We do random dance busking every Saturday and Sunday, and fun challenge videos are uploaded^^ Please subscribe and like^^',
        'https://www.youtube.com/watch?v=nLP-C6puG3M',
        '블랙핑크챌린지 초등학생이? #춤추는곰돌 #춤추는곰돌 #dance #kpop #music #댄스 #blackpink #killthislove #bp #블랙핑크 #댄스챌린지 #챌린지'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        79,
        '2024-06-12 08:35:00',
        '2025-06-02 12:23:40.456',
        '#틱톡챌린지 #challenge #댄스챌린지 #챌린지 #아이유 #iu',
        'https://www.youtube.com/watch?v=WY2nJwDGv0A',
        '아이유가 갑자기 올린 유행 지난 챌린지'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        80,
        '2025-04-23 11:00:26',
        '2025-06-02 12:23:40.456',
        '#아이돌 #kpop #챌린지',
        'https://www.youtube.com/watch?v=In_DJ5xUzU4',
        '2025년 상반기 유명했던 챌린지 모음 TOP10'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        81,
        '2023-06-11 08:56:56',
        '2025-06-02 12:23:40.456',
        '#puffdaddy #illbemissingyou #dancechallenge #dancevideo',
        'https://www.youtube.com/watch?v=rsED-bDLMG4',
        '여행갔을때 친구들이랑 꼭 같이 춰야 하는 춤'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        82,
        '2022-05-13 09:00:01',
        '2025-06-02 12:23:40.456',
        '틱톡 윤미니 윤미 윤mini 최윤미',
        'https://www.youtube.com/watch?v=1MKEo8z9Eko',
        '이노래에 안무 너무 찰떡이쟈나❤️ #아무래도난 #DANCE #SHORTS  #주시크'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        83,
        '2021-11-04 12:30:17',
        '2025-06-02 12:23:40.456',
        'ES IG - https://instagram.com/emetsound
@e4rl___ @adi_2real @mowk1ng',
        'https://www.youtube.com/watch?v=pgBPIZObLL4',
        '복덕방 댄스챌린지 | Northfacegawd - 복덕방 @emetsound'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        84,
        '2021-10-01 07:36:41',
        '2025-06-02 12:23:40.456',
        'TWICE 1ST Full English Single
"The Feels"

#GetTheFeelsWithTWICE 댄스 챌린지👑

✅ 참여방법
#GetTheFeelsWithTWICE 해시태그와 함께 “The Feels” 댄스 챌린지 쇼츠 업로드🤩

✅ 당첨선물
"The Feels" 친필 싸인 인화 사진 3명 

✅ 참여기간: 10월 1일 ~ 10월 7일 

✅ 당첨발표: TWICE Fan’s 내 공지 예정


#GetTheFeelsWithTWICE D',
        'https://www.youtube.com/watch?v=TYyccKc_oNI',
        'TWICE “The Feels”🎶 #GetTheFeelsWithTWICE 댄스 챌린지👑 #GetTheFeelsWithTWICE Dance Challenge👑'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        85,
        '2023-05-17 13:39:12',
        '2025-06-02 12:23:40.456',
        '',
        'https://www.youtube.com/watch?v=Bq97HMEqVq4',
        '머리털나고 구찌 처음 입어봄.. #구찌챌린지'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        86,
        '2023-01-09 02:24:45',
        '2025-06-02 12:23:40.456',
        '🔥요네즈 켄시의 KICK BACK 음원에 맞춰 킥백 댄스 챌린지에 도전해 보세요!⛓🪚  #덴지 #파워 #체인소맨 #챌린지 #킥백 #요네즈켄시 #kenshiyonezu  #KICKBACK #Chainsawman#shorts',
        'https://www.youtube.com/watch?v=lHLqXNcDTUw',
        '🔥KICK BACK 댄스 챌린지🔥'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        87,
        '2025-04-09 08:00:44',
        '2025-06-02 12:23:40.456',
        '》김블루 VIP멤버쉽 가입하기!! :  https://www.youtube.com/channel/UCNzcxCN_Hh_lu5RCSFXKgGQ/join
》김블루 시청자 디코 공지방!! : https://discord.gg/z9pY7PJ
》김블루 인스타 : https://www.instagram.com/kimblue_37/?hl=ko
》치지직 바로가기: https://chzzk.naver.com/0de8f1807076169b7eb9218137e99c51
》',
        'https://www.youtube.com/watch?v=iHXENFE7YuI',
        '2025년 신조어들'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        88,
        '2025-02-14 08:01:03',
        '2025-06-02 12:23:40.456',
        '#문쌤  #신조어



Instagram @bdnspresents',
        'https://www.youtube.com/watch?v=RA-l1g4Mrq0',
        '무조건 유행할 것 같다는 2025년 MZ 신조어'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        89,
        '2025-02-08 12:00:43',
        '2025-06-02 12:23:40.456',
        '신조어 테스트 #신조어 #신조어테스트 #새로운 #새로운말 #줄임말
Made with Vrew, the AI video editor.',
        'https://www.youtube.com/watch?v=XI2j0i5OwWw',
        '신조어 테스트 #신조어 #신조어테스트 #새로운 #새로운말 #줄임말'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        90,
        '2025-03-05 08:00:32',
        '2025-06-02 12:23:40.456',
        'e-mail : jjalhi680@gmail.com

저작권과 관련 기타 비즈니스 연락 주시면 바로 해결하겠습니다~!',
        'https://www.youtube.com/watch?v=RMrYBqhTRAE',
        '2025년 신조어 모음.zip'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        91,
        '2025-03-29 00:30:22',
        '2025-06-02 12:23:40.456',
        '#신조어 #MZ신조어 #MZ #유행어 #신조어뜻 #인싸 #인싸용어 #퀴즈 #신조어모음 #신조어테스트 #줄임말 #줄임말모음 #줄임말테스트 #각종유머 @퀴즈마당-k9y',
        'https://www.youtube.com/watch?v=bcNvxd1cc6g',
        '2025 #신조어 #MZ #줄임말 퀴즈 캘박'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        92,
        '2025-03-31 03:00:26',
        '2025-06-02 12:23:40.456',
        '#신조어 #MZ신조어 #MZ #유행어 #신조어뜻 #인싸 #인싸용어 #퀴즈 #신조어모음 #신조어테스트 #줄임말 #줄임말모음 #줄임말테스트 #각종유머 @퀴즈마당-k9y',
        'https://www.youtube.com/watch?v=Nc-XQvAgv3Y',
        '2025 #신조어 #MZ #줄임말 퀴즈 #추구미'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        93,
        '2025-03-07 08:01:03',
        '2025-06-02 12:23:40.456',
        '#문쌤 #신조어 #유행어


Instagram @bdnspresents',
        'https://www.youtube.com/watch?v=e8Nk62IKzE8',
        '실제로 유행하고 있다는 문쌤이 만든 신조어'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.456',
        NULL,
        94,
        '2024-04-24 12:17:36',
        '2025-06-02 12:23:40.456',
        '2024년 신조어 강의
#신조어 #공감 #조충현',
        'https://www.youtube.com/watch?v=ZVrC1pxG-WY',
        '2024년 신조어 강의'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.457',
        NULL,
        95,
        '2025-05-02 09:01:03',
        '2025-06-02 12:23:40.457',
        '#문쌤 #신조어 #네넷해


Instagram @bdnspresents',
        'https://www.youtube.com/watch?v=beWI7VZbFIE',
        '모르면 유행에 뒤처진다는 2025 신조어'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.457',
        NULL,
        96,
        '2025-05-01 09:00:00',
        '2025-06-02 12:23:40.457',
        '얘들아, 랜선생님 돌아왔다.
너네가 내가 만든 신조어 많이 좋아해 준 덕에 신조어도 벌써 3탄이야.

나한텐 너네가 끼부천사고 못해솔로다.
내년에도 내후년에도 재종반 수업 같이
열심히 헤쳐 나가보자!!!!!


민정아 뭐라고? 재종반에서 매년 만나면 다 내 탓이라고?

그래 너는 평생 그렇게 탓생으로 살아라.

...탓생 사는 민정이 제외한 끼부천사들은 이미
네이버플러스 멤버십 월 4,900원이면 넷플릭스도 볼 수 있는
네넷이 뭔지 알고 있겠지?
htt',
        'https://www.youtube.com/watch?v=-PJFmueIaLg',
        '요즘 난리 났다는 2025 문쌤 신조어'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.458',
        NULL,
        97,
        '2025-04-02 23:00:14',
        '2025-06-02 12:23:40.458',
        '#신조어 #MZ신조어 #MZ #유행어 #신조어뜻 #인싸 #인싸용어 #퀴즈 #신조어모음 #신조어테스트 #줄임말 #줄임말모음 #줄임말테스트 #각종유머 @퀴즈마당-k9y',
        'https://www.youtube.com/watch?v=FOzvb887rA4',
        '2025 #신조어 #MZ #줄임말 퀴즈 #깊생'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:23:40.458',
        NULL,
        98,
        '2024-08-15 10:02:01',
        '2025-06-02 12:23:40.458',
        '',
        'https://www.youtube.com/watch?v=K0Ot4120zIw',
        '모르는 사람 없다는 허경환 유행어 #라디오스타'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        99,
        '2024-04-08 12:37:51',
        '2025-06-02 12:24:35.566',
        '#피식대학 #경상도호소인 #메이드인경상도 #비비',
        'https://www.youtube.com/watch?v=N4CrxSgit-0',
        '요즘 경상도 MZ들은 다 쓴다는 유행어'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        100,
        '2024-08-12 09:00:44',
        '2025-06-02 12:24:35.566',
        '#shorts #kpop #걸그룹 #여자아이돌 #여돌 #보이그룹 #남자아이돌 #남돌 #밈 #엔믹스 #오해원 #외모췤 #있지 #르세라핌 #마마무 #에이핑크 #에스파 #nct127',
        'https://www.youtube.com/watch?v=o3lGYwwY5kM',
        '밈천재 오해원이 만들었다는 유행어'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        102,
        '2024-08-16 10:00:19',
        '2025-06-02 12:24:35.566',
        '',
        'https://www.youtube.com/watch?v=EvukVzICd94',
        '허경환 신상 유행어 #라디오스타'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        103,
        '2025-01-29 23:03:00',
        '2025-06-02 12:24:35.566',
        '',
        'https://www.youtube.com/watch?v=TWrMokWHuLs',
        '진짜 오래 남은 한국 유행어 #shorts'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        104,
        '2024-12-09 06:00:32',
        '2025-06-02 12:24:35.566',
        '@literacyshortform #shorts #신조어 #2025년 #을사년 #새해 #연말 #잘파세대 #mz #유행어 #밈 

▬▬▬음원 출처▬▬▬
🎵Music provided by 브금대통령
🎵Track : Ready To Nap -  https://www.youtube.com/watch?v=UZE2a9gTsDk (장난/엉뚱/Comic) Ready To Nap',
        'https://www.youtube.com/watch?v=jQAIsdyUP5U',
        '2025년도에도 계속 쓸 유행어 TOP3 #shorts #신조어 #2025년 #을사년 #새해 #연말 #잘파세대 #mz #유행어 #밈'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        105,
        '2024-12-01 12:48:15',
        '2025-06-02 12:24:35.566',
        '2024 밈/유행어 Quiz

2024년 한해 마무리를 밈과 유행어로 알아보세요!
 (#신서유기 #지구오락실 #MT게임 #야유회 #술자리게임 #밈 #유행어 #퀴즈)

00:00 Intro
00:11 #1. 1번 문제
00:32 #2. 2번 문제
00:52 #3. 3번 문제
01:19 #4. 4번 문제
01:32 #5. 5번 문제
01:47 #6. 6번 문제
02:02 #7. 7번 문제
02:22 #8. 8번 문제
02:36 #9. 9번 문제
02:51 ',
        'https://www.youtube.com/watch?v=pDS8M4R8OjU',
        '2024 총정리!! 밈/유행어 Quiz (total. 20문제)'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        106,
        '2025-05-08 08:01:00',
        '2025-06-02 12:24:35.566',
        'Shorts
쇼츠

구독하기, 좋아요 한번씩 눌러주시면 너무 감사하겠습니다 ㅎ_ㅎ
▶ https://goo.gl/c21mgR ◀구독하기!

똘킹 유튜브 채널입니다 
리그 오브 레전드, 각종 콘솔 비디오게임, 하이라이트 등등 재밌는 영상이 업로드됩니다

똘킹의 전용 홈페이지, 똘킹왕국!! 많은 가입 부탁드려요~
▶https://cafe.naver.com/ddolking555

트위치에서 스트리밍 중입니다!
▶https://www.twitch.tv/ddol',
        'https://www.youtube.com/watch?v=jLAd4iJyGUQ',
        'MZ 유행어 테스트🤢(개어려움).jpg'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        107,
        '2025-01-05 05:26:08',
        '2025-06-02 12:24:35.566',
        'Shorts
쇼츠

구독하기, 좋아요 한번씩 눌러주시면 너무 감사하겠습니다 ㅎ_ㅎ
▶ https://goo.gl/c21mgR ◀구독하기!

똘킹 유튜브 채널입니다 
리그 오브 레전드, 각종 콘솔 비디오게임, 하이라이트 등등 재밌는 영상이 업로드됩니다

똘킹의 전용 홈페이지, 똘킹왕국!! 많은 가입 부탁드려요~
▶https://cafe.naver.com/ddolking555

트위치에서 스트리밍 중입니다!
▶https://www.twitch.tv/ddol',
        'https://www.youtube.com/watch?v=3QmkmrnqlcI',
        '난 아재일까?? 최신 유행어 테스트.jpg'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        108,
        '2024-10-09 21:50:18',
        '2025-06-02 12:24:35.566',
        '#노무현#이명박#박근혜#문재인#윤석열',
        'https://www.youtube.com/watch?v=zJjs40C3F-c',
        '역대 대통령 유행어'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        109,
        '2024-06-05 08:43:52',
        '2025-06-02 12:24:35.566',
        '뉴진스가 최초로 유행시킨 아이템들',
        'https://www.youtube.com/watch?v=fq1YyePyKkk',
        '독보적 감성 크으으 뉴진스가 최초로 유행시킨 아이템들'
    );

INSERT INTO
    public.posts (
        is_deleted,
        account_id,
        category_id,
        created_at,
        deleted_at,
        id,
        media_upload_time,
        updated_at,
        content,
        media_url,
        title
    )
VALUES (
        FALSE,
        1,
        1,
        '2025-06-02 12:24:35.566',
        NULL,
        110,
        '2025-04-30 06:00:23',
        '2025-06-02 12:24:35.566',
        '출처: daniele arcangeli',
        'https://www.youtube.com/watch?v=cxlvX69nYNQ',
        '알고보니 80년대에 만들었던 ''요즘 그 밈들'' ㄷㄷ'
    );

--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: inssider
--

--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: inssider
--

--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: inssider
--

--
-- Data for Name: post_tags; Type: TABLE DATA; Schema: public; Owner: inssider
--

--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: inssider
--

--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: inssider
--

INSERT INTO
    public.user_profiles (
        account_visible,
        follower_visible,
        is_deleted,
        account_id,
        created_at,
        deleted_at,
        id,
        updated_at,
        bio,
        nickname,
        profile_url
    )
VALUES (
        TRUE,
        TRUE,
        FALSE,
        1,
        '2025-06-13 02:45:09.285161',
        NULL,
        1,
        '2025-06-13 02:45:09.285161',
        NULL,
        'cju@zso.kaq',
        NULL
    );

INSERT INTO
    public.user_profiles (
        account_visible,
        follower_visible,
        is_deleted,
        account_id,
        created_at,
        deleted_at,
        id,
        updated_at,
        bio,
        nickname,
        profile_url
    )
VALUES (
        TRUE,
        TRUE,
        FALSE,
        2,
        '2025-06-13 02:45:50.458815',
        NULL,
        2,
        '2025-06-13 02:45:50.458815',
        NULL,
        'smd@caq.fvt',
        NULL
    );

INSERT INTO
    public.user_profiles (
        account_visible,
        follower_visible,
        is_deleted,
        account_id,
        created_at,
        deleted_at,
        id,
        updated_at,
        bio,
        nickname,
        profile_url
    )
VALUES (
        TRUE,
        TRUE,
        FALSE,
        52,
        '2025-06-13 02:46:37.305704',
        NULL,
        52,
        '2025-06-13 02:46:37.305704',
        NULL,
        'rbb@cnx.pvy',
        NULL
    );

INSERT INTO
    public.user_profiles (
        account_visible,
        follower_visible,
        is_deleted,
        account_id,
        created_at,
        deleted_at,
        id,
        updated_at,
        bio,
        nickname,
        profile_url
    )
VALUES (
        TRUE,
        TRUE,
        FALSE,
        102,
        '2025-06-15 16:00:26.631742',
        NULL,
        102,
        '2025-06-15 16:00:26.631742',
        NULL,
        'dbwnghks08@gmail.com',
        NULL
    );

--
-- Name: accounts_seq; Type: SEQUENCE SET; Schema: public; Owner: inssider
--

SELECT pg_catalog.setval ( 'public.accounts_seq', 151, TRUE );

--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inssider
--

SELECT pg_catalog.setval ( 'public.categories_id_seq', 1, FALSE );

--
-- Name: comments_seq; Type: SEQUENCE SET; Schema: public; Owner: inssider
--

SELECT pg_catalog.setval ( 'public.comments_seq', 1, FALSE );

--
-- Name: likes_seq; Type: SEQUENCE SET; Schema: public; Owner: inssider
--

SELECT pg_catalog.setval ('public.likes_seq', 1, FALSE);

--
-- Name: post_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inssider
--

SELECT pg_catalog.setval ( 'public.post_tags_id_seq', 1, FALSE );

--
-- Name: posts_seq; Type: SEQUENCE SET; Schema: public; Owner: inssider
--

SELECT pg_catalog.setval ('public.posts_seq', 1, FALSE);

--
-- Name: tags_seq; Type: SEQUENCE SET; Schema: public; Owner: inssider
--

SELECT pg_catalog.setval ('public.tags_seq', 1, FALSE);

--
-- Name: user_profiles_seq; Type: SEQUENCE SET; Schema: public; Owner: inssider
--

SELECT pg_catalog.setval ( 'public.user_profiles_seq', 151, TRUE );

--
-- PostgreSQL database dump complete
--