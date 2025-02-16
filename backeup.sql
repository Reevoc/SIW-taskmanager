PGDMP                         x           taskmanager    11.7    11.7 (    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            9           1262    66028    taskmanager    DATABASE     �   CREATE DATABASE taskmanager WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Italian_Italy.1252' LC_CTYPE = 'Italian_Italy.1252';
    DROP DATABASE taskmanager;
             postgres    false            �            1259    114018    comment    TABLE     �   CREATE TABLE public.comment (
    id bigint NOT NULL,
    description character varying(255),
    comment_id bigint,
    task_id bigint
);
    DROP TABLE public.comment;
       public         postgres    false            �            1259    114023    credentials    TABLE     �   CREATE TABLE public.credentials (
    id bigint NOT NULL,
    password character varying(100) NOT NULL,
    role character varying(10) NOT NULL,
    username character varying(100) NOT NULL,
    user_id bigint
);
    DROP TABLE public.credentials;
       public         postgres    false            �            1259    114016    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       postgres    false            �            1259    114028    project    TABLE     �   CREATE TABLE public.project (
    id bigint NOT NULL,
    description character varying(255),
    name character varying(100) NOT NULL,
    start_timestamp timestamp without time zone NOT NULL,
    owner_id bigint
);
    DROP TABLE public.project;
       public         postgres    false            �            1259    114033    project_members    TABLE     q   CREATE TABLE public.project_members (
    visible_projects_id bigint NOT NULL,
    members_id bigint NOT NULL
);
 #   DROP TABLE public.project_members;
       public         postgres    false            �            1259    114036    tag    TABLE     �   CREATE TABLE public.tag (
    id bigint NOT NULL,
    color character varying(100) NOT NULL,
    description character varying(255),
    name character varying(100) NOT NULL,
    project_id bigint
);
    DROP TABLE public.tag;
       public         postgres    false            �            1259    114041    task    TABLE     O  CREATE TABLE public.task (
    id bigint NOT NULL,
    completed boolean NOT NULL,
    creation_timestamp timestamp without time zone NOT NULL,
    description character varying(255),
    last_update_timestamp timestamp without time zone NOT NULL,
    name character varying(100) NOT NULL,
    project_id bigint,
    tags_id bigint
);
    DROP TABLE public.task;
       public         postgres    false            �            1259    114046 	   task_tags    TABLE     \   CREATE TABLE public.task_tags (
    task_id bigint NOT NULL,
    tags_id bigint NOT NULL
);
    DROP TABLE public.task_tags;
       public         postgres    false            �            1259    114049    users    TABLE       CREATE TABLE public.users (
    id bigint NOT NULL,
    creation_timestamp timestamp without time zone NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    last_update_timestamp timestamp without time zone NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false            ,          0    114018    comment 
   TABLE DATA               G   COPY public.comment (id, description, comment_id, task_id) FROM stdin;
    public       postgres    false    197   `0       -          0    114023    credentials 
   TABLE DATA               L   COPY public.credentials (id, password, role, username, user_id) FROM stdin;
    public       postgres    false    198   }0       .          0    114028    project 
   TABLE DATA               S   COPY public.project (id, description, name, start_timestamp, owner_id) FROM stdin;
    public       postgres    false    199   �0       /          0    114033    project_members 
   TABLE DATA               J   COPY public.project_members (visible_projects_id, members_id) FROM stdin;
    public       postgres    false    200   �0       0          0    114036    tag 
   TABLE DATA               G   COPY public.tag (id, color, description, name, project_id) FROM stdin;
    public       postgres    false    201   �0       1          0    114041    task 
   TABLE DATA               �   COPY public.task (id, completed, creation_timestamp, description, last_update_timestamp, name, project_id, tags_id) FROM stdin;
    public       postgres    false    202   �0       2          0    114046 	   task_tags 
   TABLE DATA               5   COPY public.task_tags (task_id, tags_id) FROM stdin;
    public       postgres    false    203   1       3          0    114049    users 
   TABLE DATA               e   COPY public.users (id, creation_timestamp, first_name, last_name, last_update_timestamp) FROM stdin;
    public       postgres    false    204   +1       :           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);
            public       postgres    false    196            �
           2606    114022    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public         postgres    false    197            �
           2606    114027    credentials credentials_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.credentials DROP CONSTRAINT credentials_pkey;
       public         postgres    false    198            �
           2606    114032    project project_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public         postgres    false    199            �
           2606    114040    tag tag_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public         postgres    false    201            �
           2606    114045    task task_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public         postgres    false    202            �
           2606    114055 (   credentials uk_l7xhygibdj6cgkpj2ih1jgx14 
   CONSTRAINT     g   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT uk_l7xhygibdj6cgkpj2ih1jgx14 UNIQUE (username);
 R   ALTER TABLE ONLY public.credentials DROP CONSTRAINT uk_l7xhygibdj6cgkpj2ih1jgx14;
       public         postgres    false    198            �
           2606    114053    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    204            �
           2606    114056 #   comment fk2oflmeposgsbt7jw52ab1tgr8    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk2oflmeposgsbt7jw52ab1tgr8 FOREIGN KEY (comment_id) REFERENCES public.users(id);
 M   ALTER TABLE ONLY public.comment DROP CONSTRAINT fk2oflmeposgsbt7jw52ab1tgr8;
       public       postgres    false    2726    204    197            �
           2606    114106 %   task_tags fk5jrufop0gtxfeybb27jkoqn9r    FK CONSTRAINT     �   ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT fk5jrufop0gtxfeybb27jkoqn9r FOREIGN KEY (task_id) REFERENCES public.task(id);
 O   ALTER TABLE ONLY public.task_tags DROP CONSTRAINT fk5jrufop0gtxfeybb27jkoqn9r;
       public       postgres    false    202    203    2724            �
           2606    114076 +   project_members fk6qakef2mfjhaoaqep3b9qneea    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT fk6qakef2mfjhaoaqep3b9qneea FOREIGN KEY (members_id) REFERENCES public.users(id);
 U   ALTER TABLE ONLY public.project_members DROP CONSTRAINT fk6qakef2mfjhaoaqep3b9qneea;
       public       postgres    false    2726    204    200            �
           2606    114071 #   project fk7tetln4r9qig7tp05lsdqe8xo    FK CONSTRAINT     �   ALTER TABLE ONLY public.project
    ADD CONSTRAINT fk7tetln4r9qig7tp05lsdqe8xo FOREIGN KEY (owner_id) REFERENCES public.users(id);
 M   ALTER TABLE ONLY public.project DROP CONSTRAINT fk7tetln4r9qig7tp05lsdqe8xo;
       public       postgres    false    204    199    2726            �
           2606    114086    tag fkbyy56vice9njgl86752up8120    FK CONSTRAINT     �   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT fkbyy56vice9njgl86752up8120 FOREIGN KEY (project_id) REFERENCES public.project(id);
 I   ALTER TABLE ONLY public.tag DROP CONSTRAINT fkbyy56vice9njgl86752up8120;
       public       postgres    false    201    2720    199            �
           2606    114066 '   credentials fkcbcgksvnqvqxrrc4dwv3qys65    FK CONSTRAINT     �   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT fkcbcgksvnqvqxrrc4dwv3qys65 FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.credentials DROP CONSTRAINT fkcbcgksvnqvqxrrc4dwv3qys65;
       public       postgres    false    204    198    2726            �
           2606    114101 %   task_tags fkes0ksybarf59lj57xuuhgb5yr    FK CONSTRAINT     �   ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT fkes0ksybarf59lj57xuuhgb5yr FOREIGN KEY (tags_id) REFERENCES public.tag(id);
 O   ALTER TABLE ONLY public.task_tags DROP CONSTRAINT fkes0ksybarf59lj57xuuhgb5yr;
       public       postgres    false    203    2722    201            �
           2606    114061 #   comment fkfknte4fhjhet3l1802m1yqa50    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fkfknte4fhjhet3l1802m1yqa50 FOREIGN KEY (task_id) REFERENCES public.task(id);
 M   ALTER TABLE ONLY public.comment DROP CONSTRAINT fkfknte4fhjhet3l1802m1yqa50;
       public       postgres    false    2724    197    202            �
           2606    114096     task fkhrw05skxxae7ab6d3ompehxpr    FK CONSTRAINT     }   ALTER TABLE ONLY public.task
    ADD CONSTRAINT fkhrw05skxxae7ab6d3ompehxpr FOREIGN KEY (tags_id) REFERENCES public.tag(id);
 J   ALTER TABLE ONLY public.task DROP CONSTRAINT fkhrw05skxxae7ab6d3ompehxpr;
       public       postgres    false    202    2722    201            �
           2606    114091     task fkk8qrwowg31kx7hp93sru1pdqa    FK CONSTRAINT     �   ALTER TABLE ONLY public.task
    ADD CONSTRAINT fkk8qrwowg31kx7hp93sru1pdqa FOREIGN KEY (project_id) REFERENCES public.project(id);
 J   ALTER TABLE ONLY public.task DROP CONSTRAINT fkk8qrwowg31kx7hp93sru1pdqa;
       public       postgres    false    202    2720    199            �
           2606    114081 +   project_members fkkkowdb1552cnnmu8apvugooo0    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT fkkkowdb1552cnnmu8apvugooo0 FOREIGN KEY (visible_projects_id) REFERENCES public.project(id);
 U   ALTER TABLE ONLY public.project_members DROP CONSTRAINT fkkkowdb1552cnnmu8apvugooo0;
       public       postgres    false    2720    200    199            ,      x������ � �      -      x������ � �      .      x������ � �      /      x������ � �      0      x������ � �      1      x������ � �      2      x������ � �      3      x������ � �     