--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: create_freeword_data(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_freeword_data() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
  new.FREEWORD_DATA = (
    coalesce(new.TOUROKUMEI, '') || ' ' ||
    coalesce(new.TOUROKUMEI_YOMI, '') || ' ' ||
    coalesce(new.HONMYOU, '') || ' ' ||
    coalesce(new.HONMYOU_YOMI, '') || ' ' ||
    coalesce(new.HITSUMEI, '') || ' ' ||
    coalesce(new.HITSUMEI_YOMI, '') || ' ' ||
    coalesce(new.SHUSSEI_TODOUHUKEN, '') || ' ' ||
    coalesce(new.SHUSSEI_SHICHOU, '') || ' ' ||
    coalesce(new.SHUSSHIN_TODOUHUKEN, '') || ' ' ||
    coalesce(new.SHUSSHIN_SHICHOU, '') || ' ' ||
    coalesce(new.GAKUREKI, '') || ' ' ||
    coalesce(new.GENSHOKU, '') || ' ' ||
    coalesce(new.SENKYOKU, '') || ' ' ||
    coalesce(new.KAIHA, '') || ' ' ||
    coalesce(new.SEITOU, '') || ' ' ||
    coalesce(new.SHOZOKU, '') || ' ' ||
    coalesce(new.MOTOSHOKU, '') || ' ' ||
    coalesce(new.KEIREKI, '') || ' ' ||
    coalesce(new.SENMON_BUNYA, '') || ' ' ||
    coalesce(new.GYOUSEKI, '') || ' ' ||
    coalesce(new.GAKUI, '') || ' ' ||
    coalesce(new.JUSHOU, '') || ' ' ||
    coalesce(new.JITAKU_JUUSHO, '') || ' ' ||
    coalesce(new.JITAKU_MEISHOU, '') || ' ' ||
    coalesce(new.RENRAKUSAKI_JUUSHO, '') || ' ' ||
    coalesce(new.RENRAKUSAKI_MEISHOU, '') || ' ' ||
    coalesce(new.SOUHUSAKI_JUUSHO, '') || ' ' ||
    coalesce(new.SOUHUSAKI_MEISHOU, '') || ' ' ||
    coalesce(new.HOMEPAGE, '') || ' ' ||
    coalesce(new.SHUMI, '') || ' ' ||
    coalesce(new.BIKOU, '') || ' ' ||
    coalesce(new.ASAHI_JINBUTSU_JITEN, '') || ' ' ||
    coalesce(new.KAKUSI_KEISAI_KIJI, ''));
  return new;
end;
$$;


ALTER FUNCTION public.create_freeword_data() OWNER TO postgres;

--
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.plpgsql_call_handler() RETURNS language_handler
    LANGUAGE c
    AS '$libdir/plpgsql', 'plpgsql_call_handler';


ALTER FUNCTION public.plpgsql_call_handler() OWNER TO postgres;

--
-- Name: plpgsql_validator(oid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.plpgsql_validator(oid) RETURNS void
    LANGUAGE c
    AS '$libdir/plpgsql', 'plpgsql_validator';


ALTER FUNCTION public.plpgsql_validator(oid) OWNER TO postgres;

--
-- Name: set_jinbutu_crosssearch(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_jinbutu_crosssearch() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    NEW.crosssearch := concat_ws(' ',
      translate(NEW.tourokumei,'　',''),
      NEW.honmyou,
      NEW.hitsumei,
      translate(NEW.tourokumeiyomi,'・',''),
      NEW.honmyouyomi,
      NEW.hitsumeiyomi,
      NEW.jitakuad,
      NEW.jitakumeishou,
      NEW.shumi,
      NEW.genshoku,
      NEW.shozoku,
      NEW.kaiha,
      NEW.seitou,
      NEW.motoshoku,
      NEW.keireki,
      NEW.gyouseki,
      NEW.gakui,
      NEW.jushou
    );
    RETURN NEW;
  END;
$$;


ALTER FUNCTION public.set_jinbutu_crosssearch() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: delete_personal_info; Type: TABLE; Schema: public; Owner: postgres
--

create table public.delete_personal_info (
"input_code" character varying(11) not null,
"class_code" character varying(55),
"tourokumei" character varying(30) not null,
"tourokumei_yomi" character varying(30) not null,
"honmyou" character varying(30),
"honmyou_yomi" character varying(30),
"hitsumei" character varying(30),
"hitsumei_yomi" character varying(30),
"seiji_setsumei" character varying(100),
"seibetsu" character varying(2),
"seinengappi" character(8),
"wareki_seinen" character varying(6),
"shussei_todouhuken" character varying(20),
"shussei_shichou" character varying(150),
"shusshin_todouhuken" character varying(20),
"shusshin_shichou" character varying(150),
"shibou_nichiji" character(8),
"gakureki" character varying(1000),
"genshoku" character varying(1000),
"senkyoku" character varying(50),
"kaiha" character varying(50),
"seitou" character varying(50),
"tousen_kaisuu" integer,
"shozoku" character varying(1000),
"motoshoku" character varying(1000),
"keireki" text,
"senmon_bunya" character varying(1000),
"gyouseki" text,
"gakui" character varying(1000),
"jushou" text,
"jitaku_yuubinbangou" character(7),
"jitaku_juusho" character varying(100),
"jitaku_meishou" character varying(100),
"jitaku_denwa" character varying(20),
"jitaku_fax" character varying(20),
"renrakusaki_yuubinbangou" character(7),
"renrakusaki_juusho" character varying(200),
"renrakusaki_meishou" character varying(100),
"renrakusaki_denwa" character varying(20),
"renrakusaki_denwa_shurui" character(1),
"renrakusaki_denwa_naisen" character varying(12),
"renrakusaki_fax" character varying(20),
"renrakusaki_fax_shurui" character(1),
"keitaidenwa" character varying(20),
"email" character varying(200),
"homepage" character varying(200),
"souhusaki_yuubinbangou" character(7),
"souhusaki_juusho" character varying(200),
"souhusaki_meishou" character varying(100),
"souhusaki_denwa" character varying(20),
"souhusaki_denwa_shurui" character(1),
"souhusaki_denwa_naisen" character varying(12),
"souhusaki_fax" character varying(20),
"souhusaki_fax_shurui" character(1),
"shumi" character varying(120),
"kakusi_keisai_kiji" character varying(6144),
"bikou" text,
"asahi_jinbutsu_jiten" text,
"henshuubu_tyuu" character varying(100),
"kouteki_shokumusha_flag" character(1),
"minkan_chomeijin_flag" character(1),
"research_atena_flag" character(1),
"research_atesaki_flag" character(1),
"input_date" timestamp(6) without time zone,
"input_author" character varying(20),
"create_method" character varying(40),
"new_create_date" timestamp(6) without time zone,
"new_create_status" character(1),
"new_create_author" character varying(50),
"maintenance_date" timestamp(6) without time zone,
"maintenance_author" character varying(50),
"checker_date" timestamp(6) without time zone,
"checker_status" character(1),
"checker_author" character varying(50),
"new_create_approve_date" timestamp(6) without time zone,
"new_create_approver" character varying(50),
"maintenance_approve_date" timestamp(6) without time zone,
"maintenance_approver" character varying(50),
"checker_approve_date" timestamp(6) without time zone,
"checker_approver" character varying(50),
"update_date" timestamp(6) without time zone not null,
"update_history" text,
"message_history" text,
"publication_history" character varying(100),
"latest_research_year" character(4),
"latest_research_send_date" timestamp(6) without time zone,
"latest_research_recv_date" timestamp(6) without time zone,
"maintenance_priority" character(1),
"maintenance_research_status" character(1),
"maintenance_modify_date" timestamp(6) without time zone,
"maintenance_modifier" character varying(50),
"honmyou_pub" character(1),
"hitsumei_pub" character(1),
"seiji_setsumei_pub" character(1),
"seibetsu_pub" character(1),
"seinengappi_pub" character(1),
"shussei_todouhuken_pub" character(1),
"shussei_shichou_pub" character(1),
"shusshin_todouhuken_pub" character(1),
"shusshin_shichou_pub" character(1),
"gakureki_pub" character(1),
"genshoku_pub" character(1),
"shozoku_pub" character(1),
"motoshoku_pub" character(1),
"keireki_pub" character(1),
"senmon_bunya_pub" character(1),
"gyouseki_pub" character(1),
"gakui_pub" character(1),
"jushou_pub" character(1),
"jitaku_juusho_pub" character(1),
"jitaku_denwa_pub" character(1),
"jitaku_fax_pub" character(1),
"renrakusaki_juusho_pub" character(1),
"renrakusaki_denwa_pub" character(1),
"renrakusaki_fax_pub" character(1),
"keitaidenwa_pub" character(1),
"email_pub" character(1),
"homepage_pub" character(1),
"souhusaki_juusho_pub" character(1),
"souhusaki_denwa_pub" character(1),
"souhusaki_fax_pub" character(1),
"shumi_pub" character(1),
"jinbutsu_pub" character(1),
"delete_date" character varying(50),
"maintenance_verify_date" timestamp(6) without time zone,
"maintenance_verify_author" character varying(50),
"intai_flag" character(1),
primary key ("input_code")
);
comment on table "public"."delete_personal_info" is '削除済人物情報テーブル';
comment on column "public"."delete_personal_info"."input_code" is 'データコード';
comment on column "public"."delete_personal_info"."class_code" is '分野コード';
comment on column "public"."delete_personal_info"."tourokumei" is '登録名';
comment on column "public"."delete_personal_info"."tourokumei_yomi" is '登録名読み';
comment on column "public"."delete_personal_info"."honmyou" is '本名';
comment on column "public"."delete_personal_info"."honmyou_yomi" is '本名読み';
comment on column "public"."delete_personal_info"."hitsumei" is '芸名・筆名';
comment on column "public"."delete_personal_info"."hitsumei_yomi" is '芸名・筆名読み';
comment on column "public"."delete_personal_info"."seiji_setsumei" is '正字説明';
comment on column "public"."delete_personal_info"."seibetsu" is '性別';
comment on column "public"."delete_personal_info"."seinengappi" is '生年月日';
comment on column "public"."delete_personal_info"."wareki_seinen" is '和暦生年';
comment on column "public"."delete_personal_info"."shussei_todouhuken" is '出生都道府県';
comment on column "public"."delete_personal_info"."shussei_shichou" is '出生市町';
comment on column "public"."delete_personal_info"."shusshin_todouhuken" is '出身都道府県';
comment on column "public"."delete_personal_info"."shusshin_shichou" is '出身市町';
comment on column "public"."delete_personal_info"."shibou_nichiji" is '死亡日時';
comment on column "public"."delete_personal_info"."gakureki" is '学歴';
comment on column "public"."delete_personal_info"."genshoku" is '現職';
comment on column "public"."delete_personal_info"."senkyoku" is '選挙区';
comment on column "public"."delete_personal_info"."kaiha" is '院内会派';
comment on column "public"."delete_personal_info"."seitou" is '政党';
comment on column "public"."delete_personal_info"."tousen_kaisuu" is '当選回数';
comment on column "public"."delete_personal_info"."shozoku" is '所属';
comment on column "public"."delete_personal_info"."motoshoku" is '元職';
comment on column "public"."delete_personal_info"."keireki" is '経歴';
comment on column "public"."delete_personal_info"."senmon_bunya" is '専門分野';
comment on column "public"."delete_personal_info"."gyouseki" is '業績';
comment on column "public"."delete_personal_info"."gakui" is '学位';
comment on column "public"."delete_personal_info"."jushou" is '受賞';
comment on column "public"."delete_personal_info"."jitaku_yuubinbangou" is '自宅郵便番号';
comment on column "public"."delete_personal_info"."jitaku_juusho" is '自宅住所';
comment on column "public"."delete_personal_info"."jitaku_meishou" is '自宅名称';
comment on column "public"."delete_personal_info"."jitaku_denwa" is '自宅電話';
comment on column "public"."delete_personal_info"."jitaku_fax" is '自宅ファクス';
comment on column "public"."delete_personal_info"."renrakusaki_yuubinbangou" is '連絡先1郵便番号';
comment on column "public"."delete_personal_info"."renrakusaki_juusho" is '連絡先1住所';
comment on column "public"."delete_personal_info"."renrakusaki_meishou" is '連絡先1名称';
comment on column "public"."delete_personal_info"."renrakusaki_denwa" is '連絡先1電話';
comment on column "public"."delete_personal_info"."renrakusaki_denwa_shurui" is '連絡先1電話種類';
comment on column "public"."delete_personal_info"."renrakusaki_denwa_naisen" is '連絡先1電話内線';
comment on column "public"."delete_personal_info"."renrakusaki_fax" is '連絡先1ファクス';
comment on column "public"."delete_personal_info"."renrakusaki_fax_shurui" is '連絡先1ファクス種類';
comment on column "public"."delete_personal_info"."keitaidenwa" is '携帯電話';
comment on column "public"."delete_personal_info"."email" is '電子メール';
comment on column "public"."delete_personal_info"."homepage" is 'ホームページ';
comment on column "public"."delete_personal_info"."souhusaki_yuubinbangou" is '連絡先2郵便番号';
comment on column "public"."delete_personal_info"."souhusaki_juusho" is '連絡先2住所';
comment on column "public"."delete_personal_info"."souhusaki_meishou" is '連絡先2名称';
comment on column "public"."delete_personal_info"."souhusaki_denwa" is '連絡先2電話';
comment on column "public"."delete_personal_info"."souhusaki_denwa_shurui" is '連絡先2電話種類';
comment on column "public"."delete_personal_info"."souhusaki_denwa_naisen" is '連絡先2電話内線';
comment on column "public"."delete_personal_info"."souhusaki_fax" is '連絡先2ファクス';
comment on column "public"."delete_personal_info"."souhusaki_fax_shurui" is '連絡先2ファクス種類';
comment on column "public"."delete_personal_info"."shumi" is '趣味';
comment on column "public"."delete_personal_info"."kakusi_keisai_kiji" is '対朝日新聞';
comment on column "public"."delete_personal_info"."bikou" is '備考';
comment on column "public"."delete_personal_info"."asahi_jinbutsu_jiten" is '朝日人物事典';
comment on column "public"."delete_personal_info"."henshuubu_tyuu" is '編集部注';
comment on column "public"."delete_personal_info"."kouteki_shokumusha_flag" is '公的職務者フラグ';
comment on column "public"."delete_personal_info"."minkan_chomeijin_flag" is '民間著名人フラグ';
comment on column "public"."delete_personal_info"."research_atena_flag" is '調査票宛名フラグ';
comment on column "public"."delete_personal_info"."research_atesaki_flag" is '調査票宛先フラグ';
comment on column "public"."delete_personal_info"."input_date" is '記入日';
comment on column "public"."delete_personal_info"."input_author" is '記入担当者';
comment on column "public"."delete_personal_info"."create_method" is '作成法';
comment on column "public"."delete_personal_info"."new_create_date" is '新規追加編集日付';
comment on column "public"."delete_personal_info"."new_create_status" is '新規追加状況フラグ';
comment on column "public"."delete_personal_info"."new_create_author" is '新規追加者名';
comment on column "public"."delete_personal_info"."maintenance_date" is 'メンテ入力日付';
comment on column "public"."delete_personal_info"."maintenance_author" is 'メンテ入力者名';
comment on column "public"."delete_personal_info"."checker_date" is 'チェッカー入力日付';
comment on column "public"."delete_personal_info"."checker_status" is 'チェッカー処理状況フラグ';
comment on column "public"."delete_personal_info"."checker_author" is 'チェッカー入力者名';
comment on column "public"."delete_personal_info"."new_create_approve_date" is '新規追加確認日付';
comment on column "public"."delete_personal_info"."new_create_approver" is '新規追加確認者名';
comment on column "public"."delete_personal_info"."maintenance_approve_date" is 'メンテ確認日付';
comment on column "public"."delete_personal_info"."maintenance_approver" is 'メンテ確認者名';
comment on column "public"."delete_personal_info"."checker_approve_date" is 'チェッカー確認日付';
comment on column "public"."delete_personal_info"."checker_approver" is 'チェッカー確認者名';
comment on column "public"."delete_personal_info"."update_date" is '更新日';
comment on column "public"."delete_personal_info"."update_history" is '更新履歴';
comment on column "public"."delete_personal_info"."message_history" is '通信履歴';
comment on column "public"."delete_personal_info"."publication_history" is '過去の公開可否';
comment on column "public"."delete_personal_info"."latest_research_year" is '最近調査票年度';
comment on column "public"."delete_personal_info"."latest_research_send_date" is '最近調査票送信日時';
comment on column "public"."delete_personal_info"."latest_research_recv_date" is '最近調査票返信日時';
comment on column "public"."delete_personal_info"."maintenance_priority" is 'メンテ優先度';
comment on column "public"."delete_personal_info"."maintenance_research_status" is 'メンテ調査ステータス';
comment on column "public"."delete_personal_info"."maintenance_modify_date" is 'メンテ編集作業日';
comment on column "public"."delete_personal_info"."maintenance_modifier" is 'メンテ編集担当者名';
comment on column "public"."delete_personal_info"."honmyou_pub" is '本名公開フラグ';
comment on column "public"."delete_personal_info"."hitsumei_pub" is '筆名公開フラグ';
comment on column "public"."delete_personal_info"."seiji_setsumei_pub" is '正字説明公開フラグ';
comment on column "public"."delete_personal_info"."seibetsu_pub" is '性別公開フラグ';
comment on column "public"."delete_personal_info"."seinengappi_pub" is '生年月日公開フラグ';
comment on column "public"."delete_personal_info"."shussei_todouhuken_pub" is '出生都道府県公開フラグ';
comment on column "public"."delete_personal_info"."shussei_shichou_pub" is '出生市町公開フラグ';
comment on column "public"."delete_personal_info"."shusshin_todouhuken_pub" is '出身都道府県公開フラグ';
comment on column "public"."delete_personal_info"."shusshin_shichou_pub" is '出身市町公開フラグ';
comment on column "public"."delete_personal_info"."gakureki_pub" is '学歴公開フラグ';
comment on column "public"."delete_personal_info"."genshoku_pub" is '現職公開フラグ';
comment on column "public"."delete_personal_info"."shozoku_pub" is '所属公開フラグ';
comment on column "public"."delete_personal_info"."motoshoku_pub" is '元職公開フラグ';
comment on column "public"."delete_personal_info"."keireki_pub" is '経歴公開フラグ';
comment on column "public"."delete_personal_info"."senmon_bunya_pub" is '専門分野公開フラグ';
comment on column "public"."delete_personal_info"."gyouseki_pub" is '業績公開フラグ';
comment on column "public"."delete_personal_info"."gakui_pub" is '学位公開フラグ';
comment on column "public"."delete_personal_info"."jushou_pub" is '受賞公開フラグ';
comment on column "public"."delete_personal_info"."jitaku_juusho_pub" is '自宅住所公開フラグ';
comment on column "public"."delete_personal_info"."jitaku_denwa_pub" is '自宅電話公開フラグ';
comment on column "public"."delete_personal_info"."jitaku_fax_pub" is '自宅ファクス公開フラグ';
comment on column "public"."delete_personal_info"."renrakusaki_juusho_pub" is '連絡先1住所公開フラグ';
comment on column "public"."delete_personal_info"."renrakusaki_denwa_pub" is '連絡先1電話公開フラグ';
comment on column "public"."delete_personal_info"."renrakusaki_fax_pub" is '連絡先1ファクス公開フラグ';
comment on column "public"."delete_personal_info"."keitaidenwa_pub" is '携帯電話公開フラグ';
comment on column "public"."delete_personal_info"."email_pub" is '電子メール公開フラグ';
comment on column "public"."delete_personal_info"."homepage_pub" is 'ホームページ公開フラグ';
comment on column "public"."delete_personal_info"."souhusaki_juusho_pub" is '連絡先2住所公開フラグ';
comment on column "public"."delete_personal_info"."souhusaki_denwa_pub" is '連絡先2電話公開フラグ';
comment on column "public"."delete_personal_info"."souhusaki_fax_pub" is '連絡先2ファクス公開フラグ';
comment on column "public"."delete_personal_info"."shumi_pub" is '趣味公開フラグ';
comment on column "public"."delete_personal_info"."jinbutsu_pub" is '人物情報公開フラグ';
comment on column "public"."delete_personal_info"."delete_date" is '削除日';
comment on column "public"."delete_personal_info"."maintenance_verify_date" is 'メンテ点検入力日付';
comment on column "public"."delete_personal_info"."maintenance_verify_author" is 'メンテ点検入力者名';
comment on column "public"."delete_personal_info"."intai_flag" is '引退フラグ';





ALTER TABLE public.delete_personal_info OWNER TO postgres;

--
-- Name: input_code; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.input_code
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999
    CACHE 1;


ALTER TABLE public.input_code OWNER TO postgres;

--
-- Name: jinbutu; Type: TABLE; Schema: public; Owner: postgres
--

create table public.jinbutu (
"koushinbi" character varying(10),
"inputcode" character varying(11) not null,
"classcode" character varying(55),
"tourokumei" character varying(30),
"tourokumeiyomi" character varying(30),
"honmyou" character varying(39),
"honmyouyomi" character varying(30),
"hitsumei" character varying(30),
"hitsumeiyomi" character varying(30),
"sex" character varying(2),
"birthday" character varying(10),
"birthnengou" character varying(3),
"token" character varying(20),
"shigun" character varying(150),
"jitakuzip" character varying(8),
"jitakuad" character varying(100),
"jitakumeishou" character varying(100),
"jitakutel" character varying(20),
"jitakufax" character varying(20),
"renrakuzip" character varying(8),
"renrakuad" character varying(200),
"renrakumeishou" character varying(100),
"renrakutel" character varying(20),
"renrakuext" character varying(12),
"renrakufax" character varying(20),
"internet" character varying(150),
"shumi" character varying(120),
"fuki1" character varying(20),
"chousaday" character varying(10),
"senkyoku" character varying(50),
"kaiha" character varying(50),
"seitou" character varying(50),
"tousenkai" smallint,
"sakuseiho" character varying(40),
"tantou" character varying(20),
"henchuu" character varying(100),
"gakureki" text,
"genshoku" text,
"shozoku" text,
"motoshoku" text,
"senmon" text,
"gyouseki" text,
"gakui" text,
"jushou" text,
"keireki" text,
"token2" character varying(20),
"shigun2" character varying(150),
primary key ("inputcode")
);
comment on table "public"."jinbutu" is '商用人物情報テーブル';
comment on column "public"."jinbutu"."koushinbi" is '更新日';
comment on column "public"."jinbutu"."inputcode" is 'データコード';
comment on column "public"."jinbutu"."classcode" is '分野コード';
comment on column "public"."jinbutu"."tourokumei" is '登録名';
comment on column "public"."jinbutu"."tourokumeiyomi" is '登録名読み';
comment on column "public"."jinbutu"."honmyou" is '本名';
comment on column "public"."jinbutu"."honmyouyomi" is '本名読み';
comment on column "public"."jinbutu"."hitsumei" is '筆名';
comment on column "public"."jinbutu"."hitsumeiyomi" is '筆名読み';
comment on column "public"."jinbutu"."sex" is '性別';
comment on column "public"."jinbutu"."birthday" is '生年月日';
comment on column "public"."jinbutu"."birthnengou" is '和暦生年';
comment on column "public"."jinbutu"."token" is '出身都道府県';
comment on column "public"."jinbutu"."shigun" is '出身市町';
comment on column "public"."jinbutu"."jitakuzip" is '自宅郵便番号';
comment on column "public"."jinbutu"."jitakuad" is '自宅住所';
comment on column "public"."jinbutu"."jitakumeishou" is '自宅名称';
comment on column "public"."jinbutu"."jitakutel" is '自宅電話';
comment on column "public"."jinbutu"."jitakufax" is '自宅FAX';
comment on column "public"."jinbutu"."renrakuzip" is '連絡先郵便番号';
comment on column "public"."jinbutu"."renrakuad" is '連絡先住所';
comment on column "public"."jinbutu"."renrakumeishou" is '連絡先名称';
comment on column "public"."jinbutu"."renrakutel" is '連絡先電話';
comment on column "public"."jinbutu"."renrakuext" is '連絡先電話内線';
comment on column "public"."jinbutu"."renrakufax" is '連絡先FAX';
comment on column "public"."jinbutu"."internet" is '電子メール/ホームページ';
comment on column "public"."jinbutu"."shumi" is '趣味';
comment on column "public"."jinbutu"."fuki1" is '死亡日時';
comment on column "public"."jinbutu"."chousaday" is '記入日';
comment on column "public"."jinbutu"."senkyoku" is '選挙区';
comment on column "public"."jinbutu"."kaiha" is '会派';
comment on column "public"."jinbutu"."seitou" is '政党';
comment on column "public"."jinbutu"."tousenkai" is '当選回数';
comment on column "public"."jinbutu"."sakuseiho" is '作成法';
comment on column "public"."jinbutu"."tantou" is '記入担当者';
comment on column "public"."jinbutu"."henchuu" is '編集部注';
comment on column "public"."jinbutu"."gakureki" is '学歴';
comment on column "public"."jinbutu"."genshoku" is '現職';
comment on column "public"."jinbutu"."shozoku" is '所属';
comment on column "public"."jinbutu"."motoshoku" is '元職';
comment on column "public"."jinbutu"."senmon" is '専門';
comment on column "public"."jinbutu"."gyouseki" is '業績';
comment on column "public"."jinbutu"."gakui" is '学位';
comment on column "public"."jinbutu"."jushou" is '受賞';
comment on column "public"."jinbutu"."keireki" is '経歴';
comment on column "public"."jinbutu"."token2" is '出生都道府県';
comment on column "public"."jinbutu"."shigun2" is '出生市町';





ALTER TABLE public.jinbutu OWNER TO postgres;

--
-- Name: key; Type: TABLE; Schema: public; Owner: postgres
--

create table public.key (
"keyword" character varying(11) not null,
"data" text not null,
primary key ("keyword")
);
comment on table "public"."key" is '商用フリーワード検索用テーブル';
comment on column "public"."key"."keyword" is 'データコード';
comment on column "public"."key"."data" is '対象項目連結テキスト';



ALTER TABLE public.key OWNER TO postgres;

--
-- Name: maintenance_comment_info; Type: TABLE; Schema: public; Owner: postgres
--

create table public.maintenance_comment_info (
"research_id" character varying(50) not null,
"author" character varying(50) not null,
"input_date" timestamp(6) without time zone not null,
"comment_type" character(1) not null,
"item_name" character varying(30),
"resolution" character varying(30),
"comment" text,
primary key ("research_id","author","input_date")
);
comment on table "public"."maintenance_comment_info" is 'メンテナンスコメントテーブル';
comment on column "public"."maintenance_comment_info"."research_id" is '調査ID';
comment on column "public"."maintenance_comment_info"."author" is '入力者名';
comment on column "public"."maintenance_comment_info"."input_date" is '入力日時';
comment on column "public"."maintenance_comment_info"."comment_type" is 'コメント種類';
comment on column "public"."maintenance_comment_info"."item_name" is '項目名称';
comment on column "public"."maintenance_comment_info"."resolution" is '対応';
comment on column "public"."maintenance_comment_info"."comment" is 'コメント';



ALTER TABLE public.maintenance_comment_info OWNER TO postgres;

--
-- Name: maintenance_work_info; Type: TABLE; Schema: public; Owner: postgres
--

create table public.maintenance_work_info (
"research_pdf_id" integer not null,
"input_code" character varying(11) not null,
"research_year" character(4) not null,
"research_id" character varying(50) not null,
"returned_date" timestamp(6) without time zone not null,
"priority" character(1),
"status" character(1) not null,
"registrant" character varying(50),
"modify_date" timestamp(6) without time zone,
"modifier" character varying(50),
"approve_date" timestamp(6) without time zone,
"approver" character varying(50),
"verify_date" timestamp(6) without time zone,
"verifier" character varying(50),
primary key ("research_pdf_id")
);
comment on table "public"."maintenance_work_info" is 'メンテナンス作業テーブル';
comment on column "public"."maintenance_work_info"."research_pdf_id" is '調査票PDF';
comment on column "public"."maintenance_work_info"."input_code" is 'データコード';
comment on column "public"."maintenance_work_info"."research_year" is '調査票発送年度';
comment on column "public"."maintenance_work_info"."research_id" is '調査ID';
comment on column "public"."maintenance_work_info"."returned_date" is '調査票返送日';
comment on column "public"."maintenance_work_info"."priority" is '優先度';
comment on column "public"."maintenance_work_info"."status" is '処理状況';
comment on column "public"."maintenance_work_info"."registrant" is '調査票PDF登録作業者名';
comment on column "public"."maintenance_work_info"."modify_date" is '編集日時';
comment on column "public"."maintenance_work_info"."modifier" is '編集担当者名';
comment on column "public"."maintenance_work_info"."approve_date" is '確認日時';
comment on column "public"."maintenance_work_info"."approver" is '確認担当者名';
comment on column "public"."maintenance_work_info"."verify_date" is '点検日時';
comment on column "public"."maintenance_work_info"."verifier" is '点検担当者名';




ALTER TABLE public.maintenance_work_info OWNER TO postgres;

--
-- Name: maintenance_work_info_research_pdf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_work_info_research_pdf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maintenance_work_info_research_pdf_id_seq OWNER TO postgres;

--
-- Name: maintenance_work_info_research_pdf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_work_info_research_pdf_id_seq OWNED BY public.maintenance_work_info.research_pdf_id;


--
-- Name: public_personal_info; Type: TABLE; Schema: public; Owner: postgres
--

create table public.public_personal_info (
"input_code" character varying(11) not null,
"tourokumei" character varying(30) not null,
"tourokumei_yomi" character varying(30) not null,
"honmyou" character varying(30),
"honmyou_yomi" character varying(30),
"hitsumei" character varying(30),
"hitsumei_yomi" character varying(30),
"seiji_setsumei" character varying(100),
"seibetsu" character varying(2),
"seinengappi" character(8),
"wareki_seinen" character varying(6),
"shussei_todouhuken" character varying(20),
"shussei_shichou" character varying(150),
"shusshin_todouhuken" character varying(20),
"shusshin_shichou" character varying(150),
"shibou_nichiji" character(8),
"gakureki" character varying(1000),
"genshoku" character varying(1000),
"senkyoku" character varying(50),
"kaiha" character varying(50),
"seitou" character varying(50),
"tousen_kaisuu" integer,
"shozoku" character varying(1000),
"motoshoku" character varying(1000),
"keireki" text,
"senmon_bunya" character varying(1000),
"gyouseki" text,
"gakui" character varying(1000),
"jushou" text,
"jitaku_yuubinbangou" character(7),
"jitaku_juusho" character varying(100),
"jitaku_meishou" character varying(100),
"jitaku_denwa" character varying(20),
"jitaku_fax" character varying(20),
"renrakusaki_yuubinbangou" character(7),
"renrakusaki_juusho" character varying(200),
"renrakusaki_meishou" character varying(100),
"renrakusaki_denwa" character varying(20),
"renrakusaki_denwa_shurui" character(1),
"renrakusaki_denwa_naisen" character varying(12),
"renrakusaki_fax" character varying(20),
"renrakusaki_fax_shurui" character(1),
"keitaidenwa" character varying(20),
"email" character varying(200),
"homepage" character varying(200),
"souhusaki_yuubinbangou" character(7),
"souhusaki_juusho" character varying(200),
"souhusaki_meishou" character varying(100),
"souhusaki_denwa" character varying(20),
"souhusaki_denwa_shurui" character(1),
"souhusaki_denwa_naisen" character varying(12),
"souhusaki_fax" character varying(20),
"souhusaki_fax_shurui" character(1),
"shumi" character varying(120),
"kouteki_shokumusha_flag" character(1),
"minkan_chomeijin_flag" character(1),
"update_date" timestamp(6) without time zone not null,
"freeword_data" text,
"intai_flag" character(1),
primary key ("input_code")
);
comment on table "public"."public_personal_info" is '社内公開人物情報テーブル';
comment on column "public"."public_personal_info"."input_code" is 'データコード';
comment on column "public"."public_personal_info"."tourokumei" is '登録名';
comment on column "public"."public_personal_info"."tourokumei_yomi" is '登録名読み';
comment on column "public"."public_personal_info"."honmyou" is '本名';
comment on column "public"."public_personal_info"."honmyou_yomi" is '本名読み';
comment on column "public"."public_personal_info"."hitsumei" is '芸名・筆名';
comment on column "public"."public_personal_info"."hitsumei_yomi" is '芸名・筆名読み';
comment on column "public"."public_personal_info"."seiji_setsumei" is '正字説明';
comment on column "public"."public_personal_info"."seibetsu" is '性別';
comment on column "public"."public_personal_info"."seinengappi" is '生年月日';
comment on column "public"."public_personal_info"."wareki_seinen" is '和暦生年';
comment on column "public"."public_personal_info"."shussei_todouhuken" is '出生都道府県';
comment on column "public"."public_personal_info"."shussei_shichou" is '出生市市町';
comment on column "public"."public_personal_info"."shusshin_todouhuken" is '出身都道府県';
comment on column "public"."public_personal_info"."shusshin_shichou" is '出身市市町';
comment on column "public"."public_personal_info"."shibou_nichiji" is '死亡日時';
comment on column "public"."public_personal_info"."gakureki" is '学歴';
comment on column "public"."public_personal_info"."genshoku" is '現職';
comment on column "public"."public_personal_info"."senkyoku" is '選挙区';
comment on column "public"."public_personal_info"."kaiha" is '院内会派';
comment on column "public"."public_personal_info"."seitou" is '政党';
comment on column "public"."public_personal_info"."tousen_kaisuu" is '当選回数';
comment on column "public"."public_personal_info"."shozoku" is '所属';
comment on column "public"."public_personal_info"."motoshoku" is '元職';
comment on column "public"."public_personal_info"."keireki" is '経歴';
comment on column "public"."public_personal_info"."senmon_bunya" is '専門分野';
comment on column "public"."public_personal_info"."gyouseki" is '業績';
comment on column "public"."public_personal_info"."gakui" is '学位';
comment on column "public"."public_personal_info"."jushou" is '受賞';
comment on column "public"."public_personal_info"."jitaku_yuubinbangou" is '自宅郵便番号';
comment on column "public"."public_personal_info"."jitaku_juusho" is '自宅住所';
comment on column "public"."public_personal_info"."jitaku_meishou" is '自宅名称';
comment on column "public"."public_personal_info"."jitaku_denwa" is '自宅電話';
comment on column "public"."public_personal_info"."jitaku_fax" is '自宅ファクス';
comment on column "public"."public_personal_info"."renrakusaki_yuubinbangou" is '連絡先1郵便番号';
comment on column "public"."public_personal_info"."renrakusaki_juusho" is '連絡先1住所';
comment on column "public"."public_personal_info"."renrakusaki_meishou" is '連絡先1名称';
comment on column "public"."public_personal_info"."renrakusaki_denwa" is '連絡先1電話';
comment on column "public"."public_personal_info"."renrakusaki_denwa_shurui" is '連絡先1電話種類';
comment on column "public"."public_personal_info"."renrakusaki_denwa_naisen" is '連絡先1電話内線';
comment on column "public"."public_personal_info"."renrakusaki_fax" is '連絡先1ファクス';
comment on column "public"."public_personal_info"."renrakusaki_fax_shurui" is '連絡先1ファクス種類';
comment on column "public"."public_personal_info"."keitaidenwa" is '携帯電話';
comment on column "public"."public_personal_info"."email" is '電子メール';
comment on column "public"."public_personal_info"."homepage" is 'ホームページ';
comment on column "public"."public_personal_info"."souhusaki_yuubinbangou" is '連絡先2郵便番号';
comment on column "public"."public_personal_info"."souhusaki_juusho" is '連絡先2住所';
comment on column "public"."public_personal_info"."souhusaki_meishou" is '連絡先2名称';
comment on column "public"."public_personal_info"."souhusaki_denwa" is '連絡先2電話';
comment on column "public"."public_personal_info"."souhusaki_denwa_shurui" is '連絡先2電話種類';
comment on column "public"."public_personal_info"."souhusaki_denwa_naisen" is '連絡先2電話内線';
comment on column "public"."public_personal_info"."souhusaki_fax" is '連絡先2ファクス';
comment on column "public"."public_personal_info"."souhusaki_fax_shurui" is '連絡先2ファクス種類';
comment on column "public"."public_personal_info"."shumi" is '趣味';
comment on column "public"."public_personal_info"."kouteki_shokumusha_flag" is '公的職務者フラグ';
comment on column "public"."public_personal_info"."minkan_chomeijin_flag" is '民間著名人フラグ';
comment on column "public"."public_personal_info"."update_date" is '更新日';
comment on column "public"."public_personal_info"."freeword_data" is 'フリーワード検索項目連結テキスト';
comment on column "public"."public_personal_info"."intai_flag" is '引退フラグ';




ALTER TABLE public.public_personal_info OWNER TO postgres;

--
-- Name: research_history_info; Type: TABLE; Schema: public; Owner: postgres
--

create table public.research_history_info (
"input_code" character varying(11) not null,
"research_year" character(4) not null,
"send_date" timestamp(6) without time zone not null,
"research_id" integer not null,
"valid_date" timestamp(6) without time zone not null,
"sample_pattern" character(1) not null,
"print_status" character(1) not null,
"mail_status" character(1) not null,
"sms_status" character(1) not null,
primary key ("input_code","research_year","send_date")
);
comment on table "public"."research_history_info" is '調査票送付履歴テーブル';
comment on column "public"."research_history_info"."input_code" is 'データコード';
comment on column "public"."research_history_info"."research_year" is '調査年度';
comment on column "public"."research_history_info"."send_date" is '送付日時';
comment on column "public"."research_history_info"."research_id" is '調査ID';
comment on column "public"."research_history_info"."valid_date" is '回答期限';
comment on column "public"."research_history_info"."sample_pattern" is '入力例パターン';
comment on column "public"."research_history_info"."print_status" is '印刷送信状況';
comment on column "public"."research_history_info"."mail_status" is 'メール送信状況';
comment on column "public"."research_history_info"."sms_status" is 'SMS送信状況';


ALTER TABLE public.research_history_info OWNER TO postgres;


--
-- Name: view_jinbutu; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_jinbutu AS
 SELECT jinbutu.inputcode,
    jinbutu.classcode,
    jinbutu.tourokumei,
    jinbutu.tourokumeiyomi,
    translate((jinbutu.tourokumei)::text, '　'::text, ''::text) AS tourokumei2,
    translate((jinbutu.tourokumeiyomi)::text, '・'::text, ''::text) AS tourokumeiyomi2,
    jinbutu.honmyou,
    jinbutu.honmyouyomi,
    jinbutu.hitsumei,
    jinbutu.hitsumeiyomi,
    jinbutu.genshoku,
    jinbutu.kaiha,
    jinbutu.seitou,
    jinbutu.senkyoku,
    jinbutu.tousenkai,
    jinbutu.shozoku,
    jinbutu.motoshoku,
    jinbutu.jitakuzip,
    jinbutu.jitakuad,
    jinbutu.jitakumeishou,
    jinbutu.jitakutel,
    jinbutu.jitakufax,
    jinbutu.renrakuzip,
    jinbutu.renrakuad,
    jinbutu.renrakumeishou,
    jinbutu.renrakutel,
    jinbutu.renrakuext,
    jinbutu.renrakufax,
    jinbutu.internet,
    jinbutu.sex,
    jinbutu.birthday,
    jinbutu.fuki1,
    jinbutu.token,
    jinbutu.shigun,
    jinbutu.gakureki,
    jinbutu.keireki,
    jinbutu.gyouseki,
    jinbutu.gakui,
    jinbutu.jushou,
    jinbutu.shumi,
    jinbutu.koushinbi,
    jinbutu.token2,
    jinbutu.shigun2
   FROM public.jinbutu;


ALTER TABLE public.view_jinbutu OWNER TO postgres;

--
-- Name: work_personal_info; Type: TABLE; Schema: public; Owner: postgres
--

create table public.work_personal_info (
"input_code" character varying(11) not null,
"class_code" character varying(55),
"tourokumei" character varying(30) not null,
"tourokumei_yomi" character varying(30) not null,
"honmyou" character varying(30),
"honmyou_yomi" character varying(30),
"hitsumei" character varying(30),
"hitsumei_yomi" character varying(30),
"seiji_setsumei" character varying(100),
"seibetsu" character varying(2),
"seinengappi" character(8),
"wareki_seinen" character varying(6),
"shussei_todouhuken" character varying(20),
"shussei_shichou" character varying(150),
"shusshin_todouhuken" character varying(20),
"shusshin_shichou" character varying(150),
"shibou_nichiji" character(8),
"gakureki" character varying(1000),
"genshoku" character varying(1000),
"senkyoku" character varying(50),
"kaiha" character varying(50),
"seitou" character varying(50),
"tousen_kaisuu" integer,
"shozoku" character varying(1000),
"motoshoku" character varying(1000),
"keireki" text,
"senmon_bunya" character varying(1000),
"gyouseki" text,
"gakui" character varying(1000),
"jushou" text,
"jitaku_yuubinbangou" character(7),
"jitaku_juusho" character varying(100),
"jitaku_meishou" character varying(100),
"jitaku_denwa" character varying(20),
"jitaku_fax" character varying(20),
"renrakusaki_yuubinbangou" character(7),
"renrakusaki_juusho" character varying(200),
"renrakusaki_meishou" character varying(100),
"renrakusaki_denwa" character varying(20),
"renrakusaki_denwa_shurui" character(1),
"renrakusaki_denwa_naisen" character varying(12),
"renrakusaki_fax" character varying(20),
"renrakusaki_fax_shurui" character(1),
"keitaidenwa" character varying(20),
"email" character varying(200),
"homepage" character varying(200),
"souhusaki_yuubinbangou" character(7),
"souhusaki_juusho" character varying(200),
"souhusaki_meishou" character varying(100),
"souhusaki_denwa" character varying(20),
"souhusaki_denwa_shurui" character(1),
"souhusaki_denwa_naisen" character varying(12),
"souhusaki_fax" character varying(20),
"souhusaki_fax_shurui" character(1),
"shumi" character varying(120),
"kakusi_keisai_kiji" character varying(6144),
"bikou" text,
"asahi_jinbutsu_jiten" text,
"henshuubu_tyuu" character varying(100),
"kouteki_shokumusha_flag" character(1),
"minkan_chomeijin_flag" character(1),
"research_atena_flag" character(1),
"research_atesaki_flag" character(1),
"input_date" timestamp(6) without time zone,
"input_author" character varying(20),
"create_method" character varying(40),
"new_create_date" timestamp(6) without time zone,
"new_create_status" character(1),
"new_create_author" character varying(50),
"maintenance_date" timestamp(6) without time zone,
"maintenance_author" character varying(50),
"checker_date" timestamp(6) without time zone,
"checker_status" character(1),
"checker_author" character varying(50),
"new_create_approve_date" timestamp(6) without time zone,
"new_create_approver" character varying(50),
"maintenance_approve_date" timestamp(6) without time zone,
"maintenance_approver" character varying(50),
"checker_approve_date" timestamp(6) without time zone,
"checker_approver" character varying(50),
"update_date" timestamp(6) without time zone not null,
"update_history" text,
"message_history" text,
"publication_history" character varying(100),
"latest_research_year" character(4),
"latest_research_send_date" timestamp(6) without time zone,
"latest_research_recv_date" timestamp(6) without time zone,
"maintenance_priority" character(1),
"maintenance_research_status" character(1),
"maintenance_modify_date" timestamp(6) without time zone,
"maintenance_modifier" character varying(50),
"honmyou_pub" character(1),
"hitsumei_pub" character(1),
"seiji_setsumei_pub" character(1),
"seibetsu_pub" character(1),
"seinengappi_pub" character(1),
"shussei_todouhuken_pub" character(1),
"shussei_shichou_pub" character(1),
"shusshin_todouhuken_pub" character(1),
"shusshin_shichou_pub" character(1),
"gakureki_pub" character(1),
"genshoku_pub" character(1),
"shozoku_pub" character(1),
"motoshoku_pub" character(1),
"keireki_pub" character(1),
"senmon_bunya_pub" character(1),
"gyouseki_pub" character(1),
"gakui_pub" character(1),
"jushou_pub" character(1),
"jitaku_juusho_pub" character(1),
"jitaku_denwa_pub" character(1),
"jitaku_fax_pub" character(1),
"renrakusaki_juusho_pub" character(1),
"renrakusaki_denwa_pub" character(1),
"renrakusaki_fax_pub" character(1),
"keitaidenwa_pub" character(1),
"email_pub" character(1),
"homepage_pub" character(1),
"souhusaki_juusho_pub" character(1),
"souhusaki_denwa_pub" character(1),
"souhusaki_fax_pub" character(1),
"shumi_pub" character(1),
"jinbutsu_pub" character(1),
"freeword_data" text,
"maintenance_verify_date" timestamp(6) without time zone,
"maintenance_verify_author" character varying(50),
"intai_flag" character(1),
"expected_publish_date" timestamp(6) without time zone,
primary key ("input_code")
);
comment on table "public"."work_personal_info" is '処理中人物情報テーブル';
comment on column "public"."work_personal_info"."input_code" is 'データコード';
comment on column "public"."work_personal_info"."class_code" is '分野コード';
comment on column "public"."work_personal_info"."tourokumei" is '登録名';
comment on column "public"."work_personal_info"."tourokumei_yomi" is '登録名読み';
comment on column "public"."work_personal_info"."honmyou" is '本名';
comment on column "public"."work_personal_info"."honmyou_yomi" is '本名読み';
comment on column "public"."work_personal_info"."hitsumei" is '芸名・筆名';
comment on column "public"."work_personal_info"."hitsumei_yomi" is '芸名・筆名読み';
comment on column "public"."work_personal_info"."seiji_setsumei" is '正字説明';
comment on column "public"."work_personal_info"."seibetsu" is '性別';
comment on column "public"."work_personal_info"."seinengappi" is '生年月日';
comment on column "public"."work_personal_info"."wareki_seinen" is '和暦生年';
comment on column "public"."work_personal_info"."shussei_todouhuken" is '出生都道府県';
comment on column "public"."work_personal_info"."shussei_shichou" is '出生市町';
comment on column "public"."work_personal_info"."shusshin_todouhuken" is '出身都道府県';
comment on column "public"."work_personal_info"."shusshin_shichou" is '出身市町';
comment on column "public"."work_personal_info"."shibou_nichiji" is '死亡日時';
comment on column "public"."work_personal_info"."gakureki" is '学歴';
comment on column "public"."work_personal_info"."genshoku" is '現職';
comment on column "public"."work_personal_info"."senkyoku" is '選挙区';
comment on column "public"."work_personal_info"."kaiha" is '院内会派';
comment on column "public"."work_personal_info"."seitou" is '政党';
comment on column "public"."work_personal_info"."tousen_kaisuu" is '当選回数';
comment on column "public"."work_personal_info"."shozoku" is '所属';
comment on column "public"."work_personal_info"."motoshoku" is '元職';
comment on column "public"."work_personal_info"."keireki" is '経歴';
comment on column "public"."work_personal_info"."senmon_bunya" is '専門分野';
comment on column "public"."work_personal_info"."gyouseki" is '業績';
comment on column "public"."work_personal_info"."gakui" is '学位';
comment on column "public"."work_personal_info"."jushou" is '受賞';
comment on column "public"."work_personal_info"."jitaku_yuubinbangou" is '自宅郵便番号';
comment on column "public"."work_personal_info"."jitaku_juusho" is '自宅住所';
comment on column "public"."work_personal_info"."jitaku_meishou" is '自宅名称';
comment on column "public"."work_personal_info"."jitaku_denwa" is '自宅電話';
comment on column "public"."work_personal_info"."jitaku_fax" is '自宅ファクス';
comment on column "public"."work_personal_info"."renrakusaki_yuubinbangou" is '連絡先1郵便番号';
comment on column "public"."work_personal_info"."renrakusaki_juusho" is '連絡先1住所';
comment on column "public"."work_personal_info"."renrakusaki_meishou" is '連絡先1名称';
comment on column "public"."work_personal_info"."renrakusaki_denwa" is '連絡先1電話';
comment on column "public"."work_personal_info"."renrakusaki_denwa_shurui" is '連絡先1電話種類';
comment on column "public"."work_personal_info"."renrakusaki_denwa_naisen" is '連絡先1電話内線';
comment on column "public"."work_personal_info"."renrakusaki_fax" is '連絡先1ファクス';
comment on column "public"."work_personal_info"."renrakusaki_fax_shurui" is '連絡先1ファクス種類';
comment on column "public"."work_personal_info"."keitaidenwa" is '携帯電話';
comment on column "public"."work_personal_info"."email" is '電子メール';
comment on column "public"."work_personal_info"."homepage" is 'ホームページ';
comment on column "public"."work_personal_info"."souhusaki_yuubinbangou" is '連絡先2郵便番号';
comment on column "public"."work_personal_info"."souhusaki_juusho" is '連絡先2住所';
comment on column "public"."work_personal_info"."souhusaki_meishou" is '連絡先2名称';
comment on column "public"."work_personal_info"."souhusaki_denwa" is '連絡先2電話';
comment on column "public"."work_personal_info"."souhusaki_denwa_shurui" is '連絡先2電話種類';
comment on column "public"."work_personal_info"."souhusaki_denwa_naisen" is '連絡先2電話内線';
comment on column "public"."work_personal_info"."souhusaki_fax" is '連絡先2ファクス';
comment on column "public"."work_personal_info"."souhusaki_fax_shurui" is '連絡先2ファクス種類';
comment on column "public"."work_personal_info"."shumi" is '趣味';
comment on column "public"."work_personal_info"."kakusi_keisai_kiji" is '対朝日新聞';
comment on column "public"."work_personal_info"."bikou" is '備考';
comment on column "public"."work_personal_info"."asahi_jinbutsu_jiten" is '朝日人物事典';
comment on column "public"."work_personal_info"."henshuubu_tyuu" is '編集部注';
comment on column "public"."work_personal_info"."kouteki_shokumusha_flag" is '公的職務者フラグ';
comment on column "public"."work_personal_info"."minkan_chomeijin_flag" is '民間著名人フラグ';
comment on column "public"."work_personal_info"."research_atena_flag" is '調査票宛名フラグ';
comment on column "public"."work_personal_info"."research_atesaki_flag" is '調査票宛先フラグ';
comment on column "public"."work_personal_info"."input_date" is '記入日';
comment on column "public"."work_personal_info"."input_author" is '記入担当者';
comment on column "public"."work_personal_info"."create_method" is '作成法';
comment on column "public"."work_personal_info"."new_create_date" is '新規追加編集日付';
comment on column "public"."work_personal_info"."new_create_status" is '新規追加状況フラグ';
comment on column "public"."work_personal_info"."new_create_author" is '新規追加者名';
comment on column "public"."work_personal_info"."maintenance_date" is 'メンテ入力日付';
comment on column "public"."work_personal_info"."maintenance_author" is 'メンテ入力者名';
comment on column "public"."work_personal_info"."checker_date" is 'チェッカー入力日付';
comment on column "public"."work_personal_info"."checker_status" is 'チェッカー処理状況フラグ';
comment on column "public"."work_personal_info"."checker_author" is 'チェッカー入力者名';
comment on column "public"."work_personal_info"."new_create_approve_date" is '新規追加確認日付';
comment on column "public"."work_personal_info"."new_create_approver" is '新規追加確認者名';
comment on column "public"."work_personal_info"."maintenance_approve_date" is 'メンテ確認日付';
comment on column "public"."work_personal_info"."maintenance_approver" is 'メンテ確認者名';
comment on column "public"."work_personal_info"."checker_approve_date" is 'チェッカー確認日付';
comment on column "public"."work_personal_info"."checker_approver" is 'チェッカー確認者名';
comment on column "public"."work_personal_info"."update_date" is '更新日';
comment on column "public"."work_personal_info"."update_history" is '更新履歴';
comment on column "public"."work_personal_info"."message_history" is '通信履歴';
comment on column "public"."work_personal_info"."publication_history" is '過去の公開可否';
comment on column "public"."work_personal_info"."latest_research_year" is '最近調査票年度';
comment on column "public"."work_personal_info"."latest_research_send_date" is '最近調査票送信日時';
comment on column "public"."work_personal_info"."latest_research_recv_date" is '最近調査票返信日時';
comment on column "public"."work_personal_info"."maintenance_priority" is 'メンテ優先度';
comment on column "public"."work_personal_info"."maintenance_research_status" is 'メンテ調査ステータス';
comment on column "public"."work_personal_info"."maintenance_modify_date" is 'メンテ編集作業日';
comment on column "public"."work_personal_info"."maintenance_modifier" is 'メンテ編集担当者名';
comment on column "public"."work_personal_info"."honmyou_pub" is '本名公開フラグ';
comment on column "public"."work_personal_info"."hitsumei_pub" is '筆名公開フラグ';
comment on column "public"."work_personal_info"."seiji_setsumei_pub" is '正字説明公開フラグ';
comment on column "public"."work_personal_info"."seibetsu_pub" is '性別公開フラグ';
comment on column "public"."work_personal_info"."seinengappi_pub" is '生年月日公開フラグ';
comment on column "public"."work_personal_info"."shussei_todouhuken_pub" is '出生都道府県公開フラグ';
comment on column "public"."work_personal_info"."shussei_shichou_pub" is '出生市町公開フラグ';
comment on column "public"."work_personal_info"."shusshin_todouhuken_pub" is '出身都道府県公開フラグ';
comment on column "public"."work_personal_info"."shusshin_shichou_pub" is '出身市町公開フラグ';
comment on column "public"."work_personal_info"."gakureki_pub" is '学歴公開フラグ';
comment on column "public"."work_personal_info"."genshoku_pub" is '現職公開フラグ';
comment on column "public"."work_personal_info"."shozoku_pub" is '所属公開フラグ';
comment on column "public"."work_personal_info"."motoshoku_pub" is '元職公開フラグ';
comment on column "public"."work_personal_info"."keireki_pub" is '経歴公開フラグ';
comment on column "public"."work_personal_info"."senmon_bunya_pub" is '専門分野公開フラグ';
comment on column "public"."work_personal_info"."gyouseki_pub" is '業績公開フラグ';
comment on column "public"."work_personal_info"."gakui_pub" is '学位公開フラグ';
comment on column "public"."work_personal_info"."jushou_pub" is '受賞公開フラグ';
comment on column "public"."work_personal_info"."jitaku_juusho_pub" is '自宅住所公開フラグ';
comment on column "public"."work_personal_info"."jitaku_denwa_pub" is '自宅電話公開フラグ';
comment on column "public"."work_personal_info"."jitaku_fax_pub" is '自宅ファクス公開フラグ';
comment on column "public"."work_personal_info"."renrakusaki_juusho_pub" is '連絡先1住所公開フラグ';
comment on column "public"."work_personal_info"."renrakusaki_denwa_pub" is '連絡先1電話公開フラグ';
comment on column "public"."work_personal_info"."renrakusaki_fax_pub" is '連絡先1ファクス公開フラグ';
comment on column "public"."work_personal_info"."keitaidenwa_pub" is '携帯電話公開フラグ';
comment on column "public"."work_personal_info"."email_pub" is '電子メール公開フラグ';
comment on column "public"."work_personal_info"."homepage_pub" is 'ホームページ公開フラグ';
comment on column "public"."work_personal_info"."souhusaki_juusho_pub" is '連絡先2住所公開フラグ';
comment on column "public"."work_personal_info"."souhusaki_denwa_pub" is '連絡先2電話公開フラグ';
comment on column "public"."work_personal_info"."souhusaki_fax_pub" is '連絡先2ファクス公開フラグ';
comment on column "public"."work_personal_info"."shumi_pub" is '趣味公開フラグ';
comment on column "public"."work_personal_info"."jinbutsu_pub" is '人物情報公開フラグ';
comment on column "public"."work_personal_info"."freeword_data" is 'フリーワード検索項目連結テキスト';
comment on column "public"."work_personal_info"."maintenance_verify_date" is 'メンテ点検入力日付';
comment on column "public"."work_personal_info"."maintenance_verify_author" is 'メンテ点検入力者名';
comment on column "public"."work_personal_info"."intai_flag" is '引退フラグ';
comment on column "public"."work_personal_info"."expected_publish_date" is '公開予定日';




ALTER TABLE public.work_personal_info OWNER TO postgres;

--
-- Name: maintenance_work_info research_pdf_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_work_info ALTER COLUMN research_pdf_id SET DEFAULT nextval('public.maintenance_work_info_research_pdf_id_seq'::regclass);



--
-- Name: input_code; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.input_code', 19415, true);


--
-- Name: maintenance_work_info_research_pdf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_work_info_research_pdf_id_seq', 241566, true);



--
-- Name: birthday_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX birthday_idx ON public.jinbutu USING btree (birthday);


--
-- Name: classcode_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX classcode_idx ON public.jinbutu USING btree (classcode);


--
-- Name: genshoku_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX genshoku_idx ON public.jinbutu USING btree (genshoku);


--
-- Name: hitsumei_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitsumei_idx ON public.jinbutu USING btree (hitsumei);


--
-- Name: hitsumeiyomi_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitsumeiyomi_idx ON public.jinbutu USING btree (hitsumeiyomi);


--
-- Name: honmyou_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX honmyou_idx ON public.jinbutu USING btree (honmyou);


--
-- Name: honmyouyomi_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX honmyouyomi_idx ON public.jinbutu USING btree (honmyouyomi);


--
-- Name: inputcode_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inputcode_idx ON public.jinbutu USING btree (inputcode);


--
-- Name: jitakuad_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jitakuad_idx ON public.jinbutu USING btree (jitakuad);


--
-- Name: jitakumeishou_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jitakumeishou_idx ON public.jinbutu USING btree (jitakumeishou);


--
-- Name: maintenance_idx_input_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX maintenance_idx_input_code ON public.maintenance_work_info USING btree (input_code);


--
-- Name: maintenance_idx_research_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX maintenance_idx_research_year ON public.maintenance_work_info USING btree (research_year);


--
-- Name: maintenance_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX maintenance_idx_status ON public.maintenance_work_info USING btree (status);


--
-- Name: motoshoku_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX motoshoku_idx ON public.jinbutu USING btree (motoshoku);

--
-- Name: public_idx_genshoku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_genshoku ON public.public_personal_info USING btree (genshoku);


--
-- Name: public_idx_hitsumei; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_hitsumei ON public.public_personal_info USING btree (hitsumei);


--
-- Name: public_idx_hitsumei_yomi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_hitsumei_yomi ON public.public_personal_info USING btree (hitsumei_yomi);


--
-- Name: public_idx_honmyou; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_honmyou ON public.public_personal_info USING btree (honmyou);


--
-- Name: public_idx_honmyou_yomi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_honmyou_yomi ON public.public_personal_info USING btree (honmyou_yomi);


--
-- Name: public_idx_jitaku_juusho; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_jitaku_juusho ON public.public_personal_info USING btree (jitaku_juusho);


--
-- Name: public_idx_motoshoku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_motoshoku ON public.public_personal_info USING btree (motoshoku);


--
-- Name: public_idx_renrakusaki_juusho; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_renrakusaki_juusho ON public.public_personal_info USING btree (renrakusaki_juusho);


--
-- Name: public_idx_seiji_setsumei; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_seiji_setsumei ON public.public_personal_info USING btree (seiji_setsumei);


--
-- Name: public_idx_shozoku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_shozoku ON public.public_personal_info USING btree (shozoku);


--
-- Name: public_idx_souhusaki_juusho; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_souhusaki_juusho ON public.public_personal_info USING btree (souhusaki_juusho);


--
-- Name: public_idx_tourokumei; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_tourokumei ON public.public_personal_info USING btree (tourokumei);


--
-- Name: public_idx_tourokumei_yomi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_idx_tourokumei_yomi ON public.public_personal_info USING btree (tourokumei_yomi);


--
-- Name: research_history_idx_input_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX research_history_idx_input_code ON public.research_history_info USING btree (input_code);


--
-- Name: shozoku_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shozoku_idx ON public.jinbutu USING btree (shozoku);


--
-- Name: tourokumei_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tourokumei_idx ON public.jinbutu USING btree (tourokumei);


--
-- Name: tourokumeiyomi_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tourokumeiyomi_idx ON public.jinbutu USING btree (tourokumeiyomi);


--
-- Name: work_idx_checker_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_checker_status ON public.work_personal_info USING btree (checker_status);


--
-- Name: work_idx_class_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_class_code ON public.work_personal_info USING btree (class_code);


--
-- Name: work_idx_genshoku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_genshoku ON public.work_personal_info USING btree (genshoku);


--
-- Name: work_idx_hitsumei; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_hitsumei ON public.work_personal_info USING btree (hitsumei);


--
-- Name: work_idx_hitsumei_yomi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_hitsumei_yomi ON public.work_personal_info USING btree (hitsumei_yomi);


--
-- Name: work_idx_honmyou; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_honmyou ON public.work_personal_info USING btree (honmyou);


--
-- Name: work_idx_honmyou_yomi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_honmyou_yomi ON public.work_personal_info USING btree (honmyou_yomi);


--
-- Name: work_idx_jitaku_juusho; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_jitaku_juusho ON public.work_personal_info USING btree (jitaku_juusho);


--
-- Name: work_idx_jitaku_yuubinbangou; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_jitaku_yuubinbangou ON public.work_personal_info USING btree (jitaku_yuubinbangou);


--
-- Name: work_idx_latest_research_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_latest_research_year ON public.work_personal_info USING btree (latest_research_year);


--
-- Name: work_idx_motoshoku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_motoshoku ON public.work_personal_info USING btree (motoshoku);


--
-- Name: work_idx_new_create_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_new_create_status ON public.work_personal_info USING btree (new_create_status);


--
-- Name: work_idx_renrakusaki_juusho; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_renrakusaki_juusho ON public.work_personal_info USING btree (renrakusaki_juusho);


--
-- Name: work_idx_renrakusaki_meishou; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_renrakusaki_meishou ON public.work_personal_info USING btree (renrakusaki_meishou);


--
-- Name: work_idx_renrakusaki_yuubinban; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_renrakusaki_yuubinban ON public.work_personal_info USING btree (renrakusaki_yuubinbangou);


--
-- Name: work_idx_seiji_setsumei; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_seiji_setsumei ON public.work_personal_info USING btree (seiji_setsumei);


--
-- Name: work_idx_shozoku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_shozoku ON public.work_personal_info USING btree (shozoku);


--
-- Name: work_idx_souhusaki_juusho; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_souhusaki_juusho ON public.work_personal_info USING btree (souhusaki_juusho);


--
-- Name: work_idx_souhusaki_meishou; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_souhusaki_meishou ON public.work_personal_info USING btree (souhusaki_meishou);


--
-- Name: work_idx_souhusaki_yuubinbangou; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_souhusaki_yuubinbangou ON public.work_personal_info USING btree (souhusaki_yuubinbangou);


--
-- Name: work_idx_tourokumei; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_tourokumei ON public.work_personal_info USING btree (tourokumei);


--
-- Name: work_idx_tourokumei_yomi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_tourokumei_yomi ON public.work_personal_info USING btree (tourokumei_yomi);


--
-- Name: work_idx_update_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX work_idx_update_date ON public.work_personal_info USING btree (update_date);


--
-- Name: jinbutu jinbutu_crosssearch_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER jinbutu_crosssearch_trigger BEFORE INSERT OR UPDATE ON public.jinbutu FOR EACH ROW EXECUTE FUNCTION public.set_jinbutu_crosssearch();


--
-- Name: public_personal_info public_freeword_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER public_freeword_trigger BEFORE INSERT OR UPDATE ON public.public_personal_info FOR EACH ROW EXECUTE FUNCTION public.create_freeword_data();


--
-- Name: work_personal_info work_freeword_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER work_freeword_trigger BEFORE INSERT OR UPDATE ON public.work_personal_info FOR EACH ROW EXECUTE FUNCTION public.create_freeword_data();


create table public.public_personal_secret (
"input_code" character varying(11) not null,
"class_code" character varying(55),
"tourokumei" character varying(30) not null,
"tourokumei_yomi" character varying(30) not null,
"honmyou" character varying(30),
"honmyou_yomi" character varying(30),
"hitsumei" character varying(30),
"hitsumei_yomi" character varying(30),
"seiji_setsumei" character varying(100),
"seibetsu" character varying(2),
"seinengappi" character(8),
"wareki_seinen" character varying(6),
"shussei_todouhuken" character varying(20),
"shussei_shichou" character varying(150),
"shusshin_todouhuken" character varying(20),
"shusshin_shichou" character varying(150),
"shibou_nichiji" character(8),
"gakureki" character varying(1000),
"genshoku" character varying(1000),
"senkyoku" character varying(50),
"kaiha" character varying(50),
"seitou" character varying(50),
"tousen_kaisuu" integer,
"shozoku" character varying(1000),
"motoshoku" character varying(1000),
"keireki" text,
"senmon_bunya" character varying(1000),
"gyouseki" text,
"gakui" character varying(1000),
"jushou" text,
"jitaku_yuubinbangou" character(7),
"jitaku_juusho" character varying(100),
"jitaku_meishou" character varying(100),
"jitaku_denwa" character varying(20),
"jitaku_fax" character varying(20),
"renrakusaki_yuubinbangou" character(7),
"renrakusaki_juusho" character varying(200),
"renrakusaki_meishou" character varying(100),
"renrakusaki_denwa" character varying(20),
"renrakusaki_denwa_shurui" character(1),
"renrakusaki_denwa_naisen" character varying(12),
"renrakusaki_fax" character varying(20),
"renrakusaki_fax_shurui" character(1),
"keitaidenwa" character varying(20),
"email" character varying(200),
"homepage" character varying(200),
"souhusaki_yuubinbangou" character(7),
"souhusaki_juusho" character varying(200),
"souhusaki_meishou" character varying(100),
"souhusaki_denwa" character varying(20),
"souhusaki_denwa_shurui" character(1),
"souhusaki_denwa_naisen" character varying(12),
"souhusaki_fax" character varying(20),
"souhusaki_fax_shurui" character(1),
"shumi" character varying(120),
"kakusi_keisai_kiji" character varying(6144),
"bikou" text,
"kouteki_shokumusha_flag" character(1),
"minkan_chomeijin_flag" character(1),
"update_date" timestamp(6) without time zone not null,
"update_history" text,
"honmyou_pub" character(1),
"hitsumei_pub" character(1),
"seiji_setsumei_pub" character(1),
"seibetsu_pub" character(1),
"seinengappi_pub" character(1),
"shussei_todouhuken_pub" character(1),
"shussei_shichou_pub" character(1),
"shusshin_todouhuken_pub" character(1),
"shusshin_shichou_pub" character(1),
"gakureki_pub" character(1),
"genshoku_pub" character(1),
"shozoku_pub" character(1),
"motoshoku_pub" character(1),
"keireki_pub" character(1),
"senmon_bunya_pub" character(1),
"gyouseki_pub" character(1),
"gakui_pub" character(1),
"jushou_pub" character(1),
"jitaku_juusho_pub" character(1),
"jitaku_denwa_pub" character(1),
"jitaku_fax_pub" character(1),
"renrakusaki_juusho_pub" character(1),
"renrakusaki_denwa_pub" character(1),
"renrakusaki_fax_pub" character(1),
"keitaidenwa_pub" character(1),
"email_pub" character(1),
"homepage_pub" character(1),
"souhusaki_juusho_pub" character(1),
"souhusaki_denwa_pub" character(1),
"souhusaki_fax_pub" character(1),
"shumi_pub" character(1),
"jinbutsu_pub" character(1),
"freeword_data" text,
"intai_flag" character(1),
primary key ("input_code")
);
comment on table "public"."public_personal_secret" is '社内公開人物秘匿情報テーブル';
comment on column "public"."public_personal_secret"."input_code" is 'データコード';
comment on column "public"."public_personal_secret"."class_code" is '分野コード';
comment on column "public"."public_personal_secret"."tourokumei" is '登録名';
comment on column "public"."public_personal_secret"."tourokumei_yomi" is '登録名読み';
comment on column "public"."public_personal_secret"."honmyou" is '本名';
comment on column "public"."public_personal_secret"."honmyou_yomi" is '本名読み';
comment on column "public"."public_personal_secret"."hitsumei" is '芸名・筆名';
comment on column "public"."public_personal_secret"."hitsumei_yomi" is '芸名・筆名読み';
comment on column "public"."public_personal_secret"."seiji_setsumei" is '正字説明';
comment on column "public"."public_personal_secret"."seibetsu" is '性別';
comment on column "public"."public_personal_secret"."seinengappi" is '生年月日';
comment on column "public"."public_personal_secret"."wareki_seinen" is '和暦生年';
comment on column "public"."public_personal_secret"."shussei_todouhuken" is '出生都道府県';
comment on column "public"."public_personal_secret"."shussei_shichou" is '出生市市町';
comment on column "public"."public_personal_secret"."shusshin_todouhuken" is '出身都道府県';
comment on column "public"."public_personal_secret"."shusshin_shichou" is '出身市市町';
comment on column "public"."public_personal_secret"."shibou_nichiji" is '死亡日時';
comment on column "public"."public_personal_secret"."gakureki" is '学歴';
comment on column "public"."public_personal_secret"."genshoku" is '現職';
comment on column "public"."public_personal_secret"."senkyoku" is '選挙区';
comment on column "public"."public_personal_secret"."kaiha" is '院内会派';
comment on column "public"."public_personal_secret"."seitou" is '政党';
comment on column "public"."public_personal_secret"."tousen_kaisuu" is '当選回数';
comment on column "public"."public_personal_secret"."shozoku" is '所属';
comment on column "public"."public_personal_secret"."motoshoku" is '元職';
comment on column "public"."public_personal_secret"."keireki" is '経歴';
comment on column "public"."public_personal_secret"."senmon_bunya" is '専門分野';
comment on column "public"."public_personal_secret"."gyouseki" is '業績';
comment on column "public"."public_personal_secret"."gakui" is '学位';
comment on column "public"."public_personal_secret"."jushou" is '受賞';
comment on column "public"."public_personal_secret"."jitaku_yuubinbangou" is '自宅郵便番号';
comment on column "public"."public_personal_secret"."jitaku_juusho" is '自宅住所';
comment on column "public"."public_personal_secret"."jitaku_meishou" is '自宅名称';
comment on column "public"."public_personal_secret"."jitaku_denwa" is '自宅電話';
comment on column "public"."public_personal_secret"."jitaku_fax" is '自宅ファクス';
comment on column "public"."public_personal_secret"."renrakusaki_yuubinbangou" is '連絡先1郵便番号';
comment on column "public"."public_personal_secret"."renrakusaki_juusho" is '連絡先1住所';
comment on column "public"."public_personal_secret"."renrakusaki_meishou" is '連絡先1名称';
comment on column "public"."public_personal_secret"."renrakusaki_denwa" is '連絡先1電話';
comment on column "public"."public_personal_secret"."renrakusaki_denwa_shurui" is '連絡先1電話種類';
comment on column "public"."public_personal_secret"."renrakusaki_denwa_naisen" is '連絡先1電話内線';
comment on column "public"."public_personal_secret"."renrakusaki_fax" is '連絡先1ファクス';
comment on column "public"."public_personal_secret"."renrakusaki_fax_shurui" is '連絡先1ファクス種類';
comment on column "public"."public_personal_secret"."keitaidenwa" is '携帯電話';
comment on column "public"."public_personal_secret"."email" is '電子メール';
comment on column "public"."public_personal_secret"."homepage" is 'ホームページ';
comment on column "public"."public_personal_secret"."souhusaki_yuubinbangou" is '連絡先2郵便番号';
comment on column "public"."public_personal_secret"."souhusaki_juusho" is '連絡先2住所';
comment on column "public"."public_personal_secret"."souhusaki_meishou" is '連絡先2名称';
comment on column "public"."public_personal_secret"."souhusaki_denwa" is '連絡先2電話';
comment on column "public"."public_personal_secret"."souhusaki_denwa_shurui" is '連絡先2電話種類';
comment on column "public"."public_personal_secret"."souhusaki_denwa_naisen" is '連絡先2電話内線';
comment on column "public"."public_personal_secret"."souhusaki_fax" is '連絡先2ファクス';
comment on column "public"."public_personal_secret"."souhusaki_fax_shurui" is '連絡先2ファクス種類';
comment on column "public"."public_personal_secret"."shumi" is '趣味';
comment on column "public"."public_personal_secret"."kakusi_keisai_kiji" is '対朝日新聞';
comment on column "public"."public_personal_secret"."bikou" is '備考';
comment on column "public"."public_personal_secret"."kouteki_shokumusha_flag" is '公的職務者フラグ';
comment on column "public"."public_personal_secret"."minkan_chomeijin_flag" is '民間著名人フラグ';
comment on column "public"."public_personal_secret"."update_date" is '更新日';
comment on column "public"."public_personal_secret"."update_history" is '更新履歴';
comment on column "public"."public_personal_secret"."honmyou_pub" is '本名公開フラグ';
comment on column "public"."public_personal_secret"."hitsumei_pub" is '筆名公開フラグ';
comment on column "public"."public_personal_secret"."seiji_setsumei_pub" is '正字説明公開フラグ';
comment on column "public"."public_personal_secret"."seibetsu_pub" is '性別公開フラグ';
comment on column "public"."public_personal_secret"."seinengappi_pub" is '生年月日公開フラグ';
comment on column "public"."public_personal_secret"."shussei_todouhuken_pub" is '出生都道府県公開フラグ';
comment on column "public"."public_personal_secret"."shussei_shichou_pub" is '出生市市町公開フラグ';
comment on column "public"."public_personal_secret"."shusshin_todouhuken_pub" is '出身都道府県公開フラグ';
comment on column "public"."public_personal_secret"."shusshin_shichou_pub" is '出身市市町公開フラグ';
comment on column "public"."public_personal_secret"."gakureki_pub" is '学歴公開フラグ';
comment on column "public"."public_personal_secret"."genshoku_pub" is '現職公開フラグ';
comment on column "public"."public_personal_secret"."shozoku_pub" is '所属公開フラグ';
comment on column "public"."public_personal_secret"."motoshoku_pub" is '元職公開フラグ';
comment on column "public"."public_personal_secret"."keireki_pub" is '経歴公開フラグ';
comment on column "public"."public_personal_secret"."senmon_bunya_pub" is '専門分野公開フラグ';
comment on column "public"."public_personal_secret"."gyouseki_pub" is '業績公開フラグ';
comment on column "public"."public_personal_secret"."gakui_pub" is '学位公開フラグ';
comment on column "public"."public_personal_secret"."jushou_pub" is '受賞公開フラグ';
comment on column "public"."public_personal_secret"."jitaku_juusho_pub" is '自宅住所公開フラグ';
comment on column "public"."public_personal_secret"."jitaku_denwa_pub" is '自宅電話公開フラグ';
comment on column "public"."public_personal_secret"."jitaku_fax_pub" is '自宅ファクス公開フラグ';
comment on column "public"."public_personal_secret"."renrakusaki_juusho_pub" is '連絡先1住所公開フラグ';
comment on column "public"."public_personal_secret"."renrakusaki_denwa_pub" is '連絡先1電話公開フラグ';
comment on column "public"."public_personal_secret"."renrakusaki_fax_pub" is '連絡先1ファクス公開フラグ';
comment on column "public"."public_personal_secret"."keitaidenwa_pub" is '携帯電話公開フラグ';
comment on column "public"."public_personal_secret"."email_pub" is '電子メール公開フラグ';
comment on column "public"."public_personal_secret"."homepage_pub" is 'ホームページ公開フラグ';
comment on column "public"."public_personal_secret"."souhusaki_juusho_pub" is '連絡先2住所公開フラグ';
comment on column "public"."public_personal_secret"."souhusaki_denwa_pub" is '連絡先2電話公開フラグ';
comment on column "public"."public_personal_secret"."souhusaki_fax_pub" is '連絡先2ファクス公開フラグ';
comment on column "public"."public_personal_secret"."shumi_pub" is '趣味公開フラグ';
comment on column "public"."public_personal_secret"."jinbutsu_pub" is '人物情報公開フラグ';
comment on column "public"."public_personal_secret"."freeword_data" is 'フリーワード検索項目連結テキスト';
comment on column "public"."public_personal_secret"."intai_flag" is '引退フラグ';




create table public.webresearch_personal_info (
"research_id" character varying(50) not null,
"valid_date" timestamp(6) without time zone not null,
"input_code" character varying(11),
"class_code" character varying(55),
"tourokumei" character varying(30) not null,
"tourokumei_yomi" character varying(30) not null,
"honmyou" character varying(30),
"honmyou_yomi" character varying(30),
"hitsumei" character varying(30),
"hitsumei_yomi" character varying(30),
"seiji_setsumei" character varying(100),
"seibetsu" character varying(2),
"seinengappi" character(8),
"wareki_seinen" character varying(6),
"shussei_todouhuken" character varying(20),
"shussei_shichou" character varying(150),
"shusshin_todouhuken" character varying(20),
"shusshin_shichou" character varying(150),
"gakureki" character varying(1000),
"genshoku" character varying(1000),
"senkyoku" character varying(50),
"kaiha" character varying(50),
"seitou" character varying(50),
"tousen_kaisuu" integer,
"shozoku" character varying(1000),
"motoshoku" character varying(1000),
"keireki" text,
"senmon_bunya" character varying(1000),
"gyouseki" text,
"gakui" character varying(1000),
"jushou" text,
"jitaku_yuubinbangou" character(7),
"jitaku_juusho" character varying(100),
"jitaku_meishou" character varying(100),
"jitaku_denwa" character varying(20),
"jitaku_fax" character varying(20),
"renrakusaki_yuubinbangou" character(7),
"renrakusaki_juusho" character varying(200),
"renrakusaki_meishou" character varying(100),
"renrakusaki_denwa" character varying(20),
"renrakusaki_denwa_shurui" character(1),
"renrakusaki_denwa_naisen" character varying(12),
"renrakusaki_fax" character varying(20),
"renrakusaki_fax_shurui" character(1),
"keitaidenwa" character varying(20),
"email" character varying(200),
"homepage" character varying(200),
"souhusaki_yuubinbangou" character(7),
"souhusaki_juusho" character varying(200),
"souhusaki_meishou" character varying(100),
"souhusaki_denwa" character varying(20),
"souhusaki_denwa_shurui" character(1),
"souhusaki_denwa_naisen" character varying(12),
"souhusaki_fax" character varying(20),
"souhusaki_fax_shurui" character(1),
"shumi" character varying(120),
"bikou" text,
"kouteki_shokumusha_flag" character(1),
"update_date" timestamp(6) without time zone not null,
"latest_research_year" character(4),
"honmyou_pub" character(1),
"hitsumei_pub" character(1),
"seiji_setsumei_pub" character(1),
"seibetsu_pub" character(1),
"seinengappi_pub" character(1),
"shussei_todouhuken_pub" character(1),
"shussei_shichou_pub" character(1),
"shusshin_todouhuken_pub" character(1),
"shusshin_shichou_pub" character(1),
"gakureki_pub" character(1),
"genshoku_pub" character(1),
"shozoku_pub" character(1),
"motoshoku_pub" character(1),
"keireki_pub" character(1),
"senmon_bunya_pub" character(1),
"gyouseki_pub" character(1),
"gakui_pub" character(1),
"jushou_pub" character(1),
"jitaku_juusho_pub" character(1),
"jitaku_denwa_pub" character(1),
"jitaku_fax_pub" character(1),
"renrakusaki_juusho_pub" character(1),
"renrakusaki_denwa_pub" character(1),
"renrakusaki_fax_pub" character(1),
"keitaidenwa_pub" character(1),
"email_pub" character(1),
"homepage_pub" character(1),
"souhusaki_juusho_pub" character(1),
"souhusaki_denwa_pub" character(1),
"souhusaki_fax_pub" character(1),
"shumi_pub" character(1),
"jinbutsu_pub" character(1),
"answer_date" timestamp(6) without time zone,
primary key ("research_id")
);
comment on table "public"."webresearch_personal_info" is 'WEB回答テンポラリテーブル';
comment on column "public"."webresearch_personal_info"."research_id" is '調査ID';
comment on column "public"."webresearch_personal_info"."valid_date" is '調査期限日';
comment on column "public"."webresearch_personal_info"."input_code" is 'データコード';
comment on column "public"."webresearch_personal_info"."class_code" is '分野コード';
comment on column "public"."webresearch_personal_info"."tourokumei" is '登録名';
comment on column "public"."webresearch_personal_info"."tourokumei_yomi" is '登録名読み';
comment on column "public"."webresearch_personal_info"."honmyou" is '本名';
comment on column "public"."webresearch_personal_info"."honmyou_yomi" is '本名読み';
comment on column "public"."webresearch_personal_info"."hitsumei" is '芸名・筆名';
comment on column "public"."webresearch_personal_info"."hitsumei_yomi" is '芸名・筆名読み';
comment on column "public"."webresearch_personal_info"."seiji_setsumei" is '正字説明';
comment on column "public"."webresearch_personal_info"."seibetsu" is '性別';
comment on column "public"."webresearch_personal_info"."seinengappi" is '生年月日';
comment on column "public"."webresearch_personal_info"."wareki_seinen" is '和暦生年';
comment on column "public"."webresearch_personal_info"."shussei_todouhuken" is '出生都道府県';
comment on column "public"."webresearch_personal_info"."shussei_shichou" is '出生市町';
comment on column "public"."webresearch_personal_info"."shusshin_todouhuken" is '出身都道府県';
comment on column "public"."webresearch_personal_info"."shusshin_shichou" is '出身市町';
comment on column "public"."webresearch_personal_info"."gakureki" is '学歴';
comment on column "public"."webresearch_personal_info"."genshoku" is '現職';
comment on column "public"."webresearch_personal_info"."senkyoku" is '選挙区';
comment on column "public"."webresearch_personal_info"."kaiha" is '院内会派';
comment on column "public"."webresearch_personal_info"."seitou" is '政党';
comment on column "public"."webresearch_personal_info"."tousen_kaisuu" is '当選回数';
comment on column "public"."webresearch_personal_info"."shozoku" is '所属';
comment on column "public"."webresearch_personal_info"."motoshoku" is '元職';
comment on column "public"."webresearch_personal_info"."keireki" is '経歴';
comment on column "public"."webresearch_personal_info"."senmon_bunya" is '専門分野';
comment on column "public"."webresearch_personal_info"."gyouseki" is '業績';
comment on column "public"."webresearch_personal_info"."gakui" is '学位';
comment on column "public"."webresearch_personal_info"."jushou" is '受賞';
comment on column "public"."webresearch_personal_info"."jitaku_yuubinbangou" is '自宅郵便番号';
comment on column "public"."webresearch_personal_info"."jitaku_juusho" is '自宅住所';
comment on column "public"."webresearch_personal_info"."jitaku_meishou" is '自宅名称';
comment on column "public"."webresearch_personal_info"."jitaku_denwa" is '自宅電話';
comment on column "public"."webresearch_personal_info"."jitaku_fax" is '自宅ファクス';
comment on column "public"."webresearch_personal_info"."renrakusaki_yuubinbangou" is '連絡先1郵便番号';
comment on column "public"."webresearch_personal_info"."renrakusaki_juusho" is '連絡先1住所';
comment on column "public"."webresearch_personal_info"."renrakusaki_meishou" is '連絡先1名称';
comment on column "public"."webresearch_personal_info"."renrakusaki_denwa" is '連絡先1電話';
comment on column "public"."webresearch_personal_info"."renrakusaki_denwa_shurui" is '連絡先1電話種類';
comment on column "public"."webresearch_personal_info"."renrakusaki_denwa_naisen" is '連絡先1電話内線';
comment on column "public"."webresearch_personal_info"."renrakusaki_fax" is '連絡先1ファクス';
comment on column "public"."webresearch_personal_info"."renrakusaki_fax_shurui" is '連絡先1ファクス種類';
comment on column "public"."webresearch_personal_info"."keitaidenwa" is '携帯電話';
comment on column "public"."webresearch_personal_info"."email" is '電子メール';
comment on column "public"."webresearch_personal_info"."homepage" is 'ホームページ';
comment on column "public"."webresearch_personal_info"."souhusaki_yuubinbangou" is '連絡先2郵便番号';
comment on column "public"."webresearch_personal_info"."souhusaki_juusho" is '連絡先2住所';
comment on column "public"."webresearch_personal_info"."souhusaki_meishou" is '連絡先2名称';
comment on column "public"."webresearch_personal_info"."souhusaki_denwa" is '連絡先2電話';
comment on column "public"."webresearch_personal_info"."souhusaki_denwa_shurui" is '連絡先2電話種類';
comment on column "public"."webresearch_personal_info"."souhusaki_denwa_naisen" is '連絡先2電話内線';
comment on column "public"."webresearch_personal_info"."souhusaki_fax" is '連絡先2ファクス';
comment on column "public"."webresearch_personal_info"."souhusaki_fax_shurui" is '連絡先2ファクス種類';
comment on column "public"."webresearch_personal_info"."shumi" is '趣味';
comment on column "public"."webresearch_personal_info"."bikou" is '備考';
comment on column "public"."webresearch_personal_info"."kouteki_shokumusha_flag" is '公的職務者フラグ';
comment on column "public"."webresearch_personal_info"."update_date" is '更新日';
comment on column "public"."webresearch_personal_info"."latest_research_year" is '最近調査票年度';
comment on column "public"."webresearch_personal_info"."honmyou_pub" is '本名公開フラグ';
comment on column "public"."webresearch_personal_info"."hitsumei_pub" is '筆名公開フラグ';
comment on column "public"."webresearch_personal_info"."seiji_setsumei_pub" is '正字説明公開フラグ';
comment on column "public"."webresearch_personal_info"."seibetsu_pub" is '性別公開フラグ';
comment on column "public"."webresearch_personal_info"."seinengappi_pub" is '生年月日公開フラグ';
comment on column "public"."webresearch_personal_info"."shussei_todouhuken_pub" is '出生都道府県公開フラグ';
comment on column "public"."webresearch_personal_info"."shussei_shichou_pub" is '出生市町公開フラグ';
comment on column "public"."webresearch_personal_info"."shusshin_todouhuken_pub" is '出身都道府県公開フラグ';
comment on column "public"."webresearch_personal_info"."shusshin_shichou_pub" is '出身市町公開フラグ';
comment on column "public"."webresearch_personal_info"."gakureki_pub" is '学歴公開フラグ';
comment on column "public"."webresearch_personal_info"."genshoku_pub" is '現職公開フラグ';
comment on column "public"."webresearch_personal_info"."shozoku_pub" is '所属公開フラグ';
comment on column "public"."webresearch_personal_info"."motoshoku_pub" is '元職公開フラグ';
comment on column "public"."webresearch_personal_info"."keireki_pub" is '経歴公開フラグ';
comment on column "public"."webresearch_personal_info"."senmon_bunya_pub" is '専門分野公開フラグ';
comment on column "public"."webresearch_personal_info"."gyouseki_pub" is '業績公開フラグ';
comment on column "public"."webresearch_personal_info"."gakui_pub" is '学位公開フラグ';
comment on column "public"."webresearch_personal_info"."jushou_pub" is '受賞公開フラグ';
comment on column "public"."webresearch_personal_info"."jitaku_juusho_pub" is '自宅住所公開フラグ';
comment on column "public"."webresearch_personal_info"."jitaku_denwa_pub" is '自宅電話公開フラグ';
comment on column "public"."webresearch_personal_info"."jitaku_fax_pub" is '自宅ファクス公開フラグ';
comment on column "public"."webresearch_personal_info"."renrakusaki_juusho_pub" is '連絡先1住所公開フラグ';
comment on column "public"."webresearch_personal_info"."renrakusaki_denwa_pub" is '連絡先1電話公開フラグ';
comment on column "public"."webresearch_personal_info"."renrakusaki_fax_pub" is '連絡先1ファクス公開フラグ';
comment on column "public"."webresearch_personal_info"."keitaidenwa_pub" is '携帯電話公開フラグ';
comment on column "public"."webresearch_personal_info"."email_pub" is '電子メール公開フラグ';
comment on column "public"."webresearch_personal_info"."homepage_pub" is 'ホームページ公開フラグ';
comment on column "public"."webresearch_personal_info"."souhusaki_juusho_pub" is '連絡先2住所公開フラグ';
comment on column "public"."webresearch_personal_info"."souhusaki_denwa_pub" is '連絡先2電話公開フラグ';
comment on column "public"."webresearch_personal_info"."souhusaki_fax_pub" is '連絡先2ファクス公開フラグ';
comment on column "public"."webresearch_personal_info"."shumi_pub" is '趣味公開フラグ';
comment on column "public"."webresearch_personal_info"."jinbutsu_pub" is '人物情報公開フラグ';
comment on column "public"."webresearch_personal_info"."answer_date" is '回答日';


create table public.webresearch_attach_file (
"research_id" character varying(50) not null,
"auth_no" integer not null,
"update_date" timestamp(6) without time zone,
"input_code" character varying(11),
"original_name" text,
primary key ("research_id","auth_no")
);
comment on table "public"."webresearch_attach_file" is 'WEB回答添付ファイルテーブル';
comment on column "public"."webresearch_attach_file"."research_id" is '調査ID';
comment on column "public"."webresearch_attach_file"."auth_no" is '通番';
comment on column "public"."webresearch_attach_file"."update_date" is '更新日';
comment on column "public"."webresearch_attach_file"."input_code" is 'データコード';
comment on column "public"."webresearch_attach_file"."original_name" is '元ファイル名';



create table public.ldap_user_info (
"user_no" character varying(14) not null,
"user_name" character varying(40),
"section_cd" character varying(14),
"section_cd1" character varying(14),
"section_cd2" character varying(14),
"section_cd3" character varying(14),
"section_cd4" character varying(14),
"section_cd5" character varying(14),
"section_cd6" character varying(14),
"section_cd7" character varying(14),
"section_cd8" character varying(14),
"section_cd9" character varying(14),
"section_cd10" character varying(14),
"section_name" character varying(140),
"section_name1" character varying(140),
"section_name2" character varying(140),
"section_name3" character varying(140),
"section_name4" character varying(140),
"section_name5" character varying(140),
"section_name6" character varying(140),
"section_name7" character varying(140),
"section_name8" character varying(140),
"section_name9" character varying(140),
"section_name10" character varying(140),
"employ_cd" character varying(5),
"mail_address" character varying(100),
"role_cd" character varying(16),
"update_date" timestamp(6) without time zone,
primary key ("user_no")
);
comment on table "public"."ldap_user_info" is 'LDAPユーザ情報テーブル';
comment on column "public"."ldap_user_info"."user_no" is '社員番号';
comment on column "public"."ldap_user_info"."user_name" is '氏名';
comment on column "public"."ldap_user_info"."section_cd" is '所属コード';
comment on column "public"."ldap_user_info"."section_cd1" is '所属コード1';
comment on column "public"."ldap_user_info"."section_cd2" is '所属コード2';
comment on column "public"."ldap_user_info"."section_cd3" is '所属コード3';
comment on column "public"."ldap_user_info"."section_cd4" is '所属コード4';
comment on column "public"."ldap_user_info"."section_cd5" is '所属コード5';
comment on column "public"."ldap_user_info"."section_cd6" is '所属コード6';
comment on column "public"."ldap_user_info"."section_cd7" is '所属コード7';
comment on column "public"."ldap_user_info"."section_cd8" is '所属コード8';
comment on column "public"."ldap_user_info"."section_cd9" is '所属コード9';
comment on column "public"."ldap_user_info"."section_cd10" is '所属コード10';
comment on column "public"."ldap_user_info"."section_name" is '所属名称';
comment on column "public"."ldap_user_info"."section_name1" is '所属名称1';
comment on column "public"."ldap_user_info"."section_name2" is '所属名称2';
comment on column "public"."ldap_user_info"."section_name3" is '所属名称3';
comment on column "public"."ldap_user_info"."section_name4" is '所属名称4';
comment on column "public"."ldap_user_info"."section_name5" is '所属名称5';
comment on column "public"."ldap_user_info"."section_name6" is '所属名称6';
comment on column "public"."ldap_user_info"."section_name7" is '所属名称7';
comment on column "public"."ldap_user_info"."section_name8" is '所属名称8';
comment on column "public"."ldap_user_info"."section_name9" is '所属名称9';
comment on column "public"."ldap_user_info"."section_name10" is '所属名称10';
comment on column "public"."ldap_user_info"."employ_cd" is '社員区分コード';
comment on column "public"."ldap_user_info"."mail_address" is 'メールアドレス';
comment on column "public"."ldap_user_info"."role_cd" is 'ロールコード';
comment on column "public"."ldap_user_info"."update_date" is '更新日';



create table public.section_info (
"section_cd" character varying(14) not null,
"section_name" character varying(40),
"role_cd" character varying(16),
primary key ("section_cd")
);
comment on table "public"."section_info" is '部署テーブル';
comment on column "public"."section_info"."section_cd" is '所属コード';
comment on column "public"."section_info"."section_name" is '部署名';
comment on column "public"."section_info"."role_cd" is 'ロールコード';



create table public.role_info (
"role_cd" character varying(16) not null,
"role_name" character varying(40),
"permission_cds" text,
primary key ("role_cd")
);
comment on table "public"."role_info" is 'ロール権限テーブル';
comment on column "public"."role_info"."role_cd" is 'ロールコード';
comment on column "public"."role_info"."role_name" is 'ロール名';
comment on column "public"."role_info"."permission_cds" is '権限リスト';



create table public.zipno_info (
"zip_cd" character varying(7),
"prefectures" text,
"municipalityes" text,
"role_name" text,
"office_name" text,
"address" text,
"jigyosyo_flg" character varying(1)
);
comment on table "public"."zipno_info" is '郵便番号テーブル';
comment on column "public"."zipno_info"."zip_cd" is '郵便番号';
comment on column "public"."zipno_info"."prefectures" is '都道府県';
comment on column "public"."zipno_info"."municipalityes" is '市区町村';
comment on column "public"."zipno_info"."role_name" is '町域';
comment on column "public"."zipno_info"."office_name" is '事業所名';
comment on column "public"."zipno_info"."address" is '住所表示';
comment on column "public"."zipno_info"."jigyosyo_flg" is '大口フラグ';









--
-- PostgreSQL database dump complete
--
