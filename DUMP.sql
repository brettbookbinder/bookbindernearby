--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: flowers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flowers (
    id integer NOT NULL,
    name character varying(255),
    picture character varying(255)
);


ALTER TABLE public.flowers OWNER TO postgres;

--
-- Name: flowers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flowers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flowers_id_seq OWNER TO postgres;

--
-- Name: flowers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flowers_id_seq OWNED BY public.flowers.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    flowerid integer,
    choices character varying(255),
    answer character varying(255)
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizzes (
    id integer NOT NULL,
    quiznumber integer,
    questionid integer
);


ALTER TABLE public.quizzes OWNER TO postgres;

--
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizzes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizzes_id_seq OWNER TO postgres;

--
-- Name: quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quizzes_id_seq OWNED BY public.quizzes.id;


--
-- Name: scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scores (
    id integer NOT NULL,
    customerid integer,
    quizid integer,
    score integer
);


ALTER TABLE public.scores OWNER TO postgres;

--
-- Name: scores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_id_seq OWNER TO postgres;

--
-- Name: scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scores_id_seq OWNED BY public.scores.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: flowers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flowers ALTER COLUMN id SET DEFAULT nextval('public.flowers_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: quizzes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN id SET DEFAULT nextval('public.quizzes_id_seq'::regclass);


--
-- Name: scores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores ALTER COLUMN id SET DEFAULT nextval('public.scores_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, email, password) FROM stdin;
1	brett	no	no
2	no	no	no
3	3	no	no
4	4	no	no
5	5	no	no
6	1	1	1
7	Brett2	2	2
8	sdgfdsgnkj	sdfkjnsfd	jnfsgkjn
9	nsdfjkns	jknsdnsjdfn	nsfdkjnsd
10	;kjbh;bhbhjbjhb	jhbjhb	hbjhbjhbjhb
11	asdhbuy	uyuyuy	uyu
12	fdsfs	sdfsdf	sdcsdf
13	qdwdsfsav	vfvfdv	sdvdv
14	d	d	ds
15	dfssdfvs	sdvsv	sdcsdvs
\.


--
-- Data for Name: flowers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flowers (id, name, picture) FROM stdin;
1	Acacia	https://habahram.blob.core.windows.net/flowers/acacia.jpg
2	Alyssum	https://habahram.blob.core.windows.net/flowers/alyssum.jpg
3	Amaryllis	https://habahram.blob.core.windows.net/flowers/amaryllis.jpg
4	Aster	https://habahram.blob.core.windows.net/flowers/aster.jpg
5	Azalea	https://habahram.blob.core.windows.net/flowers/azalea.jpg
6	Begonia	https://habahram.blob.core.windows.net/flowers/begonia.jpg
7	Buttercup	https://habahram.blob.core.windows.net/flowers/buttercup.jpg
8	Calluna	https://habahram.blob.core.windows.net/flowers/calluna.jpg
9	Camellia	https://habahram.blob.core.windows.net/flowers/camellia.jpg
10	Cardinal	https://habahram.blob.core.windows.net/flowers/cardinal.jpg
11	Carnation	https://habahram.blob.core.windows.net/flowers/carnation.jpg
12	Clover	https://habahram.blob.core.windows.net/flowers/clover.jpg
13	Crown Imperial	https://habahram.blob.core.windows.net/flowers/crownimperial.jpg
14	Daffodil	https://habahram.blob.core.windows.net/flowers/daffodil.jpg
15	Dahlia	https://habahram.blob.core.windows.net/flowers/dahlia.jpg
16	Daisy	https://habahram.blob.core.windows.net/flowers/daisy.jpg
17	Gladiolus	https://habahram.blob.core.windows.net/flowers/gladiolus.jpg
18	Lantana	https://habahram.blob.core.windows.net/flowers/lantana.jpg
19	Lily	https://habahram.blob.core.windows.net/flowers/lily.jpg
20	Lotus	https://habahram.blob.core.windows.net/flowers/lotus.jpg
21	Marigold	https://habahram.blob.core.windows.net/flowers/Marigold.jpg
22	Orchid	https://habahram.blob.core.windows.net/flowers/orchid.jpg
23	Primrose	https://habahram.blob.core.windows.net/flowers/primrose.jpg
24	Sunflower	https://habahram.blob.core.windows.net/flowers/sunflower.jpg
25	Tickseed	https://habahram.blob.core.windows.net/flowers/tickseed.jpg
26	Tulip	https://habahram.blob.core.windows.net/flowers/tulip.jpg
27	Zinnia	https://habahram.blob.core.windows.net/flowers/zinnia.jpg
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, flowerid, choices, answer) FROM stdin;
1	1	Acacia Alyssum Amaryllis	Acacia
2	2	Alyssum Amaryllis Aster	Alyssum
3	3	Amaryllis Aster Azalea	Amaryllis
4	4	Aster Azalea Begonia	Aster
5	5	Azalea Begonia Buttercup	Azalea
6	6	Begonia Buttercup Calluna	Begonia
7	2	Alyssum Amaryllis Aster	Alyssum
8	3	Amaryllis Aster Azalea	Amaryllis
9	4	Aster Azalea Begonia	Aster
10	5	Azalea Begonia Buttercup	Azalea
11	6	Begonia Buttercup Calluna	Begonia
12	7	Buttercup Calluna Camellia	Buttercup
13	3	Amaryllis Aster Azalea	Amaryllis
14	4	Aster Azalea Begonia	Aster
15	5	Azalea Begonia Buttercup	Azalea
16	6	Begonia Buttercup Calluna	Begonia
17	7	Buttercup Calluna Camellia	Buttercup
18	8	Calluna Camellia Cardinal	Calluna
19	4	Aster Azalea Begonia	Aster
20	5	Azalea Begonia Buttercup	Azalea
21	6	Begonia Buttercup Calluna	Begonia
22	7	Buttercup Calluna Camellia	Buttercup
23	8	Calluna Camellia Cardinal	Calluna
24	9	Camellia Cardinal Carnation	Camellia
25	5	Azalea Begonia Buttercup	Azalea
26	6	Begonia Buttercup Calluna	Begonia
27	7	Buttercup Calluna Camellia	Buttercup
28	8	Calluna Camellia Cardinal	Calluna
29	9	Camellia Cardinal Carnation	Camellia
30	10	Cardinal Carnation Clover	Cardinal
31	6	Begonia Buttercup Calluna	Begonia
32	7	Buttercup Calluna Camellia	Buttercup
33	8	Calluna Camellia Cardinal	Calluna
34	9	Camellia Cardinal Carnation	Camellia
35	10	Cardinal Carnation Clover	Cardinal
36	11	Carnation Clover Crown Imperial	Carnation
37	7	Buttercup Calluna Camellia	Buttercup
38	8	Calluna Camellia Cardinal	Calluna
39	9	Camellia Cardinal Carnation	Camellia
40	10	Cardinal Carnation Clover	Cardinal
41	11	Carnation Clover Crown Imperial	Carnation
42	12	Clover Crown Imperial Daffodil	Clover
43	8	Calluna Camellia Cardinal	Calluna
44	9	Camellia Cardinal Carnation	Camellia
45	10	Cardinal Carnation Clover	Cardinal
46	11	Carnation Clover Crown Imperial	Carnation
47	12	Clover Crown Imperial Daffodil	Clover
48	13	Crown Imperial Daffodil Dahlia	Crown Imperial
49	9	Camellia Cardinal Carnation	Camellia
50	10	Cardinal Carnation Clover	Cardinal
51	11	Carnation Clover Crown Imperial	Carnation
52	12	Clover Crown Imperial Daffodil	Clover
53	13	Crown Imperial Daffodil Dahlia	Crown Imperial
54	14	Daffodil Dahlia Daisy	Daffodil
55	10	Cardinal Carnation Clover	Cardinal
56	11	Carnation Clover Crown Imperial	Carnation
57	12	Clover Crown Imperial Daffodil	Clover
58	13	Crown Imperial Daffodil Dahlia	Crown Imperial
59	14	Daffodil Dahlia Daisy	Daffodil
60	15	Dahlia Daisy Gladiolus	Dahlia
61	11	Carnation Clover Crown Imperial	Carnation
62	12	Clover Crown Imperial Daffodil	Clover
63	13	Crown Imperial Daffodil Dahlia	Crown Imperial
64	14	Daffodil Dahlia Daisy	Daffodil
65	15	Dahlia Daisy Gladiolus	Dahlia
66	16	Daisy Gladiolus Lantana	Daisy
67	12	Clover Crown Imperial Daffodil	Clover
68	13	Crown Imperial Daffodil Dahlia	Crown Imperial
69	14	Daffodil Dahlia Daisy	Daffodil
70	15	Dahlia Daisy Gladiolus	Dahlia
71	16	Daisy Gladiolus Lantana	Daisy
72	17	Gladiolus Lantana Lily	Gladiolus
73	13	Crown Imperial Daffodil Dahlia	Crown Imperial
74	14	Daffodil Dahlia Daisy	Daffodil
75	15	Dahlia Daisy Gladiolus	Dahlia
76	16	Daisy Gladiolus Lantana	Daisy
77	17	Gladiolus Lantana Lily	Gladiolus
78	18	Lantana Lily Lotus	Lantana
79	14	Daffodil Dahlia Daisy	Daffodil
80	15	Dahlia Daisy Gladiolus	Dahlia
81	16	Daisy Gladiolus Lantana	Daisy
82	17	Gladiolus Lantana Lily	Gladiolus
83	18	Lantana Lily Lotus	Lantana
84	19	Lily Lotus Marigold	Lily
85	15	Dahlia Daisy Gladiolus	Dahlia
86	16	Daisy Gladiolus Lantana	Daisy
87	17	Gladiolus Lantana Lily	Gladiolus
88	18	Lantana Lily Lotus	Lantana
89	19	Lily Lotus Marigold	Lily
90	20	Lotus Marigold Orchid	Lotus
91	16	Daisy Gladiolus Lantana	Daisy
92	17	Gladiolus Lantana Lily	Gladiolus
93	18	Lantana Lily Lotus	Lantana
94	19	Lily Lotus Marigold	Lily
95	20	Lotus Marigold Orchid	Lotus
96	21	Marigold Orchid Primrose	Marigold
97	17	Gladiolus Lantana Lily	Gladiolus
98	18	Lantana Lily Lotus	Lantana
99	19	Lily Lotus Marigold	Lily
100	20	Lotus Marigold Orchid	Lotus
101	21	Marigold Orchid Primrose	Marigold
102	22	Orchid Primrose Sunflower	Orchid
103	18	Lantana Lily Lotus	Lantana
104	19	Lily Lotus Marigold	Lily
105	20	Lotus Marigold Orchid	Lotus
106	21	Marigold Orchid Primrose	Marigold
107	22	Orchid Primrose Sunflower	Orchid
108	23	Primrose Sunflower Tickseed	Primrose
109	19	Lily Lotus Marigold	Lily
110	20	Lotus Marigold Orchid	Lotus
111	21	Marigold Orchid Primrose	Marigold
112	22	Orchid Primrose Sunflower	Orchid
113	23	Primrose Sunflower Tickseed	Primrose
114	24	Sunflower Tickseed Tulip	Sunflower
115	20	Lotus Marigold Orchid	Lotus
116	21	Marigold Orchid Primrose	Marigold
117	22	Orchid Primrose Sunflower	Orchid
118	23	Primrose Sunflower Tickseed	Primrose
119	24	Sunflower Tickseed Tulip	Sunflower
120	25	Primrose Sunflower Tickseed	Tickseed
121	21	Marigold Orchid Primrose	Marigold
122	22	Orchid Primrose Sunflower	Orchid
123	23	Primrose Sunflower Tickseed	Primrose
124	24	Sunflower Tickseed Tulip	Sunflower
125	25	Primrose Sunflower Tickseed	Tickseed
126	26	Sunflower Tickseed Tulip	Tulip
127	17	Gladiolus Lantana Lily	Gladiolus
128	18	Lantana Lily Lotus	Lantana
129	19	Lily Lotus Marigold	Lily
130	20	Lotus Marigold Orchid	Lotus
131	21	Marigold Orchid Primrose	Marigold
132	22	Orchid Primrose Sunflower	Orchid
133	18	Lantana Lily Lotus	Lantana
134	19	Lily Lotus Marigold	Lily
135	20	Lotus Marigold Orchid	Lotus
136	21	Marigold Orchid Primrose	Marigold
137	22	Orchid Primrose Sunflower	Orchid
138	23	Primrose Sunflower Tickseed	Primrose
139	19	Lily Lotus Marigold	Lily
140	20	Lotus Marigold Orchid	Lotus
141	21	Marigold Orchid Primrose	Marigold
142	22	Orchid Primrose Sunflower	Orchid
143	23	Primrose Sunflower Tickseed	Primrose
144	24	Sunflower Tickseed Tulip	Sunflower
145	20	Lotus Marigold Orchid	Lotus
146	21	Marigold Orchid Primrose	Marigold
147	22	Orchid Primrose Sunflower	Orchid
148	23	Primrose Sunflower Tickseed	Primrose
149	24	Sunflower Tickseed Tulip	Sunflower
150	25	Primrose Sunflower Tickseed	Tickseed
151	21	Marigold Orchid Primrose	Marigold
152	22	Orchid Primrose Sunflower	Orchid
153	23	Primrose Sunflower Tickseed	Primrose
154	24	Sunflower Tickseed Tulip	Sunflower
155	25	Primrose Sunflower Tickseed	Tickseed
156	26	Sunflower Tickseed Tulip	Tulip
157	22	Orchid Primrose Sunflower	Orchid
158	23	Primrose Sunflower Tickseed	Primrose
159	24	Sunflower Tickseed Tulip	Sunflower
160	25	Primrose Sunflower Tickseed	Tickseed
161	26	Sunflower Tickseed Tulip	Tulip
162	27	Tickseed Tulip Zinnia	Zinnia
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quizzes (id, quiznumber, questionid) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	2	7
8	2	8
9	2	9
10	2	10
11	2	11
12	2	12
13	3	13
14	3	14
15	3	15
16	3	16
17	3	17
18	3	18
19	4	19
20	4	20
21	4	21
22	4	22
23	4	23
24	4	24
25	5	25
26	5	26
27	5	27
28	5	28
29	5	29
30	5	30
31	6	31
32	6	32
33	6	33
34	6	34
35	6	35
36	6	36
37	7	37
38	7	38
39	7	39
40	7	40
41	7	41
42	7	42
43	8	43
44	8	44
45	8	45
46	8	46
47	8	47
48	8	48
49	9	49
50	9	50
51	9	51
52	9	52
53	9	53
54	9	54
55	10	55
56	10	56
57	10	57
58	10	58
59	10	59
60	10	60
61	11	61
62	11	62
63	11	63
64	11	64
65	11	65
66	11	66
67	12	67
68	12	68
69	12	69
70	12	70
71	12	71
72	12	72
73	13	73
74	13	74
75	13	75
76	13	76
77	13	77
78	13	78
79	14	79
80	14	80
81	14	81
82	14	82
83	14	83
84	14	84
85	15	85
86	15	86
87	15	87
88	15	88
89	15	89
90	15	90
91	16	91
92	16	92
93	16	93
94	16	94
95	16	95
96	16	96
97	17	97
98	17	98
99	17	99
100	17	100
101	17	101
102	17	102
103	18	103
104	18	104
105	18	105
106	18	106
107	18	107
108	18	108
109	19	109
110	19	110
111	19	111
112	19	112
113	19	113
114	19	114
115	20	115
116	20	116
117	20	117
118	20	118
119	20	119
120	20	120
121	21	121
122	21	122
123	21	123
124	21	124
125	21	125
126	21	126
127	22	127
128	22	128
129	22	129
130	22	130
131	22	131
132	22	132
133	23	133
134	23	134
135	23	135
136	23	136
137	23	137
138	23	138
139	24	139
140	24	140
141	24	141
142	24	142
143	24	143
144	24	144
145	25	145
146	25	146
147	25	147
148	25	148
149	25	149
150	25	150
151	26	151
152	26	152
153	26	153
154	26	154
155	26	155
156	26	156
157	27	157
158	27	158
159	27	159
160	27	160
161	27	161
162	27	162
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scores (id, customerid, quizid, score) FROM stdin;
3	11	2	4
4	11	19	4
5	11	19	4
6	11	19	4
7	11	19	4
8	14	2	4
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 15, true);


--
-- Name: flowers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flowers_id_seq', 27, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 162, true);


--
-- Name: quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizzes_id_seq', 162, true);


--
-- Name: scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scores_id_seq', 8, true);


--
-- Name: customers customers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_name_key UNIQUE (name);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: flowers flowers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flowers
    ADD CONSTRAINT flowers_name_key UNIQUE (name);


--
-- Name: flowers flowers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flowers
    ADD CONSTRAINT flowers_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- Name: questions questions_flowerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_flowerid_fkey FOREIGN KEY (flowerid) REFERENCES public.flowers(id);


--
-- Name: quizzes quizzes_questionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_questionid_fkey FOREIGN KEY (questionid) REFERENCES public.questions(id);


--
-- Name: scores scores_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id);


--
-- Name: scores scores_quizid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_quizid_fkey FOREIGN KEY (quizid) REFERENCES public.quizzes(id);


--
-- PostgreSQL database dump complete
--

