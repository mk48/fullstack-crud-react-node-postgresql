--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

-- Started on 2019-02-06 22:09:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16542)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id uuid NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16537)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    category_id uuid,
    expiry_date date,
    is_expiry boolean,
    price numeric(13,2),
    size smallint,
    description text
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 2799 (class 0 OID 16542)
-- Dependencies: 197
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category VALUES ('9a842da6-c198-41a0-831f-0f9b45018d53', 'Photojam');
INSERT INTO public.category VALUES ('7b355ec5-40c3-4a64-9eec-9abdc895deb1', 'Tagopia');
INSERT INTO public.category VALUES ('22412c0c-735b-47e5-90cd-a5aaae02ef17', 'Tazz');
INSERT INTO public.category VALUES ('2dfb2f6d-d1e9-4375-a1fb-813db1280870', 'Demimbu');
INSERT INTO public.category VALUES ('a3a2060f-cd1e-4621-9edf-cbfb80fbaf43', 'Youopia');
INSERT INTO public.category VALUES ('cee51903-2995-4b3f-861b-5f8113261096', 'Skidoo');
INSERT INTO public.category VALUES ('02877201-e6cf-4dc4-804b-68cc03ee26d6', 'Digitube');
INSERT INTO public.category VALUES ('13d31c27-de6d-4922-9af4-27cc5dbc5027', 'Skynoodle');
INSERT INTO public.category VALUES ('53baa779-66c2-4cbf-a781-6fa0beae5cfa', 'Plambee');
INSERT INTO public.category VALUES ('8ac43fe7-b336-4a58-97c2-4147237c7e8a', 'DabZ');
INSERT INTO public.category VALUES ('5ff5f236-98a2-43e3-b67d-2725829d4d47', 'Realpoint');
INSERT INTO public.category VALUES ('501b6ad9-ca4a-468a-b875-b7a290913f12', 'Fivebridge');
INSERT INTO public.category VALUES ('56994ce3-4608-4c4a-9948-1d370d67a212', 'Einti');
INSERT INTO public.category VALUES ('04c5724e-9458-47c8-b47a-90538d0251be', 'Ailane');
INSERT INTO public.category VALUES ('6cd9ec16-5c66-4d80-8316-c365fd3d9b6f', 'Cogilith');
INSERT INTO public.category VALUES ('f7d4ae91-33f6-44db-9f61-5a6134474848', 'Voomm');
INSERT INTO public.category VALUES ('a426352b-1ca9-44d4-a1d4-21914616062c', 'Edgeclub');
INSERT INTO public.category VALUES ('3bdaa7b1-1e42-4dea-a944-0b265e83f99c', 'Dynabox');
INSERT INTO public.category VALUES ('de61e631-ff60-458b-a36b-206c119fcdbb', 'Thoughtstorm');
INSERT INTO public.category VALUES ('df1a491d-5581-41b6-8fcc-f2493e2dcf14', 'Thoughtmix');
INSERT INTO public.category VALUES ('dd169b84-fa01-4563-878a-2e13e5b499bb', 'Zoovu');
INSERT INTO public.category VALUES ('53ee8ce6-eb17-4681-bb45-ea8745db69d6', 'Voonder');
INSERT INTO public.category VALUES ('e30198e0-edf3-46a6-9b3c-a927cddc048d', 'Yombu');
INSERT INTO public.category VALUES ('a65c07fc-14e5-4208-a041-ef5ed860777b', 'Zoomdog');
INSERT INTO public.category VALUES ('cd4d0f8f-a196-4bc4-b0e5-d6def9fe1acf', 'Lazzy');
INSERT INTO public.category VALUES ('2fbc2528-defd-42ad-a8a5-fbc8984a89d4', 'Realcube');
INSERT INTO public.category VALUES ('be13863f-09be-4193-ae10-092d466faf1c', 'Fliptune');
INSERT INTO public.category VALUES ('9ac85577-a6ef-47e3-836b-ccd1abf139ad', 'Voonix');
INSERT INTO public.category VALUES ('8b97b395-4c5b-4792-819e-a8da2045fbdf', 'Oyondu');
INSERT INTO public.category VALUES ('5a173cd9-380e-4122-a47c-50e5690614ac', 'Aivee');
INSERT INTO public.category VALUES ('b49ca61a-8936-44a7-a3b4-2c6ae6b5b73e', 'Mudo');
INSERT INTO public.category VALUES ('5e0f104d-c5c5-4687-93a2-fd1a266c712f', 'Eamia');
INSERT INTO public.category VALUES ('d6e6fa83-3a00-4b4b-ac04-ff2a055cb298', 'Katz');
INSERT INTO public.category VALUES ('3c87fe46-4e13-490d-aca8-5025bcaab124', 'Skiptube');
INSERT INTO public.category VALUES ('8f2ade90-d511-42d8-88b4-e4333e954af3', 'Trilia');
INSERT INTO public.category VALUES ('bc231b2f-bfd9-4c56-b847-887ca72d0ab6', 'Tagtune');
INSERT INTO public.category VALUES ('a0ab4a0f-489e-4fb1-bda3-905949d953b1', 'Voonix');
INSERT INTO public.category VALUES ('a19cd401-eb3c-447e-af39-eed3a3c80b25', 'Fivechat');
INSERT INTO public.category VALUES ('a2c5a693-d865-4ee9-9415-a3b9536251ea', 'Voonyx');
INSERT INTO public.category VALUES ('a98599f0-7d27-477d-9a40-2de8671fe7d9', 'Flashset');
INSERT INTO public.category VALUES ('ec297f45-e7e5-4311-8e58-4de2e7ee9a2e', 'Rhyloo');
INSERT INTO public.category VALUES ('d879d5b3-1493-416c-ba2e-4ce21f289851', 'Zoonder');
INSERT INTO public.category VALUES ('a4e07d7f-3682-4bb6-bc92-1bef39b2e0ee', 'Meeveo');
INSERT INTO public.category VALUES ('0510a74a-6522-4f03-a244-0ea59ff44b41', 'Jaloo');
INSERT INTO public.category VALUES ('d7656dd4-49a0-4550-84b4-2935e913ca7f', 'Voolith');
INSERT INTO public.category VALUES ('ff16a1c7-2c26-4b4a-944b-101a25251037', 'Realcube');
INSERT INTO public.category VALUES ('f80515c7-07cb-4de6-a48e-7b04276dcb29', 'Realfire');
INSERT INTO public.category VALUES ('9266f762-2854-499d-bd6b-bcf64b42df3e', 'Voonder');
INSERT INTO public.category VALUES ('917f6817-ca42-428e-aaf4-dcbf81280545', 'Digitube');
INSERT INTO public.category VALUES ('61dbf211-ddc7-4e8d-89d1-fce16d416226', 'Vinder');
INSERT INTO public.category VALUES ('db93af1a-d9b2-44f8-bb54-d5cf994c0914', 'Gigazoom');
INSERT INTO public.category VALUES ('8329d285-72af-473a-8585-b8aa356eea01', 'Meemm');
INSERT INTO public.category VALUES ('caf2f55f-f750-450f-bc52-ee2d335cb752', 'Jabbersphere');
INSERT INTO public.category VALUES ('251b8210-bb4a-4f7f-a155-6df2210c507f', 'Jaxspan');
INSERT INTO public.category VALUES ('257fbeff-5a1e-49f2-bbf8-e9d7a6528fbb', 'Gigashots');
INSERT INTO public.category VALUES ('4d47d34b-a8af-4b47-808e-64557c4b6378', 'Npath');
INSERT INTO public.category VALUES ('c985cce8-bffb-4155-a8ce-0a1cf0af9c4c', 'Eadel');
INSERT INTO public.category VALUES ('0af5f300-64e9-4fc7-bba7-70d6de8bf519', 'Photospace');
INSERT INTO public.category VALUES ('ec834043-cd7b-4072-a955-5447c032bc13', 'Eimbee');
INSERT INTO public.category VALUES ('8344b61f-210d-48c6-afe7-7109688cccf2', 'Oodoo');
INSERT INTO public.category VALUES ('eab6171e-8f2e-494c-b956-e7fffccd6fa2', 'Yozio');
INSERT INTO public.category VALUES ('af7e5536-a9b6-4b9e-9420-df29ef156a80', 'Trilia');
INSERT INTO public.category VALUES ('95a3ae07-fd8f-4552-a32a-7907e3d6b4aa', 'Thoughtblab');
INSERT INTO public.category VALUES ('60776347-d2fc-4225-b628-e854619c34e3', 'Feedfire');
INSERT INTO public.category VALUES ('926a5328-aecc-400b-ac41-c61cf8774235', 'Eazzy');
INSERT INTO public.category VALUES ('7e1227eb-f7a1-40c9-96ef-4342b296315d', 'Agivu');
INSERT INTO public.category VALUES ('234b8e23-eec0-435c-bc37-d44cd0b21d38', 'Zooveo');
INSERT INTO public.category VALUES ('d931e2ee-7334-4a9e-ae96-ae16767894da', 'Jabbersphere');
INSERT INTO public.category VALUES ('8a01cab0-040f-4791-a4f7-97cac1479804', 'Topdrive');
INSERT INTO public.category VALUES ('1e00682d-b4d2-4404-8e21-5c6fd4197915', 'Skalith');
INSERT INTO public.category VALUES ('385fc1f6-f0ae-4c2f-a2ed-bc161babdbc8', 'Wikivu');
INSERT INTO public.category VALUES ('a8f31a15-a62b-453a-9fe9-a92a1c28b981', 'Browsetype');
INSERT INTO public.category VALUES ('131c8484-f027-412b-b095-6384eca51541', 'Reallinks');
INSERT INTO public.category VALUES ('ea91f3b0-731a-49e9-a731-e3e9f8f289a2', 'Gabtype');
INSERT INTO public.category VALUES ('0ec71bae-e30b-4a92-a64f-1e824defccb2', 'Rhycero');
INSERT INTO public.category VALUES ('cd6a8e54-8811-4a38-9d8b-d818009db409', 'Chatterpoint');
INSERT INTO public.category VALUES ('4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', 'Thoughtmix');
INSERT INTO public.category VALUES ('4504e9a1-0f3d-4d72-b5a5-117940cd86e8', 'Feedbug');
INSERT INTO public.category VALUES ('b454f0e7-0646-42ab-92f0-c5873680631a', 'Feedfish');
INSERT INTO public.category VALUES ('2f3b0072-b99d-4231-b589-16ab26787305', 'Jabberstorm');
INSERT INTO public.category VALUES ('181a34ac-3144-4aba-b0d8-70cdd691322b', 'Plajo');
INSERT INTO public.category VALUES ('f41ab2c2-c3aa-4aa4-a247-619b846d5e2a', 'Wikizz');
INSERT INTO public.category VALUES ('df4a6a5b-2bec-44d9-8092-5707cf3d9b01', 'Wikido');
INSERT INTO public.category VALUES ('41dd6686-7a3e-4a54-b22b-ae4b4eb0fc73', 'Demivee');
INSERT INTO public.category VALUES ('c2c9fb6e-7c85-4b35-953b-8efa4b550cce', 'Brainsphere');
INSERT INTO public.category VALUES ('ef3bee6f-3865-4ef1-9c3c-230cdda2c34d', 'Riffpedia');
INSERT INTO public.category VALUES ('d8b7b829-1e73-4e35-a595-201ba9369433', 'Flashspan');
INSERT INTO public.category VALUES ('7f17192b-547b-4e69-a9a0-305bacbb2ec4', 'Roodel');
INSERT INTO public.category VALUES ('0518e429-b338-48b4-a15e-ec53c6599906', 'Skibox');
INSERT INTO public.category VALUES ('9afc7b9f-0325-4359-a5af-78f61345b7f8', 'Flipstorm');
INSERT INTO public.category VALUES ('d5a1a2da-d110-4c54-9a09-7ce8459033ab', 'Aivee');
INSERT INTO public.category VALUES ('e0ac86ce-0d42-4852-bf22-9b8fd2058802', 'Jaxspan');
INSERT INTO public.category VALUES ('c24df21f-c132-4ac5-b151-2cec0e24e3f5', 'Jaxspan');
INSERT INTO public.category VALUES ('39770a58-f985-4777-a860-856bf5700041', 'Kayveo');
INSERT INTO public.category VALUES ('429c12da-04f3-46d7-a8f3-9ff5f7f51194', 'Tagchat');
INSERT INTO public.category VALUES ('564cca50-84c8-4062-a24b-aaa529b9f766', 'Viva');
INSERT INTO public.category VALUES ('f449755b-4229-4f4c-b9e9-0e626cd6d627', 'Fivechat');
INSERT INTO public.category VALUES ('1de98c0f-63f1-40f9-874a-d476d2674d82', 'Voomm');
INSERT INTO public.category VALUES ('2e623624-4357-45f9-96e3-3d056eb9b13c', 'Miboo');
INSERT INTO public.category VALUES ('d39cb139-ec6d-45ca-9834-45edaeec6e4b', 'Realmix');


--
-- TOC entry 2798 (class 0 OID 16537)
-- Dependencies: 196
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product VALUES ('7b93ae21-e748-4b1c-87aa-75e69f4f9f0b', 'test product', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.product VALUES ('1cede354-e8e5-4978-a3fd-a57aa960e120', 'test product', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.product VALUES ('02cfb78e-7ad9-4914-8f3b-df549d8253ca', 'rrr', NULL, NULL, NULL, 44.00, 1, 'eeee');
INSERT INTO public.product VALUES ('074e17fe-0654-4748-8fd7-01320329a57b', 'aaa', NULL, NULL, NULL, 446.00, 1, 'fdsf');
INSERT INTO public.product VALUES ('28410e78-f099-41d1-b5e4-db6f197e599a', 'rrtqasw', NULL, NULL, NULL, 0.00, 1, 'ooo');
INSERT INTO public.product VALUES ('e4f7e236-98bb-4433-9d67-616512781d5f', 'small box', NULL, '2019-02-06', true, 56.75, 2, 'this
is');
INSERT INTO public.product VALUES ('b80d560d-62df-4c96-99c5-076962c81f68', 'small box', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-06', true, 56.75, 2, 'this
is');


--
-- TOC entry 2676 (class 2606 OID 16546)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 16541)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


-- Completed on 2019-02-06 22:09:42

--
-- PostgreSQL database dump complete
--

