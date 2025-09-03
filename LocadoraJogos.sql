--
-- PostgreSQL database dump
--

\restrict BcnxIwXG85hU273Kc36giInd4h0CPDASbkGhwwff3Jcu00IR4MFbC0I2VHi2CTR

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-03 15:29:45

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
-- TOC entry 220 (class 1259 OID 16462)
-- Name: aluguel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluguel (
    id integer NOT NULL,
    data_aluguel date,
    cliente_cpf character(11),
    "jogo_código" integer,
    atendente_cpf character(11)
);


ALTER TABLE public.aluguel OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16435)
-- Name: atendente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atendente (
    cpf character(11) NOT NULL,
    nome character varying(100)
);


ALTER TABLE public.atendente OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16440)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cpf character(11) NOT NULL,
    nome character varying(100),
    telefone character varying(20),
    "endereço" text,
    email character varying(100),
    atendente_cpf character(11)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16452)
-- Name: jogo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogo (
    "código" integer NOT NULL,
    nome character varying(100),
    fabricante character varying(100),
    "número_máximo_jogadores" integer,
    "ano_publicação" integer,
    "número_cópias" integer,
    atendente_cpf character(11)
);


ALTER TABLE public.jogo OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 16462)
-- Dependencies: 220
-- Data for Name: aluguel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aluguel (id, data_aluguel, cliente_cpf, "jogo_código", atendente_cpf) FROM stdin;
1	2025-09-01	44444444444	1	11111111111
2	2025-09-02	55555555555	2	22222222222
3	2025-09-03	66666666666	3	33333333333
\.


--
-- TOC entry 4911 (class 0 OID 16435)
-- Dependencies: 217
-- Data for Name: atendente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atendente (cpf, nome) FROM stdin;
11111111111	Ana Silva
22222222222	Bruno Souza
33333333333	Carlos Lima
\.


--
-- TOC entry 4912 (class 0 OID 16440)
-- Dependencies: 218
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cpf, nome, telefone, "endereço", email, atendente_cpf) FROM stdin;
44444444444	Daniela Costa	(11) 99999-0001	Rua A, 123	daniela@email.com	11111111111
55555555555	Eduardo Pereira	(21) 98888-1111	Rua B, 456	eduardo@email.com	22222222222
66666666666	Fernanda Rocha	(31) 97777-2222	Rua C, 789	fernanda@email.com	33333333333
\.


--
-- TOC entry 4913 (class 0 OID 16452)
-- Dependencies: 219
-- Data for Name: jogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jogo ("código", nome, fabricante, "número_máximo_jogadores", "ano_publicação", "número_cópias", atendente_cpf) FROM stdin;
1	Banco Imobiliário	Estrela	6	1935	5	11111111111
2	War	Grow	4	1972	3	22222222222
3	Uno	Mattel	10	1971	7	33333333333
\.


--
-- TOC entry 4760 (class 2606 OID 16466)
-- Name: aluguel aluguel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel
    ADD CONSTRAINT aluguel_pkey PRIMARY KEY (id);


--
-- TOC entry 4754 (class 2606 OID 16439)
-- Name: atendente atendente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendente
    ADD CONSTRAINT atendente_pkey PRIMARY KEY (cpf);


--
-- TOC entry 4756 (class 2606 OID 16446)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cpf);


--
-- TOC entry 4758 (class 2606 OID 16456)
-- Name: jogo jogo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo
    ADD CONSTRAINT jogo_pkey PRIMARY KEY ("código");


--
-- TOC entry 4763 (class 2606 OID 16477)
-- Name: aluguel aluguel_atendente_cpf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel
    ADD CONSTRAINT aluguel_atendente_cpf_fkey FOREIGN KEY (atendente_cpf) REFERENCES public.atendente(cpf);


--
-- TOC entry 4764 (class 2606 OID 16467)
-- Name: aluguel aluguel_cliente_cpf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel
    ADD CONSTRAINT aluguel_cliente_cpf_fkey FOREIGN KEY (cliente_cpf) REFERENCES public.cliente(cpf);


--
-- TOC entry 4765 (class 2606 OID 16472)
-- Name: aluguel aluguel_jogo_código_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel
    ADD CONSTRAINT "aluguel_jogo_código_fkey" FOREIGN KEY ("jogo_código") REFERENCES public.jogo("código");


--
-- TOC entry 4761 (class 2606 OID 16447)
-- Name: cliente cliente_atendente_cpf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_atendente_cpf_fkey FOREIGN KEY (atendente_cpf) REFERENCES public.atendente(cpf);


--
-- TOC entry 4762 (class 2606 OID 16457)
-- Name: jogo jogo_atendente_cpf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogo
    ADD CONSTRAINT jogo_atendente_cpf_fkey FOREIGN KEY (atendente_cpf) REFERENCES public.atendente(cpf);


-- Completed on 2025-09-03 15:29:45

--
-- PostgreSQL database dump complete
--

\unrestrict BcnxIwXG85hU273Kc36giInd4h0CPDASbkGhwwff3Jcu00IR4MFbC0I2VHi2CTR

