--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

-- Started on 2019-02-16 10:44:51

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

INSERT INTO public.product VALUES ('1b9a83ee-bc5b-47fd-9486-9ee2b286ab26', 'Wine - Ej Gallo Sierra Valley', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-10', false, 427.90, 2, 'Computerized Tomography (CT Scan) of Left Lower Extremity Arteries');
INSERT INTO public.product VALUES ('e692c97d-1145-4906-bce3-11c4a376b685', 'Yeast Dry - Fermipan', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-10', true, 124.52, 3, 'Revision of Internal Fixation Device in Right Finger Phalanx, Percutaneous Approach');
INSERT INTO public.product VALUES ('799e5ad1-b59c-403a-bc75-a7bb5044955c', 'Dried Peach', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-31', false, 501.23, 2, 'Plain Radiography of Inferior Vena Cava using High Osmolar Contrast');
INSERT INTO public.product VALUES ('55d57893-f296-4fe3-94ce-5fbb3495471c', 'Wine - Rioja Campo Viejo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-25', true, 576.47, 3, 'Reposition Ulnar Nerve, Open Approach');
INSERT INTO public.product VALUES ('731327f3-47ac-4d50-9b32-4ef4bb12cea4', 'Assorted Desserts', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-14', false, 508.81, 1, 'Stereotactic Other Photon Radiosurgery of Head and Neck');
INSERT INTO public.product VALUES ('f4958a31-b24b-4660-b843-b15faf32499d', 'Cabbage Roll', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-02', false, 977.82, 3, 'Revision of Synthetic Substitute in Left Tibia, Percutaneous Approach');
INSERT INTO public.product VALUES ('e96c19fb-3d73-49b1-aba6-d983ca5dbd06', 'Milk - Homo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-20', true, 502.42, 1, 'Dilation of Right Large Intestine, Open Approach');
INSERT INTO public.product VALUES ('173e156a-cc55-4604-b501-aba5fa8615f4', 'Cornish Hen', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-31', true, 382.43, 1, 'Removal of Internal Fixation Device from Right Upper Femur, Percutaneous Approach');
INSERT INTO public.product VALUES ('03817aa9-6ff7-49a1-8c6e-338b9ac86607', 'Bacardi Limon', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-04', false, 922.05, 3, 'Extraction of Right Ethmoid Sinus, Open Approach');
INSERT INTO public.product VALUES ('3bafda58-a6f4-4b1e-a204-03db517dfb54', 'Cheese - Havarti, Salsa', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-18', true, 410.86, 2, 'Removal of Radioactive Element from Prostate and Seminal Vesicles, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('9e6c9e0b-fa03-4df2-b9db-dccf6008d881', 'Veal - Inside Round / Top, Lean', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-19', true, 964.24, 1, 'Removal of Autologous Tissue Substitute from Right Wrist Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('afb9343c-a7f6-41d4-afe4-49a14c0ba8b5', 'Calypso - Strawberry Lemonade', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-04', true, 120.84, 2, 'Planar Nuclear Medicine Imaging of Thorax using Technetium 99m (Tc-99m)');
INSERT INTO public.product VALUES ('c4e3fc23-08f2-4381-88d9-356b59bdd758', 'Butter - Pod', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-04', true, 155.60, 1, 'Excision of Bilateral Spermatic Cords, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('9b6303c0-7a93-4bf3-8cc6-c488cbde3f6d', 'Syrup - Monin, Swiss Choclate', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-26', false, 837.86, 1, 'Removal of Autologous Tissue Substitute from Left Metacarpophalangeal Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('87265563-a7f0-409a-8542-9f4567171d44', 'Red Cod Fillets - 225g', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-21', true, 310.43, 2, 'Revision of Synthetic Substitute in Coccygeal Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('76ef4bd4-9920-42ae-b9de-1e3c51bcfc9d', 'Doilies - 7, Paper', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-27', true, 844.34, 2, 'Drainage of Left Axillary Vein, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('1557137f-96f3-43a5-8d1f-547939d1fe9a', 'Turnip - White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-19', true, 548.47, 1, 'Therapeutic Exercise Treatment of Neurological System - Upper Back / Upper Extremity using Mechanical or Electromechanical Equipment');
INSERT INTO public.product VALUES ('37b151f9-aa31-4c90-a7e4-489a1d4b3224', 'Juice - Tomato, 10 Oz', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-04', false, 570.23, 3, 'Inspection of Thoracolumbar Vertebral Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('bceb11aa-ae5b-4916-8f64-da89492edb9a', 'Salmon - Atlantic, No Skin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-05', false, 967.00, 1, 'Magnetic Resonance Imaging (MRI) of Right Lower Extremity Veins using Other Contrast, Unenhanced and Enhanced');
INSERT INTO public.product VALUES ('898819ba-af53-4943-973b-161f66930af9', 'Beef - Striploin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-16', true, 615.20, 3, 'Removal of Internal Fixation Device from Lumbar Vertebra, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('4dfec530-ff3f-47bc-b8e5-55e170168ff9', 'Pork Loin Cutlets', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-08', false, 118.80, 3, 'Dilation of Left Anterior Tibial Artery with Three Intraluminal Devices, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e62370c8-0371-48ef-978d-945e089f333a', 'Sauce - Thousand Island', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-28', false, 215.91, 2, 'Transfer Small Intestine to Esophagus, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('7b28cc51-f34f-42f9-8d4a-5851fbae0ca4', 'Walkers Special Old Whiskey', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-20', false, 859.95, 2, 'Reposition Right Tibia with Hybrid External Fixation Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('a3f7a43f-1d7f-4e65-af6d-2b34d7082f84', 'Vacuum Bags 12x16', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-26', true, 425.64, 2, 'Reposition Right Metacarpophalangeal Joint with Internal Fixation Device, External Approach');
INSERT INTO public.product VALUES ('40e60ad2-8249-4045-b122-9c4cf1010c50', 'Rum - Light, Captain Morgan', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-28', false, 6.59, 2, 'Supplement Bilateral Seminal Vesicles with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e96c2981-5186-463e-b249-ccf2cfb47164', 'Beer - Camerons Auburn', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-10', true, 909.24, 3, 'Drainage of Lingula Bronchus, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('368f3716-68b4-44e0-8a2e-c9f0bf69fd00', 'Marjoram - Fresh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-29', false, 440.40, 3, 'Removal of Monitoring Device from Spinal Cord, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('c826af94-915e-441d-9cba-ff14b27b912b', 'Tomato - Peeled Italian Canned', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-28', true, 500.97, 2, 'Excision of Right Upper Extremity Lymphatic, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('059603d2-8379-4a3b-aa40-6bd0f6aff48e', 'Cheese Cheddar Processed', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-16', true, 217.45, 3, 'Introduction of Other Gas into Spinal Canal, Percutaneous Approach');
INSERT INTO public.product VALUES ('707debd2-e497-4ee2-bd58-ba74cb29c986', 'Pasta - Fusili, Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-14', false, 804.91, 3, 'Excision of Right Seminal Vesicle, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('e7e9dba6-9c4d-4a18-b305-9e155c19b829', 'Tomato - Plum With Basil', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-24', false, 776.54, 2, 'Repair Left Shoulder Tendon, Percutaneous Approach');
INSERT INTO public.product VALUES ('11d61cc1-4648-404e-bc4f-59aa06fd9186', 'Flower - Carnations', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-06', true, 221.97, 2, 'Replacement of Left Metatarsal-Tarsal Joint with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('42043fd7-43b9-403e-a5d6-a6ecfb462b8c', 'Coffee Beans - Chocolate', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-18', false, 706.11, 2, 'Revision of Infusion Device in Vagina and Cul-de-sac, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('2902765f-1fee-450b-87d9-2005dae03a77', 'Pork - Smoked Back Bacon', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-02', true, 972.31, 3, 'Beam Radiation of Femur using Neutron Capture');
INSERT INTO public.product VALUES ('82415a7a-cc30-4011-af6a-ece540f5883c', 'Glaze - Apricot', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-31', false, 566.61, 3, 'Replacement of Gastric Artery with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('b5a4972f-60c0-4e0b-9277-cc5e38f15e0b', 'Sauce - Apple, Unsweetened', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-27', false, 706.35, 1, 'Drainage of Large Intestine with Drainage Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('f101c09e-89ff-4487-b136-10c99e43f6cf', 'Vodka - Lemon, Absolut', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-12', true, 892.77, 2, 'Removal of Radioactive Element from Upper Jaw, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('22da3d2b-274d-46f0-8c2a-3faf03cf5e69', 'Chocolate - Dark', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-05', false, 826.32, 2, 'Excision of Scalp Subcutaneous Tissue and Fascia, Percutaneous Approach');
INSERT INTO public.product VALUES ('030485b7-1943-459b-b01e-ce275c102fa7', 'Arctic Char - Fresh, Whole', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-04', true, 138.41, 3, 'Excision of Left Metacarpophalangeal Joint, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('be966919-4348-42b2-975e-414145b8e682', 'Pasta - Canelloni, Single Serve', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-21', false, 627.05, 1, 'Removal of Synthetic Substitute from Nose, Percutaneous Approach');
INSERT INTO public.product VALUES ('39f71e63-0bbd-4b96-a410-9057cc299e9c', 'Lid - 3oz Med Rec', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-02-04', false, 584.12, 2, 'Supplement Right Femoral Vein with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('85314f4e-c67b-469f-849c-63cc9c70cd0a', 'Fish - Base, Bouillion', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-06', true, 702.95, 3, 'Release Gastric Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('86a64ff3-a79e-4e08-abff-d462911cc884', 'Wine - Magnotta - Red, Baco', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-16', true, 392.53, 1, 'Repair Left Vertebral Artery, Open Approach');
INSERT INTO public.product VALUES ('8bc84ad8-aaa6-4a9e-9eb7-96a58e21d94f', 'Tea - Jasmin Green', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-15', true, 766.78, 3, 'Revision of Drainage Device in Thoracolumbar Vertebral Disc, Percutaneous Approach');
INSERT INTO public.product VALUES ('c8fd1e78-96bc-4584-9eb9-606536a6f634', 'Teriyaki Sauce', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-08', true, 267.26, 1, 'Removal of Drainage Device from Stomach, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('f55d89a1-fff0-4c0f-957f-f6557f2ddc2e', 'Chicken - Tenderloin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-21', false, 858.56, 3, 'Resection of Right Shoulder Joint, Open Approach');
INSERT INTO public.product VALUES ('b5f59684-c402-490c-81ba-c696267939ec', 'Almonds Ground Blanched', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-07', true, 12.14, 2, 'Revision of Synthetic Substitute in Left Glenoid Cavity, External Approach');
INSERT INTO public.product VALUES ('48701836-5a02-44c0-a7c4-0bf2c444c1e9', 'Chocolate - Milk Coating', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-14', true, 312.05, 3, 'Bypass Right Common Iliac Vein to Lower Vein with Autologous Venous Tissue, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('a38d08f0-ff5c-42ba-a6a8-ce95f775103e', 'Soup - French Onion', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-30', true, 241.74, 2, 'Revision of Autologous Tissue Substitute in Sacrococcygeal Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('79c4082a-50df-49ad-b035-3c25c4236d32', 'Coffee - Frthy Coffee Crisp', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-12', true, 633.29, 3, 'Fusion of 2 to 7 Thoracic Vertebral Joints with Synthetic Substitute, Posterior Approach, Posterior Column, Percutaneous Approach');
INSERT INTO public.product VALUES ('c4e481e0-bea5-4faa-88bf-3ef556de56d0', 'Oil - Food, Lacquer Spray', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-18', false, 487.19, 1, 'Dilation of Right Main Bronchus, Open Approach');
INSERT INTO public.product VALUES ('7c7d525d-be0e-4b70-8525-99feeeb7cf67', 'Wine - Red, Pelee Island Merlot', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-15', true, 865.49, 3, 'Dilation of Upper Artery with Four or More Drug-eluting Intraluminal Devices, Open Approach');
INSERT INTO public.product VALUES ('398308aa-a9f6-45e0-8fec-0818b089f438', 'Coffee - French Vanilla Frothy', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-16', true, 994.05, 1, 'Revision of Nonautologous Tissue Substitute in Left Eye, Open Approach');
INSERT INTO public.product VALUES ('d2cfb9b7-8e7d-4db1-bb73-a976fd527dde', 'Red Pepper Paste', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-03', false, 903.40, 2, 'Extirpation of Matter from Right Tarsal Joint, Open Approach');
INSERT INTO public.product VALUES ('ec5b4706-efa1-4559-9ef8-f49f208156be', 'Pasta - Bauletti, Chicken White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-17', false, 158.52, 2, 'Reposition Right Femoral Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('4086948a-d0f7-47ed-adf7-1657df6a7247', 'Foil - 4oz Custard Cup', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-14', true, 66.17, 1, 'Excision of Right Femoral Shaft, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('090cc3ae-0658-45a0-9cb6-632ad566437e', 'Sea Bass - Fillets', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-17', false, 6.81, 1, 'Bypass Right Ventricle to Left Pulmonary Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('f34264b5-8742-48c1-b79e-ad57040473da', 'Tahini Paste', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-26', false, 234.87, 3, 'Destruction of Minor Salivary Gland, Open Approach');
INSERT INTO public.product VALUES ('37679126-4098-4a5d-ba4f-b829458529c5', 'Table Cloth 81x81 Colour', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-18', false, 815.52, 1, 'Reposition Gastric Vein, Open Approach');
INSERT INTO public.product VALUES ('9c959b18-8862-4423-a54e-b52efe3b7af9', 'Carbonated Water - Peach', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-30', false, 948.06, 1, 'Insertion of Internal Fixation Device into Left Lower Femur, Open Approach');
INSERT INTO public.product VALUES ('1b563e6b-3bda-4a0b-9e87-0d6e439feffa', 'Cinnamon - Stick', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-01', true, 298.33, 1, 'Revision of Drainage Device in Spinal Canal, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('5285abfd-c9ea-4abb-9b99-33d4ef77aa60', 'Nut - Almond, Blanched, Ground', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-17', true, 814.93, 1, 'Drainage of Lower Esophagus, Via Natural or Artificial Opening Endoscopic, Diagnostic');
INSERT INTO public.product VALUES ('607b67e5-3d88-4af3-a6ed-8e5969d49aa7', 'Oil - Peanut', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-13', true, 621.87, 2, 'Excision of Left Maxilla, Percutaneous Approach');
INSERT INTO public.product VALUES ('6a7cecf4-faa9-4f5d-ba6b-5ca94e3f7bff', 'Tofu - Soft', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-19', false, 333.92, 2, 'Transplantation of Other Body System into Products of Conception, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('08bc8ef9-a78d-469f-b6bc-fcd8e2e7224a', 'Cheese - Blue', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-25', false, 672.35, 3, 'Supplement Right Hypogastric Vein with Autologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('2ac81f70-999a-437c-a1cb-f70b79eaf6b1', 'Gloves - Goldtouch Disposable', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-25', true, 191.39, 1, 'Dilation of Coronary Artery, Four or More Arteries, Bifurcation, with Three Drug-eluting Intraluminal Devices, Open Approach');
INSERT INTO public.product VALUES ('bb2039fc-bcce-428a-b113-404db8817fec', 'Garam Marsala', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-29', false, 173.44, 2, 'Dilation of Right Temporal Artery, Bifurcation, with Two Drug-eluting Intraluminal Devices, Open Approach');
INSERT INTO public.product VALUES ('b5342f42-c93d-4dbe-ac8e-dc284dc89845', 'Water - Spring 1.5lit', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-10', false, 99.72, 3, 'Insertion of Infusion Device into Left Upper Arm, Percutaneous Approach');
INSERT INTO public.product VALUES ('e4e030b3-28f5-49e3-8ec9-9aa368aa1a99', 'Wine - Montecillo Rioja Crianza', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-27', true, 396.70, 3, 'Drainage of Left Upper Lobe Bronchus, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('417c993b-86a2-4fef-8c66-9d96a1c724d3', 'Sugar - Palm', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-06', true, 689.46, 2, 'Introduction of Radioactive Substance into Respiratory Tract, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('4b31ea0b-6d24-438e-b67b-051bcea3bdf1', 'Lettuce - Boston Bib', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-11', false, 985.80, 1, 'Magnetic Resonance Imaging (MRI) of Bilateral Eyes using Other Contrast, Unenhanced and Enhanced');
INSERT INTO public.product VALUES ('162c2bfc-bcf8-4b41-bfd1-392aa8ecf13b', 'Container Clear 8 Oz', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-16', true, 449.89, 1, 'Repair Splenic Vein, Open Approach');
INSERT INTO public.product VALUES ('7792a85f-5fb8-4304-a9cc-809f965b28f8', 'Wine - Zinfandel California 2002', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-30', true, 971.23, 3, 'Restriction of Transverse Colon, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('f4d31750-77e2-4545-8261-1cfda6d61b5a', 'Peach - Halves', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-30', true, 129.78, 3, 'Division of Left Finger Phalanx, Percutaneous Approach');
INSERT INTO public.product VALUES ('04839a55-9c26-4dea-ac66-8d3e8811c6b4', 'Chinese Lemon Pork', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-07', false, 129.22, 3, 'Drainage of Right Occipital Bone, Open Approach');
INSERT INTO public.product VALUES ('0b2b5051-5c11-4255-bb38-4c374c799602', 'V8 - Vegetable Cocktail', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-25', true, 2.91, 2, 'Excision of Left Temporomandibular Joint, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('fd4f21b4-b2d1-4108-bc90-fb235e43fc43', 'Figs', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-17', false, 795.25, 2, 'Supplement Right Axillary Vein with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('293d08a3-cf5f-4ca4-a877-304d5df7ec24', 'Ham Black Forest', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-12', false, 544.03, 2, 'Anatomical Regions, General, Fragmentation');
INSERT INTO public.product VALUES ('367d9251-d6b5-43aa-96e3-62ccd87b271f', 'Bread - English Muffin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-11', true, 58.92, 1, 'Supplement Left External Carotid Artery with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('681d1a81-d5e1-4ed3-8195-80abc06ae20d', 'Sausage - Blood Pudding', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-26', false, 47.46, 1, 'Insertion of Infusion Device into Left Temporomandibular Joint, Percutaneous Approach');
INSERT INTO public.product VALUES ('b79a06ea-b8eb-43a3-b7ac-a350e79e1c2c', 'Milk 2% 500 Ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-21', false, 882.80, 2, 'Extirpation of Matter from Right External Iliac Artery, Open Approach');
INSERT INTO public.product VALUES ('9c9bfff1-1e7e-4bfe-b5f1-3b6b6d583f04', 'Cheese - Augre Des Champs', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-18', false, 444.10, 3, 'Plain Radiography of Right Subclavian Vein using Low Osmolar Contrast');
INSERT INTO public.product VALUES ('deba4636-968e-4d7d-a04a-381b97f9059a', 'Shrimp - Baby, Cold Water', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-18', true, 244.92, 3, 'Replacement of Pulmonary Trunk with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('b0b616be-7e94-4b23-8615-a3b8f89a5e3e', 'Wine - Maipo Valle Cabernet', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-05', true, 677.85, 2, 'Dilation of Right Foot Artery, Bifurcation, with Three Drug-eluting Intraluminal Devices, Open Approach');
INSERT INTO public.product VALUES ('8b43de63-5e7b-485f-9870-9a1984dea700', 'Wine - Shiraz Wolf Blass Premium', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-15', true, 51.94, 1, 'Release Uterus, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('3630d74c-92ce-4980-aee0-bf764ab803ac', 'Flavouring Vanilla Artificial', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-12', true, 309.24, 2, 'Destruction of Medulla Oblongata, Percutaneous Approach');
INSERT INTO public.product VALUES ('723aada9-4715-41b2-9e40-1c8cfaa1c5a3', 'Potatoes - Parissienne', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-26', false, 803.85, 2, 'Release Duodenum, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('6c924286-673e-4e98-8547-deb0d84af603', 'Nut - Almond, Blanched, Sliced', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-13', false, 327.50, 2, 'Division of Right Neck Muscle, Open Approach');
INSERT INTO public.product VALUES ('b68e320d-41cc-495b-839a-260cdbcbdf7b', 'Sauce - Balsamic Viniagrette', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-25', false, 378.36, 1, 'Release Pharynx, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('d71ab22f-d99f-4d85-ab80-424f8e5a944d', 'Oil - Shortening,liqud, Fry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-07', false, 960.90, 3, 'Supplement Right Cornea with Autologous Tissue Substitute, External Approach');
INSERT INTO public.product VALUES ('928db308-b063-4da4-a05a-ae498a0fc612', 'Longos - Lasagna Beef', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-10', false, 146.46, 1, 'Fluoroscopy of Bile Ducts using Low Osmolar Contrast');
INSERT INTO public.product VALUES ('cbe29706-c924-40d6-aec5-a6e89c49cd0b', 'Energy Drink Bawls', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-23', true, 892.40, 3, 'Release Inferior Mesenteric Vein, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('fc43c65f-c63f-4475-9895-f2f520d53bf0', 'Carbonated Water - Strawberry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-30', true, 882.43, 3, 'Dilation of Left Face Vein with Intraluminal Device, Open Approach');
INSERT INTO public.product VALUES ('aaf2b9a9-ee96-4bf2-b118-29e13f78f1b4', 'Nantucket Apple Juice', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-10', false, 326.69, 3, 'Repair Right Tarsal Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e9a87949-0ab9-4583-b796-a72b08d5713c', 'Dried Cranberries', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-10', false, 17.30, 2, 'Release Thoracic Vertebral Disc, External Approach');
INSERT INTO public.product VALUES ('65aec542-e4d8-4187-950f-cfa7c114482e', 'Water - Spring Water 500ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-16', true, 216.59, 2, 'Occlusion of Left Face Vein with Intraluminal Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('c4dc79e8-1e1d-4a1a-a75a-fd5932d6f8ab', 'The Pop Shoppe - Lime Rickey', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-11', true, 603.52, 2, 'Removal of Drainage Device from Diaphragm, Percutaneous Approach');
INSERT INTO public.product VALUES ('9bf3650c-cdb4-4027-b6e5-47f937d2ccb6', 'Pears - Anjou', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-02', false, 603.75, 2, 'Fusion of Left Elbow Joint with Nonautologous Tissue Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('bbe92837-8c1c-4da6-9fdf-1a27ff56fec1', 'Bar Mix - Pina Colada, 355 Ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-17', false, 955.00, 1, 'Dilation of Right Common Carotid Artery, Bifurcation, with Drug-eluting Intraluminal Device, Open Approach');
INSERT INTO public.product VALUES ('95e09b3c-f94d-44b3-8121-fb0fa819e61f', 'Pastry - Banana Tea Loaf', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-29', true, 935.43, 3, 'Inspection of Mediastinum, Open Approach');
INSERT INTO public.product VALUES ('c402a2dd-973a-4b9b-84c7-99d0ae307a6e', 'Pop - Club Soda Can', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-17', false, 590.33, 2, 'Revision of Nonautologous Tissue Substitute in Mesentery, Percutaneous Approach');
INSERT INTO public.product VALUES ('b2dc99ca-cd5b-46df-879c-fb509cb4b6c4', 'Crawfish', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-05', false, 673.49, 2, 'Supplement Right Brachial Vein with Autologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('8ec057b6-fbea-49d8-a619-cc46b3550332', 'Bandage - Fexible 1x3', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-19', false, 658.06, 3, 'Insertion of Intraluminal Device into Left Cephalic Vein, Open Approach');
INSERT INTO public.product VALUES ('2ae58c32-82f0-46d7-9cb8-6bf9c7f4b516', 'Mince Meat - Filling', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-30', true, 565.51, 3, 'Immobilization of Right Finger using Cast');
INSERT INTO public.product VALUES ('a2284872-64f6-48e3-8026-d35c84ea9dd9', 'Lid - High Heat, Super Clear', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-21', true, 125.49, 3, 'Fluoroscopy of Right Ankle using High Osmolar Contrast');
INSERT INTO public.product VALUES ('f93489b7-364f-4d17-9028-76fcfebf39df', 'Corn Meal', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-06', false, 941.87, 3, 'Excision of Lower Back, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('0872b94e-5ece-43cf-8fa8-5db33b41dccd', 'Lobster - Base', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-02', true, 891.09, 2, 'Release Right Vertebral Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('4986874d-ebfa-4b2b-9ae4-67028928872a', 'Muffin - Mix - Creme Brule 15l', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-02', false, 225.22, 2, 'Reposition Left Brachial Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('44f741cb-f75e-45b0-9deb-a05011736313', 'Cheese - Parmigiano Reggiano', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-20', true, 658.40, 2, 'Control Bleeding in Gastrointestinal Tract, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('b00b5724-b07f-4e9f-a20a-72de73d4e9bb', 'Scallops - 10/20', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-14', false, 192.66, 3, 'Fragmentation in Right Fallopian Tube, Open Approach');
INSERT INTO public.product VALUES ('0f10ae7b-0c28-4747-93ac-78aa1deb7d6b', 'Plastic Wrap', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-10', true, 545.52, 1, 'Computerized Tomography (CT Scan) of Left Sternoclavicular Joint using Other Contrast');
INSERT INTO public.product VALUES ('8dd0a1b7-880f-4921-827e-33d484c0dbab', 'Beer - Upper Canada Lager', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-02', false, 538.16, 2, 'Occlusion of Cecum with Intraluminal Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('f48abbb0-70f9-46df-84fa-94a31db3e799', 'Oil - Sunflower', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-05', false, 441.90, 3, 'Revision of Internal Fixation Device in Right Clavicle, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('8876890f-2b2e-41ad-bd5b-d8242f102c24', 'Iced Tea - Lemon, 340ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-11', true, 733.86, 3, 'Destruction of Right Foot Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('6440c12c-a90d-4b81-ab77-f1158606bd87', 'Chips - Assorted', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-05', true, 68.23, 3, 'Ultrasonography of Bilateral Internal Carotid Arteries');
INSERT INTO public.product VALUES ('745243b3-4b2e-4830-8037-d1873397bef2', 'Beer - Pilsner Urquell', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-27', true, 879.67, 3, 'Revision of Synthetic Substitute in Left Elbow Joint, Percutaneous Approach');
INSERT INTO public.product VALUES ('94b88741-ab7b-4e33-83f2-bb468328557d', 'Absolut Citron', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-24', false, 907.26, 3, 'Fusion of Right Metatarsal-Tarsal Joint with External Fixation Device, Open Approach');
INSERT INTO public.product VALUES ('a00933df-7f83-4c88-b5ef-051b4c3200f5', 'Stock - Veal, Brown', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-20', false, 763.57, 3, 'Dilation of Right Common Carotid Artery with Two Drug-eluting Intraluminal Devices, Percutaneous Approach');
INSERT INTO public.product VALUES ('9577567d-eb86-49a3-a23a-71252d182c46', 'Chicken - Base, Ultimate', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-12', false, 964.09, 2, 'Release Head Muscle, External Approach');
INSERT INTO public.product VALUES ('e60f5e9c-a46c-4e38-8fd5-085fc13e9d24', 'Vinegar - Champagne', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-29', false, 70.60, 2, 'Insertion of Internal Fixation Device into Left Acromioclavicular Joint, Open Approach');
INSERT INTO public.product VALUES ('a698aeac-a326-4d76-b091-a362a423a619', 'Wine - Black Tower Qr', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-08', true, 60.12, 2, 'Extirpation of Matter from Left Common Iliac Vein, Open Approach');
INSERT INTO public.product VALUES ('22709562-932b-4c23-8447-46ecd1579ef5', 'Shopper Bag - S - 4', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-03', true, 449.54, 3, 'Restriction of Right Thyroid Artery with Extraluminal Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('9ba4f5ed-83ec-423b-b49b-b9f63f03f344', 'Garlic - Primerba, Paste', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-02', false, 432.34, 3, 'Reattachment of Transverse Colon, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1c572d19-00ea-4191-ae10-b827c27ecbb6', 'Sage - Rubbed', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-09', false, 53.16, 3, 'Wound Management Treatment of Musculoskeletal System - Whole Body using Other Equipment');
INSERT INTO public.product VALUES ('9c66671a-db7b-45aa-9db8-78041c280e87', 'Lid - High Heat, Super Clear', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-07', false, 700.07, 2, 'Introduction of Other Therapeutic Substance into Coronary Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('dc6cc507-de41-4cf5-8935-613462d871ed', 'Chips Potato Salt Vinegar 43g', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-04', true, 928.81, 3, 'Dilation of Left Radial Artery with Intraluminal Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('46854785-90cb-4f53-9d55-a8af4cf4e29d', 'Sauce - Mint', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-04', true, 885.10, 2, 'Drainage of Right Upper Lung Lobe, Via Natural or Artificial Opening, Diagnostic');
INSERT INTO public.product VALUES ('77c970f9-e524-499d-a52f-ee17d4ef2fa0', 'Soup - Cream Of Broccoli, Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-05', false, 897.25, 1, 'Change Traction Apparatus on Abdominal Wall');
INSERT INTO public.product VALUES ('729506d1-6549-4bf1-a030-beb40d297aeb', 'Mushroom - Portebello', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-07', false, 821.48, 3, 'Introduction of Other Therapeutic Substance into Biliary and Pancreatic Tract, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('0a995f25-ea8f-492a-88bb-575011199008', 'Wine - Chablis J Moreau Et Fils', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-12', false, 985.24, 3, 'Division of Right Upper Arm Tendon, Open Approach');
INSERT INTO public.product VALUES ('3eac6a81-5083-42c0-819c-aa37a4b3c529', 'Wine - Magnotta - Belpaese', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-05', true, 33.68, 3, 'Reposition Left Maxilla, Percutaneous Approach');
INSERT INTO public.product VALUES ('00771009-c8b1-4baa-97e8-19e8b7142cef', 'Wine - Rosso Toscano Igt', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-05', true, 254.51, 2, 'Dilation of Face Artery, Open Approach');
INSERT INTO public.product VALUES ('95bc57d5-6380-4ad5-b314-8d38ebcd3d97', 'Beef - Striploin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-04', true, 827.78, 1, 'Destruction of Left Testis, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e3d35de7-437a-4d86-88de-2650eff39ac9', 'Pepper - Chilli Seeds Mild', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-07', false, 697.44, 1, 'Fluoroscopy of Gallbladder and Bile Ducts using High Osmolar Contrast');
INSERT INTO public.product VALUES ('0a92a467-9e9d-45d4-9a7d-fca21fb13244', 'Garlic Powder', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-04', false, 540.41, 2, 'Reposition Left Metacarpocarpal Joint with External Fixation Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('425c50e3-ff2d-44a3-9efc-8fe56b9cae68', 'Energy Drink - Franks Original', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-18', true, 822.68, 3, 'Radiation Therapy, Central and Peripheral Nervous System, Brachytherapy');
INSERT INTO public.product VALUES ('1e9622be-70f4-4075-a226-622898ff8ebb', 'Puree - Raspberry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-31', true, 284.11, 2, 'Bypass Splenic Vein to Lower Vein with Autologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e1948170-5658-4540-ad0b-db4626ee019b', 'The Pop Shoppe - Grape', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-22', false, 256.11, 2, 'Bypass Portal Vein to Left Renal Vein with Autologous Venous Tissue, Open Approach');
INSERT INTO public.product VALUES ('9e8e837e-d751-4988-a120-32883bb7892c', 'Blackberries', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-16', true, 919.86, 2, 'Insertion of Infusion Device into Left Knee Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('a0ce0a60-ca73-4b7d-9576-ede2961680c5', 'Transfer Sheets', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-23', true, 234.03, 3, 'Magnetic Resonance Imaging (MRI) of Bilateral Testicles using Other Contrast, Unenhanced and Enhanced');
INSERT INTO public.product VALUES ('7c7abf14-40ea-431d-bb81-263b1d0b5c60', 'Cabbage - Nappa', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-19', false, 784.04, 3, 'Release Right Lower Leg Tendon, Open Approach');
INSERT INTO public.product VALUES ('6f21debb-e968-4e52-aeb7-6a9a4f87a5ec', 'Steam Pan - Half Size Deep', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-17', true, 11.23, 1, 'Reposition Right Fibula with Intramedullary Internal Fixation Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('eb1c218d-dc57-4d18-8b17-e0656d5902e0', 'Wine - Manischewitz Concord', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-04', true, 49.11, 3, 'Reposition Right Metacarpophalangeal Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e88af296-5b7a-49e7-b419-8f17e58c1fc7', 'Plasticspoonblack', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-09', true, 128.55, 1, 'Reposition Sternum with Internal Fixation Device, Open Approach');
INSERT INTO public.product VALUES ('97aa2972-18db-4a64-bb9c-188742c7ff8c', 'Pastry - Apple Large', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-06', true, 4.73, 1, 'Repair Left Foot Subcutaneous Tissue and Fascia, Percutaneous Approach');
INSERT INTO public.product VALUES ('74b87462-4cac-4b98-8f26-9b90e642e8a0', 'Soup - Campbells', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-05', true, 508.88, 3, 'Drainage of Uterus, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('061dff41-7906-49d0-8977-e70477ee4663', 'Soup Campbells Split Pea And Ham', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-08', false, 392.87, 3, 'Insertion of Radioactive Element into Vagina, Percutaneous Approach');
INSERT INTO public.product VALUES ('cffd4aaf-cf18-4fa0-a182-2110c90b0e05', 'Tomatoes', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-03', false, 344.25, 2, 'Revision of Drainage Device in Thoracic Vertebral Joint, External Approach');
INSERT INTO public.product VALUES ('aa3cd017-13eb-48c9-ac42-0759ec62b241', 'Beans - Yellow', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-13', true, 188.86, 3, 'Magnetic Resonance Imaging (MRI) of Right Elbow using Other Contrast, Unenhanced and Enhanced');
INSERT INTO public.product VALUES ('e555f89a-daf7-459f-b96c-d027c786354c', 'Beer - Moosehead', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-10', false, 283.87, 1, 'Restriction of Accessory Pancreatic Duct with Intraluminal Device, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('41740174-cf35-4e30-91da-40b59f48a210', 'Cheese - Mozzarella', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-13', false, 718.46, 3, 'Bypass Left Kidney Pelvis to Ileocutaneous with Nonautologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('0f89c92d-2fc2-4c96-a03d-b28ce893a5f7', 'Foam Espresso Cup Plain White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-10', false, 848.50, 1, 'Alteration of Right Upper Eyelid, Open Approach');
INSERT INTO public.product VALUES ('efa5109b-a2df-4ff2-84fa-3b037374d482', 'Wine - Zinfandel Rosenblum', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-08', true, 444.72, 3, 'Destruction of Right Metatarsal, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('fc626d45-5c7f-40ad-bcce-a37e5adf0208', 'Squid U5 - Thailand', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-19', true, 26.54, 3, 'Insertion of Cardiac Lead into Pericardium, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('55b911ed-38fb-4565-b3f9-302b8fdcfa19', 'Bread - Wheat Baguette', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-24', false, 653.97, 3, 'Destruction of Nasal Turbinate, Percutaneous Approach');
INSERT INTO public.product VALUES ('a412f251-4448-4c39-b803-d61db3f8f21a', 'Flower - Daisies', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-01', true, 704.61, 3, 'Supplement Left Lower Eyelid with Autologous Tissue Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('1d1b154a-2a7c-4f46-891b-6ea35bc5bc56', 'Salmon - Fillets', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-15', true, 408.97, 1, 'Release Middle Esophagus, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('54b4d6ce-2a25-4d4c-abd8-ff60e9d9829f', 'Pork Casing', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-25', true, 960.31, 2, 'Bypass Lower Esophagus to Cutaneous, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('087cc763-bb53-4fbc-92dc-4eaafe16d77a', 'Towels - Paper / Kraft', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-02', false, 815.42, 3, 'Restriction of Inferior Mesenteric Artery with Intraluminal Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('7869b5a5-dad0-43e0-a7f5-94a2062b1105', 'Butter - Unsalted', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-17', false, 394.88, 3, 'Plain Radiography of Left Humerus');
INSERT INTO public.product VALUES ('3cbf41f9-3df3-4af5-9a20-4f2c28ccf0f5', 'Salmon - Smoked, Sliced', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-24', true, 65.77, 2, 'Supplement Radial Nerve with Autologous Tissue Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('840ff981-de82-41a1-93cc-30968ed9951e', 'Cheese - Mix', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-31', true, 121.92, 2, 'Plain Radiography of Left Renal Vein using High Osmolar Contrast');
INSERT INTO public.product VALUES ('302993f6-22c8-4bcb-b25a-c0fee7dacb62', 'Salt - Sea', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-21', true, 973.07, 2, 'Resection of Left Upper Extremity Bursa and Ligament, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1e81bf97-64d7-4454-af94-7f040248ef63', 'Island Oasis - Sweet And Sour Mix', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-11', true, 901.21, 2, 'Restriction of Bladder Neck with Extraluminal Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('64dedea8-c904-4bb3-82a5-6d72ffb3180a', 'Sauce - Apple, Unsweetened', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-05', true, 154.46, 1, 'Manual Therapy Techniques Treatment of Musculoskeletal System - Whole Body');
INSERT INTO public.product VALUES ('94d2cbfd-abd3-4d91-8e34-549e7db52028', 'Wine - Riesling Dr. Pauly', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-23', false, 1.42, 1, 'Visual Motor Integration Treatment using Aerodynamic Function Equipment');
INSERT INTO public.product VALUES ('672eddc5-f34e-48f8-be66-861fc60fe71c', 'Corn Syrup', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-09', true, 634.93, 2, 'Respiratory System, Insertion');
INSERT INTO public.product VALUES ('e6f92c6f-2cc3-4c95-b8e2-282d1a0f6a78', 'Steampan - Half Size Shallow', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-17', false, 761.25, 2, 'Excision of Right Fallopian Tube, Via Natural or Artificial Opening Endoscopic, Diagnostic');
INSERT INTO public.product VALUES ('cfdeb3a4-d0ea-4de6-afa8-593de4329326', 'Parsley Italian - Fresh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-22', false, 822.49, 2, 'High Dose Rate (HDR) Brachytherapy of Duodenum using Iodine 125 (I-125)');
INSERT INTO public.product VALUES ('734eba15-7e9c-4797-a5c2-9bfbfebf7071', 'Chocolate - Dark', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-15', true, 548.95, 2, 'Destruction of Right Vertebral Vein, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e9ef988a-ba37-4fc2-8cba-dafb26ef5e47', 'Compound - Strawberry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-18', false, 923.43, 2, 'Supplement Heart with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('b4c76d4e-baf4-46db-b1bf-9465a6ce9345', 'Beer - Sleeman Fine Porter', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-20', true, 271.52, 3, 'Restriction of Pelvis Lymphatic with Intraluminal Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('9a2c2bc8-327a-4c8d-8fe5-61b76f646525', 'Lentils - Green, Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-20', false, 107.67, 1, 'Insertion of Infusion Device into Left Greater Saphenous Vein, Open Approach');
INSERT INTO public.product VALUES ('a5aa1385-7dab-47c9-bd2f-d8584717293e', 'Leeks - Baby, White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-07', true, 592.24, 2, 'Drainage of Left Lower Arm with Drainage Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('35695582-e776-420f-8ec0-e0c7a78bb012', 'Wine - Casillero Deldiablo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-17', true, 186.24, 1, 'Drainage of Small Intestine, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('834f9550-51a2-41a2-8bb3-0aa300d1d892', 'Water - Tonic', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-06', false, 131.35, 3, 'Male Reproductive System, Drainage');
INSERT INTO public.product VALUES ('2969c3cd-a9d1-41e9-9295-161c2f3b6d6a', 'Chips - Miss Vickies', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-06', false, 3.81, 3, 'Excision of Papillary Muscle, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('dd6e3178-8cca-47c4-b1b9-105c088aee38', 'Nori Sea Weed', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-22', false, 819.35, 1, 'Bypass Right Common Iliac Artery to Bilateral Femoral Arteries, Open Approach');
INSERT INTO public.product VALUES ('cc4545c0-c280-47f5-8bfd-ffd872b34c32', 'Venison - Liver', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-19', true, 966.54, 2, 'Bypass Thoracic Aorta, Ascending/Arch to Pulmonary Trunk with Autologous Arterial Tissue, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1d5d30dc-54bb-4565-b3a4-51d6bf4b41d8', 'Ecolab - Solid Fusion', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-17', false, 366.90, 1, 'Introduction of Other Gas into Spinal Canal, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('da432878-d1c7-4069-8064-4ca8a43f9c6c', 'Pernod', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-04', false, 294.43, 3, 'Dilation of Gastric Artery with Two Intraluminal Devices, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e973805d-0154-4241-ab13-fb2d4d67aed0', 'Bread - Multigrain', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-06', true, 775.46, 1, 'Excision of Parathyroid Gland, Open Approach');
INSERT INTO public.product VALUES ('63f783cf-60a9-4885-86a4-271a41149d8a', 'Crab Brie In Phyllo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-23', false, 761.84, 3, 'Removal of Spacer from Left Shoulder Joint, Open Approach');
INSERT INTO public.product VALUES ('5a22ea99-6c21-41b5-88dd-876fadcd4443', 'Sole - Iqf', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-16', false, 105.27, 1, 'Nonimaging Nuclear Medicine Assay of Lymphatic and Hematologic System using Other Radionuclide');
INSERT INTO public.product VALUES ('0c297bef-f6f1-44c4-b1ab-9e0be74853dd', 'Compound - Mocha', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-07', true, 807.37, 3, 'Introduction of Radioactive Substance into Products of Conception, Percutaneous Approach');
INSERT INTO public.product VALUES ('b2a80cc1-5abf-4db3-874f-8ad1d27c6a34', 'Crush - Grape, 355 Ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-16', false, 551.65, 1, 'Division of Left Ovary, Open Approach');
INSERT INTO public.product VALUES ('ec09efab-beae-488e-b759-7709ebe6df60', 'Napkin White - Starched', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-28', true, 4.64, 3, 'Destruction of Left Thumb Phalanx, Open Approach');
INSERT INTO public.product VALUES ('0da3f9f9-330e-4e5b-8d50-35988e0b3b25', 'Pepper - Green, Chili', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-19', true, 805.74, 3, 'Introduction of Anti-inflammatory into Peritoneal Cavity, Percutaneous Approach');
INSERT INTO public.product VALUES ('be9eecbb-ae5d-4845-939f-7686e4caf717', 'Shrimp - Prawn', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-25', false, 867.01, 1, 'Removal of Drainage Device from Right Toe Phalangeal Joint, Percutaneous Approach');
INSERT INTO public.product VALUES ('b8bae7fb-bcd5-4cbc-9d6d-f77cf2d4d7e4', 'Garbage Bags - Clear', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-19', false, 695.58, 2, 'Supplement Duodenum with Synthetic Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e03365d3-d48c-4dfb-9175-55b34ec86736', 'Bagel - Everything', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-24', true, 111.66, 2, 'Drainage of Right Anterior Tibial Artery, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('a3085dc9-74c0-4e0f-bd11-ea2b2971a42f', 'Bouq All Italian - Primerba', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-29', false, 918.56, 1, 'Supplement Left Femoral Artery with Autologous Tissue Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('818b0bf9-b35b-4cbe-b77f-f314c03dbaf4', 'Couscous', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-03', true, 497.60, 3, 'Revision of Zooplastic Tissue in Mitral Valve, Open Approach');
INSERT INTO public.product VALUES ('7c83fd96-34c0-480c-a737-9654a2abad6b', 'Garlic Powder', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-08', true, 168.95, 1, 'Repair Right Thyroid Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('d22cc5f9-3177-422a-b9d2-045643e47921', 'Stock - Veal, Brown', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-01', true, 830.39, 2, 'Bypass Abdominal Aorta to Left Internal Iliac Artery with Synthetic Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('c4b440b0-00e5-4b4c-b4ba-bc5cd95184c8', 'Propel Sport Drink', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-01', false, 33.65, 3, 'Creation of Tricuspid Valve from Common Atrioventricular Valve using Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('0419cf69-1fdd-4e8e-8125-d78bd58cfae0', 'Chicken - Ground', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-29', true, 57.48, 1, 'Replacement of Right Internal Iliac Artery with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('9a6bc916-ab1f-4e52-a79e-a0f51f2b1435', 'Cheese - Brick With Onion', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-30', false, 22.99, 2, 'Replacement of Left Humeral Head with Autologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('959a8b65-35be-4382-a79e-9c63e7a4a99a', 'Plums - Red', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-31', true, 970.35, 2, 'Occlusion of Right Middle Lobe Bronchus with Intraluminal Device, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('9ec4e77b-599d-4ad3-bb2b-8b48c2f58f39', 'Bouillion - Fish', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-19', false, 635.76, 1, 'Planar Nuclear Medicine Imaging of Thyroid Gland using Iodine 131 (I-131)');
INSERT INTO public.product VALUES ('77918ad7-4457-4b59-8ee8-d4aabb705b57', 'Bread - Crusty Italian Poly', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-28', false, 169.96, 2, 'Excision of Left Upper Leg Tendon, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('ecd26de9-0f13-43d9-806a-7bb7d6f58802', 'Pepper - Chipotle, Canned', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-11', false, 369.00, 1, 'Drainage of Left Colic Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('f90cdbc8-866b-43fc-a910-e1e59bb2cfb2', 'Cheese Cloth No 60', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-05', true, 992.23, 3, 'Insertion of Infusion Device into Right Temporal Artery, Open Approach');
INSERT INTO public.product VALUES ('2a5d6e2e-9b06-4740-b57a-cfc45effb7c7', 'Beef - Short Loin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-06', true, 427.71, 3, 'Supplement Right Vertebral Vein with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('9aa7e09e-8426-4523-89f2-2b26da3bf54f', 'Cup - Paper 10oz 92959', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-22', false, 983.42, 2, 'Excision of Upper Vein, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('60449bcc-bedc-481a-814f-e45cd7dff754', 'Chicken - Base', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-12', true, 691.85, 1, 'Occlusion of Right Large Intestine, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('3ea443ff-4a2b-4ead-b807-0398bbc53478', 'Beer - Heinekin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-15', false, 86.67, 3, 'Excision of Lower Esophagus, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('548cf10c-d627-4f6a-ad02-553ef2b631b0', 'Napkin - Beverge, White 2 - Ply', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-10', true, 458.99, 2, 'Revision of Drainage Device in Right Finger Phalangeal Joint, External Approach');
INSERT INTO public.product VALUES ('01894261-3cf4-4ec5-8238-fc8135632a7b', 'Cheese - Cheddar, Old White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-20', false, 999.88, 3, 'Reposition Bilateral Testes, Percutaneous Approach');
INSERT INTO public.product VALUES ('dc55a9b9-9424-4d20-8f6a-aa1ae0597916', 'Chocolate - Pistoles, White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-17', false, 541.94, 2, 'Insertion of Internal Fixation Device into Left Acromioclavicular Joint, Open Approach');
INSERT INTO public.product VALUES ('ea59f6df-600d-4831-ac34-958221846700', 'Cheese Cloth', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-23', false, 28.64, 2, 'Plain Radiography of Left Heart using High Osmolar Contrast');
INSERT INTO public.product VALUES ('ccc980cf-1363-4c65-bdb9-1781dd4b987a', 'Squid - Tubes / Tenticles 10/20', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-03', true, 848.91, 1, 'Destruction of Sacral Plexus, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('38eb4977-6531-467f-906f-1dd1b2723c99', 'Beer - Guiness', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-01', true, 360.35, 2, 'Excision of Small Intestine, Percutaneous Approach');
INSERT INTO public.product VALUES ('64dbbe05-045c-4769-80d2-668755b71fc2', 'Chicken - Whole Roasting', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-22', true, 190.68, 3, 'Transfusion of Autologous Whole Blood into Central Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('2e1c3187-d9a1-427c-8aa6-9dd546521473', 'Lid Tray - 16in Dome', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-04', true, 880.52, 3, 'Bypass Splenic Artery to Bilateral Renal Artery with Autologous Venous Tissue, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('b50afe28-9f1c-438c-a96d-a39af5246d8a', 'Hold Up Tool Storage Rack', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-11', false, 908.26, 3, 'Supplement Left Femoral Shaft with Autologous Tissue Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('ae1dd4bc-7bbb-4c0b-ab24-d2f2715d6930', 'Appetizer - Mushroom Tart', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-20', true, 544.96, 2, 'Osteopathic Treatment of Cervical Region using Articulatory-Raising Forces');
INSERT INTO public.product VALUES ('3cabaa7e-c63f-4ff8-9443-e095eb5e5620', 'Syrup - Golden, Lyles', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-15', true, 280.71, 2, 'Low Dose Rate (LDR) Brachytherapy of Tongue using Palladium 103 (Pd-103)');
INSERT INTO public.product VALUES ('e8eab984-ee6a-435a-a149-55a3801ddb79', 'Shrimp - Baby, Cold Water', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-22', false, 151.98, 2, 'Plain Radiography of Superior Vena Cava using Low Osmolar Contrast');
INSERT INTO public.product VALUES ('e4bc49be-61c9-45bc-a698-01aad7717d3d', 'Chicken - Ground', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-28', false, 426.22, 2, 'Reposition Left Ankle Joint with External Fixation Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('0dd41952-6b5a-4649-ad28-e1ac6a414bc9', 'Quail - Eggs, Fresh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-29', true, 979.47, 2, 'Drainage of Left Lower Leg with Drainage Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('3a22b3d8-9898-48ff-b0ea-a6940ee91a77', 'Pasta - Penne Primavera, Single', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-12', false, 704.90, 2, 'Bypass Cerebral Ventricle to Bone Marrow with Synthetic Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('30dac351-eb37-4a5c-b9d5-864900995b95', 'Energy Drink', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-11', true, 348.59, 3, 'Occlusion of Ileocecal Valve with Extraluminal Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('9b5f89e1-12cd-4b51-a7d6-8504771c1ab9', 'Tea - Green', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-27', false, 200.36, 1, 'Drainage of Transverse Colon, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('88f92b84-c1d4-4f03-9702-fd914d375087', 'Bread - Wheat Baguette', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-13', false, 815.04, 3, 'Bypass Bilateral Ureters to Ileum, Open Approach');
INSERT INTO public.product VALUES ('4e027b58-da72-42f8-9cc7-ac015d752c25', 'Cheese - Mozzarella, Shredded', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-26', true, 54.23, 2, 'Stereotactic Particulate Radiosurgery of Abdomen');
INSERT INTO public.product VALUES ('5cf69e0f-e85c-4578-b281-a506848c960b', 'Lotus Leaves', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-12', false, 316.11, 1, 'Supplement Thoracolumbar Vertebral Disc with Synthetic Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('0a55439e-0ada-4c62-8f30-563cf8fff0b8', 'Mix - Cocktail Ice Cream', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-15', false, 949.25, 2, 'Fragmentation in Carina, External Approach');
INSERT INTO public.product VALUES ('9999692c-4050-4888-8116-1d8af7dce1f8', 'Mousse - Passion Fruit', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-19', false, 549.79, 3, 'Drainage of Right Hand Tendon with Drainage Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('cc0bab98-4964-4329-b28a-ad4f5fd8671c', 'Wine - Sake', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-13', false, 487.05, 1, 'Bypass Cecum to Descending Colon, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('f0c80fa0-1378-4a7c-b77d-e4febfeedccc', 'Spinach - Baby', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-22', true, 961.43, 3, 'Plain Radiography of Superior Vena Cava using High Osmolar Contrast');
INSERT INTO public.product VALUES ('0223c809-881d-442c-8b05-5d547821a5ab', 'Lettuce - Baby Salad Greens', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-02-03', false, 613.33, 2, 'Insertion of Monitoring Device into Urethra, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('ee04a6db-10ba-4ced-b856-7399c988a3d7', 'Chevere Logs', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-23', true, 961.55, 1, 'Bypass Right Femoral Artery to Left Femoral Artery with Synthetic Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('65b99bb9-8b07-4bab-8f0d-8ab1cb9a2016', 'Yeast - Fresh, Fleischman', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-28', false, 431.92, 1, 'Replacement of Left Kidney Pelvis with Nonautologous Tissue Substitute, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('c698d8f3-8f18-491f-b132-a56b571b5d73', 'Sping Loaded Cup Dispenser', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-14', true, 789.64, 1, 'Repair Right Hand, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('00269622-3f2a-4234-984a-20cf1e8af365', 'Sausage - Andouille', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-11', true, 939.95, 1, 'Individual Counseling for Substance Abuse Treatment, Cognitive');
INSERT INTO public.product VALUES ('dc0cacd4-096e-45f9-bfb0-d8213a22004b', 'Beef - Sushi Flat Iron Steak', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-19', false, 77.19, 3, 'Destruction of Right Tympanic Membrane, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('e8fcd257-9c36-4adb-8025-b22049a94534', 'Steam Pan Full Lid', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-02', true, 514.44, 3, 'Plain Radiography of Left Upper Extremity Arteries using Low Osmolar Contrast');
INSERT INTO public.product VALUES ('64e0106b-0309-4f66-9bab-7e55f1337b9e', 'Tea - Decaf 1 Cup', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-08', true, 313.08, 3, 'Supplement Atrial Septum with Zooplastic Tissue, Open Approach');
INSERT INTO public.product VALUES ('47e01c44-0b3b-465c-b7f2-f141f5ce7637', 'Tart Shells - Sweet, 2', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-17', false, 749.36, 1, 'Excision of Tricuspid Valve, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('bd7275ff-9d53-4edc-a386-dcbfe6faed1f', 'Spice - Paprika', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-06', false, 193.25, 3, 'Revision of Drainage Device in Liver, External Approach');
INSERT INTO public.product VALUES ('8868b0d8-ff90-4181-84a0-9c837f13d8ad', 'Cheese - Mozzarella', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-04', true, 899.00, 2, 'Repair Coccyx, Percutaneous Approach');
INSERT INTO public.product VALUES ('ba407884-1893-4fd7-9191-007ea9fe086c', 'Onions - Cippolini', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-28', true, 663.45, 3, 'Bypass Bladder to Colocutaneous with Autologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1bd3671d-97a4-4b43-a86e-3fb86e558141', 'Beef - Cow Feet Split', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-26', true, 869.13, 3, 'Fusion of 8 or more Thoracic Vertebral Joints with Interbody Fusion Device, Posterior Approach, Posterior Column, Percutaneous Approach');
INSERT INTO public.product VALUES ('4336fb68-3079-43d3-91a6-c9d44b1ee07a', 'Wine - Riesling Alsace Ac 2001', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-06', true, 998.82, 2, 'Bypass Ascending Colon to Ascending Colon, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e6047857-0325-4339-9960-3f02dda05d81', 'Eggroll', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-14', false, 399.87, 1, 'Fusion of 2 or more Lumbar Vertebral Joints, Posterior Approach, Posterior Column, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('454ce34e-29b9-437a-8459-2201631ebee1', 'Juice - Orange, Concentrate', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-14', true, 783.68, 2, 'Bypass Superior Vena Cava to Pulmonary Trunk with Autologous Venous Tissue, Open Approach');
INSERT INTO public.product VALUES ('0561fa2d-e56f-4678-a05f-e1e7ddf70790', 'Lettuce - Frisee', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-28', false, 853.77, 2, 'Muscle Performance Treatment of Musculoskeletal System - Head and Neck using Orthosis');
INSERT INTO public.product VALUES ('e7b5cf36-1564-40fb-b5e4-8e4906d8d877', 'Beef - Rib Roast, Capless', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-26', false, 230.51, 1, 'Dilation of Left Popliteal Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('567c7678-db4c-4d85-916d-c323b6f34c1d', 'Capers - Pickled', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-28', true, 598.07, 1, 'Transfer Left Lower Leg Muscle with Skin, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1256fe4e-ee25-48af-8824-817bbcb517f9', 'Vinegar - Red Wine', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-15', true, 698.20, 3, 'Removal of Synthetic Substitute from Nose, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('208be9a4-875d-461a-8846-4a5dc8635214', 'Vaccum Bag - 14x20', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-15', false, 394.76, 3, 'Excision of Penis, Open Approach');
INSERT INTO public.product VALUES ('c67c4952-b443-477a-8f72-910194e9f768', 'Bread - Roll, Whole Wheat', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-14', true, 645.12, 2, 'Removal of Internal Fixation Device from Left Wrist Joint, Percutaneous Approach');
INSERT INTO public.product VALUES ('ab06e292-e7d0-4e26-b4e9-61473eca6548', 'Jicama', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-09', false, 470.02, 1, 'Destruction of Left Large Intestine, Open Approach');
INSERT INTO public.product VALUES ('8fb08160-5211-4559-a21a-d1db560b498d', 'Oil - Shortening - All - Purpose', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-26', true, 377.27, 2, 'Replacement of Left Hand Tendon with Nonautologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('96013f61-1b46-4669-864e-8d6031ef4f88', 'Bread - Onion Focaccia', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-20', true, 651.90, 1, 'Replacement of Left Femoral Shaft with Autologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('7fb389a0-1cd9-4029-887f-f6ed66d3c082', 'Flour - All Purpose', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-27', true, 498.03, 3, 'Revision of Autologous Tissue Substitute in Head, External Approach');
INSERT INTO public.product VALUES ('d174f793-8d19-4de7-8488-38ae5af678f7', 'Beef - Kindney, Whole', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-11', false, 335.80, 1, 'Destruction of Lung Lingula, Open Approach');
INSERT INTO public.product VALUES ('ef3fd020-1b5b-411d-9fd0-a3bdbee9d393', 'Wine - White, Schroder And Schyl', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-12', true, 497.19, 1, 'Release Right Ethmoid Sinus, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('9e53e255-834d-4011-b9cd-d326c967733c', 'Cakes Assorted', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-15', false, 530.84, 2, 'Bypass Cecum to Cecum with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('0eb0dd6e-abb8-4d9f-ae9b-88a58fc8c29d', 'Skirt - 29 Foot', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-24', true, 953.73, 1, 'Temporal Ordering of Stimuli Assessment using Audiometer');
INSERT INTO public.product VALUES ('c68c7287-eccb-47d5-b8e3-917d8a0a7c0f', 'Rosemary - Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-08', false, 528.54, 2, 'Planar Nuclear Medicine Imaging of Chest and Neck using Thallium 201 (Tl-201)');
INSERT INTO public.product VALUES ('e8c128d6-b5f9-48ee-9d6f-d98c2372c5ef', 'Cheese - Parmesan Grated', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-09', false, 770.48, 3, 'Plain Radiography of Dialysis Shunt/Fistula using Other Contrast');
INSERT INTO public.product VALUES ('b17e2661-237e-41ca-87ae-ee3856fb658f', 'Bread - Pain Au Liat X12', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-21', true, 311.62, 1, 'Drainage of Thoracic Nerve with Drainage Device, Open Approach');
INSERT INTO public.product VALUES ('495097f5-4c9f-42af-a41c-0bcb5ab54bff', 'Lettuce - Escarole', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-26', true, 403.33, 2, 'Removal of Drainage Device from Left Toe Phalangeal Joint, Open Approach');
INSERT INTO public.product VALUES ('e86c62e6-10d7-41a7-a203-6ce5b832de3a', 'Lettuce - Red Leaf', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-08', false, 88.43, 1, 'Replacement of Uvula with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('568697e8-406e-4d03-8676-44623e14ee48', 'Canada Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-02-04', false, 767.62, 3, 'Insertion of Infusion Device into Left Common Carotid Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('8a84cc89-de7b-46c2-aff3-2c0785c40772', 'Wine - Montecillo Rioja Crianza', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-11', true, 214.61, 3, 'Supplement Right Humeral Head with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('50466708-dc9c-490e-ba2b-fc99f6a7663a', 'Compound - Rum', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-18', true, 633.02, 3, 'Dilation of Right Popliteal Artery with Three Drug-eluting Intraluminal Devices, Percutaneous Approach');
INSERT INTO public.product VALUES ('a87c2e26-4474-4ba7-b221-1c8a71b90452', 'Coke - Diet, 355 Ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-13', false, 300.75, 1, 'Replacement of Left Hand Skin with Nonautologous Tissue Substitute, Partial Thickness, External Approach');
INSERT INTO public.product VALUES ('c096861d-ac58-432c-84d4-d9ad9a474eb8', 'Tamarind Paste', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-09', false, 682.96, 1, 'Revision of Drainage Device in Right Wrist Joint, External Approach');
INSERT INTO public.product VALUES ('2d869f6a-57f3-4448-9a33-325e0e615c4c', 'Wine - Acient Coast Caberne', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-10', true, 369.47, 1, 'Fragmentation in Pelvic Cavity, Open Approach');
INSERT INTO public.product VALUES ('236ce02c-3df3-4f00-a526-910a484b289c', 'Wine - Two Oceans Cabernet', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-27', false, 276.39, 2, 'Dilation of Lower Artery with Two Intraluminal Devices, Open Approach');
INSERT INTO public.product VALUES ('b2e92c08-4d6e-4b6c-bccb-68d9d58402ff', 'Veal - Leg, Provimi - 50 Lb Max', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-08', false, 62.44, 1, 'Drainage of Right Pleural Cavity, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('67f0b5fa-694b-46c4-8c99-5b98b3a54f5d', 'Pasta - Fettuccine, Egg, Fresh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-28', false, 209.55, 3, 'Reposition Right Scapula, External Approach');
INSERT INTO public.product VALUES ('d31dce3e-db0d-4dfb-9a5a-d6f4598a38af', 'Water - Green Tea Refresher', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-13', false, 528.71, 3, 'Computerized Tomography (CT Scan) of Bilateral Internal Carotid Arteries using Intravascular Optical Coherence');
INSERT INTO public.product VALUES ('e86fe8f7-2c57-4ef2-8a60-35f60a1a23db', 'Chervil - Fresh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-03', true, 317.16, 1, 'Supplement Right Metatarsal-Tarsal Joint with Nonautologous Tissue Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('0ceb7c57-e842-44a1-b9ab-f637040a0b41', 'Daikon Radish', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-26', false, 888.05, 3, 'Excision of Left Kidney Pelvis, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('008a3b16-f2ce-431c-ab82-ea4104bf13d3', 'Vinegar - White Wine', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-02', true, 253.37, 3, 'Removal of Nonautologous Tissue Substitute from Left Upper Extremity, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('a511860c-22ad-4231-b92f-6d000b0eff27', 'Vaccum Bag 10x13', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-01', false, 533.25, 1, 'Therapeutic Exercise Treatment of Circulatory System - Whole Body using Other Equipment');
INSERT INTO public.product VALUES ('f5d94af5-a68e-47d1-ae38-78fb2e32f40a', 'Wine - Magnotta - Pinot Gris Sr', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-10', false, 95.89, 3, 'Excision of Inferior Mesenteric Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('a069fbca-b1b5-437c-8741-36e780d53b3e', 'Ham - Smoked, Bone - In', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-14', false, 205.17, 1, 'Revision of Intraluminal Device in Lymphatic, External Approach');
INSERT INTO public.product VALUES ('b0f29241-ec28-423a-b11a-5d8dabb475d9', 'Wine - Tio Pepe Sherry Fino', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-06', false, 7.10, 1, 'Insertion of Monoplanar External Fixation Device into Left Humeral Head, Open Approach');
INSERT INTO public.product VALUES ('9a462b34-6f31-439c-ad12-2be54ea2c16b', 'Spoon - Soup, Plastic', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-15', true, 292.01, 2, 'Drainage of Upper Back, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('0ee965a6-6d4d-47dc-a56c-dfdeead537cf', 'Truffle Cups - Red', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-02', false, 11.26, 2, 'Excision of Left Kidney, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('f090d925-e409-444e-9ef2-b3d042c96fd9', 'Ham - Cooked', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-02', true, 461.04, 1, 'Plain Radiography of Right Parotid Gland using High Osmolar Contrast');
INSERT INTO public.product VALUES ('366aaf22-d4cc-47fc-aa66-e3405053fd58', 'Pasta - Fusili, Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-25', true, 708.87, 3, 'Insertion of Intraluminal Device into Superior Mesenteric Vein, Open Approach');
INSERT INTO public.product VALUES ('7924b36a-29ab-4eca-9feb-a8c77b03f3ea', 'Juice - Apple 284ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-17', true, 342.25, 1, 'Repair Thalamus, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('cbbeaace-d969-4e09-ab3b-36e3f18cd17d', 'Artichokes - Knobless, White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-23', true, 276.08, 2, 'Static Orthosis Device Fitting');
INSERT INTO public.product VALUES ('364b95dc-65c8-4ed2-b62f-307616a35c24', 'Russian Prince', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-21', true, 876.08, 3, 'Insertion of Infusion Device into Thoracic Aorta, Ascending/Arch, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('50a862f3-813c-4e6a-b520-73fc4a73dc6e', 'Grapes - Red', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-25', true, 9.32, 3, 'Excision of Left Ventricle, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('1fd7709b-8429-4f19-9b7a-9ae14aa26512', 'Wine - Blue Nun Qualitatswein', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-05', false, 535.64, 3, 'Occlusion of Right Common Carotid Artery with Bioactive Intraluminal Device, Open Approach');
INSERT INTO public.product VALUES ('4915b759-0845-4128-a28e-b959e14b9137', 'Arrowroot', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-29', false, 253.81, 2, 'Release Scalp Subcutaneous Tissue and Fascia, External Approach');
INSERT INTO public.product VALUES ('d1786c0b-785a-4d5d-9a15-39a899b44c7e', 'Shrimp - Black Tiger 16/20', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-13', false, 395.86, 2, 'Fragmentation in Pancreatic Duct, Percutaneous Approach');
INSERT INTO public.product VALUES ('00a6c40c-f635-46b6-b26c-86faa0cc1ada', 'Tomatoes - Vine Ripe, Red', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-06', true, 979.79, 1, 'Removal of External Fixation Device from Right Knee Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('bb1dd782-be2e-4256-ba42-b502a89d0455', 'Wine - Ej Gallo Sierra Valley', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-01', true, 491.81, 3, 'Release Left Maxillary Sinus, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('bd2acc02-8dd6-4253-814b-0807709f68b7', 'Nantucket - Carrot Orange', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-06', false, 638.25, 1, 'Repair Left Hip Muscle, Open Approach');
INSERT INTO public.product VALUES ('79618337-0c3b-41f1-8659-c6c5dfe8a701', 'Bonito Flakes - Toku Katsuo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-06', true, 265.74, 1, 'Insertion of Infusion Device into Left Axillary Vein, Percutaneous Approach');
INSERT INTO public.product VALUES ('70b51b90-a20b-40d3-b2ff-8d9f4c584411', 'Fork - Plastic', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-18', true, 832.63, 2, 'Nuclear Medicine, Skin, Subcutaneous Tissue and Breast, Planar Nuclear Medicine Imaging');
INSERT INTO public.product VALUES ('2b91f6a9-3858-4587-a877-62a5aaa8a19e', 'Juice - Ocean Spray Kiwi', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-13', true, 544.58, 2, 'Extirpation of Matter from Right Eye, External Approach');
INSERT INTO public.product VALUES ('4e5e838d-9e8f-49ce-8bb9-80af5de2b207', 'Wheat - Soft Kernal Of Wheat', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-12', false, 791.27, 1, 'Removal of Other Device from Mediastinum, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('bad1aa93-dc9c-4a4e-a402-0a6ca8409db4', 'Pork - Shoulder', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-18', true, 853.12, 3, 'Drainage of Pericardial Cavity, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('dcd74287-6b5b-4172-8bfa-0a83e48a8fe0', 'Orange - Canned, Mandarin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-01', true, 808.57, 2, 'Insertion of Infusion Device into Right Temporal Artery, Open Approach');
INSERT INTO public.product VALUES ('b704cb8c-5bf1-4a52-bc4d-a9c966c9c221', 'Cookies Oatmeal Raisin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-06', true, 880.38, 1, 'Insertion of Monitoring Device into Small Intestine, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('f4a006d5-9ed0-4191-8bab-2776eb69fef9', 'Chevere Logs', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-26', false, 78.03, 3, 'Drainage of Lumbar Vertebral Joint, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('7c02d956-e393-465a-9269-687822aaf2da', 'Soup - Verve - Chipotle Chicken', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-04', false, 560.22, 1, 'Restriction of Left Main Bronchus with Extraluminal Device, Open Approach');
INSERT INTO public.product VALUES ('d790118e-5aca-4e0e-a0e0-9c9c1206bb75', 'Chicken - Whole Roasting', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-24', true, 804.97, 3, 'Release Upper Tooth, Single, Open Approach');
INSERT INTO public.product VALUES ('5b8d9823-a3bd-4f65-8d7e-ab1aec3e186b', 'Glaze - Apricot', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-30', true, 27.27, 1, 'Excision of Head and Neck Sympathetic Nerve, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('7f56d957-127a-483d-9dba-13c1140fb5fd', 'Milk 2% 500 Ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-30', true, 461.26, 1, 'Drainage of Common Bile Duct, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('146c29e6-3bbd-4a60-9a09-a08a8ab439a6', 'Loquat', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-02', true, 195.16, 3, 'Insertion of Internal Fixation Device into Right Toe Phalangeal Joint, Open Approach');
INSERT INTO public.product VALUES ('567adcb0-f066-4432-a75e-4d677332c76d', 'Pepper - Pablano', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-28', false, 964.27, 3, 'Repair Buccal Mucosa, Percutaneous Approach');
INSERT INTO public.product VALUES ('16b8ed41-73ed-4185-98ad-09f6bad5bb11', 'Syrup - Kahlua Chocolate', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-14', true, 176.44, 1, 'Revision of Drainage Device in Right Tarsal Joint, External Approach');
INSERT INTO public.product VALUES ('c20c7458-75bf-4967-b107-fd14c214b6c3', 'Ostrich - Fan Fillet', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-11', true, 836.44, 1, 'Repair Left Internal Carotid Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('edd22923-ce75-4f91-b546-d5890ddb546c', 'Bok Choy - Baby', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-11', true, 7.41, 2, 'Removal of Autologous Tissue Substitute from Stomach, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('8b376b14-4d0c-406a-9fd1-176d0e0a0d9c', 'Rosemary - Fresh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-04', true, 705.76, 2, 'Replacement of Left Lens with Intraocular Telescope, Percutaneous Approach');
INSERT INTO public.product VALUES ('f2cdf99f-91ab-4741-923f-00070a88fffb', 'Cumin - Ground', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-19', true, 919.05, 2, 'Revision of Nonautologous Tissue Substitute in Right Carpal, Percutaneous Approach');
INSERT INTO public.product VALUES ('bfb52591-b665-4b77-89b1-322d919d6232', 'Curry Powder', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-27', false, 999.31, 2, 'Drainage of Left Zygomatic Bone with Drainage Device, Open Approach');
INSERT INTO public.product VALUES ('c463a84f-4476-41b6-b8eb-b9969a651b30', 'Pasta - Rotini, Colour, Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-12', true, 122.76, 3, 'Drainage of Left Eye, External Approach');
INSERT INTO public.product VALUES ('298c1dbe-2516-44dc-8cf3-c44a95f259c1', 'Muffin Mix - Blueberry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-05', false, 214.37, 1, 'Drainage of Cervical Vertebral Joint, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('160cba1c-5d1d-49a6-b2b3-81a2f431882e', 'Boogies', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-16', true, 627.45, 3, 'Drainage of Right Mandible, Percutaneous Endoscopic Approach, Diagnostic');
INSERT INTO public.product VALUES ('c6751c44-505f-49d6-8feb-bb4a231fd5cb', 'Cocoa Powder - Natural', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-22', false, 875.62, 2, 'Removal of Extraluminal Device from Great Vessel, Percutaneous Approach');
INSERT INTO public.product VALUES ('879c8b83-cae9-4c24-b2a8-c1d41e7dfd56', 'Duck - Breast', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-09', true, 675.00, 2, 'Revision of Contraceptive Device in Upper Extremity Subcutaneous Tissue and Fascia, Open Approach');
INSERT INTO public.product VALUES ('2a4e2d51-273a-40e9-aa26-0997fc37b39b', 'Sugar - White Packet', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-16', false, 722.54, 2, 'Removal of Nonautologous Tissue Substitute from Right Breast, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('a9dced03-afbb-4d36-849b-0dead0cbc617', 'Schnappes Peppermint - Walker', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-17', false, 190.19, 2, 'Reattachment of Left Knee Tendon, Open Approach');
INSERT INTO public.product VALUES ('9b2800be-7667-4a37-83cd-53df53bcfdbd', 'Radish - Black, Winter, Organic', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-13', false, 650.93, 3, 'Restriction of Splenic Vein, Open Approach');
INSERT INTO public.product VALUES ('bbbd8152-c638-4f43-aab2-287fa209b603', 'Bread - Raisin Walnut Pull', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-12', true, 815.51, 3, 'Excision of Thoracolumbar Vertebral Joint, Percutaneous Approach');
INSERT INTO public.product VALUES ('2ceae66f-e378-4f2a-9f38-3adcfe9cac01', 'Red Currants', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-18', false, 388.81, 2, 'Dilation of Left Femoral Artery with Intraluminal Device, using Drug-Coated Balloon, Open Approach');
INSERT INTO public.product VALUES ('df661f07-a4fe-4075-9a0c-064b4f904b33', 'Oven Mitts - 15 Inch', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-26', false, 256.74, 2, 'Extirpation of Matter from Left Neck Lymphatic, Open Approach');
INSERT INTO public.product VALUES ('bcd300a8-4f8b-452b-b9c3-bc67b565c3ce', 'Tea - Herbal - 6 Asst', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-31', true, 11.85, 3, 'Removal of Infusion Device from Left Acromioclavicular Joint, Open Approach');
INSERT INTO public.product VALUES ('ea367691-85b3-493f-99c8-7e3aaf23cdbe', 'Wine - Puligny Montrachet A.', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-16', false, 689.04, 1, 'Extirpation of Matter from Upper Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('2c65949d-9cf3-4b4e-a05b-251231f2bc17', 'Wine - Rhine Riesling Wolf Blass', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-28', false, 746.79, 1, 'Insertion of Infusion Device into Right Femoral Vein, Percutaneous Approach');
INSERT INTO public.product VALUES ('7c612f16-a49f-4a82-b4bd-7b52176ac9f5', 'Flavouring - Raspberry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-02', true, 878.37, 3, 'Removal of Internal Fixation Device from Right Metacarpal, Percutaneous Approach');
INSERT INTO public.product VALUES ('9c47f9cf-9bef-4ae3-a2bd-cf419424db33', 'Wine - Fontanafredda Barolo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-16', true, 322.73, 1, 'Supplement Skull with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('a2dd408e-0fff-4fbb-a9d9-66a11ac323de', 'Grapes - Red', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-05', true, 976.06, 3, 'Destruction of Right Thumb Phalanx, Percutaneous Approach');
INSERT INTO public.product VALUES ('0337a6d7-692a-46de-8eab-dc0798fce958', 'Barley - Pearl', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-05', true, 426.68, 2, 'Ear, Nose, Sinus, Drainage');
INSERT INTO public.product VALUES ('7cd2b2d1-c674-4510-ab94-5c73a573ab03', 'Lentils - Red, Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-27', true, 928.00, 1, 'Revision of Nonautologous Tissue Substitute in Thoracolumbar Vertebral Disc, Open Approach');
INSERT INTO public.product VALUES ('2abbc491-d97c-4a37-a62b-de567a51d709', 'Mince Meat - Filling', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-21', false, 827.09, 2, 'Excision of Right Fibula, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('6968e711-8013-4bd4-bba0-f7c67c62ca24', 'Ecolab - Balanced Fusion', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-21', false, 184.74, 1, 'Replacement of Chest Subcutaneous Tissue and Fascia with Synthetic Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('7c3fcd52-abac-4218-8328-11a50261a4a6', 'Muffin Mix - Raisin Bran', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-16', true, 934.64, 2, 'High Dose Rate (HDR) Brachytherapy of Kidney using Iridium 192 (Ir-192)');
INSERT INTO public.product VALUES ('fccf3dc2-d2cc-4366-8774-6479236a6839', 'Energy Drink - Franks Pineapple', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-25', true, 526.14, 1, 'Computerized Tomography (CT Scan) of Inferior Vena Cava using Low Osmolar Contrast');
INSERT INTO public.product VALUES ('8cfc4142-7f32-4a8b-9bb8-75f6b2d84011', 'Ice Cream Bar - Rolo Cone', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-09', false, 104.91, 2, 'Introduction of Anti-inflammatory into Biliary and Pancreatic Tract, Percutaneous Approach');
INSERT INTO public.product VALUES ('5def6d90-95b3-4a3b-8aa7-46226da5cfcf', 'Yogurt - Raspberry, 175 Gr', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-16', false, 529.21, 1, 'Fusion of 2 to 7 Thoracic Vertebral Joints with Synthetic Substitute, Posterior Approach, Anterior Column, Percutaneous Approach');
INSERT INTO public.product VALUES ('c0520548-8e0a-43ab-9b1c-a63b7989fa6e', 'Bread - Raisin Walnut Oval', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-24', true, 521.45, 3, 'Excision of Left Tympanic Membrane, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('0c73b30f-9729-4288-803b-7ff44e807133', 'Muffin Mix - Morning Glory', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-13', false, 411.04, 1, 'Resection of Left Thorax Bursa and Ligament, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('5161dd58-6d55-4953-952d-9712bd956c5e', 'Cheese - Asiago', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-17', true, 122.87, 1, 'Excision of Upper Jaw, External Approach, Diagnostic');
INSERT INTO public.product VALUES ('40f73057-e5eb-4660-984c-f0c4a761acb5', 'Wheat - Soft Kernal Of Wheat', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-30', true, 816.91, 1, 'Revision of Intraluminal Device in Uterus and Cervix, External Approach');
INSERT INTO public.product VALUES ('057fa4e4-8677-467e-9b6b-2dc6f2b57172', 'Lentils - Green, Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-22', true, 559.35, 3, 'Replacement of Left Toe Phalanx with Synthetic Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('86018319-1ecf-456e-ac63-ca3d92f94869', 'Cabbage - Green', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-09', false, 659.92, 2, 'Bypass Transverse Colon to Sigmoid Colon with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('d4097523-d008-4490-afb3-6cd90be25417', 'Canadian Emmenthal', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-22', false, 865.62, 3, 'Removal of Stimulator Lead from Ureter, External Approach');
INSERT INTO public.product VALUES ('ec3aef20-2e41-46b9-a365-7c9ad97ed06b', 'Wine - Soave Folonari', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-17', true, 799.19, 1, 'Restriction of Left Innominate Vein with Intraluminal Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('10a4fb30-4e8a-4aa4-b391-781add0964f1', 'Curry Powder Madras', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-05', false, 432.84, 3, 'Removal of Nonautologous Tissue Substitute from Left Toe Phalangeal Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('610c6b7d-fe7e-4aeb-b489-7c0c431d33c6', 'Miso - Soy Bean Paste', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-07', true, 509.93, 2, 'Revision of Nonautologous Tissue Substitute in Left Metacarpal, External Approach');
INSERT INTO public.product VALUES ('cebc0b55-dc72-4536-bf71-ae2f27f499d4', 'Onion Powder', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-08', false, 56.80, 2, 'Excision of Right Zygomatic Bone, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('814b1e5e-b891-476f-8020-c070850c3ca8', 'Wine - Sauvignon Blanc', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-11', true, 322.76, 1, 'Occlusion of Trachea with Intraluminal Device, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('5309453c-151f-46c4-8026-99ae2bd89978', 'Chickhen - Chicken Phyllo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-10', false, 970.47, 3, 'Insertion of Infusion Device into Left Lower Leg, Open Approach');
INSERT INTO public.product VALUES ('02f1207c-ef8f-4253-91aa-2eb52082b0cd', 'Ice Cream Bar - Hageen Daz To', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-23', false, 987.44, 2, 'Dilation of Right Hand Artery, Bifurcation, with Intraluminal Device, Open Approach');
INSERT INTO public.product VALUES ('b01237b8-cfac-42ee-a6d0-853ba50266c8', 'Pears - Anjou', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-07', false, 695.64, 1, 'Removal of Intraluminal Device from Vas Deferens, External Approach');
INSERT INTO public.product VALUES ('a86a8f97-b459-43f6-b03f-38370107c0cf', 'Stock - Veal, White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-16', true, 237.82, 2, 'Reposition Right Carpal Joint, Percutaneous Approach');
INSERT INTO public.product VALUES ('68a312df-302d-42d2-bb01-6c78a72442a5', 'Compound - Strawberry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-09', true, 876.89, 3, 'Excision of Jejunum, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('ae545b8c-fb37-4fe2-8193-ab9fa2017f35', 'Chocolate - Semi Sweet, Calets', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-14', true, 689.57, 2, 'Bypass Right Brachial Artery to Lower Arm Vein with Nonautologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('7ec22719-020e-4cbd-b01f-1886914c69d6', 'Oregano - Dry, Rubbed', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-02', true, 921.99, 2, 'Reposition Celiac Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('ff8325fb-3faf-4815-b174-d4f2ffa632a8', 'Cheese - Brick With Pepper', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-21', true, 54.58, 2, 'Control Bleeding in Left Foot, Open Approach');
INSERT INTO public.product VALUES ('53353af3-3254-47f8-82b0-e669e86d8990', 'Beer - Original Organic Lager', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-28', true, 533.19, 3, 'Bypass Right Axillary Artery to Bilateral Lower Arm Artery with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('b522066f-9b7e-44a1-9495-318fc5429356', 'Wine - Toasted Head', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-24', true, 180.45, 3, 'Fusion of Left Metacarpocarpal Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('23a6bdcc-4247-47dd-b13e-d16a284dda8c', 'Doilies - 8, Paper', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-05', true, 61.41, 1, 'Drainage of Oculomotor Nerve, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('417ff5e1-6398-41ad-a207-d8353f860ff2', 'Herb Du Provence - Primerba', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-02', true, 211.32, 2, 'Replacement of Left Anterior Tibial Artery with Synthetic Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('122f6e0b-533c-46bc-a342-e5d020586304', 'Salsify, Organic', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-22', true, 513.56, 1, 'Replacement of Gastric Vein with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('0db96937-1add-480b-924d-87f994d109f1', 'Butter Balls Salted', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-16', false, 960.97, 1, 'Bypass Left Kidney Pelvis to Bladder with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('50759070-dac8-4ac1-b5d5-f6c99994813f', 'Chicken - Wings, Tip Off', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-08', true, 191.17, 3, 'Dilation of Intracranial Artery, Bifurcation, with Intraluminal Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('a8a8812c-5484-44e4-a925-448501728963', 'Sprouts - Bean', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-25', false, 66.42, 2, 'Release Right Carpal Joint, External Approach');
INSERT INTO public.product VALUES ('3b28cf8e-3f1c-437b-a80d-019a9946e8f8', 'Wine - Conde De Valdemar', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-30', false, 991.34, 3, 'Revision of Infusion Device in Right Finger Phalangeal Joint, External Approach');
INSERT INTO public.product VALUES ('ef54e3e1-815f-461d-824a-b835978234b1', 'Plastic Arrow Stir Stick', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-06', true, 832.74, 2, 'Bypass Right Cephalic Vein to Upper Vein with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('775d9d11-c2f0-47a0-968a-f6b3de5ad10d', 'Pepper - Red Thai', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-23', false, 793.62, 2, 'Drainage of Left Superior Parathyroid Gland, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('96c1bb56-629d-4639-b482-8b980c63a2ee', 'Tomatoes Tear Drop Yellow', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-16', false, 247.21, 2, 'Muscles, Supplement');
INSERT INTO public.product VALUES ('c418e415-4c66-4375-8964-5a18b0d2a4c9', 'Lettuce - Romaine, Heart', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-14', true, 895.16, 3, 'Extirpation of Matter from Right External Iliac Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('6637f77f-018d-4263-8d7f-d201c6e08939', 'Tomatoes Tear Drop Yellow', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-04', true, 387.08, 3, 'Occlusion of Transverse Colon with Extraluminal Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('47db5f80-3d70-4576-b0f2-09f26fc90d2e', 'Tart - Pecan Butter Squares', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-26', true, 441.56, 2, 'Destruction of Azygos Vein, Percutaneous Approach');
INSERT INTO public.product VALUES ('59d520ad-eb06-4a89-8d14-3e0685fa45ab', 'Juice - Mango', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-04', true, 788.83, 3, 'Fluoroscopy of Intercostal and Bronchial Arteries using Other Contrast');
INSERT INTO public.product VALUES ('ca25370c-e58c-46bf-9b5d-70d687a55856', 'Savory', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-27', true, 482.25, 2, 'Bypass Coronary Artery, Four or More Arteries from Abdominal Artery with Autologous Venous Tissue, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('ebb0e7f8-534c-4507-85b9-16d91ac14d93', 'Triple Sec - Mcguinness', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-16', true, 821.12, 2, 'Removal of Nonautologous Tissue Substitute from Lower Bursa and Ligament, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('6491d615-2d3b-41df-9385-d8d4c495dc83', 'Bread Crumbs - Japanese Style', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-06', false, 410.20, 2, 'Removal of Nonautologous Tissue Substitute from Left Tarsal Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('d78642fb-7160-4bba-b2cc-c3a3a7b83752', 'Bread - Dark Rye, Loaf', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-24', true, 19.65, 1, 'Drainage of Cerebral Meninges, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('8e3ab5b3-7cd0-4016-ba40-f16fab118ce5', 'Wine - White, Gewurtzraminer', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-25', true, 67.65, 3, 'Revision of Autologous Tissue Substitute in Right Tarsal Joint, External Approach');
INSERT INTO public.product VALUES ('773faf2a-8bf2-40a7-a4f7-5b59ca4b7536', 'Soup - Campbells, Chix Gumbo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-15', false, 695.75, 1, 'Drainage of Right Trunk Bursa and Ligament with Drainage Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('5e4c06be-5e7f-4317-b2c2-3e209091494c', 'Apple - Macintosh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-11', true, 880.90, 3, 'Revision of Drainage Device in Upper Bone, Percutaneous Approach');
INSERT INTO public.product VALUES ('6df18487-ebfd-43fb-a548-bffcb7992305', 'Bread - Rosemary Focaccia', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-06', true, 319.99, 3, 'Revision of Monitoring Device in Azygos Vein, Open Approach');
INSERT INTO public.product VALUES ('79fe1da7-0adf-4010-bd55-32e7e0b9508f', 'Wine - Lamancha Do Crianza', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-27', true, 963.17, 1, 'Reposition Right Thumb Phalanx with External Fixation Device, Open Approach');
INSERT INTO public.product VALUES ('d8adda61-1064-4b53-9b82-c6d7347148cd', 'Soup - Campbells, Spinach Crm', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-10', true, 242.20, 1, 'Reposition Left Rib with Internal Fixation Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('13a3cbbf-ae84-46fa-ae23-4f5a38e1cdac', 'Olives - Black, Pitted', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-28', false, 584.98, 3, 'Insertion of Intraluminal Device into Hepatobiliary Duct, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('d18ae58f-1243-4eb2-b6cf-817fb61b9f44', 'Cassis', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-09', false, 969.53, 2, 'Revision of Extraluminal Device in Lower Vein, External Approach');
INSERT INTO public.product VALUES ('f99b01c6-3bb8-4c86-8163-59a3e0bae085', 'Beef - Ground, Extra Lean, Fresh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-04', false, 51.71, 1, 'Drainage of Right Eye, External Approach');
INSERT INTO public.product VALUES ('460c78c8-0db5-4dc6-bedf-958f42731be9', 'Wine - Chateauneuf Du Pape', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-03', true, 659.86, 1, 'Bypass Cerebral Ventricle to Peritoneal Cavity with Autologous Tissue Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('269cbea5-e3e9-4e27-ab08-025021ab99c8', 'Nutmeg - Ground', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-23', true, 253.53, 3, 'Reattachment of Perineum Muscle, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('49f6be1e-936d-4c21-863d-9ee2b8f08b37', 'Sparkling Wine - Rose, Freixenet', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-04', true, 834.22, 3, 'Replacement of Right Lower Leg Tendon with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('96bec3f7-9c4d-4c8f-b45e-4d76cd958194', 'Longos - Chicken Cordon Bleu', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-10', false, 458.86, 1, 'Restriction of Intracranial Vein, Open Approach');
INSERT INTO public.product VALUES ('67f86a01-ec82-48b5-8b82-f3fa912a19f6', 'Breakfast Quesadillas', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-15', true, 379.96, 3, 'Removal of Bone Growth Stimulator from Upper Bone, Percutaneous Approach');
INSERT INTO public.product VALUES ('73371abc-c735-4bf7-8880-c8b9926a70d5', 'Kohlrabi', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-15', true, 722.51, 1, 'Computerized Tomography (CT Scan) of Bilateral Lungs');
INSERT INTO public.product VALUES ('6ce08f65-11d9-4a9e-9170-3b47c24a9f70', 'Butter - Pod', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-02-20', false, 168.37, 1, 'Excision of Olfactory Nerve, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('658c47c3-e041-4b8d-91a9-a8600608e040', 'Melon - Watermelon, Seedless', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-16', false, 887.31, 2, 'Revision of Synthetic Substitute in Left Patella, Open Approach');
INSERT INTO public.product VALUES ('40858574-def4-4f2b-a0b8-7f399066d41e', 'Bread - Rosemary Focaccia', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-10', true, 935.61, 3, 'Introduction of Local Anesthetic into Male Reproductive, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('a9ec29f4-704c-485f-a25f-918356a5e1ea', 'Otomegusa Dashi Konbu', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-12', true, 609.93, 1, 'Removal of Intraluminal Device from Tracheobronchial Tree, Open Approach');
INSERT INTO public.product VALUES ('887b70ae-d5dc-4700-8105-9f1686c2fa65', 'Beer - Upper Canada Light', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-01', true, 58.97, 3, 'Insertion of Infusion Device into Left Shoulder Region, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('5fa53abe-4681-4b13-9675-f7772e95ac4a', 'Wild Boar - Tenderloin', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-14', true, 937.80, 1, 'Division of Right Ankle Bursa and Ligament, Percutaneous Approach');
INSERT INTO public.product VALUES ('54723980-028a-4d1b-bbc0-d6c4800ea6f3', 'Nut - Almond, Blanched, Sliced', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-23', false, 103.21, 3, 'Supplement Left Lacrimal Duct with Autologous Tissue Substitute, Via Natural or Artificial Opening Endoscopic');
INSERT INTO public.product VALUES ('22c6fbb0-7ddd-4ee9-9726-78c315e7c6f7', 'Cheese - Goat', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-27', false, 865.55, 2, 'Dilation of Left External Iliac Artery, Bifurcation, Open Approach');
INSERT INTO public.product VALUES ('d79dcf84-8fae-4028-9176-7c50bba62abe', 'Venison - Racks Frenched', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-30', true, 480.96, 1, 'Insertion of Infusion Device into Right Internal Mammary Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('56cbc15a-500e-4445-9a8d-3d61e7ae03b6', 'Beef - Ground Medium', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-26', true, 574.23, 2, 'Reposition Left Humeral Head with Internal Fixation Device, Open Approach');
INSERT INTO public.product VALUES ('f96bd8bf-bcbe-4bd4-852e-238d6d00826b', 'Tortillas - Flour, 12', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-02', true, 54.63, 3, 'Bypass Left Pulmonary Artery from Innominate Artery with Autologous Venous Tissue, Open Approach');
INSERT INTO public.product VALUES ('81042d65-85ce-4a18-93b5-cd311f8901fe', 'Sproutsmustard Cress', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-17', false, 781.12, 2, 'Bypass Middle Esophagus to Duodenum with Synthetic Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('a1c93b16-1283-480b-b030-11025df5ba76', 'Paper Cocktail Umberlla 80 - 180', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-04', true, 88.99, 2, 'Excision of Bilateral Vas Deferens, Open Approach');
INSERT INTO public.product VALUES ('fe321042-8527-4e4a-b7c4-c67a3eb40b54', 'Curry Paste - Madras', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-18', false, 79.03, 2, 'Restriction of Intracranial Vein, Percutaneous Approach');
INSERT INTO public.product VALUES ('4f023874-7219-4faf-b238-652e034b3c5d', 'Cotton Wet Mop 16 Oz', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-12-07', false, 323.44, 1, 'Extirpation of Matter from Coronary Artery, Three Arteries, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1b6385e1-5932-4ca7-bc58-c4be0e9dc66e', 'Sesame Seed', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-29', false, 827.26, 3, 'Revision of Nonautologous Tissue Substitute in Right Toe Phalanx, Open Approach');
INSERT INTO public.product VALUES ('7f1af33c-63ec-4ed2-ab21-5e6ebe06eb73', 'Potatoes - Peeled', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-14', true, 810.26, 3, 'Fragmentation in Left Large Intestine, Percutaneous Approach');
INSERT INTO public.product VALUES ('cdc690c9-d68c-4685-9818-6caaa5da148e', 'Turkey Leg With Drum And Thigh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-14', false, 933.29, 2, 'Drainage of Left Thyroid Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('01329f18-c1bb-47a7-8946-107b3b3dd243', 'Sour Puss Raspberry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-09', true, 25.57, 3, 'Computerized Tomography (CT Scan) of Bilateral Sternoclavicular Joints using Low Osmolar Contrast');
INSERT INTO public.product VALUES ('604789ef-a8d4-40d4-b8eb-3db45cca62c3', 'Ham Black Forest', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-10', true, 70.91, 2, 'Magnetic Resonance Imaging (MRI) of Right Shoulder');
INSERT INTO public.product VALUES ('b9e7e2e1-62e4-46e0-9220-055c5882934d', 'Aspic - Clear', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-12', false, 386.45, 3, 'Revision of Intraluminal Device in Bladder, Percutaneous Approach');
INSERT INTO public.product VALUES ('a5b29d83-7525-4cec-8d65-802fc0621554', 'Almonds Ground Blanched', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-14', false, 50.81, 1, 'Drainage of Right Lacrimal Bone, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('f564ba8f-bce1-4452-926c-74cb216d5cf5', 'Island Oasis - Peach Daiquiri', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-18', true, 484.49, 3, 'Removal of Drainage Device from Sinus, Open Approach');
INSERT INTO public.product VALUES ('8f22a127-16f8-4281-a047-018448ccfca3', 'Pepper - Julienne, Frozen', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-04', false, 590.55, 2, 'Repair Right Finger Phalanx, Open Approach');
INSERT INTO public.product VALUES ('9afc97fc-2729-4fa0-a2b1-29f13165ba69', 'Coffee - Cafe Moreno', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-14', true, 702.51, 1, 'Medication Management for Substance Abuse Treatment, Clonidine');
INSERT INTO public.product VALUES ('554157e2-655c-4725-b6fc-29ac9d63fc57', 'Chivas Regal - 12 Year Old', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-21', false, 351.62, 2, 'Revision of Nonautologous Tissue Substitute in Left Ankle Joint, Open Approach');
INSERT INTO public.product VALUES ('1f34ef9f-4ebc-45b1-8f9c-7ba04ba9ad9c', 'Pastry - Baked Scones - Mini', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-16', false, 741.54, 1, 'Dilation of Left Subclavian Artery with Two Intraluminal Devices, Percutaneous Approach');
INSERT INTO public.product VALUES ('c0953fdc-41fc-4bcb-9fb0-b922d066bdf7', 'Peas Snow', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2022-01-21', false, 136.29, 2, 'Replacement of Left Upper Leg Skin with Synthetic Substitute, Partial Thickness, External Approach');
INSERT INTO public.product VALUES ('4d98d917-95f6-4c08-83a1-17b20bf8f5c0', 'Ginger - Crystalized', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-10-27', true, 406.96, 2, 'Division of Left Foot Tendon, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('3a1e2d8b-f17e-49fd-b6c3-7fa4800a9696', 'Sausage - Chorizo', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-11', false, 945.42, 3, 'Repair Left Sternoclavicular Joint, Percutaneous Approach');
INSERT INTO public.product VALUES ('5d3ee96b-d8ec-4ce6-bc81-f91d8e443ee8', 'Chocolate - Pistoles, White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-03', true, 480.07, 1, 'Replacement of Left Foot Artery with Synthetic Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('c9c59a61-0af3-412e-99f4-2b410e6e9a6a', 'Pepper - Pablano', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-30', true, 720.98, 1, 'Occlusion of Left Pulmonary Vein with Intraluminal Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('4aa9f6a0-55b8-4fb6-85c2-c62ae5244117', 'Langers - Cranberry Cocktail', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-22', true, 277.56, 3, 'Dilation of Left External Carotid Artery with Three Drug-eluting Intraluminal Devices, Percutaneous Approach');
INSERT INTO public.product VALUES ('3ee7e394-5338-4e28-94ae-3f0cb0436f97', 'Eggplant - Baby', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-11-02', false, 391.90, 2, 'Removal of Monitoring Device from Trachea, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('6b72fd09-5c6f-4739-b4bd-91854635dc1a', 'Turkey - Breast, Double', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-06', false, 623.92, 3, 'Supplement Left Patella with Synthetic Substitute, Percutaneous Approach');
INSERT INTO public.product VALUES ('e5ea4e5e-08b1-44ef-ad21-0a8f94e6a1da', 'Container - Foam Dixie 12 Oz', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-18', false, 823.49, 2, 'Destruction of Left Face Vein, Open Approach');
INSERT INTO public.product VALUES ('bf01f1f0-1a6e-4484-8388-a4030c6f6a4f', 'Banana', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-24', false, 294.94, 3, 'Dilation of Right Posterior Tibial Artery, Bifurcation, with Two Drug-eluting Intraluminal Devices, Percutaneous Approach');
INSERT INTO public.product VALUES ('040fce3f-6ae4-41fa-9752-6d9217a494f2', 'Wine - Peller Estates Late', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-20', true, 584.73, 1, 'Reposition Right Glenoid Cavity, Open Approach');
INSERT INTO public.product VALUES ('742f1e1e-face-42c3-a981-7849afc2a582', 'Frangelico', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-13', false, 3.24, 1, 'Change Splint on Left Lower Extremity');
INSERT INTO public.product VALUES ('9d057a27-51e8-44d9-a0cd-c636e841fc39', 'Yeast Dry - Fermipan', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-26', false, 572.77, 2, 'Transfer Acoustic Nerve to Olfactory Nerve, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1b4819a2-f0c0-4144-95c2-1605f6db6a85', 'Wine - Red, Mouton Cadet', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-12', false, 2.25, 1, 'Release Cisterna Chyli, Percutaneous Approach');
INSERT INTO public.product VALUES ('8cd870bf-e3f0-4a8a-adf0-a0f6021a8914', 'Lettuce - Spring Mix', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-05-19', true, 677.84, 1, 'Supplement Right Lesser Saphenous Vein with Nonautologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('bcd47bb1-666f-42eb-b3b0-0eecfbf4ba4d', 'Pastry - Butterscotch Baked', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-04-02', false, 343.68, 1, 'Fusion of Left Temporomandibular Joint with Internal Fixation Device, Open Approach');
INSERT INTO public.product VALUES ('e50fa06d-d1d9-41bf-8064-ad42d4a5dd06', 'Sobe - Green Tea', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-01', false, 249.28, 3, 'Revision of Synthetic Substitute in Right Hip Joint, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1cfc7ebf-ce26-44ef-afad-2c0b9e158030', 'Onions - White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-20', true, 979.37, 2, 'Bypass Coronary Artery, Three Arteries from Left Internal Mammary with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('6083aae3-c144-407c-b774-a2e00ec91e92', 'Juice - Apple, 500 Ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-16', false, 510.14, 3, 'Dilation of Right Vertebral Artery with Four or More Intraluminal Devices, Percutaneous Approach');
INSERT INTO public.product VALUES ('226140a2-1167-4eba-8288-cad738a9961c', 'White Baguette', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-22', true, 960.61, 1, 'Dilation of Lower Artery, Bifurcation, with Four or More Intraluminal Devices, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('513978f0-5358-4828-9adf-fd73d5a05199', 'Flour - Corn, Fine', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-09', true, 219.49, 2, 'Excision of Left Renal Artery, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('9d50c06d-74e4-48c8-bdc0-c370687cc4df', 'Table Cloth 81x81 White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-07-22', false, 434.82, 3, 'Excision of Right Colic Artery, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('2cf2bafe-7aa0-4b1e-984a-c8b42bcea29f', 'Tart Shells - Sweet, 3', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-27', false, 608.05, 3, 'Dilation of Right Internal Carotid Artery, Bifurcation, with Drug-eluting Intraluminal Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('0a910210-a2e4-4354-8247-d6e5d9d8e228', 'Oyster - In Shell', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-01', true, 671.31, 3, 'Dilation of Right Colic Artery with Four or More Intraluminal Devices, Percutaneous Approach');
INSERT INTO public.product VALUES ('cdb4c51d-1fba-49ca-8d9c-4af696b2bf79', 'Shrimp - Black Tiger 13/15', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-03', true, 827.90, 2, 'Fluoroscopy of Spinal Cord using Low Osmolar Contrast');
INSERT INTO public.product VALUES ('1ca27aa0-f6d8-40e2-a8d5-9be03df305fa', 'Wine - White, Pelee Island', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-07', true, 540.41, 1, 'Bypass Left Renal Vein to Lower Vein with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('b8fac86f-67c5-4864-92da-75788d81e4a9', 'Pickles - Gherkins', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-09-18', false, 389.33, 3, 'Excision of Left Ankle Joint, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('7929222b-4c61-43ad-9681-d47c62111bad', 'Puree - Passion Fruit', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-05-26', false, 581.09, 2, 'Insertion of Interspinous Process Spinal Stabilization Device into Cervicothoracic Vertebral Joint, Open Approach');
INSERT INTO public.product VALUES ('2d4fe045-fc2b-4850-bc67-c086ae9194eb', 'Cookies - Amaretto', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-05', true, 598.77, 2, 'Excision of Trochlear Nerve, Open Approach');
INSERT INTO public.product VALUES ('afbeacd3-1e73-41e0-a85a-a3d83d32c3bf', 'Dip - Tapenade', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-17', false, 888.50, 1, 'Replacement of Right Peroneal Artery with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('c972e45a-eee5-4b50-b6d9-d628e16f6394', 'Compound - Orange', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-22', false, 452.77, 3, 'Supplement Scrotum with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('b38bd565-ccf8-4e3b-85b1-5270908d6bef', 'Water - Spring Water, 355 Ml', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-23', true, 540.63, 1, 'Removal of Drainage Device from Thoracic Duct, Open Approach');
INSERT INTO public.product VALUES ('a0a4895b-4c20-4417-b4c8-535c958f7f52', 'Wine - Sicilia Igt Nero Avola', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-08-10', true, 879.45, 3, 'Supplement Right Ring Finger with Autologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('f0bbdbf5-c818-42dd-bac0-acab5d59ea59', 'Pork Loin Bine - In Frenched', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-06', true, 857.74, 1, 'Excision of Right Knee Bursa and Ligament, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('7696daf9-0f3d-42b2-8fdc-b5f7fd0c48af', 'Soup - Cream Of Broccoli, Dry', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-10', false, 260.72, 1, 'Reposition Right Toe Phalangeal Joint with External Fixation Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('667c2047-9cd9-4c75-9adb-708c62d7752d', 'Tomatoes Tear Drop', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-31', false, 24.90, 1, 'Repair Left Ethmoid Sinus, Percutaneous Approach');
INSERT INTO public.product VALUES ('7a5c9b27-cf2e-4a33-b106-a40e275ff3d3', 'Extract - Rum', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-19', true, 213.47, 2, 'Release Left Femoral Shaft, Percutaneous Approach');
INSERT INTO public.product VALUES ('e30d9f1a-85dd-4a8f-b398-3115e12c1acd', 'General Purpose Trigger', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-02', false, 649.88, 1, 'Bypass Left Common Iliac Artery to Right Renal Artery with Autologous Venous Tissue, Open Approach');
INSERT INTO public.product VALUES ('66e38fc1-c0ee-4b04-8ee2-e7f1e9c1f7fa', 'Pastry - Chocolate Marble Tea', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-03-01', false, 808.74, 3, 'Reposition Right Scapula, Open Approach');
INSERT INTO public.product VALUES ('289ddb32-c666-438a-96fd-6bc11c976638', 'Cheese - Colby', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-04-25', false, 696.10, 1, 'Bypass Left Kidney Pelvis to Bladder with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('4c8260a2-c692-4e19-8307-d43d38729742', 'Cocoa Butter', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-11-03', false, 53.73, 3, 'Drainage of Left Fallopian Tube, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('92f7e8a8-24b9-44aa-b4cb-9978e67bf946', 'Juice - Propel Sport', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-14', true, 756.34, 2, 'Release Right Lower Leg Muscle, Percutaneous Approach');
INSERT INTO public.product VALUES ('34975aa4-9d75-47fa-93b5-6e41557c8ac6', 'Coriander - Seed', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-06-18', true, 733.13, 1, 'Drainage of Upper Tooth, Open Approach, Single');
INSERT INTO public.product VALUES ('3cd253ec-8682-4d77-9281-2b97418842b7', 'Squash - Acorn', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-01', false, 594.24, 1, 'Dilation of Inferior Mesenteric Artery, Bifurcation, with Two Drug-eluting Intraluminal Devices, Open Approach');
INSERT INTO public.product VALUES ('fd0af773-57f1-4503-bfb2-96ca90f924b2', 'Juice - Grape, White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-03', false, 425.57, 2, 'Magnetic Resonance Imaging (MRI) of Left Forearm using Other Contrast, Unenhanced and Enhanced');
INSERT INTO public.product VALUES ('25c8d0db-5dd6-4597-94b5-9e4f4b08f06c', 'Cup - 3.5oz, Foam', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-25', true, 984.84, 2, 'Restriction of Right Hand Vein with Intraluminal Device, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('21b6679a-b819-4ebe-81bb-f01a1a2067b1', 'Cabbage - Nappa', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-11-21', true, 955.94, 3, 'Alteration of Right Lower Arm, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('e5d7988b-647c-47c1-bb68-387d2b8d787f', 'Beer - Mill St Organic', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-06-05', false, 245.95, 1, 'Stereotactic Gamma Beam Radiosurgery of Duodenum');
INSERT INTO public.product VALUES ('dc59102b-15e3-4423-9717-8263c687837e', 'Daikon Radish', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-01', true, 993.62, 3, 'Beam Radiation of Pineal Body using Electrons');
INSERT INTO public.product VALUES ('68be9519-8af4-446e-9136-e21d65fad5b1', 'Aspic - Amber', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-01-23', true, 912.12, 2, 'Occlusion of Ampulla of Vater with Extraluminal Device, Open Approach');
INSERT INTO public.product VALUES ('a081314b-c8fc-4b1c-8b84-9db98ae8bc04', 'Muffin - Carrot Individual Wrap', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-05', true, 722.13, 3, 'Inspection of Peritoneum, Percutaneous Approach');
INSERT INTO public.product VALUES ('1a323c38-f3f9-408c-9dfa-4f6fc05504fc', 'Chocolate Bar - Coffee Crisp', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-28', false, 6.16, 3, 'Beam Radiation of Esophagus using Photons >10 MeV');
INSERT INTO public.product VALUES ('d560f9bb-019c-48a8-a492-f6a6edb28c99', 'Daikon Radish', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-05', false, 73.27, 3, 'Drainage of Left Ulnar Artery with Drainage Device, Open Approach');
INSERT INTO public.product VALUES ('995857d7-260a-4664-bb7f-c17f36aa2a6d', 'Vinegar - Tarragon', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-04-02', false, 796.69, 3, 'Occlusion of Right Internal Carotid Artery with Bioactive Intraluminal Device, Open Approach');
INSERT INTO public.product VALUES ('cb37c5a5-2f5a-4759-938c-70f7ddcba7c8', 'Grapefruit - White', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-05-23', true, 967.95, 1, 'Fusion of Sacrococcygeal Joint with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('f922b568-6358-4e9b-ab10-514b0bba2715', 'Chicken - Breast, 5 - 7 Oz', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-02-19', true, 457.87, 1, 'Excision of Left Metacarpal, Open Approach');
INSERT INTO public.product VALUES ('dc75bacc-1a70-4521-805c-8d845a6764fd', 'Irish Cream - Butterscotch', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-03-12', true, 88.44, 3, 'Excision of Left Upper Extremity Bursa and Ligament, Open Approach, Diagnostic');
INSERT INTO public.product VALUES ('2900ed85-3e96-4fbc-8a38-d2ae127b97aa', 'Cheese - Roquefort Pappillon', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-21', false, 386.00, 3, 'Release Left Finger Phalangeal Joint, External Approach');
INSERT INTO public.product VALUES ('d2d6c267-4b09-4099-ae1d-b7c2dfd9fdd0', 'Miso - Soy Bean Paste', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-09-26', false, 412.88, 3, 'Release Right Maxilla, Open Approach');
INSERT INTO public.product VALUES ('4a8fd09a-bc69-41ca-9c2b-bf70d0c6c343', 'Chicken - Leg / Back Attach', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-03-22', false, 518.13, 1, 'Replacement of Right Hip Joint with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('6a0317de-1b10-483c-8341-9a11c4d8cb57', 'Sauce - Thousand Island', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-01-08', false, 870.49, 3, 'Drainage of Left Neck Lymphatic, Percutaneous Approach, Diagnostic');
INSERT INTO public.product VALUES ('1fbaa5f6-2196-4d23-a1de-c610ed28faf8', 'Spinach - Baby', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-06', true, 440.99, 3, 'Supplement Right Finger Phalangeal Joint with Nonautologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('73c7379f-d9de-4342-b48c-c2ee982c2cc8', 'Pastry - Baked Cinnamon Stick', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-06-03', false, 629.56, 1, 'Drainage of Right Toe Phalangeal Joint with Drainage Device, Percutaneous Approach');
INSERT INTO public.product VALUES ('db3f507f-8042-468d-b535-4bc3561cbbad', 'Wine - Ruffino Chianti', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-17', false, 973.28, 2, 'Radiation Therapy, Eye, Beam Radiation');
INSERT INTO public.product VALUES ('5f2025cb-d188-4833-bef9-fc4648a2510e', 'Bread - Raisin Walnut Oval', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-07', false, 910.77, 2, 'Computerized Tomography (CT Scan) of Portal and Splanchnic Veins');
INSERT INTO public.product VALUES ('ccae3a83-0e79-4f24-b7bd-745ac3e2a31b', 'Mackerel Whole Fresh', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-08-03', false, 361.60, 3, 'Computer Assisted Procedure of Head and Neck Region, With Magnetic Resonance Imaging');
INSERT INTO public.product VALUES ('ac15e643-a017-4c37-8322-8f3cadd1d05f', 'Onions Granulated', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-02-01', true, 279.87, 2, 'Insertion of Infusion Device into Right Common Iliac Artery, Percutaneous Approach');
INSERT INTO public.product VALUES ('78df58b9-4b49-456c-8fa9-ef5880191938', 'Lobster - Base', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-07-23', true, 445.69, 3, 'Reposition Radial Nerve, Percutaneous Approach');
INSERT INTO public.product VALUES ('1cb804bf-23bb-41d2-beb3-d149997fa4de', 'Grapes - Black', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-10-19', true, 323.33, 1, 'Revision of Extraluminal Device in Lower Intestinal Tract, Percutaneous Endoscopic Approach');
INSERT INTO public.product VALUES ('1aed67c4-3866-4add-8ef9-1c6bff0c1397', 'Kellogs Cereal In A Cup', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-07-23', true, 868.05, 2, 'Bypass Innominate Artery to Left Extracranial Artery, Open Approach');
INSERT INTO public.product VALUES ('5354063b-6877-4980-95a5-91f22ef5583e', 'Corn Kernels - Frozen', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-26', false, 890.66, 3, 'Change Other Device in Vas Deferens, External Approach');
INSERT INTO public.product VALUES ('8bb36f14-db36-4b3f-a01e-2f3fe5a6db95', 'Sausage - Liver', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-12-15', true, 318.64, 1, 'Supplement Left Neck Lymphatic with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('3c97ec81-7461-4ca5-acbe-238eea33e9a7', 'Hipnotiq Liquor', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-10-17', true, 242.56, 1, 'Supplement Bilateral External Ear with Synthetic Substitute, Open Approach');
INSERT INTO public.product VALUES ('6460beae-af5a-433b-9d0d-3e0b84f88b27', 'Chocolate - Compound Coating', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2020-09-07', true, 465.43, 1, 'Supplement Bilateral Testes with Autologous Tissue Substitute, Open Approach');
INSERT INTO public.product VALUES ('6d23d031-a9bf-4ec4-9158-4b32726c4065', 'Cleaner - Comet', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2021-08-27', true, 538.05, 2, 'Restriction of Urethra, Via Natural or Artificial Opening');
INSERT INTO public.product VALUES ('e7aab121-6b4d-48f5-af7f-bcb0c8f312fc', 'Cheese - Brie Roitelet', '4d1f5c6f-593f-4c4e-91b1-f1fbf192f6ff', '2019-12-20', false, 20.02, 2, 'Occlusion of Pelvis Lymphatic, Open Approach');


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


-- Completed on 2019-02-16 10:44:53

--
-- PostgreSQL database dump complete
--

