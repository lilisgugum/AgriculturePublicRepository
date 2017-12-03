--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: data_hasil_pertanian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE data_hasil_pertanian (
    id integer NOT NULL,
    id_jenis_produk integer NOT NULL,
    tanggal_tanam date,
    tanggal_panen date,
    luas_lahan double precision,
    lokasi text,
    suhu double precision,
    harga double precision,
    id_pengguna integer,
    status_panen boolean NOT NULL,
    modal double precision,
    id_penyakit integer
);


ALTER TABLE data_hasil_pertanian OWNER TO postgres;

--
-- Name: data_hasil_pertanian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE data_hasil_pertanian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_hasil_pertanian_id_seq OWNER TO postgres;

--
-- Name: data_hasil_pertanian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE data_hasil_pertanian_id_seq OWNED BY data_hasil_pertanian.id;


--
-- Name: detail_pengguna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detail_pengguna (
    id_pengguna integer,
    institusi integer
);


ALTER TABLE detail_pengguna OWNER TO postgres;

--
-- Name: foto_hasil_pertanian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE foto_hasil_pertanian (
    id integer NOT NULL,
    id_data integer NOT NULL,
    foto character varying(500),
    tanggal_unggah date
);


ALTER TABLE foto_hasil_pertanian OWNER TO postgres;

--
-- Name: foto_hasil_pertanian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE foto_hasil_pertanian_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE foto_hasil_pertanian_id_seq OWNER TO postgres;

--
-- Name: foto_hasil_pertanian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE foto_hasil_pertanian_id_seq OWNED BY foto_hasil_pertanian.id;


--
-- Name: jenis_penyakit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_penyakit (
    id integer NOT NULL,
    nama character varying(256) NOT NULL
);


ALTER TABLE jenis_penyakit OWNER TO postgres;

--
-- Name: jenis_penyakit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_penyakit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_penyakit_id_seq OWNER TO postgres;

--
-- Name: jenis_penyakit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_penyakit_id_seq OWNED BY jenis_penyakit.id;


--
-- Name: jenis_produk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_produk (
    id integer NOT NULL,
    nama character varying(500) NOT NULL
);


ALTER TABLE jenis_produk OWNER TO postgres;

--
-- Name: jenis_produk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_produk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_produk_id_seq OWNER TO postgres;

--
-- Name: jenis_produk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_produk_id_seq OWNED BY jenis_produk.id;


--
-- Name: kandidat_donatur_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kandidat_donatur_data (
    id_pengguna integer
);


ALTER TABLE kandidat_donatur_data OWNER TO postgres;

--
-- Name: komentar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE komentar (
    id integer NOT NULL,
    id_data integer NOT NULL,
    id_pengguna integer NOT NULL,
    komentar text,
    tanggal_komentar date
);


ALTER TABLE komentar OWNER TO postgres;

--
-- Name: komentar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE komentar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE komentar_id_seq OWNER TO postgres;

--
-- Name: komentar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE komentar_id_seq OWNED BY komentar.id;


--
-- Name: pengguna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pengguna (
    id integer NOT NULL,
    nama character varying(256) NOT NULL,
    email character varying(100),
    password character varying(100) NOT NULL,
    id_role integer NOT NULL
);


ALTER TABLE pengguna OWNER TO postgres;

--
-- Name: pengguna_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pengguna_id_seq OWNER TO postgres;

--
-- Name: pengguna_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pengguna_id_seq OWNED BY pengguna.id;


--
-- Name: penyakit_hasil_pertanian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE penyakit_hasil_pertanian (
    id_data integer,
    id_penyakit integer
);


ALTER TABLE penyakit_hasil_pertanian OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles (
    id integer NOT NULL,
    role character varying(256) NOT NULL
);


ALTER TABLE roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE votes (
    id integer NOT NULL,
    id_data integer NOT NULL,
    id_pengguna integer NOT NULL,
    vote boolean NOT NULL
);


ALTER TABLE votes OWNER TO postgres;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE votes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO postgres;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: data_hasil_pertanian id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_hasil_pertanian ALTER COLUMN id SET DEFAULT nextval('data_hasil_pertanian_id_seq'::regclass);


--
-- Name: foto_hasil_pertanian id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_hasil_pertanian ALTER COLUMN id SET DEFAULT nextval('foto_hasil_pertanian_id_seq'::regclass);


--
-- Name: jenis_penyakit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_penyakit ALTER COLUMN id SET DEFAULT nextval('jenis_penyakit_id_seq'::regclass);


--
-- Name: jenis_produk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_produk ALTER COLUMN id SET DEFAULT nextval('jenis_produk_id_seq'::regclass);


--
-- Name: komentar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komentar ALTER COLUMN id SET DEFAULT nextval('komentar_id_seq'::regclass);


--
-- Name: pengguna id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pengguna ALTER COLUMN id SET DEFAULT nextval('pengguna_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: data_hasil_pertanian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY data_hasil_pertanian (id, id_jenis_produk, tanggal_tanam, tanggal_panen, luas_lahan, lokasi, suhu, harga, id_pengguna, status_panen, modal, id_penyakit) FROM stdin;
\.


--
-- Data for Name: detail_pengguna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detail_pengguna (id_pengguna, institusi) FROM stdin;
\.


--
-- Data for Name: foto_hasil_pertanian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY foto_hasil_pertanian (id, id_data, foto, tanggal_unggah) FROM stdin;
\.


--
-- Data for Name: jenis_penyakit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_penyakit (id, nama) FROM stdin;
2	Tomcat
\.


--
-- Data for Name: jenis_produk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_produk (id, nama) FROM stdin;
1	Cabean
\.


--
-- Data for Name: kandidat_donatur_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kandidat_donatur_data (id_pengguna) FROM stdin;
\.


--
-- Data for Name: komentar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY komentar (id, id_data, id_pengguna, komentar, tanggal_komentar) FROM stdin;
\.


--
-- Data for Name: pengguna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pengguna (id, nama, email, password, id_role) FROM stdin;
\.


--
-- Data for Name: penyakit_hasil_pertanian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY penyakit_hasil_pertanian (id_data, id_penyakit) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, role) FROM stdin;
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY votes (id, id_data, id_pengguna, vote) FROM stdin;
\.


--
-- Name: data_hasil_pertanian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('data_hasil_pertanian_id_seq', 1, true);


--
-- Name: foto_hasil_pertanian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('foto_hasil_pertanian_id_seq', 1, false);


--
-- Name: jenis_penyakit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_penyakit_id_seq', 2, true);


--
-- Name: jenis_produk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_produk_id_seq', 1, true);


--
-- Name: komentar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('komentar_id_seq', 1, false);


--
-- Name: pengguna_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pengguna_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('votes_id_seq', 1, false);


--
-- Name: data_hasil_pertanian data_hasil_pertanian_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_hasil_pertanian
    ADD CONSTRAINT data_hasil_pertanian_id_pk PRIMARY KEY (id);


--
-- Name: foto_hasil_pertanian foto_hasil_pertanian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_hasil_pertanian
    ADD CONSTRAINT foto_hasil_pertanian_pkey PRIMARY KEY (id);


--
-- Name: jenis_penyakit jenis_penyakit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_penyakit
    ADD CONSTRAINT jenis_penyakit_pkey PRIMARY KEY (id);


--
-- Name: jenis_produk jenis_produk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_produk
    ADD CONSTRAINT jenis_produk_pkey PRIMARY KEY (id);


--
-- Name: komentar komentar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komentar
    ADD CONSTRAINT komentar_pkey PRIMARY KEY (id);


--
-- Name: pengguna pengguna_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pengguna
    ADD CONSTRAINT pengguna_id_pk PRIMARY KEY (id);


--
-- Name: roles roles_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_id_pk PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: data_hasil_pertanian data_hasil_pertanian_jenis_penyakit_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_hasil_pertanian
    ADD CONSTRAINT data_hasil_pertanian_jenis_penyakit_id_fk FOREIGN KEY (id_penyakit) REFERENCES jenis_penyakit(id) ON UPDATE CASCADE;


--
-- Name: data_hasil_pertanian data_hasil_pertanian_jenis_produk_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_hasil_pertanian
    ADD CONSTRAINT data_hasil_pertanian_jenis_produk_id_fk FOREIGN KEY (id_jenis_produk) REFERENCES jenis_produk(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: data_hasil_pertanian data_hasil_pertanian_pengguna_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_hasil_pertanian
    ADD CONSTRAINT data_hasil_pertanian_pengguna_id_fk FOREIGN KEY (id_pengguna) REFERENCES pengguna(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: detail_pengguna detail_pengguna_pengguna_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_pengguna
    ADD CONSTRAINT detail_pengguna_pengguna_id_fk FOREIGN KEY (id_pengguna) REFERENCES pengguna(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: foto_hasil_pertanian foto_hasil_pertanian_data_hasil_pertanian_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_hasil_pertanian
    ADD CONSTRAINT foto_hasil_pertanian_data_hasil_pertanian_id_fk FOREIGN KEY (id_data) REFERENCES data_hasil_pertanian(id);


--
-- Name: kandidat_donatur_data kandidat_donatur_data_pengguna_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kandidat_donatur_data
    ADD CONSTRAINT kandidat_donatur_data_pengguna_id_fk FOREIGN KEY (id_pengguna) REFERENCES pengguna(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: komentar komentar_data_hasil_pertanian_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komentar
    ADD CONSTRAINT komentar_data_hasil_pertanian_id_fk FOREIGN KEY (id_data) REFERENCES data_hasil_pertanian(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: komentar komentar_pengguna_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komentar
    ADD CONSTRAINT komentar_pengguna_id_fk FOREIGN KEY (id_pengguna) REFERENCES pengguna(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pengguna pengguna_roles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pengguna
    ADD CONSTRAINT pengguna_roles_id_fk FOREIGN KEY (id_role) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: penyakit_hasil_pertanian penyakit_hasil_pertanian_data_hasil_pertanian_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY penyakit_hasil_pertanian
    ADD CONSTRAINT penyakit_hasil_pertanian_data_hasil_pertanian_id_fk FOREIGN KEY (id_data) REFERENCES data_hasil_pertanian(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: penyakit_hasil_pertanian penyakit_hasil_pertanian_jenis_penyakit_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY penyakit_hasil_pertanian
    ADD CONSTRAINT penyakit_hasil_pertanian_jenis_penyakit_id_fk FOREIGN KEY (id_penyakit) REFERENCES jenis_penyakit(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: votes votes_data_hasil_pertanian_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_data_hasil_pertanian_id_fk FOREIGN KEY (id_data) REFERENCES data_hasil_pertanian(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: votes votes_pengguna_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pengguna_id_fk FOREIGN KEY (id_pengguna) REFERENCES pengguna(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

