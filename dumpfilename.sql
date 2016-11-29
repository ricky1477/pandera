--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying
);


ALTER TABLE public.admins OWNER TO rkreyhsig9620;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: rkreyhsig9620
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO rkreyhsig9620;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rkreyhsig9620
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    name character varying,
    email character varying,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    dob date,
    city character varying,
    zipcode character varying,
    street_address character varying,
    sms_gateway character varying
);


ALTER TABLE public.clients OWNER TO rkreyhsig9620;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: rkreyhsig9620
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO rkreyhsig9620;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rkreyhsig9620
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: estimates; Type: TABLE; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE TABLE estimates (
    id integer NOT NULL,
    description character varying,
    price numeric,
    client_id integer,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.estimates OWNER TO rkreyhsig9620;

--
-- Name: estimates_id_seq; Type: SEQUENCE; Schema: public; Owner: rkreyhsig9620
--

CREATE SEQUENCE estimates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estimates_id_seq OWNER TO rkreyhsig9620;

--
-- Name: estimates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rkreyhsig9620
--

ALTER SEQUENCE estimates_id_seq OWNED BY estimates.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE TABLE invoices (
    id integer NOT NULL,
    client_id integer,
    invoice_number integer,
    maturity date,
    description text,
    total numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    paid boolean
);


ALTER TABLE public.invoices OWNER TO rkreyhsig9620;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: rkreyhsig9620
--

CREATE SEQUENCE invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoices_id_seq OWNER TO rkreyhsig9620;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rkreyhsig9620
--

ALTER SEQUENCE invoices_id_seq OWNED BY invoices.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO rkreyhsig9620;

--
-- Name: services; Type: TABLE; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE TABLE services (
    id integer NOT NULL,
    date date,
    description text,
    price numeric,
    maturity date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    client_id integer,
    paid boolean,
    invoice_id integer
);


ALTER TABLE public.services OWNER TO rkreyhsig9620;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: rkreyhsig9620
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO rkreyhsig9620;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rkreyhsig9620
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: shipping_addresses; Type: TABLE; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE TABLE shipping_addresses (
    id integer NOT NULL,
    name character varying,
    street character varying,
    city character varying,
    state character varying,
    zipcode character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_default boolean,
    email character varying,
    phone character varying
);


ALTER TABLE public.shipping_addresses OWNER TO rkreyhsig9620;

--
-- Name: shipping_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: rkreyhsig9620
--

CREATE SEQUENCE shipping_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_addresses_id_seq OWNER TO rkreyhsig9620;

--
-- Name: shipping_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rkreyhsig9620
--

ALTER SEQUENCE shipping_addresses_id_seq OWNED BY shipping_addresses.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rkreyhsig9620
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rkreyhsig9620
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rkreyhsig9620
--

ALTER TABLE ONLY estimates ALTER COLUMN id SET DEFAULT nextval('estimates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rkreyhsig9620
--

ALTER TABLE ONLY invoices ALTER COLUMN id SET DEFAULT nextval('invoices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rkreyhsig9620
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rkreyhsig9620
--

ALTER TABLE ONLY shipping_addresses ALTER COLUMN id SET DEFAULT nextval('shipping_addresses_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: rkreyhsig9620
--

COPY admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, image) FROM stdin;
1	rickreyhsig@gmail.com	$2a$11$87vPXNQKPE4afK98enEruOqfX9eASnMfGs0KGIVXcxcN53tOpxKta	\N	\N	\N	12	2016-11-17 20:50:41.287137	2016-11-14 20:39:35.152814	10.247.59.242	10.247.59.242	2016-09-01 22:16:44.452376	2016-11-17 20:50:41.288623	\N
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rkreyhsig9620
--

SELECT pg_catalog.setval('admins_id_seq', 2, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: rkreyhsig9620
--

COPY clients (id, name, email, phone, created_at, updated_at, dob, city, zipcode, street_address, sms_gateway) FROM stdin;
4	Test	rickreyhsig@gmail.com		2016-10-06 20:52:17.402675	2016-11-07 15:02:09.345613	2016-10-06			Test	\N
6	sfv	lika@mail.com	2404833458	2016-11-14 20:50:03.568087	2016-11-14 20:50:03.568087	2016-11-14	dfbv	df	sfv	\N
7	db	df	2404833458	2016-11-14 20:52:05.583907	2016-11-14 20:52:05.583907	2016-11-14	dfb	db	df	\N
10	Rickx	rickreyhsig@gmail.com	2404833458	2016-11-14 22:36:43.102237	2016-11-14 22:36:43.102237	2016-11-14			test dr	@tmomail.net
2	Aline	rickreyhsig@gmail.com	2404833458	2016-09-01 16:46:43.439299	2016-11-14 23:08:41.509561	2016-09-01	Gaithersburg	20853	1234 Street	@tmomail.net
8	Rickerdinhu	rickreyhsig@gmail.com	2404833458	2016-11-14 22:32:05.793157	2016-11-14 23:21:31.425557	2016-11-14			sdv	@sms.myboostmobile.com
1	Rick	rickreyhsig@gmail.com	2404833458	2016-08-29 20:14:46.358499	2016-11-17 21:36:40.298105	2016-08-29	Gaithersburg	20853	123 Elm St	@tmomail.net
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rkreyhsig9620
--

SELECT pg_catalog.setval('clients_id_seq', 10, true);


--
-- Data for Name: estimates; Type: TABLE DATA; Schema: public; Owner: rkreyhsig9620
--

COPY estimates (id, description, price, client_id, notes, created_at, updated_at) FROM stdin;
1	Fall Clean-Up	34.0	8	Test	2016-11-17 20:52:47.586153	2016-11-17 20:52:47.586153
2	Weekly Cutting	67.0	1	Dude.. notes	2016-11-17 21:36:57.97066	2016-11-17 21:36:57.97066
3	Weekly Cutting	46.0	1	Tets yo	2016-11-17 21:39:30.130846	2016-11-17 21:39:30.130846
4	Weekly Cutting	50.0	1	Yo weekly cuttin' be 50 maing!	2016-11-17 21:42:02.015448	2016-11-17 21:42:02.015448
5	Weekly Cutting	50.0	1	Yo weekly cuttin' be 50 maing!	2016-11-17 21:42:31.675891	2016-11-17 21:42:31.675891
6	Fertilizer	56.0	1	Gotta fertilze maing!	2016-11-17 21:46:38.340758	2016-11-17 21:46:38.340758
\.


--
-- Name: estimates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rkreyhsig9620
--

SELECT pg_catalog.setval('estimates_id_seq', 6, true);


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: rkreyhsig9620
--

COPY invoices (id, client_id, invoice_number, maturity, description, total, created_at, updated_at, paid) FROM stdin;
76	4	772016	2016-11-07	Invoice for Test	490.0	2016-11-07 15:23:11.4062	2016-11-07 15:28:54.79111	t
77	1	772016	2016-11-14	Testing SMS	0.0	2016-11-14 23:04:17.464479	2016-11-14 23:04:17.464479	f
78	1	782016	2016-11-14	Testing SMS	0.0	2016-11-14 23:05:02.113536	2016-11-14 23:05:02.113536	f
79	1	792016	2016-11-14	Testing SMS	0.0	2016-11-14 23:06:15.052044	2016-11-14 23:06:15.052044	f
80	2	802016	2016-11-14	Testing SMS(2)	20.0	2016-11-14 23:07:46.80676	2016-11-14 23:07:46.80676	f
81	8	812016	2016-11-14	Test SMS(3)	40.0	2016-11-14 23:12:13.253975	2016-11-14 23:12:13.253975	f
74	2	772016	2016-11-07	Invoice for Aline	120.0	2016-11-07 15:22:57.022227	2016-11-07 15:27:07.71812	t
75	1	772016	2016-11-07	Invoice for Rick	170.0	2016-11-07 15:23:04.814813	2016-11-07 15:27:55.637417	t
\.


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rkreyhsig9620
--

SELECT pg_catalog.setval('invoices_id_seq', 81, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: rkreyhsig9620
--

COPY schema_migrations (version) FROM stdin;
20160826192015
20160826191137
20160826185848
20160829202343
20160830134023
20160901221312
20160902202534
20160906220004
20160912193211
20160912193816
20160920193245
20160920221423
20160920225114
20160921221117
20161012195724
20161027184422
20161114202721
20161117204355
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: rkreyhsig9620
--

COPY services (id, date, description, price, maturity, created_at, updated_at, client_id, paid, invoice_id) FROM stdin;
75	2016-11-07	Fertilizer	120.0	2016-11-07	2016-11-07 15:21:12.565441	2016-11-07 15:27:07.71671	2	t	74
72	2016-11-07	Trimming Bushes and Shrubs	150.0	2016-11-07	2016-11-07 15:04:08.581903	2016-11-07 15:27:55.634744	1	t	75
71	2016-11-07	Weekly Cutting	20.0	2016-11-07	2016-11-07 15:03:59.564643	2016-11-07 15:27:55.636344	1	t	75
73	2016-11-07	Bi-weekly Cutting	40.0	2016-11-07	2016-11-07 15:04:15.450615	2016-11-07 15:28:54.788677	4	t	76
74	2016-11-07	Aeration and Seeding	450.0	2016-11-07	2016-11-07 15:04:23.769432	2016-11-07 15:28:54.79004	4	t	76
79	2016-11-10		0.0	2016-11-10	2016-11-10 21:03:10.633192	2016-11-14 23:04:17.474985	1	\N	77
76	2016-11-10		0.0	2016-11-10	2016-11-10 20:52:37.176324	2016-11-14 23:07:46.813613	2	\N	80
77	2016-11-10		0.0	2016-11-10	2016-11-10 20:54:14.788835	2016-11-14 23:07:46.81495	2	\N	80
78	2016-11-10		20.0	2016-11-10	2016-11-10 20:55:43.317429	2016-11-14 23:07:46.816147	2	\N	80
80	2016-11-14	Weekly Cutting	40.0	2016-11-14	2016-11-14 23:12:03.682062	2016-11-14 23:12:13.259258	8	\N	81
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rkreyhsig9620
--

SELECT pg_catalog.setval('services_id_seq', 80, true);


--
-- Data for Name: shipping_addresses; Type: TABLE DATA; Schema: public; Owner: rkreyhsig9620
--

COPY shipping_addresses (id, name, street, city, state, zipcode, created_at, updated_at, is_default, email, phone) FROM stdin;
3	Test					2016-09-21 21:54:53.786851	2016-09-21 21:55:47.654344	f	\N	\N
4	Another Test					2016-09-21 21:55:41.907614	2016-09-21 21:56:05.014788	f	\N	\N
2	Eliel	4215 Landblue St	Rockville	MD	20853	2016-09-20 22:09:41.810972	2016-09-29 14:53:43.253514	f	\N	\N
1	L&R Landscaping	4214 Landgreen St	Rockville	MD	20854	2016-09-20 22:08:17.021388	2016-09-29 15:02:25.729851	f	\N	\N
5	Nice and Green Lanscaping	P.O. Box 9527	Silver Spring	MD	20916	2016-09-29 14:58:23.271131	2016-10-12 20:03:53.815814	t	nglandscaping@gmail.com	(240)671-8592 
\.


--
-- Name: shipping_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rkreyhsig9620
--

SELECT pg_catalog.setval('shipping_addresses_id_seq', 5, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: estimates_pkey; Type: CONSTRAINT; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

ALTER TABLE ONLY estimates
    ADD CONSTRAINT estimates_pkey PRIMARY KEY (id);


--
-- Name: invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

ALTER TABLE ONLY invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: shipping_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

ALTER TABLE ONLY shipping_addresses
    ADD CONSTRAINT shipping_addresses_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: rkreyhsig9620; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_1b9e100e65; Type: FK CONSTRAINT; Schema: public; Owner: rkreyhsig9620
--

ALTER TABLE ONLY services
    ADD CONSTRAINT fk_rails_1b9e100e65 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

