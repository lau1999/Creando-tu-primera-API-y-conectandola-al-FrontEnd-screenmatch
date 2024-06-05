PGDMP      *                |            alura_series    15.7    16.3                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16398    alura_series    DATABASE        CREATE DATABASE alura_series WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE alura_series;
                postgres    false            �            1259    16471    autores    TABLE     �   CREATE TABLE public.autores (
    id bigint NOT NULL,
    fallecimiento integer,
    nacimiento integer,
    nombre character varying(255)
);
    DROP TABLE public.autores;
       public         heap    postgres    false            �            1259    16470    autores_id_seq    SEQUENCE     w   CREATE SEQUENCE public.autores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.autores_id_seq;
       public          postgres    false    219            !           0    0    autores_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.autores_id_seq OWNED BY public.autores.id;
          public          postgres    false    218            �            1259    16412 	   episodios    TABLE     �   CREATE TABLE public.episodios (
    id bigint NOT NULL,
    evaluacion double precision,
    fecha_de_lanzamiento date,
    numero_episodio integer,
    temporada integer,
    titulo character varying(255),
    serie_id bigint
);
    DROP TABLE public.episodios;
       public         heap    postgres    false            �            1259    16411    episodios_id_seq    SEQUENCE     y   CREATE SEQUENCE public.episodios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.episodios_id_seq;
       public          postgres    false    217            "           0    0    episodios_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.episodios_id_seq OWNED BY public.episodios.id;
          public          postgres    false    216            �            1259    16477    libros    TABLE     �  CREATE TABLE public.libros (
    id bigint NOT NULL,
    copyright character varying(255),
    descargas integer,
    idioma character varying(255),
    titulo character varying(255),
    autor_id bigint,
    CONSTRAINT libros_idioma_check CHECK (((idioma)::text = ANY ((ARRAY['ES'::character varying, 'FR'::character varying, 'EN'::character varying, 'PT'::character varying])::text[])))
);
    DROP TABLE public.libros;
       public         heap    postgres    false            �            1259    16400    series    TABLE       CREATE TABLE public.series (
    id bigint NOT NULL,
    actores character varying(255),
    evaluacion double precision,
    genero character varying(255),
    poster character varying(255),
    sinopsis character varying(255),
    titulo character varying(255),
    total_temporadas integer,
    CONSTRAINT series_genero_check CHECK (((genero)::text = ANY ((ARRAY['ACCION'::character varying, 'ROMANCE'::character varying, 'COMEDIA'::character varying, 'DRAMA'::character varying, 'CRIMEN'::character varying])::text[])))
);
    DROP TABLE public.series;
       public         heap    postgres    false            �            1259    16399    series_id_seq    SEQUENCE     v   CREATE SEQUENCE public.series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.series_id_seq;
       public          postgres    false    215            #           0    0    series_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.series_id_seq OWNED BY public.series.id;
          public          postgres    false    214            u           2604    16474 
   autores id    DEFAULT     h   ALTER TABLE ONLY public.autores ALTER COLUMN id SET DEFAULT nextval('public.autores_id_seq'::regclass);
 9   ALTER TABLE public.autores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            t           2604    16415    episodios id    DEFAULT     l   ALTER TABLE ONLY public.episodios ALTER COLUMN id SET DEFAULT nextval('public.episodios_id_seq'::regclass);
 ;   ALTER TABLE public.episodios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            s           2604    16403 	   series id    DEFAULT     f   ALTER TABLE ONLY public.series ALTER COLUMN id SET DEFAULT nextval('public.series_id_seq'::regclass);
 8   ALTER TABLE public.series ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    16471    autores 
   TABLE DATA           H   COPY public.autores (id, fallecimiento, nacimiento, nombre) FROM stdin;
    public          postgres    false    219   ?%                 0    16412 	   episodios 
   TABLE DATA           w   COPY public.episodios (id, evaluacion, fecha_de_lanzamiento, numero_episodio, temporada, titulo, serie_id) FROM stdin;
    public          postgres    false    217   3&                 0    16477    libros 
   TABLE DATA           T   COPY public.libros (id, copyright, descargas, idioma, titulo, autor_id) FROM stdin;
    public          postgres    false    220   �@                 0    16400    series 
   TABLE DATA           m   COPY public.series (id, actores, evaluacion, genero, poster, sinopsis, titulo, total_temporadas) FROM stdin;
    public          postgres    false    215   [B       $           0    0    autores_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.autores_id_seq', 9, true);
          public          postgres    false    218            %           0    0    episodios_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.episodios_id_seq', 705, true);
          public          postgres    false    216            &           0    0    series_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.series_id_seq', 7, true);
          public          postgres    false    214                       2606    16476    autores autores_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.autores DROP CONSTRAINT autores_pkey;
       public            postgres    false    219            }           2606    16417    episodios episodios_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.episodios
    ADD CONSTRAINT episodios_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.episodios DROP CONSTRAINT episodios_pkey;
       public            postgres    false    217            �           2606    16484    libros libros_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.libros DROP CONSTRAINT libros_pkey;
       public            postgres    false    220            y           2606    16408    series series_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.series DROP CONSTRAINT series_pkey;
       public            postgres    false    215            �           2606    16486 $   autores uk_bmqig88fabri853omysia6j3t 
   CONSTRAINT     a   ALTER TABLE ONLY public.autores
    ADD CONSTRAINT uk_bmqig88fabri853omysia6j3t UNIQUE (nombre);
 N   ALTER TABLE ONLY public.autores DROP CONSTRAINT uk_bmqig88fabri853omysia6j3t;
       public            postgres    false    219            {           2606    16410 #   series uk_sujdgbuv4embh3cjvu1sux7ri 
   CONSTRAINT     `   ALTER TABLE ONLY public.series
    ADD CONSTRAINT uk_sujdgbuv4embh3cjvu1sux7ri UNIQUE (titulo);
 M   ALTER TABLE ONLY public.series DROP CONSTRAINT uk_sujdgbuv4embh3cjvu1sux7ri;
       public            postgres    false    215            �           2606    16418 %   episodios fk8031rj1wc9dgbh8a9mr6env2m    FK CONSTRAINT     �   ALTER TABLE ONLY public.episodios
    ADD CONSTRAINT fk8031rj1wc9dgbh8a9mr6env2m FOREIGN KEY (serie_id) REFERENCES public.series(id);
 O   ALTER TABLE ONLY public.episodios DROP CONSTRAINT fk8031rj1wc9dgbh8a9mr6env2m;
       public          postgres    false    3193    215    217            �           2606    16487 "   libros fkspm6r4x8iif19d9gjsrvwev65    FK CONSTRAINT     �   ALTER TABLE ONLY public.libros
    ADD CONSTRAINT fkspm6r4x8iif19d9gjsrvwev65 FOREIGN KEY (autor_id) REFERENCES public.autores(id);
 L   ALTER TABLE ONLY public.libros DROP CONSTRAINT fkspm6r4x8iif19d9gjsrvwev65;
       public          postgres    false    3199    220    219               �   x�5�Kj�@�ךS�L���g�4�	�Yt��H�t�<��4��z�ʄ������С���~FN��PbU��6�ˍ�ȃ���X����<q�GV)5F,=�I�����r�K��l�8~���>:��5���^O>�"+��%j}���J�
��Y�s�{�l�m���Õi&}
�STb�j3��J�=0w�=��^�ϣ�9�3���R���N�            x��[�n�H�}f��;@[ ��~Y�b[nK�Ve�0��PU)G,�@������8���gw�A{x����e�$(N��Dq�.�?AL��6���!��Ǳ~���ɔ)!K�����n��-#����ô������/�����8Z��*��Q&RB}����>��s�ndpD�-}AN��<�m��ւ�h��cc:
aO��M��������XEq��L�\��yh֐C��!eP�\m�o�NdUZ/cm̼3��	Ά�65Ђw� X⎗B��0���{�Ǧ��t1I1!)����4��̝�M��hÇ~�.�����$K�v�ư�³��!��X,���7�����gQoU�5|B�"|_?��d%
�ʐ��-韾'QD��Aگ�t���m/�N�8��B�����t���P� �q�e,����vXۮ��:L��ϕ`�����A�I�Z2�%X줳��Y{�I����H5���5�`�I�Of@d����0�u-�u�A���@g�Ѕ��u�S�u؜v��zhD����|&K�Uz��G���o���:���DM�!=��7}�M���c�3	�[v�Δ��R)����LY�l�#l7����6�4�ܐ�����`��R9^�(!�����ǘm;�ڷ��;G�5�d��f�w�D���/�A�F��w�z
����^��6<s�(��r6���4�C3�/m��^�7�����J� A	�	�b�?�l�i@R���������a��=ר�����q
W�f�q���$
�XQ_��lĢHe�NU� z�o�~c�OO�ߌJg��8����h�IL6k�@t�������Cg���ɝm��g5}� ���ڒD(�\��6��/�d�d|�� 	��dS�L�e3��W[Y��:\L�
b���@:���a�o_��������R0��;-$ӝ��a�#��' 툵{k) �v�˔X���D�V�Z�+����N����,�-�`8�g�v��;�%�,��������;A�fc8(f���z��n�a
aI�G���A��YlD����ٶ�N#�4 ��nD��s��貀Q���<�/{A][��$)�2�N	۠�Á���N�}
GE���I&�%�d��8W�n��p5�r��}�#�y��t�nB�4�QZ����TKv�L�LP3����'i��@�MG�H�? ���{(����b_(C�Y�S�[fzs�\�U �Ų��1��ҶX*3�L��Lrv�l�5 �!���
��^雥���m�&���IiƘ�pV��ԝ�� ��X�ܗ�~o;d,�+�8K���C����֏t��O�N��˩f����c�u.~d�q�pz�VdV9�s���t��V������yË^�ΣWs#v�s���J��͛Re��m|�0��hxV@p� ���V�2�r���&pRr��}Z��(��{0OՍ�K'~��mݶ5	��l��)3�Q�����Rv3ص��<_L'V�g���F4�C	M�K.8Qg���t��j�3Ψ }��#�
��ҫ���] u]@X!p�9+b���t12ȕ��O;�u��E�c�_�L�4���m�0�9���0ʴm(���i�D�k�Iq��HGfd��r�~��}ڞ�� �k@�`㴂��tNq�9<��;J)"}�sJ�ȣcB���b���ZYgCO�#���k:ϴ�[u�C�h1S�f͎z>4{
��[g��z����ȉT=�N"ˈ�qP���d����}�S86Nkp�PH�d[򅐒�A%.?\�����$BbY�׋��.$��G� �>��;��q�O�Ih�Ym�~�w��%P����&>4�<��`k,����\��t����c
�K����	�M-���t ��'0��� ޑ��g2=z�ډ1`�IW$L2j�~���_+PQ�`?{�4����q25����o��c-J6f]�qzzJ{���L��@I߉�A�s��ݥ ���~���N���bQ�������(���
L����ĕ�h͗��=����k�U9�+x�ok;(�羮������x{���wr&�{������	��C׌[� �O)Q�j1���fOI�_���w��޲�ɀ�cb�W	a+��pq'�?�l����>2v�\)�y���I"��
���z�ڕK�x3`T��@�>��we�=�W}7ĺr f�`�l���9G�������_	��) ��B��Fr�_fD��{J^��!��$pԊÎ?�m?ʂ^MR���A�ɷx{[�(Cg/�|�+]�O��awi�K
&)h1�B�T���Yl4{�����H��ֵ�0"��8y�\�k�!�7��y��4�xT���wA�~oܞ}0�1%���e&�t�f$�#�m1"5"�f�|�m�͠�-$�K��x�sWӔS���H�sAμ�H� �����$�|YQ�%�(��+bK㉸V�b�teJ
v�#��+h,dȗL�zA�J����a~F!����n�1�ٿ��c� �ŷ��/����Ved2w#eP�0#p�Z���P?�ۙ|QH�Q;~�%P��0�X���8�.�0r��j9A��i���֗no�3�\sN��1�ŏDIN�!�/��Y�?95p�F��`cgŹ�.���{A�E�I_KR����4I�Zs�	\���˵�U���bɼ�����I�K;�xɳz�Z��r#�s��g^�R<�.6�|�틾\5'�]�B�^7P.*�2�̉w�� g���I8�X?��o�q��.��HDВci��վoZ�`�ݡJPx(�n��Ӿp� �,�B2[g��k�q�#M��8�.*g����EHy��e�x��钯��d՝��;dUξ�v�tx��q#�f[j�N�9p��4u�z��'�?ɼ�~?�N3şю��ؒ�i�9�T�("�IF��P9;�i�~
R��7�9Α�_�Ɔ�݋��QFR�ΐ�_ں������A�R��E�T3g"Z���r�8�!k��t�fD�j1��i�~�X7��
Q�������mJRT,�V��p����8���X�#�'��J����e����-#JQ��}��9�yN�4k�"�P�fD�����F��b9C�u��O����RH��W3.�t.�AH�=�!�&_F8���%ӌL�CA�����(#V{�-]PN?y��
�C��i�����iW�(�(��m2G�"c�����i�áeBɷ�W�c,�����tbP �B$����y+g q8t�'����0�D�2��(I��X�N"�X>��$ܦ����wKD��0��Mp�ª"�jo-�/F&�9-�����b~IT�>�J	)o���/��='��Mpݬ�8���YC,p��l��G�S�?<��,�e�����k
��v�wm���4ƾ=����BofA�YE�T7]�1�a�&�H��% 7�H$�1�˃�%WfT�;t��3K�fe��M(�d�����@	!�Y�!��'��@�.� �ݻ�CcӍ�Ua�.�R���>u���N��A��S���n|OgS�Q -�}#������[+��0Z�)]�̄1��CiU	�z *;��Q��m�աwH���|W��s���������|���[(��P?Ch�܀c#�+�X"�Fq����a��h���z�T�d�D�&�/�E�7�#�����lT������������۾�MP��K�����������v��+vZ�b��T�o
�7X7����]Hj:��b!C�Q�}7C�9���z���;��<����ɹO����;��ʃ9�ȱ&3�H��ϓE�t)��v
�����x�d%��@:.f`\�-��c�᫓��������>�|h+��ctU���}�E�,��R�����l.}6x�UO�
O7@�2�Ř:/c�P��]�i�wX����S.���1u]0rV��{G�)�:�Mב ��b�ST!T�Y=�6��Q?A�T�R��z���/�[H�ل�(�;Lt;�'��U�Kiܒ��vT��}���M����%�����s0�B���0V���gH� lB������� 
  �d�Ɨ[>���jKٍl�5 d�,�͎��j��W�DH��ݾ�ֲ�u��f�=��
�4�Ar�},�ơ?·��dfq$�C�P�7'.�
YQ��#G�i�}{�$�O�J�)7����^���x���m㛇���1F�Z��P��H��W�Jm-іA�{K1�> '�N�I��ʮ)j�]��C3��zǌ���H���h�k<�AkQ��@(��>�AoQK�ߚ�2�,�Q�k���&>U���9��}L���i�F�l�����-�$ V��\t���$��Ӿ�`I�jg�}�����|dI
睕>�1p.�{�j�ܾ���#��C#	_���b$đ���@�ӌ�Ai�.8!��0p�zxӬ�f`����nPN�Gq�����m�kk5����A8VH�T;��ޝ>M��3L��_���h���RW����O@ؚ'�D�.�뇦��bVG�4W��xM꽁*3��&��;D����aF}���}����E�'��e�L!�} b����jK�x��>,��٘9�$� ��Qb�`�Y�"����*��2�n� �U�R_�Vn,mPT(��e�Z!��Tڠ��~���
���D�]M�+���r�fZ��������DR?.5��ƕ���}�;�y8o���N45<E�r��S��}pe�Ęǯ��l�~�pĻ&��b"���QY��q�����ؽ��9r���/Z�O�"m{��s6�w��uy�X�.�j����N0��>V�ݖ��޷��E��(���r�/��L͈ؗ�~K�}E���?����*��݆pӊ���$�R��V��{�Z������A��q;a@���y?N���D|�D �d�႟\��ss����pf�{c_�:ҥr��b�frw�o.?��{ȇ����a����������m=����~�B<RY�X��۩��tH`���bWm]��	�z6,\�C�/��z@�!+����.�y�WqW�L�r�M�t>+�97�VQF�7��l��LsJ������E, *[B
�,UG��π��O^��BJ�s/+�ш��jX�>�Ց��?��WqH���yN_t���� עX�R�	?�0����k6Կ��xl�;A�V]�X=+�S�]C)<����t��ۈ]+��*β�5�I${��,�/�(0_����J�l�	��گ�6_e�Px7^�}O�\��g�AѨ%_��n�,�*fc��I�M���v��k��Ԍ�n�Eı<�=�i:����Z-�>F����0���u�<�R��\���� ���J�]3na*y���We��)	ՙ��`\}��}����S%"�ϒ��0�&��(�X���[N��nQ��#ҁ��$�����*`#y��[�8X��O�Hȗ���X̕ �g�r�O�� ӕ��x�J�������C�sj	4ݧ�%IZR���幔�s�p�C�D@��lK�����Tg��)5��{$���y5�A]ribC�b����ncR1AS�0H7�!KEH���a�3[ꇉ朘Vo���#�5��&|<!jNw�B�eP�=_|sy*����� O�}�i��.4�*"U����AV�f���HE��ɗ�+��P/GKw�X_V���5��ã�\�q��u3;��.��L���� pQJC���M������U����$�����E�)%>��_��a�{���V���ߊ|�k�a���t9�G�������!��Y�\^�i�[IA;�<W�1��W����v����P-��T���^�E/�p�V��Ci&�b�Ts^�T7Î��ͦ���W8�eY��WO���q�&Y0?����?S �ж�_W�ĿUh�Gtzrzr{r}����N�^Yx)������m��h��HB�HM9��	+5X�cd��0��\A�4:�A�̜��R;O��WfN���?*b��۸b�����)G���q�q�p�&������A5�K�@t�B�����U�b�\�(��v��fx����������+'�a�'y�w�<ie�,�q���ٕ�e����Q_چ�PP���ޖ.�1Kd��Y�٦��n�
��n��on�l����ѩ��q����3�Q o_P-�q��Y�%j�:�i�;��� ��kwSs/��U˧{�8\Q����#�[�G��6.c�M�������s��w��
G�m� /�#d�����5U��IS�&�9�C�s懨�o���ƥ&�FK�ē�ه���F�G�lM/����{�w4^��`��S�4�o����-A)O<(���pP��7%�����|[Pʫ7�"z[P*�7�¼1(ɛ�R��%(��R��5(�ۂRQ�5(������MA����J�T&oJ���xP*���ҽ�4�k�o2�D���~��]��(~�]����ū�x���������1����y����Y �Ŧ��H�����#��m7�J��^�	_E�"
��8x�m�{��b�*^���㴘��fa����+�0��o]-q^�hk�t"�#c�%I:_�����JmN~�q��BY��c�y12��t��'�;KC��o��V��W+Տj�z�V��ǵRD��V���RDo�J��V�����N~�����>�         �  x�=�=r�0�k�ۥQ4I�G]"مGI�e�\�끰 t��H|���(�i0;ط߼ݧ�2Gc�*o�\�|O=�q=<>M=u(�̳,�*U^�R�<�;�>�G�,���/��za=ћg���=C�o	_�R��Wv+��ޭA�"����:vѐ��AL�#�a4>.��lώ:�o\?�BV�j�w���b��C$C7��
���������a~E�eQ֪y�T�8<�u�3�.��x��p�ޥ�`������_KӒ;MƄ�NӲڈ���;!U���k���p��ܛ���&�7��0>{�BVTRiU\�鲭���|F��t7Y�(j�SD"�)eQ�m���`4gN[r� �J}�y^苄�����n����R�����         6  x����r�8���)��!H�̪�C'6MbBLuU���-,K�$��̓̋͑�E�鞪T
YW׾�ι�ƛ\pJƂꜵ�f�&.sAS��%Q�ej��>vz�p<�//��`���.:K8�����Ī����k����y�#��6�m
�w��d~��g��mЛ֛��&�gb1��/��z��ǳ�-_��`?<��y1��|{������v;�C�\2"�V0���fȎ��%;�I���JuDA6cDP��vd��T�MN�a*�s&-a��̖ZBwƖ�z�(]PyI�w	&%�oF�r��V��C���S�NW��9��Mf��tG�r�M���:i��`g|�?�ɉ�އ���ݬ�)�s��S0�v���f"�G�߯�A-�`�<�a�{���}�^�0�b��sTm��T���֐+Ր���Rh	)*ǒ+l���c�HSIQ���V+�O�%9Q�Xݜ�Q]��S�HŨÍ��|J��+�)O���~�o2l�^bܞi>EŌ�����޵�ތ�	U@��l��i�6��$5�(��}g�M���׵�_���L�A��/nGT�$��M���g쥷�~�Z�Cbع�BT��hΤÑҊX� ?�	�u�xa����-���j&��J��ȉ�a������b˒&�1CnZԲ�7R�����dّ�1E� Ș�;nb(��$���pir�}��:��:!�p:��E���i�a=l��FPZPgY���A���Qd���� ��`��,`S�+��T���$g��!I��q)�bgp�Y#�(�55����Ă��!�Kz8hu��`��!�v�Up�e��B$Z4��>�n=G�� �DJ%�d�Jm�D*�:��7�ܗ�V'���q��<گ�~[�Xl\�s<=m�S�X?g�~#��Q��i��p�э_G�q�)!��b�X�G���Û�Y���3�'��.M�k�r��R0�N�{B�wZ�p]Z���D{�*\T��D;�wA��V��rһ��y_H�/��*�2�P��jo��h���'��<���,�o���>�E6�W��	8둸�\��.�`}�����i��:'��~�_~z��)<2��D`�����*��E�n���`�0�����늠���!--8��r�١�
_��	E��Tz���WG09E?F?A��z�������Vu��~oj1ŻQv�U����)�����}ܽ��y+E�����[v�f���Bm�����I�9�ѸHY	^7��M���&K�)��1P,Z*Ⱁ������L�͠)� ���Q�@��X����|pK�_����i�Z�"��     