--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2024-12-18 06:12:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 24595)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    group_id integer NOT NULL,
    group_name character varying(100) NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24594)
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_group_id_seq OWNER TO postgres;

--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;


--
-- TOC entry 222 (class 1259 OID 24602)
-- Name: lectures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectures (
    lecture_id integer NOT NULL,
    lecture_name character varying(100) NOT NULL,
    lecture_date date NOT NULL,
    room_number character varying(50) NOT NULL,
    group_id integer NOT NULL,
    time_slot character varying(50)
);


ALTER TABLE public.lectures OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24601)
-- Name: lectures_lecture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lectures_lecture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lectures_lecture_id_seq OWNER TO postgres;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 221
-- Name: lectures_lecture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lectures_lecture_id_seq OWNED BY public.lectures.lecture_id;


--
-- TOC entry 218 (class 1259 OID 24581)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    teacher_id integer NOT NULL,
    teacher_name character varying(100) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24580)
-- Name: teachers_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_teacher_id_seq OWNER TO postgres;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 217
-- Name: teachers_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_teacher_id_seq OWNED BY public.teachers.teacher_id;


--
-- TOC entry 4706 (class 2604 OID 24598)
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);


--
-- TOC entry 4707 (class 2604 OID 24605)
-- Name: lectures lecture_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures ALTER COLUMN lecture_id SET DEFAULT nextval('public.lectures_lecture_id_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 24584)
-- Name: teachers teacher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN teacher_id SET DEFAULT nextval('public.teachers_teacher_id_seq'::regclass);


--
-- TOC entry 4863 (class 0 OID 24595)
-- Dependencies: 220
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (group_id, group_name) FROM stdin;
1	ИВТ-360
2	ИВТ-363
3	ИВТ-364
4	ПРИН-366
5	ПРИН-367
6	ПРИН-368
7	Ф-369
8	ИИТ-373
\.


--
-- TOC entry 4865 (class 0 OID 24602)
-- Dependencies: 222
-- Data for Name: lectures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectures (lecture_id, lecture_name, lecture_date, room_number, group_id, time_slot) FROM stdin;
10	СЕТИ И ТЕЛЕ-КОММУН.	2024-10-12	В-1302	1	08:00 - 11:50
11	СЕТИ И ТЕЛЕ-КОММУН.	2024-12-12	В-13023	1	08:00 - 11:50
12	ПРОГРАММИРОВАНИЕ.	2024-12-13	В-13024	2	12:00 - 15:00
13	МАТЕМАТИКА.	2024-12-14	В-13025	3	14:00 - 16:30
14	ФИЗИКА.	2024-12-15	В-13026	1	10:00 - 12:30
15	ХИМИЯ.	2024-12-16	В-13027	4	09:00 - 11:00
16	ИСТОРИЯ.	2024-12-17	В-13028	5	11:00 - 13:00
17	ГЕОГРАФИЯ.	2024-12-18	В-13029	1	15:00 - 17:00
18	ФИЛОСОФИЯ.	2024-12-19	В-13030	2	08:00 - 10:00
19	АНГЛИЙСКИЙ.	2024-12-20	В-13031	3	13:00 - 15:00
20	МУЗЫКА.	2024-12-21	В-13032	4	10:00 - 12:00
21	БИОЛОГИЯ.	2024-12-22	В-13033	1	09:00 - 11:00
22	ЛИТЕРАТУРА.	2024-12-23	В-13034	2	14:00 - 16:00
23	ЭКОНОМИКА.	2024-12-24	В-13035	3	11:00 - 13:00
24	ЮРИСПРУДЕНЦИЯ.	2024-12-25	В-13036	4	16:00 - 18:00
25	ФИЗКУЛЬТУРА.	2024-12-26	В-13037	5	08:00 - 10:00
26	СОЦИОЛОГИЯ.	2024-12-27	В-13038	1	12:00 - 14:00
27	ПСИХОЛОГИЯ.	2024-12-28	В-13039	2	10:00 - 12:00
28	СТАТИСТИКА.	2024-12-29	В-13040	3	15:00 - 17:00
29	ХИМИЯ.	2024-12-30	В-13041	4	09:00 - 11:00
30	МАТЕМАТИКА.	2025-01-02	В-13042	1	13:00 - 15:00
31	ФИЗИКА.	2025-01-03	В-13043	2	08:00 - 10:00
32	АНГЛИЙСКИЙ.	2025-01-04	В-13044	3	11:00 - 13:00
33	МУЗЫКА.	2025-01-05	В-13045	4	14:00 - 16:00
34	ЛИТЕРАТУРА.	2025-01-06	В-13046	5	09:00 - 11:00
35	БИОЛОГИЯ.	2025-01-07	В-13047	1	10:00 - 12:00
36	ФИЛОСОФИЯ.	2025-01-08	В-13048	2	15:00 - 17:00
37	ИСТОРИЯ.	2025-01-09	В-13049	3	12:00 - 14:00
38	ГЕОГРАФИЯ.	2025-01-10	В-13050	4	08:00 - 10:00
39	ЭКОНОМИКА.	2025-01-11	В-13051	5	11:00 - 13:00
40	ЮРИСПРУДЕНЦИЯ.	2025-01-12	В-13052	1	14:00 - 16:00
41	СОЦИОЛОГИЯ.	2025-01-13	В-13053	2	10:00 - 12:00
42	ПСИХОЛОГИЯ.	2025-01-14	В-13054	3	09:00 - 11:00
43	СТАТИСТИКА.	2025-01-15	В-13055	4	13:00 - 15:00
44	ФИЗКУЛЬТУРА.	2025-01-16	В-13056	5	08:00 - 10:00
45	МАТЕМАТИКА.	2025-01-17	В-13057	1	16:00 - 18:00
46	ФИЗИКА.	2025-01-18	В-13058	2	11:00 - 13:00
47	АНГЛИЙСКИЙ.	2025-01-19	В-13059	3	15:00 - 17:00
48	МУЗЫКА.	2025-01-20	В-13060	4	12:00 - 14:00
49	ЛИТЕРАТУРА.	2025-01-21	В-13061	5	09:00 - 11:00
50	БИОЛОГИЯ.	2025-01-22	В-13062	1	14:00 - 16:00
51	ФИЛОСОФИЯ.	2025-01-23	В-13063	2	10:00 - 12:00
52	ИСТОРИЯ.	2025-01-24	В-13064	3	13:00 - 15:00
53	ГЕОГРАФИЯ.	2025-01-25	В-13065	4	08:00 - 10:00
54	ЭКОНОМИКА.	2025-01-26	В-13066	5	09:00 - 11:00
55	ЮРИСПРУДЕНЦИЯ.	2025-01-27	В-13067	1	11:00 - 13:00
56	СОЦИОЛОГИЯ.	2025-01-28	В-13068	2	16:00 - 18:00
\.


--
-- TOC entry 4861 (class 0 OID 24581)
-- Dependencies: 218
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (teacher_id, teacher_name) FROM stdin;
\.


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_group_id_seq', 25, true);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 221
-- Name: lectures_lecture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lectures_lecture_id_seq', 56, true);


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 217
-- Name: teachers_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_teacher_id_seq', 1, false);


--
-- TOC entry 4711 (class 2606 OID 24600)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);


--
-- TOC entry 4713 (class 2606 OID 24607)
-- Name: lectures lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (lecture_id);


--
-- TOC entry 4709 (class 2606 OID 24586)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id);


--
-- TOC entry 4714 (class 2606 OID 24608)
-- Name: lectures lectures_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(group_id);


-- Completed on 2024-12-18 06:12:26

--
-- PostgreSQL database dump complete
--

