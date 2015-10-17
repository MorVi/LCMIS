--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: medcateg; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medcateg (
    medcat_num integer NOT NULL,
    medcat_name text NOT NULL,
    medcat_id integer NOT NULL
);


ALTER TABLE public.medcateg OWNER TO postgres;

--
-- Name: medcateg_medcat_num_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medcateg_medcat_num_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medcateg_medcat_num_seq OWNER TO postgres;

--
-- Name: medcateg_medcat_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medcateg_medcat_num_seq OWNED BY medcateg.medcat_num;


--
-- Name: medicines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medicines (
    med_num integer NOT NULL,
    name text NOT NULL,
    dosage integer NOT NULL,
    amount integer,
    producer text NOT NULL,
    need_recept text NOT NULL,
    category text NOT NULL,
    price integer NOT NULL,
    cat_num integer,
    CONSTRAINT medicines_need_recept_check CHECK ((need_recept = ANY (ARRAY['yes'::text, 'no'::text])))
);


ALTER TABLE public.medicines OWNER TO postgres;

--
-- Name: medicines_med_num_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medicines_med_num_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicines_med_num_seq OWNER TO postgres;

--
-- Name: medicines_med_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medicines_med_num_seq OWNED BY medicines.med_num;


--
-- Name: pharmacies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pharmacies (
    pharm_num integer NOT NULL,
    address text NOT NULL,
    number integer NOT NULL,
    nearest_metropolitan text NOT NULL
);


ALTER TABLE public.pharmacies OWNER TO postgres;

--
-- Name: pharmacies_pharm_num_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pharmacies_pharm_num_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pharmacies_pharm_num_seq OWNER TO postgres;

--
-- Name: pharmacies_pharm_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pharmacies_pharm_num_seq OWNED BY pharmacies.pharm_num;


--
-- Name: pharmacists; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pharmacists (
    pharmst_num integer NOT NULL,
    last_name text NOT NULL,
    first_name text NOT NULL,
    second_name text,
    birthday date NOT NULL,
    inn integer NOT NULL,
    series_and_number_of_passport integer NOT NULL,
    pharm_id integer NOT NULL
);


ALTER TABLE public.pharmacists OWNER TO postgres;

--
-- Name: pharmacists_pharmst_num_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pharmacists_pharmst_num_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pharmacists_pharmst_num_seq OWNER TO postgres;

--
-- Name: pharmacists_pharmst_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pharmacists_pharmst_num_seq OWNED BY pharmacists.pharmst_num;


--
-- Name: presence_info; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE presence_info (
    pi_num integer NOT NULL,
    pharm_id integer NOT NULL,
    med_id integer NOT NULL,
    number_of_packages integer NOT NULL
);


ALTER TABLE public.presence_info OWNER TO postgres;

--
-- Name: presence_info_pi_num_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE presence_info_pi_num_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presence_info_pi_num_seq OWNER TO postgres;

--
-- Name: presence_info_pi_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE presence_info_pi_num_seq OWNED BY presence_info.pi_num;


--
-- Name: sale_info; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sale_info (
    si_num integer NOT NULL,
    pharm_id integer NOT NULL,
    med_id integer NOT NULL,
    pharmasist_id integer NOT NULL,
    date_of_sale date NOT NULL,
    number_of_packages integer NOT NULL
);


ALTER TABLE public.sale_info OWNER TO postgres;

--
-- Name: sale_info_si_num_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sale_info_si_num_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_info_si_num_seq OWNER TO postgres;

--
-- Name: sale_info_si_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sale_info_si_num_seq OWNED BY sale_info.si_num;


--
-- Name: medcat_num; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medcateg ALTER COLUMN medcat_num SET DEFAULT nextval('medcateg_medcat_num_seq'::regclass);


--
-- Name: med_num; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicines ALTER COLUMN med_num SET DEFAULT nextval('medicines_med_num_seq'::regclass);


--
-- Name: pharm_num; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pharmacies ALTER COLUMN pharm_num SET DEFAULT nextval('pharmacies_pharm_num_seq'::regclass);


--
-- Name: pharmst_num; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pharmacists ALTER COLUMN pharmst_num SET DEFAULT nextval('pharmacists_pharmst_num_seq'::regclass);


--
-- Name: pi_num; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presence_info ALTER COLUMN pi_num SET DEFAULT nextval('presence_info_pi_num_seq'::regclass);


--
-- Name: si_num; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale_info ALTER COLUMN si_num SET DEFAULT nextval('sale_info_si_num_seq'::regclass);


--
-- Data for Name: medcateg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medcateg (medcat_num, medcat_name, medcat_id) FROM stdin;
\.


--
-- Name: medcateg_medcat_num_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medcateg_medcat_num_seq', 1, false);


--
-- Data for Name: medicines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medicines (med_num, name, dosage, amount, producer, need_recept, category, price, cat_num) FROM stdin;
\.


--
-- Name: medicines_med_num_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medicines_med_num_seq', 1, false);


--
-- Data for Name: pharmacies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pharmacies (pharm_num, address, number, nearest_metropolitan) FROM stdin;
\.


--
-- Name: pharmacies_pharm_num_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pharmacies_pharm_num_seq', 1, false);


--
-- Data for Name: pharmacists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pharmacists (pharmst_num, last_name, first_name, second_name, birthday, inn, series_and_number_of_passport, pharm_id) FROM stdin;
\.


--
-- Name: pharmacists_pharmst_num_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pharmacists_pharmst_num_seq', 1, false);


--
-- Data for Name: presence_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presence_info (pi_num, pharm_id, med_id, number_of_packages) FROM stdin;
\.


--
-- Name: presence_info_pi_num_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('presence_info_pi_num_seq', 1, false);


--
-- Data for Name: sale_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sale_info (si_num, pharm_id, med_id, pharmasist_id, date_of_sale, number_of_packages) FROM stdin;
\.


--
-- Name: sale_info_si_num_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sale_info_si_num_seq', 1, false);


--
-- Name: medcateg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medcateg
    ADD CONSTRAINT medcateg_pkey PRIMARY KEY (medcat_num);


--
-- Name: medicines_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medicines
    ADD CONSTRAINT medicines_name_key UNIQUE (name);


--
-- Name: medicines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medicines
    ADD CONSTRAINT medicines_pkey PRIMARY KEY (med_num);


--
-- Name: pharmacies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pharmacies
    ADD CONSTRAINT pharmacies_pkey PRIMARY KEY (pharm_num);


--
-- Name: pharmacists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pharmacists
    ADD CONSTRAINT pharmacists_pkey PRIMARY KEY (pharmst_num);


--
-- Name: presence_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presence_info
    ADD CONSTRAINT presence_info_pkey PRIMARY KEY (pi_num);


--
-- Name: sale_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sale_info
    ADD CONSTRAINT sale_info_pkey PRIMARY KEY (si_num);


--
-- Name: mc_med_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medcateg
    ADD CONSTRAINT mc_med_num FOREIGN KEY (medcat_id) REFERENCES medicines(med_num);


--
-- Name: pi_med_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presence_info
    ADD CONSTRAINT pi_med_num FOREIGN KEY (med_id) REFERENCES medicines(med_num);


--
-- Name: pi_pharm_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presence_info
    ADD CONSTRAINT pi_pharm_num FOREIGN KEY (pharm_id) REFERENCES pharmacies(pharm_num);


--
-- Name: pt_pharm_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pharmacists
    ADD CONSTRAINT pt_pharm_num FOREIGN KEY (pharm_id) REFERENCES pharmacies(pharm_num);


--
-- Name: si_med_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale_info
    ADD CONSTRAINT si_med_num FOREIGN KEY (med_id) REFERENCES medicines(med_num);


--
-- Name: si_pharm_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale_info
    ADD CONSTRAINT si_pharm_num FOREIGN KEY (pharm_id) REFERENCES pharmacies(pharm_num);


--
-- Name: si_pharst_num; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale_info
    ADD CONSTRAINT si_pharst_num FOREIGN KEY (pharmasist_id) REFERENCES pharmacists(pharmst_num);


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

