PGDMP                      |            maxautos    16.3    16.2 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    49152    maxautos    DATABASE     ~   CREATE DATABASE maxautos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE maxautos;
                postgres    false            �            1259    65714    buyers    TABLE     %  CREATE TABLE public.buyers (
    cc bigint NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    phone bigint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.buyers;
       public         heap    postgres    false            �            1259    57499    cars    TABLE     �  CREATE TABLE public.cars (
    _id integer NOT NULL,
    brand character varying NOT NULL,
    model integer NOT NULL,
    line character varying NOT NULL,
    kilometers integer NOT NULL,
    images text[] DEFAULT '{}'::text[] NOT NULL,
    price bigint NOT NULL,
    preview character varying,
    fuel character varying NOT NULL,
    transmission character varying NOT NULL,
    cc double precision NOT NULL,
    type character varying NOT NULL,
    owners integer NOT NULL,
    plate character varying NOT NULL,
    color character varying NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.cars;
       public         heap    postgres    false            �            1259    57498    cars__id_seq    SEQUENCE     �   CREATE SEQUENCE public.cars__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cars__id_seq;
       public          postgres    false    217            �           0    0    cars__id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cars__id_seq OWNED BY public.cars._id;
          public          postgres    false    216            �            1259    73847    login_history    TABLE     �   CREATE TABLE public.login_history (
    id integer NOT NULL,
    "loginTime" timestamp without time zone NOT NULL,
    user_id integer
);
 !   DROP TABLE public.login_history;
       public         heap    postgres    false            �            1259    73846    login_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.login_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.login_history_id_seq;
       public          postgres    false    223            �           0    0    login_history_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.login_history_id_seq OWNED BY public.login_history.id;
          public          postgres    false    222            �            1259    65724    transactions    TABLE     ;  CREATE TABLE public.transactions (
    _id integer NOT NULL,
    price bigint NOT NULL,
    date timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "buyerCc" bigint,
    car_id integer
);
     DROP TABLE public.transactions;
       public         heap    postgres    false            �            1259    65723    transactions__id_seq    SEQUENCE     �   CREATE SEQUENCE public.transactions__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.transactions__id_seq;
       public          postgres    false    220            �           0    0    transactions__id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.transactions__id_seq OWNED BY public.transactions._id;
          public          postgres    false    219            �            1259    49224    users    TABLE     T  CREATE TABLE public.users (
    _id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    role character varying NOT NULL,
    image character varying,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    65732    users__id_seq    SEQUENCE     v   CREATE SEQUENCE public.users__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users__id_seq;
       public          postgres    false    215            �           0    0    users__id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.users__id_seq OWNED BY public.users._id;
          public          postgres    false    221            0           2604    57502    cars _id    DEFAULT     d   ALTER TABLE ONLY public.cars ALTER COLUMN _id SET DEFAULT nextval('public.cars__id_seq'::regclass);
 7   ALTER TABLE public.cars ALTER COLUMN _id DROP DEFAULT;
       public          postgres    false    217    216    217            9           2604    73850    login_history id    DEFAULT     t   ALTER TABLE ONLY public.login_history ALTER COLUMN id SET DEFAULT nextval('public.login_history_id_seq'::regclass);
 ?   ALTER TABLE public.login_history ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            6           2604    65727    transactions _id    DEFAULT     t   ALTER TABLE ONLY public.transactions ALTER COLUMN _id SET DEFAULT nextval('public.transactions__id_seq'::regclass);
 ?   ALTER TABLE public.transactions ALTER COLUMN _id DROP DEFAULT;
       public          postgres    false    219    220    220            -           2604    65733 	   users _id    DEFAULT     f   ALTER TABLE ONLY public.users ALTER COLUMN _id SET DEFAULT nextval('public.users__id_seq'::regclass);
 8   ALTER TABLE public.users ALTER COLUMN _id DROP DEFAULT;
       public          postgres    false    221    215            �          0    65714    buyers 
   TABLE DATA           R   COPY public.buyers (cc, name, email, phone, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   �.       �          0    57499    cars 
   TABLE DATA           �   COPY public.cars (_id, brand, model, line, kilometers, images, price, preview, fuel, transmission, cc, type, owners, plate, color, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    217   �/       �          0    73847    login_history 
   TABLE DATA           A   COPY public.login_history (id, "loginTime", user_id) FROM stdin;
    public          postgres    false    223   �1       �          0    65724    transactions 
   TABLE DATA           e   COPY public.transactions (_id, price, date, "createdAt", "updatedAt", "buyerCc", car_id) FROM stdin;
    public          postgres    false    220   �1       �          0    49224    users 
   TABLE DATA           _   COPY public.users (_id, username, password, role, image, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    215   k2       �           0    0    cars__id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cars__id_seq', 3, true);
          public          postgres    false    216            �           0    0    login_history_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.login_history_id_seq', 4, true);
          public          postgres    false    222            �           0    0    transactions__id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transactions__id_seq', 3, true);
          public          postgres    false    219            �           0    0    users__id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users__id_seq', 1, false);
          public          postgres    false    221            =           2606    57509 #   cars PK_32fd975b8f388a770e46b485467 
   CONSTRAINT     d   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT "PK_32fd975b8f388a770e46b485467" PRIMARY KEY (_id);
 O   ALTER TABLE ONLY public.cars DROP CONSTRAINT "PK_32fd975b8f388a770e46b485467";
       public            postgres    false    217            A           2606    65731 +   transactions PK_3386cedd74f727ad93e5eaf78d1 
   CONSTRAINT     l   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "PK_3386cedd74f727ad93e5eaf78d1" PRIMARY KEY (_id);
 W   ALTER TABLE ONLY public.transactions DROP CONSTRAINT "PK_3386cedd74f727ad93e5eaf78d1";
       public            postgres    false    220            ;           2606    49233 $   users PK_46c438e5a956fb9c3e86e73e321 
   CONSTRAINT     e   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_46c438e5a956fb9c3e86e73e321" PRIMARY KEY (_id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "PK_46c438e5a956fb9c3e86e73e321";
       public            postgres    false    215            ?           2606    65722 %   buyers PK_cd30fe76a384e74b42b68df0e3b 
   CONSTRAINT     e   ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT "PK_cd30fe76a384e74b42b68df0e3b" PRIMARY KEY (cc);
 Q   ALTER TABLE ONLY public.buyers DROP CONSTRAINT "PK_cd30fe76a384e74b42b68df0e3b";
       public            postgres    false    218            C           2606    73854 ,   login_history PK_fe377f36d49c39547cb6b9f0727 
   CONSTRAINT     l   ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT "PK_fe377f36d49c39547cb6b9f0727" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.login_history DROP CONSTRAINT "PK_fe377f36d49c39547cb6b9f0727";
       public            postgres    false    223            D           2606    65734 +   transactions FK_78bae806ae4d6043d68e793995c    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "FK_78bae806ae4d6043d68e793995c" FOREIGN KEY ("buyerCc") REFERENCES public.buyers(cc);
 W   ALTER TABLE ONLY public.transactions DROP CONSTRAINT "FK_78bae806ae4d6043d68e793995c";
       public          postgres    false    220    4671    218            E           2606    65739 +   transactions FK_95a3123a71b104358217366f49a    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "FK_95a3123a71b104358217366f49a" FOREIGN KEY (car_id) REFERENCES public.cars(_id);
 W   ALTER TABLE ONLY public.transactions DROP CONSTRAINT "FK_95a3123a71b104358217366f49a";
       public          postgres    false    217    4669    220            F           2606    73855 ,   login_history FK_ad9ce49cb73c0b33746a56b6bd1    FK CONSTRAINT     �   ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT "FK_ad9ce49cb73c0b33746a56b6bd1" FOREIGN KEY (user_id) REFERENCES public.users(_id);
 X   ALTER TABLE ONLY public.login_history DROP CONSTRAINT "FK_ad9ce49cb73c0b33746a56b6bd1";
       public          postgres    false    223    4667    215            �   �   x�}�I
�0E��)z��K�����	�Ӂ&���P;P:@�Z|�=�,���!�Wߟ��z7�<)&��]U��ƺ����H��o���F����i�c��*��p˂RoT[Q��t�:���Z��rfe�~>�`*��/�)�5%	}4Z�'iDP      �   �  x����n� �3~�\�6�,E�U����2�q�6��ݪ���ewUEM.9������̿"�4�-I)%~?���uM3�k�yK۞W>�����x�:�9��o8N���c��V�lKޯ_�f������u�?Sس<����(ӼE�X
�&z@��Z�DɔJ+	��G��>��S�#����4�����r�JRe�� #X�zr��� ��C<|!���=���>�y���(���#��-_U�2�;�P�UM-h힖��N�]�ɺ�W��Ĳ�
��Ҏ}S���� �R��)B�K:@#����C���D2�O�L����[��@:r;��*��+Y��9�1��GWE5zl-<wŎ�F�HS��S�o�Z^��E�+$zS��5�E��d��Ȳ$[R[�Rk2�|K^���W�Z�d �Y㋱r���>��V�?+�^a{k����O�����#{Y�ڷJ��ꪪ���3�      �   F   x�e̱�0�ڜ"X e�	4K��#���x��dN=��
V����o*���c��m���<,���� �jl      �   w   x�}��C1�P�x��mQK��#N�HOF{@;��x��Fh����Y���F�*�2��2���tR���o�ycXQ�ї�9�~T�ww|�h��U�
�L�	�{�-�GW�'�7(      �   Z   x��̱� ��n
��;$C8��Ha7��%Oh���M���\e\��I
���l��H<B� V���ٟ��%wX��l��/�#�     