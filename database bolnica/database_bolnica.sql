--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-15 14:45:39

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

--
-- TOC entry 4984 (class 1262 OID 33244)
-- Name: postgresM; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "postgresM" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


\connect "postgresM"

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 244 (class 1259 OID 42145)
-- Name: AccountServices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AccountServices" (
    account_service_code integer NOT NULL,
    accountant_id integer NOT NULL,
    date_of_bith date NOT NULL,
    service_code integer NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 42144)
-- Name: AccountServices_account_service_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."AccountServices_account_service_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 243
-- Name: AccountServices_account_service_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."AccountServices_account_service_code_seq" OWNED BY public."AccountServices".account_service_code;


--
-- TOC entry 236 (class 1259 OID 42115)
-- Name: Accountant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Accountant" (
    accountant_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 42114)
-- Name: Accountant_accountant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Accountant_accountant_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 235
-- Name: Accountant_accountant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Accountant_accountant_id_seq" OWNED BY public."Accountant".accountant_id;


--
-- TOC entry 234 (class 1259 OID 42108)
-- Name: Administrators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Administrators" (
    admin_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 42107)
-- Name: Administrators_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Administrators_admin_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 233
-- Name: Administrators_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Administrators_admin_id_seq" OWNED BY public."Administrators".admin_id;


--
-- TOC entry 221 (class 1259 OID 42049)
-- Name: AnalyzeWork; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AnalyzeWork" (
    analyzer_code integer NOT NULL,
    company_name character varying(35) NOT NULL,
    service_code integer NOT NULL,
    date_of_receipt date NOT NULL,
    date_of_service date NOT NULL,
    time_of_service time without time zone NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 42048)
-- Name: AnalyzeWork_analyzer_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."AnalyzeWork_analyzer_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 220
-- Name: AnalyzeWork_analyzer_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."AnalyzeWork_analyzer_code_seq" OWNED BY public."AnalyzeWork".analyzer_code;


--
-- TOC entry 226 (class 1259 OID 42070)
-- Name: InsuranceCompanies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."InsuranceCompanies" (
    insurance_company_code integer NOT NULL,
    company_name character varying(35) NOT NULL,
    company_address character varying(255) NOT NULL,
    inn integer NOT NULL,
    current_account character varying(255) NOT NULL,
    bik character varying(255) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 42069)
-- Name: InsuranceCompanies_insurance_company_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."InsuranceCompanies_insurance_company_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 225
-- Name: InsuranceCompanies_insurance_company_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."InsuranceCompanies_insurance_company_code_seq" OWNED BY public."InsuranceCompanies".insurance_company_code;


--
-- TOC entry 228 (class 1259 OID 42085)
-- Name: Invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Invoices" (
    invoices_id integer NOT NULL,
    accountant_id integer NOT NULL,
    polis_code integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 42084)
-- Name: Invoices_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Invoices_invoices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 227
-- Name: Invoices_invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Invoices_invoices_id_seq" OWNED BY public."Invoices".invoices_id;


--
-- TOC entry 242 (class 1259 OID 42138)
-- Name: LaborantServices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."LaborantServices" (
    laborant_service_code integer NOT NULL,
    laborant_id integer NOT NULL,
    service_code integer NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 42137)
-- Name: LaborantServices_laborant_service_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."LaborantServices_laborant_service_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 241
-- Name: LaborantServices_laborant_service_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."LaborantServices_laborant_service_code_seq" OWNED BY public."LaborantServices".laborant_service_code;


--
-- TOC entry 232 (class 1259 OID 42101)
-- Name: Laborants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Laborants" (
    laborant_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 42100)
-- Name: Laborants_laborant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Laborants_laborant_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 231
-- Name: Laborants_laborant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Laborants_laborant_id_seq" OWNED BY public."Laborants".laborant_id;


--
-- TOC entry 219 (class 1259 OID 42042)
-- Name: Orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Orders" (
    order_id integer NOT NULL,
    accountant_id integer NOT NULL,
    creation_date date NOT NULL,
    orders_time timestamp without time zone NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 42058)
-- Name: OrdersTransaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."OrdersTransaction" (
    transaction_id integer NOT NULL,
    order_id integer NOT NULL,
    service_code integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 42057)
-- Name: OrdersTransaction_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."OrdersTransaction_transaction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 222
-- Name: OrdersTransaction_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."OrdersTransaction_transaction_id_seq" OWNED BY public."OrdersTransaction".transaction_id;


--
-- TOC entry 218 (class 1259 OID 42041)
-- Name: Orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Orders_order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 218
-- Name: Orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Orders_order_id_seq" OWNED BY public."Orders".order_id;


--
-- TOC entry 246 (class 1259 OID 42152)
-- Name: Patient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Patient" (
    patient_id integer NOT NULL,
    user_id integer NOT NULL,
    date_of_bith date NOT NULL,
    passport bigint NOT NULL,
    polis_code bigint NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 42151)
-- Name: Patient_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Patient_patient_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 245
-- Name: Patient_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Patient_patient_id_seq" OWNED BY public."Patient".patient_id;


--
-- TOC entry 230 (class 1259 OID 42092)
-- Name: PolisType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."PolisType" (
    polis_type_code integer NOT NULL,
    polis_type character varying NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 42091)
-- Name: PolisType_polis_type_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."PolisType_polis_type_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 229
-- Name: PolisType_polis_type_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."PolisType_polis_type_code_seq" OWNED BY public."PolisType".polis_type_code;


--
-- TOC entry 224 (class 1259 OID 42064)
-- Name: Polises; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Polises" (
    polis_code bigint NOT NULL,
    polis_type_code integer NOT NULL,
    insurance_company_code integer NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 42129)
-- Name: ProvideServices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProvideServices" (
    provide_service_code integer NOT NULL,
    service_code integer NOT NULL,
    date_of_service timestamp without time zone NOT NULL,
    laborant_id integer NOT NULL,
    analyzer_code integer NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 42128)
-- Name: ProvideServices_provide_service_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."ProvideServices_provide_service_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 239
-- Name: ProvideServices_provide_service_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."ProvideServices_provide_service_code_seq" OWNED BY public."ProvideServices".provide_service_code;


--
-- TOC entry 238 (class 1259 OID 42122)
-- Name: Roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Roles" (
    role_id integer NOT NULL,
    role_name character varying(255) NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 42121)
-- Name: Roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Roles_role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 237
-- Name: Roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Roles_role_id_seq" OWNED BY public."Roles".role_id;


--
-- TOC entry 217 (class 1259 OID 42032)
-- Name: Services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Services" (
    service_code integer NOT NULL,
    service_name character varying(255) NOT NULL,
    relise_data date NOT NULL,
    cost numeric NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 42017)
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Users" (
    user_id integer NOT NULL,
    user_login character varying(35) NOT NULL,
    user_password character varying(35) NOT NULL,
    user_fio character varying(255) NOT NULL,
    tel_number character varying(35) NOT NULL,
    email character varying(255),
    role_id integer NOT NULL,
    user_entry timestamp without time zone NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 42016)
-- Name: Users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Users_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 215
-- Name: Users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Users_user_id_seq" OWNED BY public."Users".user_id;


--
-- TOC entry 247 (class 1259 OID 58116)
-- Name: bolnica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bolnica (
);


--
-- TOC entry 4729 (class 2604 OID 42148)
-- Name: AccountServices account_service_code; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AccountServices" ALTER COLUMN account_service_code SET DEFAULT nextval('public."AccountServices_account_service_code_seq"'::regclass);


--
-- TOC entry 4725 (class 2604 OID 42118)
-- Name: Accountant accountant_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Accountant" ALTER COLUMN accountant_id SET DEFAULT nextval('public."Accountant_accountant_id_seq"'::regclass);


--
-- TOC entry 4724 (class 2604 OID 42111)
-- Name: Administrators admin_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Administrators" ALTER COLUMN admin_id SET DEFAULT nextval('public."Administrators_admin_id_seq"'::regclass);


--
-- TOC entry 4718 (class 2604 OID 42052)
-- Name: AnalyzeWork analyzer_code; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AnalyzeWork" ALTER COLUMN analyzer_code SET DEFAULT nextval('public."AnalyzeWork_analyzer_code_seq"'::regclass);


--
-- TOC entry 4720 (class 2604 OID 42073)
-- Name: InsuranceCompanies insurance_company_code; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InsuranceCompanies" ALTER COLUMN insurance_company_code SET DEFAULT nextval('public."InsuranceCompanies_insurance_company_code_seq"'::regclass);


--
-- TOC entry 4721 (class 2604 OID 42088)
-- Name: Invoices invoices_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoices" ALTER COLUMN invoices_id SET DEFAULT nextval('public."Invoices_invoices_id_seq"'::regclass);


--
-- TOC entry 4728 (class 2604 OID 42141)
-- Name: LaborantServices laborant_service_code; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LaborantServices" ALTER COLUMN laborant_service_code SET DEFAULT nextval('public."LaborantServices_laborant_service_code_seq"'::regclass);


--
-- TOC entry 4723 (class 2604 OID 42104)
-- Name: Laborants laborant_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Laborants" ALTER COLUMN laborant_id SET DEFAULT nextval('public."Laborants_laborant_id_seq"'::regclass);


--
-- TOC entry 4717 (class 2604 OID 42045)
-- Name: Orders order_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN order_id SET DEFAULT nextval('public."Orders_order_id_seq"'::regclass);


--
-- TOC entry 4719 (class 2604 OID 42061)
-- Name: OrdersTransaction transaction_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrdersTransaction" ALTER COLUMN transaction_id SET DEFAULT nextval('public."OrdersTransaction_transaction_id_seq"'::regclass);


--
-- TOC entry 4730 (class 2604 OID 42155)
-- Name: Patient patient_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Patient" ALTER COLUMN patient_id SET DEFAULT nextval('public."Patient_patient_id_seq"'::regclass);


--
-- TOC entry 4722 (class 2604 OID 42095)
-- Name: PolisType polis_type_code; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."PolisType" ALTER COLUMN polis_type_code SET DEFAULT nextval('public."PolisType_polis_type_code_seq"'::regclass);


--
-- TOC entry 4727 (class 2604 OID 42132)
-- Name: ProvideServices provide_service_code; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProvideServices" ALTER COLUMN provide_service_code SET DEFAULT nextval('public."ProvideServices_provide_service_code_seq"'::regclass);


--
-- TOC entry 4726 (class 2604 OID 42125)
-- Name: Roles role_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN role_id SET DEFAULT nextval('public."Roles_role_id_seq"'::regclass);


--
-- TOC entry 4716 (class 2604 OID 42020)
-- Name: Users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users" ALTER COLUMN user_id SET DEFAULT nextval('public."Users_user_id_seq"'::regclass);


--
-- TOC entry 4975 (class 0 OID 42145)
-- Dependencies: 244
-- Data for Name: AccountServices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."AccountServices" VALUES (1, 1, '2000-03-19', 1);
INSERT INTO public."AccountServices" VALUES (2, 2, '1986-09-29', 4);


--
-- TOC entry 4967 (class 0 OID 42115)
-- Dependencies: 236
-- Data for Name: Accountant; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Accountant" VALUES (1, 3);
INSERT INTO public."Accountant" VALUES (2, 7);


--
-- TOC entry 4965 (class 0 OID 42108)
-- Dependencies: 234
-- Data for Name: Administrators; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4952 (class 0 OID 42049)
-- Dependencies: 221
-- Data for Name: AnalyzeWork; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."AnalyzeWork" VALUES (1, 'StrahovanieRF', 1, '2023-12-11', '2023-12-11', '12:30:43');
INSERT INTO public."AnalyzeWork" VALUES (2, 'StrahovkaUDoma', 4, '2024-01-01', '2024-01-01', '01:34:10');


--
-- TOC entry 4957 (class 0 OID 42070)
-- Dependencies: 226
-- Data for Name: InsuranceCompanies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."InsuranceCompanies" VALUES (1, 'StrahovanieRF', 'ул. Ленина, д. 3', 1234567890, '2121234', '014743567');
INSERT INTO public."InsuranceCompanies" VALUES (2, 'GOSstrahovanie', 'ул. Пушкина, д.43', 987654321, '2139863', '014798321');
INSERT INTO public."InsuranceCompanies" VALUES (3, 'Strahovanie147', 'ул. Комарова, д.14', 21435215, '1029389', '014736890');
INSERT INTO public."InsuranceCompanies" VALUES (4, 'StrahovanieUDoma', 'ул. Романова д.54', 15122151, '6745899', '014778789');
INSERT INTO public."InsuranceCompanies" VALUES (5, 'GlavnoeStrahovka', 'ул. Кожевникова д.1', 5123421, '7483998', '01473209');


--
-- TOC entry 4959 (class 0 OID 42085)
-- Dependencies: 228
-- Data for Name: Invoices; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4973 (class 0 OID 42138)
-- Dependencies: 242
-- Data for Name: LaborantServices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."LaborantServices" VALUES (1, 1, 1);
INSERT INTO public."LaborantServices" VALUES (2, 2, 4);


--
-- TOC entry 4963 (class 0 OID 42101)
-- Dependencies: 232
-- Data for Name: Laborants; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Laborants" VALUES (1, 4);
INSERT INTO public."Laborants" VALUES (2, 8);


--
-- TOC entry 4950 (class 0 OID 42042)
-- Dependencies: 219
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Orders" VALUES (1, 1, '2023-12-11', '2023-12-11 12:32:56');
INSERT INTO public."Orders" VALUES (2, 2, '2024-01-01', '2024-01-01 12:43:20');


--
-- TOC entry 4954 (class 0 OID 42058)
-- Dependencies: 223
-- Data for Name: OrdersTransaction; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."OrdersTransaction" VALUES (1, 1, 1);
INSERT INTO public."OrdersTransaction" VALUES (2, 2, 4);


--
-- TOC entry 4977 (class 0 OID 42152)
-- Dependencies: 246
-- Data for Name: Patient; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Patient" VALUES (1, 1, '1990-06-19', 4120175689, 3245436454645674);
INSERT INTO public."Patient" VALUES (2, 5, '2003-02-27', 4120377899, 481234567890);


--
-- TOC entry 4961 (class 0 OID 42092)
-- Dependencies: 230
-- Data for Name: PolisType; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."PolisType" VALUES (1, 'oms');
INSERT INTO public."PolisType" VALUES (2, 'dms');


--
-- TOC entry 4955 (class 0 OID 42064)
-- Dependencies: 224
-- Data for Name: Polises; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Polises" VALUES (481234567890, 2, 1);
INSERT INTO public."Polises" VALUES (3245436454645674, 1, 2);
INSERT INTO public."Polises" VALUES (4812907390343998, 1, 3);
INSERT INTO public."Polises" VALUES (218904129879, 2, 4);
INSERT INTO public."Polises" VALUES (1809320890894809, 1, 5);


--
-- TOC entry 4971 (class 0 OID 42129)
-- Dependencies: 240
-- Data for Name: ProvideServices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ProvideServices" VALUES (1, 1, '2023-11-12 00:00:00', 1, 1);
INSERT INTO public."ProvideServices" VALUES (2, 4, '2024-01-01 00:00:00', 2, 2);


--
-- TOC entry 4969 (class 0 OID 42122)
-- Dependencies: 238
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Roles" VALUES (1, 'patient');
INSERT INTO public."Roles" VALUES (2, 'admin');
INSERT INTO public."Roles" VALUES (3, 'accountant');
INSERT INTO public."Roles" VALUES (4, 'laborant');


--
-- TOC entry 4948 (class 0 OID 42032)
-- Dependencies: 217
-- Data for Name: Services; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Services" VALUES (1, 'blood_test', '2009-03-11', 1990);
INSERT INTO public."Services" VALUES (2, 'blood_donation', '2009-03-11', 0);
INSERT INTO public."Services" VALUES (3, 'health_check', '2009-03-11', 2999);
INSERT INTO public."Services" VALUES (4, 'rehabilitation', '2009-03-11', 10000);
INSERT INTO public."Services" VALUES (5, 'issue_direction', '2009-03-11', 1000);


--
-- TOC entry 4947 (class 0 OID 42017)
-- Dependencies: 216
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Users" VALUES (1, 'ivan123', 'password123', 'Ivanov Ivan Ivanovich', '89994354567', 'ivan123@mail.ru', 1, '2023-12-11 11:12:11');
INSERT INTO public."Users" VALUES (2, 'daniil32', 'password111', 'Zyatkov Daniil Konstantinovich', '89128765923', 'daniil32@mail.ru', 2, '2023-12-24 14:56:09');
INSERT INTO public."Users" VALUES (3, 'kirill89', 'password222', 'Timofeev Kirill Evgenivich', '89327896756', 'kirill89@mail.ru', 3, '2023-12-30 19:02:23');
INSERT INTO public."Users" VALUES (4, 'masha432', 'password333', 'Romanov Marya Artemovna', '89459087612', 'masha432@mail.ru', 4, '2023-12-30 17:43:33');
INSERT INTO public."Users" VALUES (5, 'roma456', 'password444', 'Neklydov Roman Terentiev', '89111887346', 'roma4562@mail.ru', 1, '2024-01-01 00:53:13');
INSERT INTO public."Users" VALUES (6, 'katya654', 'password555', 'Lomonosova Ekaterina Andreevna', '89768900123', 'katya654@mail.ru', 2, '2024-01-01 01:02:32');
INSERT INTO public."Users" VALUES (7, 'misha823', 'password666', 'Mozaikov Mikhail Mikhailovich', '89655464342', 'misha823@mail.ru', 3, '2024-01-02 10:53:02');
INSERT INTO public."Users" VALUES (8, 'gosha437', 'password777', 'Ogapov Gerogii Grigorevich', '89453567890', 'gosha437@mail.ru', 4, '2024-01-03 09:12:54');


--
-- TOC entry 4978 (class 0 OID 58116)
-- Dependencies: 247
-- Data for Name: bolnica; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 243
-- Name: AccountServices_account_service_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."AccountServices_account_service_code_seq"', 2, true);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 235
-- Name: Accountant_accountant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Accountant_accountant_id_seq"', 2, true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 233
-- Name: Administrators_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Administrators_admin_id_seq"', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 220
-- Name: AnalyzeWork_analyzer_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."AnalyzeWork_analyzer_code_seq"', 2, true);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 225
-- Name: InsuranceCompanies_insurance_company_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."InsuranceCompanies_insurance_company_code_seq"', 5, true);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 227
-- Name: Invoices_invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Invoices_invoices_id_seq"', 1, false);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 241
-- Name: LaborantServices_laborant_service_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."LaborantServices_laborant_service_code_seq"', 2, true);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 231
-- Name: Laborants_laborant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Laborants_laborant_id_seq"', 2, true);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 222
-- Name: OrdersTransaction_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."OrdersTransaction_transaction_id_seq"', 2, true);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 218
-- Name: Orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Orders_order_id_seq"', 2, true);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 245
-- Name: Patient_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Patient_patient_id_seq"', 2, true);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 229
-- Name: PolisType_polis_type_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."PolisType_polis_type_code_seq"', 2, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 239
-- Name: ProvideServices_provide_service_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."ProvideServices_provide_service_code_seq"', 2, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 237
-- Name: Roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Roles_role_id_seq"', 4, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 215
-- Name: Users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Users_user_id_seq"', 9, true);


--
-- TOC entry 4780 (class 2606 OID 42150)
-- Name: AccountServices AccountServices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AccountServices"
    ADD CONSTRAINT "AccountServices_pkey" PRIMARY KEY (account_service_code);


--
-- TOC entry 4770 (class 2606 OID 42120)
-- Name: Accountant Accountant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Accountant"
    ADD CONSTRAINT "Accountant_pkey" PRIMARY KEY (accountant_id);


--
-- TOC entry 4768 (class 2606 OID 42113)
-- Name: Administrators Administrators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Administrators"
    ADD CONSTRAINT "Administrators_pkey" PRIMARY KEY (admin_id);


--
-- TOC entry 4746 (class 2606 OID 42056)
-- Name: AnalyzeWork AnalyzeWork_company_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AnalyzeWork"
    ADD CONSTRAINT "AnalyzeWork_company_name_key" UNIQUE (company_name);


--
-- TOC entry 4748 (class 2606 OID 42054)
-- Name: AnalyzeWork AnalyzeWork_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AnalyzeWork"
    ADD CONSTRAINT "AnalyzeWork_pkey" PRIMARY KEY (analyzer_code);


--
-- TOC entry 4754 (class 2606 OID 42083)
-- Name: InsuranceCompanies InsuranceCompanies_bik_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InsuranceCompanies"
    ADD CONSTRAINT "InsuranceCompanies_bik_key" UNIQUE (bik);


--
-- TOC entry 4756 (class 2606 OID 42079)
-- Name: InsuranceCompanies InsuranceCompanies_company_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InsuranceCompanies"
    ADD CONSTRAINT "InsuranceCompanies_company_name_key" UNIQUE (company_name);


--
-- TOC entry 4758 (class 2606 OID 42081)
-- Name: InsuranceCompanies InsuranceCompanies_inn_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InsuranceCompanies"
    ADD CONSTRAINT "InsuranceCompanies_inn_key" UNIQUE (inn);


--
-- TOC entry 4760 (class 2606 OID 42077)
-- Name: InsuranceCompanies InsuranceCompanies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InsuranceCompanies"
    ADD CONSTRAINT "InsuranceCompanies_pkey" PRIMARY KEY (insurance_company_code);


--
-- TOC entry 4762 (class 2606 OID 42090)
-- Name: Invoices Invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_pkey" PRIMARY KEY (invoices_id);


--
-- TOC entry 4778 (class 2606 OID 42143)
-- Name: LaborantServices LaborantServices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LaborantServices"
    ADD CONSTRAINT "LaborantServices_pkey" PRIMARY KEY (laborant_service_code);


--
-- TOC entry 4766 (class 2606 OID 42106)
-- Name: Laborants Laborants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Laborants"
    ADD CONSTRAINT "Laborants_pkey" PRIMARY KEY (laborant_id);


--
-- TOC entry 4750 (class 2606 OID 42063)
-- Name: OrdersTransaction OrdersTransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrdersTransaction"
    ADD CONSTRAINT "OrdersTransaction_pkey" PRIMARY KEY (transaction_id);


--
-- TOC entry 4744 (class 2606 OID 42047)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (order_id);


--
-- TOC entry 4782 (class 2606 OID 42157)
-- Name: Patient Patient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Patient"
    ADD CONSTRAINT "Patient_pkey" PRIMARY KEY (patient_id);


--
-- TOC entry 4764 (class 2606 OID 42099)
-- Name: PolisType PolisType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."PolisType"
    ADD CONSTRAINT "PolisType_pkey" PRIMARY KEY (polis_type_code);


--
-- TOC entry 4752 (class 2606 OID 49930)
-- Name: Polises Polises_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Polises"
    ADD CONSTRAINT "Polises_pkey" PRIMARY KEY (polis_code);


--
-- TOC entry 4774 (class 2606 OID 42136)
-- Name: ProvideServices ProvideServices_analyzer_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProvideServices"
    ADD CONSTRAINT "ProvideServices_analyzer_code_key" UNIQUE (analyzer_code);


--
-- TOC entry 4776 (class 2606 OID 42134)
-- Name: ProvideServices ProvideServices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProvideServices"
    ADD CONSTRAINT "ProvideServices_pkey" PRIMARY KEY (provide_service_code);


--
-- TOC entry 4772 (class 2606 OID 42127)
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (role_id);


--
-- TOC entry 4740 (class 2606 OID 42038)
-- Name: Services Services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_pkey" PRIMARY KEY (service_code);


--
-- TOC entry 4742 (class 2606 OID 42040)
-- Name: Services Services_service_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_service_name_key" UNIQUE (service_name);


--
-- TOC entry 4732 (class 2606 OID 42030)
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- TOC entry 4734 (class 2606 OID 42024)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


--
-- TOC entry 4736 (class 2606 OID 42028)
-- Name: Users Users_tel_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_tel_number_key" UNIQUE (tel_number);


--
-- TOC entry 4738 (class 2606 OID 42026)
-- Name: Users Users_user_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_user_login_key" UNIQUE (user_login);


--
-- TOC entry 4793 (class 2606 OID 42164)
-- Name: Accountant accountant_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Accountant"
    ADD CONSTRAINT accountant_users_fk FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);


--
-- TOC entry 4799 (class 2606 OID 42184)
-- Name: AccountServices accountservices_accountant_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AccountServices"
    ADD CONSTRAINT accountservices_accountant_fk FOREIGN KEY (accountant_id) REFERENCES public."Accountant"(accountant_id);


--
-- TOC entry 4800 (class 2606 OID 42189)
-- Name: AccountServices accountservices_services_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AccountServices"
    ADD CONSTRAINT accountservices_services_fk FOREIGN KEY (service_code) REFERENCES public."Services"(service_code);


--
-- TOC entry 4792 (class 2606 OID 42179)
-- Name: Administrators administrators_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Administrators"
    ADD CONSTRAINT administrators_users_fk FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);


--
-- TOC entry 4784 (class 2606 OID 42214)
-- Name: AnalyzeWork analyzework_services_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AnalyzeWork"
    ADD CONSTRAINT analyzework_services_fk FOREIGN KEY (service_code) REFERENCES public."Services"(service_code);


--
-- TOC entry 4789 (class 2606 OID 42253)
-- Name: Invoices invoices_accountant_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT invoices_accountant_fk FOREIGN KEY (accountant_id) REFERENCES public."Accountant"(accountant_id);


--
-- TOC entry 4790 (class 2606 OID 49936)
-- Name: Invoices invoices_polises_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT invoices_polises_fk FOREIGN KEY (polis_code) REFERENCES public."Polises"(polis_code);


--
-- TOC entry 4791 (class 2606 OID 42174)
-- Name: Laborants laborants_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Laborants"
    ADD CONSTRAINT laborants_users_fk FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);


--
-- TOC entry 4797 (class 2606 OID 42229)
-- Name: LaborantServices laborantservices_laborants_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LaborantServices"
    ADD CONSTRAINT laborantservices_laborants_fk FOREIGN KEY (laborant_id) REFERENCES public."Laborants"(laborant_id);


--
-- TOC entry 4798 (class 2606 OID 42234)
-- Name: LaborantServices laborantservices_services_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LaborantServices"
    ADD CONSTRAINT laborantservices_services_fk FOREIGN KEY (service_code) REFERENCES public."Services"(service_code);


--
-- TOC entry 4785 (class 2606 OID 42204)
-- Name: OrdersTransaction orderstransaction_orders_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrdersTransaction"
    ADD CONSTRAINT orderstransaction_orders_fk FOREIGN KEY (order_id) REFERENCES public."Orders"(order_id);


--
-- TOC entry 4786 (class 2606 OID 42209)
-- Name: OrdersTransaction orderstransaction_services_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrdersTransaction"
    ADD CONSTRAINT orderstransaction_services_fk FOREIGN KEY (service_code) REFERENCES public."Services"(service_code);


--
-- TOC entry 4801 (class 2606 OID 49945)
-- Name: Patient patient_polises_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Patient"
    ADD CONSTRAINT patient_polises_fk FOREIGN KEY (polis_code) REFERENCES public."Polises"(polis_code);


--
-- TOC entry 4802 (class 2606 OID 42169)
-- Name: Patient patient_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Patient"
    ADD CONSTRAINT patient_users_fk FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);


--
-- TOC entry 4787 (class 2606 OID 42248)
-- Name: Polises polises_insurancecompanies_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Polises"
    ADD CONSTRAINT polises_insurancecompanies_fk FOREIGN KEY (insurance_company_code) REFERENCES public."InsuranceCompanies"(insurance_company_code);


--
-- TOC entry 4788 (class 2606 OID 42243)
-- Name: Polises polises_polistype_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Polises"
    ADD CONSTRAINT polises_polistype_fk FOREIGN KEY (polis_type_code) REFERENCES public."PolisType"(polis_type_code);


--
-- TOC entry 4794 (class 2606 OID 42219)
-- Name: ProvideServices provideservices_analyzework_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProvideServices"
    ADD CONSTRAINT provideservices_analyzework_fk FOREIGN KEY (analyzer_code) REFERENCES public."AnalyzeWork"(analyzer_code);


--
-- TOC entry 4795 (class 2606 OID 42199)
-- Name: ProvideServices provideservices_laborants_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProvideServices"
    ADD CONSTRAINT provideservices_laborants_fk FOREIGN KEY (laborant_id) REFERENCES public."Laborants"(laborant_id);


--
-- TOC entry 4796 (class 2606 OID 42194)
-- Name: ProvideServices provideservices_services_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProvideServices"
    ADD CONSTRAINT provideservices_services_fk FOREIGN KEY (service_code) REFERENCES public."Services"(service_code);


--
-- TOC entry 4783 (class 2606 OID 42159)
-- Name: Users users_roles_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT users_roles_fk FOREIGN KEY (role_id) REFERENCES public."Roles"(role_id);


-- Completed on 2024-11-15 14:45:40

--
-- PostgreSQL database dump complete
--

