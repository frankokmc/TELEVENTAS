PGDMP         4        
        {            base    15.1    15.1 #    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    36033    base    DATABASE     w   CREATE DATABASE base WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE base;
                postgres    false            �            1259    36034    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         heap    postgres    false            �            1259    36039    clientes    TABLE       CREATE TABLE public.clientes (
    id bigint NOT NULL,
    numero_telefonico character varying,
    nombre character varying,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    36044    clientes_id_seq    SEQUENCE     x   CREATE SEQUENCE public.clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    215            &           0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    216            �            1259    36045    llamados    TABLE     �   CREATE TABLE public.llamados (
    id bigint NOT NULL,
    cliente_id bigint NOT NULL,
    motivo character varying,
    fecha date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.llamados;
       public         heap    postgres    false            �            1259    36050    llamados_id_seq    SEQUENCE     x   CREATE SEQUENCE public.llamados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.llamados_id_seq;
       public          postgres    false    217            '           0    0    llamados_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.llamados_id_seq OWNED BY public.llamados.id;
          public          postgres    false    218            �            1259    36051    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    postgres    false            �            1259    36056    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    36063    usuarios_id_seq    SEQUENCE     x   CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    220            (           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    221            w           2604    36064    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            x           2604    36065    llamados id    DEFAULT     j   ALTER TABLE ONLY public.llamados ALTER COLUMN id SET DEFAULT nextval('public.llamados_id_seq'::regclass);
 :   ALTER TABLE public.llamados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            y           2604    36066    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220                      0    36034    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          postgres    false    214   (                 0    36039    clientes 
   TABLE DATA           `   COPY public.clientes (id, numero_telefonico, nombre, email, created_at, updated_at) FROM stdin;
    public          postgres    false    215   U(                 0    36045    llamados 
   TABLE DATA           Y   COPY public.llamados (id, cliente_id, motivo, fecha, created_at, updated_at) FROM stdin;
    public          postgres    false    217   *                 0    36051    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          postgres    false    219   �*                 0    36056    usuarios 
   TABLE DATA           �   COPY public.usuarios (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
    public          postgres    false    220   +       )           0    0    clientes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clientes_id_seq', 31, true);
          public          postgres    false    216            *           0    0    llamados_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.llamados_id_seq', 23, true);
          public          postgres    false    218            +           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 3, true);
          public          postgres    false    221            }           2606    36068 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public            postgres    false    214                       2606    36070    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215            �           2606    36072    llamados llamados_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.llamados
    ADD CONSTRAINT llamados_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.llamados DROP CONSTRAINT llamados_pkey;
       public            postgres    false    217            �           2606    36074 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            postgres    false    219            �           2606    36076    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    220            �           1259    36077    index_llamados_on_cliente_id    INDEX     W   CREATE INDEX index_llamados_on_cliente_id ON public.llamados USING btree (cliente_id);
 0   DROP INDEX public.index_llamados_on_cliente_id;
       public            postgres    false    217            �           1259    36078    index_usuarios_on_email    INDEX     T   CREATE UNIQUE INDEX index_usuarios_on_email ON public.usuarios USING btree (email);
 +   DROP INDEX public.index_usuarios_on_email;
       public            postgres    false    220            �           1259    36079 &   index_usuarios_on_reset_password_token    INDEX     r   CREATE UNIQUE INDEX index_usuarios_on_reset_password_token ON public.usuarios USING btree (reset_password_token);
 :   DROP INDEX public.index_usuarios_on_reset_password_token;
       public            postgres    false    220            �           2606    36080    llamados fk_rails_be40e248f2    FK CONSTRAINT     �   ALTER TABLE ONLY public.llamados
    ADD CONSTRAINT fk_rails_be40e248f2 FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);
 F   ALTER TABLE ONLY public.llamados DROP CONSTRAINT fk_rails_be40e248f2;
       public          postgres    false    217    3199    215               ?   x�K�+�,���M�+�LI-K��/ ����u�u�ͬLM�LL��-�--��Hq��qqq �$�         �  x�}�Mo�0��үȽ� R�q����7���0`'�
�M=����Ud�cK	��C��]��2b�ճ��?bռ��M�6n_�t�u�W���@��^�{M#�	1�У�Q�I�B��D	Z�x�K��8.㯳�(�d>�މ:Ϡ\ �~@� Gh�1���˼�8;%Cxk���4�%	Fx�;�����9�cҠ |���W�zo�M+��U���Ӷ}���0Ҽ1$�J�w�$	^8�<�x��j�/&�x�5����v����.����$!���&�+�K�qZ�<9n?;J���$D&Gb_���-����&C�#�d˵$Q�;�Po���eYdU6�f�EY��%9=A��'�ɢt��I���[Bg��h^V�w��{z���!��ap$i@��J;�Wu�c�_b�ٙ`(idG4ُ�kI�RR�Q��         �   x���;�0@��\�������Y*�V` �O'��TH"=�g�)���t��51�l�n����� 	�\H��)�^Р�و�זm!F�"a��WQ^A0��^1	���Ӭ �D�^n��>��6� ƌ^[w�9��ON8ԲY�J+��Gx��PWE]Ap� ���o         >   x�M̻ !�����!C�u@G��DB>�U?|)��n��"��]}�H�������           x�}λr�@@��"�����W1bHP@qlv�*`��i2iL�9�i>"��}�uY�^��t�+alB`���Iy��4����M�DI�������S�����Yun􌄣�`�S�N��DTt�RDdI��?"u�pל�{֙�[_�����\m�J2ۍ#�k�&����zӞ�I(���� 5��5�j�HEp/2������;��EI�rwM1�����7��#Q[��[���Ѽx �t�bM��%�(���kv�     