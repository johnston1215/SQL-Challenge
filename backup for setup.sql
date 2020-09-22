--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-09-22 15:16:53

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
-- TOC entry 202 (class 1259 OID 18028)
-- Name: data_depts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_depts (
    dept_no character varying(4) NOT NULL,
    dept_name character varying NOT NULL
);


ALTER TABLE public.data_depts OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18044)
-- Name: employee_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_data (
    emp_no integer NOT NULL,
    emp_title_id character varying NOT NULL,
    birth_date date NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    sex character varying(1) NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employee_data OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18036)
-- Name: employee_depts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_depts (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL
);


ALTER TABLE public.employee_depts OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18039)
-- Name: manager_depts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager_depts (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL
);


ALTER TABLE public.manager_depts OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18052)
-- Name: salary_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salary_data (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salary_data OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18057)
-- Name: title_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title_data (
    title_id character varying(5) NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.title_data OWNER TO postgres;

--
-- TOC entry 2709 (class 2606 OID 18035)
-- Name: data_depts pk_data_depts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_depts
    ADD CONSTRAINT pk_data_depts PRIMARY KEY (dept_no);


--
-- TOC entry 2713 (class 2606 OID 18051)
-- Name: employee_data pk_employee_data; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_data
    ADD CONSTRAINT pk_employee_data PRIMARY KEY (emp_no);


--
-- TOC entry 2711 (class 2606 OID 18043)
-- Name: manager_depts pk_manager_depts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager_depts
    ADD CONSTRAINT pk_manager_depts PRIMARY KEY (emp_no);


--
-- TOC entry 2715 (class 2606 OID 18056)
-- Name: salary_data pk_salary_data; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salary_data
    ADD CONSTRAINT pk_salary_data PRIMARY KEY (emp_no);


--
-- TOC entry 2717 (class 2606 OID 18064)
-- Name: title_data pk_title_data; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_data
    ADD CONSTRAINT pk_title_data PRIMARY KEY (title_id);


--
-- TOC entry 2722 (class 2606 OID 18085)
-- Name: employee_data fk_employee_data_emp_title_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_data
    ADD CONSTRAINT fk_employee_data_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES public.title_data(title_id);


--
-- TOC entry 2719 (class 2606 OID 18070)
-- Name: employee_depts fk_employee_depts_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_depts
    ADD CONSTRAINT fk_employee_depts_dept_no FOREIGN KEY (dept_no) REFERENCES public.data_depts(dept_no);


--
-- TOC entry 2718 (class 2606 OID 18065)
-- Name: employee_depts fk_employee_depts_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_depts
    ADD CONSTRAINT fk_employee_depts_emp_no FOREIGN KEY (emp_no) REFERENCES public.employee_data(emp_no);


--
-- TOC entry 2721 (class 2606 OID 18080)
-- Name: manager_depts fk_manager_depts_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager_depts
    ADD CONSTRAINT fk_manager_depts_dept_no FOREIGN KEY (dept_no) REFERENCES public.data_depts(dept_no);


--
-- TOC entry 2720 (class 2606 OID 18075)
-- Name: manager_depts fk_manager_depts_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager_depts
    ADD CONSTRAINT fk_manager_depts_emp_no FOREIGN KEY (emp_no) REFERENCES public.employee_data(emp_no);


--
-- TOC entry 2723 (class 2606 OID 18090)
-- Name: salary_data fk_salary_data_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salary_data
    ADD CONSTRAINT fk_salary_data_emp_no FOREIGN KEY (emp_no) REFERENCES public.employee_data(emp_no);


-- Completed on 2020-09-22 15:16:54

--
-- PostgreSQL database dump complete
--

