--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Debian 12.22-1.pgdg120+1)
-- Dumped by pg_dump version 12.22 (Debian 12.22-1.pgdg120+1)

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
-- Name: emaildeliverytype; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.emaildeliverytype AS ENUM (
    'attachment',
    'inline'
);


ALTER TYPE public.emaildeliverytype OWNER TO superset;

--
-- Name: objecttype; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.objecttype AS ENUM (
    'query',
    'chart',
    'dashboard',
    'dataset'
);


ALTER TYPE public.objecttype OWNER TO superset;

--
-- Name: sliceemailreportformat; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.sliceemailreportformat AS ENUM (
    'visualization',
    'data'
);


ALTER TYPE public.sliceemailreportformat OWNER TO superset;

--
-- Name: tagtype; Type: TYPE; Schema: public; Owner: superset
--

CREATE TYPE public.tagtype AS ENUM (
    'custom',
    'type',
    'owner',
    'favorited_by'
);


ALTER TYPE public.tagtype OWNER TO superset;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO superset;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_id_seq OWNER TO superset;

--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO superset;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_id_seq OWNER TO superset;

--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO superset;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_role_id_seq OWNER TO superset;

--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    email character varying(64) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO superset;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_register_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_register_user_id_seq OWNER TO superset;

--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO superset;

--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_role_id_seq OWNER TO superset;

--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(320) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO superset;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO superset;

--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO superset;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_role_id_seq OWNER TO superset;

--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO superset;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_view_menu_id_seq OWNER TO superset;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO superset;

--
-- Name: annotation; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.annotation (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    layer_id integer,
    short_descr character varying(500),
    long_descr text,
    changed_by_fk integer,
    created_by_fk integer,
    json_metadata text
);


ALTER TABLE public.annotation OWNER TO superset;

--
-- Name: annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_id_seq OWNER TO superset;

--
-- Name: annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.annotation_id_seq OWNED BY public.annotation.id;


--
-- Name: annotation_layer; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.annotation_layer (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    descr text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.annotation_layer OWNER TO superset;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.annotation_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_layer_id_seq OWNER TO superset;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.annotation_layer_id_seq OWNED BY public.annotation_layer.id;


--
-- Name: cache_keys; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.cache_keys (
    id integer NOT NULL,
    cache_key character varying(256) NOT NULL,
    cache_timeout integer,
    datasource_uid character varying(64) NOT NULL,
    created_on timestamp without time zone
);


ALTER TABLE public.cache_keys OWNER TO superset;

--
-- Name: cache_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.cache_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cache_keys_id_seq OWNER TO superset;

--
-- Name: cache_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.cache_keys_id_seq OWNED BY public.cache_keys.id;


--
-- Name: css_templates; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.css_templates (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    template_name character varying(250),
    css text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.css_templates OWNER TO superset;

--
-- Name: css_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.css_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.css_templates_id_seq OWNER TO superset;

--
-- Name: css_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.css_templates_id_seq OWNED BY public.css_templates.id;


--
-- Name: dashboard_roles; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    dashboard_id integer
);


ALTER TABLE public.dashboard_roles OWNER TO superset;

--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_roles_id_seq OWNER TO superset;

--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_roles_id_seq OWNED BY public.dashboard_roles.id;


--
-- Name: dashboard_slices; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_slices (
    id integer NOT NULL,
    dashboard_id integer,
    slice_id integer
);


ALTER TABLE public.dashboard_slices OWNER TO superset;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_slices_id_seq OWNER TO superset;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_slices_id_seq OWNED BY public.dashboard_slices.id;


--
-- Name: dashboard_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboard_user (
    id integer NOT NULL,
    user_id integer,
    dashboard_id integer
);


ALTER TABLE public.dashboard_user OWNER TO superset;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_user_id_seq OWNER TO superset;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboard_user_id_seq OWNED BY public.dashboard_user.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    dashboard_title character varying(500),
    position_json text,
    created_by_fk integer,
    changed_by_fk integer,
    css text,
    description text,
    slug character varying(255),
    json_metadata text,
    published boolean,
    uuid uuid,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dashboards OWNER TO superset;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboards_id_seq OWNER TO superset;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- Name: database_user_oauth2_tokens; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.database_user_oauth2_tokens (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer NOT NULL,
    database_id integer NOT NULL,
    access_token bytea,
    access_token_expiration timestamp without time zone,
    refresh_token bytea,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.database_user_oauth2_tokens OWNER TO superset;

--
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.database_user_oauth2_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_user_oauth2_tokens_id_seq OWNER TO superset;

--
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.database_user_oauth2_tokens_id_seq OWNED BY public.database_user_oauth2_tokens.id;


--
-- Name: dbs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dbs (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_name character varying(250) NOT NULL,
    sqlalchemy_uri character varying(1024) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    password bytea,
    cache_timeout integer,
    extra text,
    select_as_create_table_as boolean,
    allow_ctas boolean,
    expose_in_sqllab boolean,
    force_ctas_schema character varying(250),
    allow_run_async boolean,
    allow_dml boolean,
    verbose_name character varying(250),
    impersonate_user boolean,
    allow_file_upload boolean DEFAULT true NOT NULL,
    encrypted_extra bytea,
    server_cert bytea,
    allow_cvas boolean,
    uuid uuid,
    configuration_method character varying(255) DEFAULT 'sqlalchemy_form'::character varying,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dbs OWNER TO superset;

--
-- Name: dbs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dbs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbs_id_seq OWNER TO superset;

--
-- Name: dbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dbs_id_seq OWNED BY public.dbs.id;


--
-- Name: dynamic_plugin; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.dynamic_plugin (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    bundle_url character varying(1000) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.dynamic_plugin OWNER TO superset;

--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.dynamic_plugin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dynamic_plugin_id_seq OWNER TO superset;

--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.dynamic_plugin_id_seq OWNED BY public.dynamic_plugin.id;


--
-- Name: embedded_dashboards; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.embedded_dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    allow_domain_list text,
    uuid uuid,
    dashboard_id integer NOT NULL,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.embedded_dashboards OWNER TO superset;

--
-- Name: favstar; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.favstar (
    id integer NOT NULL,
    user_id integer,
    class_name character varying(50),
    obj_id integer,
    dttm timestamp without time zone
);


ALTER TABLE public.favstar OWNER TO superset;

--
-- Name: favstar_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.favstar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favstar_id_seq OWNER TO superset;

--
-- Name: favstar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.favstar_id_seq OWNED BY public.favstar.id;


--
-- Name: key_value; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.key_value (
    id integer NOT NULL,
    resource character varying(32) NOT NULL,
    value bytea NOT NULL,
    uuid uuid,
    created_on timestamp without time zone,
    created_by_fk integer,
    changed_on timestamp without time zone,
    changed_by_fk integer,
    expires_on timestamp without time zone
);


ALTER TABLE public.key_value OWNER TO superset;

--
-- Name: key_value_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.key_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.key_value_id_seq OWNER TO superset;

--
-- Name: key_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.key_value_id_seq OWNED BY public.key_value.id;


--
-- Name: keyvalue; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.keyvalue (
    id integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.keyvalue OWNER TO superset;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.keyvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keyvalue_id_seq OWNER TO superset;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.keyvalue_id_seq OWNED BY public.keyvalue.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(512),
    user_id integer,
    json text,
    dttm timestamp without time zone,
    dashboard_id integer,
    slice_id integer,
    duration_ms integer,
    referrer character varying(1024)
);


ALTER TABLE public.logs OWNER TO superset;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO superset;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: query; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.query (
    id integer NOT NULL,
    client_id character varying(11) NOT NULL,
    database_id integer NOT NULL,
    tmp_table_name character varying(256),
    tab_name character varying(256),
    sql_editor_id character varying(256),
    user_id integer,
    status character varying(16),
    schema character varying(256),
    sql text,
    select_sql text,
    executed_sql text,
    "limit" integer,
    select_as_cta boolean,
    select_as_cta_used boolean,
    progress integer,
    rows integer,
    error_message text,
    start_time numeric(20,6),
    changed_on timestamp without time zone,
    end_time numeric(20,6),
    results_key character varying(64),
    start_running_time numeric(20,6),
    end_result_backend_time numeric(20,6),
    tracking_url text,
    extra_json text,
    tmp_schema_name character varying(256),
    ctas_method character varying(16),
    limiting_factor character varying(255) DEFAULT 'UNKNOWN'::character varying,
    catalog character varying(256)
);


ALTER TABLE public.query OWNER TO superset;

--
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_id_seq OWNER TO superset;

--
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.query_id_seq OWNED BY public.query.id;


--
-- Name: report_execution_log; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_execution_log (
    id integer NOT NULL,
    scheduled_dttm timestamp without time zone NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    value double precision,
    value_row_json text,
    state character varying(50) NOT NULL,
    error_message text,
    report_schedule_id integer NOT NULL,
    uuid uuid
);


ALTER TABLE public.report_execution_log OWNER TO superset;

--
-- Name: report_execution_log_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_execution_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_execution_log_id_seq OWNER TO superset;

--
-- Name: report_execution_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_execution_log_id_seq OWNED BY public.report_execution_log.id;


--
-- Name: report_recipient; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_recipient (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    recipient_config_json text,
    report_schedule_id integer NOT NULL,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.report_recipient OWNER TO superset;

--
-- Name: report_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_recipient_id_seq OWNER TO superset;

--
-- Name: report_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_recipient_id_seq OWNED BY public.report_recipient.id;


--
-- Name: report_schedule; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_schedule (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    context_markdown text,
    active boolean,
    crontab character varying(1000) NOT NULL,
    sql text,
    chart_id integer,
    dashboard_id integer,
    database_id integer,
    last_eval_dttm timestamp without time zone,
    last_state character varying(50),
    last_value double precision,
    last_value_row_json text,
    validator_type character varying(100),
    validator_config_json text,
    log_retention integer,
    grace_period integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    working_timeout integer,
    report_format character varying(50) DEFAULT 'PNG'::character varying,
    creation_method character varying(255) DEFAULT 'alerts_reports'::character varying,
    timezone character varying(100) DEFAULT 'UTC'::character varying NOT NULL,
    extra_json text NOT NULL,
    force_screenshot boolean,
    custom_width integer,
    custom_height integer,
    email_subject character varying(255)
);


ALTER TABLE public.report_schedule OWNER TO superset;

--
-- Name: report_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_schedule_id_seq OWNER TO superset;

--
-- Name: report_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_schedule_id_seq OWNED BY public.report_schedule.id;


--
-- Name: report_schedule_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.report_schedule_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    report_schedule_id integer NOT NULL
);


ALTER TABLE public.report_schedule_user OWNER TO superset;

--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.report_schedule_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_schedule_user_id_seq OWNER TO superset;

--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.report_schedule_user_id_seq OWNED BY public.report_schedule_user.id;


--
-- Name: rls_filter_roles; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.rls_filter_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_roles OWNER TO superset;

--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.rls_filter_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rls_filter_roles_id_seq OWNER TO superset;

--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.rls_filter_roles_id_seq OWNED BY public.rls_filter_roles.id;


--
-- Name: rls_filter_tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.rls_filter_tables (
    id integer NOT NULL,
    table_id integer,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_tables OWNER TO superset;

--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.rls_filter_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rls_filter_tables_id_seq OWNER TO superset;

--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.rls_filter_tables_id_seq OWNED BY public.rls_filter_tables.id;


--
-- Name: row_level_security_filters; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.row_level_security_filters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    clause text NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    filter_type character varying(255),
    group_key character varying(255),
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.row_level_security_filters OWNER TO superset;

--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.row_level_security_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.row_level_security_filters_id_seq OWNER TO superset;

--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.row_level_security_filters_id_seq OWNED BY public.row_level_security_filters.id;


--
-- Name: saved_query; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.saved_query (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    db_id integer,
    label character varying(256),
    schema character varying(128),
    sql text,
    description text,
    changed_by_fk integer,
    created_by_fk integer,
    extra_json text,
    last_run timestamp without time zone,
    rows integer,
    uuid uuid,
    template_parameters text,
    catalog character varying(256)
);


ALTER TABLE public.saved_query OWNER TO superset;

--
-- Name: saved_query_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.saved_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_query_id_seq OWNER TO superset;

--
-- Name: saved_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.saved_query_id_seq OWNED BY public.saved_query.id;


--
-- Name: slice_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slice_user (
    id integer NOT NULL,
    user_id integer,
    slice_id integer
);


ALTER TABLE public.slice_user OWNER TO superset;

--
-- Name: slice_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slice_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slice_user_id_seq OWNER TO superset;

--
-- Name: slice_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slice_user_id_seq OWNED BY public.slice_user.id;


--
-- Name: slices; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.slices (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    slice_name character varying(250),
    datasource_type character varying(200),
    datasource_name character varying(2000),
    viz_type character varying(250),
    params text,
    created_by_fk integer,
    changed_by_fk integer,
    description text,
    cache_timeout integer,
    perm character varying(2000),
    datasource_id integer,
    schema_perm character varying(1000),
    uuid uuid,
    query_context text,
    last_saved_at timestamp without time zone,
    last_saved_by_fk integer,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    catalog_perm character varying(1000),
    CONSTRAINT ck_chart_datasource CHECK (((datasource_type)::text = 'table'::text))
);


ALTER TABLE public.slices OWNER TO superset;

--
-- Name: slices_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slices_id_seq OWNER TO superset;

--
-- Name: slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.slices_id_seq OWNED BY public.slices.id;


--
-- Name: sql_metrics; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sql_metrics (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    metric_name character varying(255) NOT NULL,
    verbose_name character varying(1024),
    metric_type character varying(32),
    table_id integer,
    expression text NOT NULL,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    d3format character varying(128),
    warning_text text,
    extra text,
    uuid uuid,
    currency character varying(128)
);


ALTER TABLE public.sql_metrics OWNER TO superset;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sql_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_metrics_id_seq OWNER TO superset;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sql_metrics_id_seq OWNED BY public.sql_metrics.id;


--
-- Name: sqlatable_user; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.sqlatable_user (
    id integer NOT NULL,
    user_id integer,
    table_id integer
);


ALTER TABLE public.sqlatable_user OWNER TO superset;

--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.sqlatable_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sqlatable_user_id_seq OWNER TO superset;

--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.sqlatable_user_id_seq OWNED BY public.sqlatable_user.id;


--
-- Name: ssh_tunnels; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.ssh_tunnels (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    extra_json text,
    uuid uuid,
    id integer NOT NULL,
    database_id integer,
    server_address character varying(256),
    server_port integer,
    username bytea,
    password bytea,
    private_key bytea,
    private_key_password bytea
);


ALTER TABLE public.ssh_tunnels OWNER TO superset;

--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.ssh_tunnels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ssh_tunnels_id_seq OWNER TO superset;

--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.ssh_tunnels_id_seq OWNED BY public.ssh_tunnels.id;


--
-- Name: tab_state; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tab_state (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    user_id integer,
    label character varying(256),
    active boolean,
    database_id integer,
    schema character varying(256),
    sql text,
    query_limit integer,
    latest_query_id character varying(11),
    autorun boolean NOT NULL,
    template_params text,
    created_by_fk integer,
    changed_by_fk integer,
    hide_left_bar boolean DEFAULT false NOT NULL,
    saved_query_id integer,
    catalog character varying(256)
);


ALTER TABLE public.tab_state OWNER TO superset;

--
-- Name: tab_state_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tab_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_state_id_seq OWNER TO superset;

--
-- Name: tab_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tab_state_id_seq OWNED BY public.tab_state.id;


--
-- Name: table_columns; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.table_columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_id integer,
    column_name character varying(255) NOT NULL,
    is_dttm boolean,
    is_active boolean,
    type text,
    groupby boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    expression text,
    verbose_name character varying(1024),
    python_date_format character varying(255),
    uuid uuid,
    extra text,
    advanced_data_type character varying(255)
);


ALTER TABLE public.table_columns OWNER TO superset;

--
-- Name: table_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.table_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_columns_id_seq OWNER TO superset;

--
-- Name: table_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.table_columns_id_seq OWNED BY public.table_columns.id;


--
-- Name: table_schema; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.table_schema (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    tab_state_id integer,
    database_id integer NOT NULL,
    schema character varying(256),
    "table" character varying(256),
    description text,
    expanded boolean,
    created_by_fk integer,
    changed_by_fk integer,
    catalog character varying(256)
);


ALTER TABLE public.table_schema OWNER TO superset;

--
-- Name: table_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.table_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_schema_id_seq OWNER TO superset;

--
-- Name: table_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.table_schema_id_seq OWNED BY public.table_schema.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tables (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_name character varying(250) NOT NULL,
    main_dttm_col character varying(250),
    default_endpoint text,
    database_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    description text,
    is_featured boolean,
    cache_timeout integer,
    schema character varying(255),
    sql text,
    params text,
    perm character varying(1000),
    filter_select_enabled boolean,
    fetch_values_predicate text,
    is_sqllab_view boolean DEFAULT false,
    template_params text,
    schema_perm character varying(1000),
    extra text,
    uuid uuid,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    normalize_columns boolean DEFAULT false,
    always_filter_main_dttm boolean DEFAULT false,
    catalog character varying(256),
    catalog_perm character varying(1000)
);


ALTER TABLE public.tables OWNER TO superset;

--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_id_seq OWNER TO superset;

--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tag (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    type character varying,
    created_by_fk integer,
    changed_by_fk integer,
    description text
);


ALTER TABLE public.tag OWNER TO superset;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO superset;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tagged_object; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.tagged_object (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    tag_id integer,
    object_id integer,
    object_type character varying,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.tagged_object OWNER TO superset;

--
-- Name: tagged_object_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.tagged_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagged_object_id_seq OWNER TO superset;

--
-- Name: tagged_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.tagged_object_id_seq OWNED BY public.tagged_object.id;


--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.user_attribute (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    welcome_dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer,
    avatar_url character varying(100)
);


ALTER TABLE public.user_attribute OWNER TO superset;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: superset
--

CREATE SEQUENCE public.user_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_attribute_id_seq OWNER TO superset;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: superset
--

ALTER SEQUENCE public.user_attribute_id_seq OWNED BY public.user_attribute.id;


--
-- Name: user_favorite_tag; Type: TABLE; Schema: public; Owner: superset
--

CREATE TABLE public.user_favorite_tag (
    user_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.user_favorite_tag OWNER TO superset;

--
-- Name: annotation id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_id_seq'::regclass);


--
-- Name: annotation_layer id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer ALTER COLUMN id SET DEFAULT nextval('public.annotation_layer_id_seq'::regclass);


--
-- Name: cache_keys id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.cache_keys ALTER COLUMN id SET DEFAULT nextval('public.cache_keys_id_seq'::regclass);


--
-- Name: css_templates id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates ALTER COLUMN id SET DEFAULT nextval('public.css_templates_id_seq'::regclass);


--
-- Name: dashboard_roles id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles ALTER COLUMN id SET DEFAULT nextval('public.dashboard_roles_id_seq'::regclass);


--
-- Name: dashboard_slices id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices ALTER COLUMN id SET DEFAULT nextval('public.dashboard_slices_id_seq'::regclass);


--
-- Name: dashboard_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user ALTER COLUMN id SET DEFAULT nextval('public.dashboard_user_id_seq'::regclass);


--
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- Name: database_user_oauth2_tokens id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens ALTER COLUMN id SET DEFAULT nextval('public.database_user_oauth2_tokens_id_seq'::regclass);


--
-- Name: dbs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs ALTER COLUMN id SET DEFAULT nextval('public.dbs_id_seq'::regclass);


--
-- Name: dynamic_plugin id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin ALTER COLUMN id SET DEFAULT nextval('public.dynamic_plugin_id_seq'::regclass);


--
-- Name: favstar id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar ALTER COLUMN id SET DEFAULT nextval('public.favstar_id_seq'::regclass);


--
-- Name: key_value id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value ALTER COLUMN id SET DEFAULT nextval('public.key_value_id_seq'::regclass);


--
-- Name: keyvalue id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.keyvalue ALTER COLUMN id SET DEFAULT nextval('public.keyvalue_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: query id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query ALTER COLUMN id SET DEFAULT nextval('public.query_id_seq'::regclass);


--
-- Name: report_execution_log id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log ALTER COLUMN id SET DEFAULT nextval('public.report_execution_log_id_seq'::regclass);


--
-- Name: report_recipient id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient ALTER COLUMN id SET DEFAULT nextval('public.report_recipient_id_seq'::regclass);


--
-- Name: report_schedule id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_id_seq'::regclass);


--
-- Name: report_schedule_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_user_id_seq'::regclass);


--
-- Name: rls_filter_roles id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_roles_id_seq'::regclass);


--
-- Name: rls_filter_tables id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_tables_id_seq'::regclass);


--
-- Name: row_level_security_filters id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters ALTER COLUMN id SET DEFAULT nextval('public.row_level_security_filters_id_seq'::regclass);


--
-- Name: saved_query id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query ALTER COLUMN id SET DEFAULT nextval('public.saved_query_id_seq'::regclass);


--
-- Name: slice_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user ALTER COLUMN id SET DEFAULT nextval('public.slice_user_id_seq'::regclass);


--
-- Name: slices id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices ALTER COLUMN id SET DEFAULT nextval('public.slices_id_seq'::regclass);


--
-- Name: sql_metrics id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics ALTER COLUMN id SET DEFAULT nextval('public.sql_metrics_id_seq'::regclass);


--
-- Name: sqlatable_user id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user ALTER COLUMN id SET DEFAULT nextval('public.sqlatable_user_id_seq'::regclass);


--
-- Name: ssh_tunnels id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ssh_tunnels ALTER COLUMN id SET DEFAULT nextval('public.ssh_tunnels_id_seq'::regclass);


--
-- Name: tab_state id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state ALTER COLUMN id SET DEFAULT nextval('public.tab_state_id_seq'::regclass);


--
-- Name: table_columns id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns ALTER COLUMN id SET DEFAULT nextval('public.table_columns_id_seq'::regclass);


--
-- Name: table_schema id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema ALTER COLUMN id SET DEFAULT nextval('public.table_schema_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tagged_object id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object ALTER COLUMN id SET DEFAULT nextval('public.tagged_object_id_seq'::regclass);


--
-- Name: user_attribute id; Type: DEFAULT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute ALTER COLUMN id SET DEFAULT nextval('public.user_attribute_id_seq'::regclass);


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_read
2	can_write
5	can_csv_upload
6	can_excel_upload
7	can_columnar_upload
8	can_this_form_post
9	can_this_form_get
10	can_delete
11	can_userinfo
12	can_add
13	can_show
14	can_list
15	can_edit
16	resetmypassword
17	resetpasswords
18	userinfoedit
19	copyrole
20	can_get
21	can_invalidate
22	can_warm_up_cache
23	can_export
24	can_set_embedded
25	can_cache_dashboard_screenshot
26	can_delete_embedded
27	can_get_embedded
28	can_duplicate
29	can_get_or_create_dataset
30	can_get_column_values
31	can_import_
32	can_bulk_create
33	can_export_csv
34	can_execute_sql_query
35	can_get_results
36	can_estimate_query_cost
37	can_format_sql
38	can_download
39	can_time_range
40	can_query
41	can_query_form_data
42	can_external_metadata
43	can_external_metadata_by_name
44	can_samples
45	can_save
46	can_get_value
47	can_store
48	can_sqllab_history
49	can_slice
50	can_dashboard_permalink
51	can_log
52	can_fetch_datasource_metadata
55	can_dashboard
56	can_explore
57	can_explore_json
58	can_expanded
59	can_post
62	can_activate
63	can_migrate_query
64	can_delete_query
65	can_put
68	can_tags
71	can_recent_activity
72	can_grant_guest_token
73	menu_access
76	all_datasource_access
79	all_database_access
82	all_query_access
85	can_csv
88	can_share_dashboard
91	can_share_chart
94	can_sqllab
97	can_view_query
100	can_view_chart_as_table
103	can_drill
106	can_tag
109	database_access
110	catalog_access
111	schema_access
112	datasource_access
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	2	2
5	1	3
6	2	3
7	1	4
8	2	4
9	1	5
10	2	5
11	1	6
12	2	6
13	1	7
14	2	7
15	1	8
16	2	8
17	1	9
18	2	9
19	1	10
22	5	9
23	6	9
24	7	9
25	8	15
26	9	15
27	8	16
28	9	16
29	8	17
30	9	17
31	10	19
32	11	19
33	12	19
34	13	19
35	14	19
36	15	19
37	16	19
38	17	19
39	18	19
40	10	20
41	12	20
42	13	20
43	14	20
44	15	20
45	19	20
46	20	21
47	13	22
48	20	23
49	14	24
50	1	25
51	1	26
52	21	27
53	22	4
54	23	4
55	1	30
56	2	30
57	1	31
58	2	31
59	24	8
60	25	8
61	23	8
62	26	8
63	27	8
64	23	9
65	28	6
66	22	6
67	23	6
68	29	6
69	30	32
70	1	33
71	1	34
72	1	35
73	2	35
74	1	36
75	2	36
76	31	37
77	23	37
78	1	38
79	2	38
80	23	1
81	1	39
82	2	39
83	32	39
84	1	40
85	33	40
86	34	40
87	35	40
88	36	40
89	37	40
90	10	41
91	12	41
92	13	41
93	2	41
94	14	41
95	38	41
96	15	41
97	39	42
98	40	42
99	41	42
100	42	32
101	43	32
102	44	32
103	20	32
104	45	32
105	46	44
106	47	44
107	10	1
108	12	1
109	13	1
110	14	1
111	15	1
112	48	45
113	49	45
114	50	45
115	51	45
116	52	45
117	55	45
118	22	45
119	56	45
120	57	45
121	10	47
122	58	47
123	59	47
124	10	49
125	59	49
127	62	49
128	20	49
129	63	49
130	64	49
131	65	49
132	14	50
133	68	51
134	71	7
136	1	53
137	72	53
138	1	55
140	73	57
141	73	58
142	73	59
144	73	61
146	73	38
147	73	62
149	73	64
150	73	65
151	73	66
153	73	68
154	73	69
156	73	71
157	73	72
159	73	74
161	73	50
163	73	75
165	73	76
166	73	77
168	73	79
169	73	80
171	73	82
172	76	83
173	82	88
174	85	45
175	88	45
176	91	45
177	94	45
178	97	8
179	100	8
180	103	8
181	106	4
182	106	8
184	79	85
185	109	90
186	110	91
187	110	92
188	110	93
189	110	94
190	111	95
191	111	96
192	111	97
193	111	98
194	111	99
195	111	100
196	111	101
197	111	102
198	112	103
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	25	1
2	26	1
3	27	1
4	28	1
5	29	1
6	30	1
7	31	1
8	32	1
9	33	1
10	34	1
11	35	1
12	36	1
13	37	1
14	38	1
15	39	1
16	40	1
17	41	1
18	42	1
19	43	1
20	44	1
21	45	1
22	46	1
23	47	1
24	48	1
25	9	1
26	10	1
27	49	1
28	50	1
29	51	1
30	52	1
31	53	1
32	54	1
33	7	1
34	8	1
35	3	1
36	4	1
37	55	1
38	56	1
39	57	1
40	58	1
41	59	1
42	60	1
43	61	1
44	62	1
45	63	1
46	15	1
47	16	1
48	64	1
49	17	1
50	18	1
51	22	1
52	23	1
53	24	1
54	65	1
55	66	1
56	67	1
57	68	1
58	11	1
59	12	1
60	69	1
61	70	1
62	71	1
63	72	1
64	73	1
65	74	1
66	75	1
67	76	1
68	77	1
69	19	1
70	5	1
71	6	1
72	78	1
73	79	1
74	80	1
75	1	1
76	2	1
77	81	1
78	82	1
79	83	1
80	84	1
81	85	1
82	86	1
83	87	1
84	88	1
85	89	1
86	90	1
87	91	1
88	92	1
89	93	1
90	94	1
91	95	1
92	96	1
93	97	1
94	98	1
95	99	1
96	100	1
97	101	1
98	102	1
99	103	1
100	104	1
101	105	1
102	106	1
103	107	1
104	108	1
105	109	1
106	110	1
107	111	1
109	112	1
110	113	1
111	114	1
112	115	1
113	116	1
114	117	1
115	118	1
116	119	1
117	120	1
118	121	1
119	122	1
120	123	1
121	124	1
122	125	1
123	127	1
124	128	1
125	129	1
126	130	1
128	131	1
129	132	1
131	133	1
132	134	1
133	13	1
135	14	1
136	136	1
137	137	1
139	138	1
140	140	1
141	141	1
143	142	1
144	144	1
145	146	1
146	149	1
147	147	1
148	150	1
150	151	1
151	153	1
153	154	1
154	156	1
156	157	1
157	159	1
158	161	1
159	163	1
160	165	1
162	166	1
163	168	1
165	169	1
166	171	1
167	172	1
168	173	1
169	174	1
170	175	1
171	176	1
172	177	1
173	178	1
174	179	1
175	180	1
176	181	1
177	182	1
179	3	3
180	4	3
181	5	3
182	6	3
183	7	3
184	8	3
185	9	3
186	10	3
187	11	3
188	12	3
189	15	3
190	16	3
191	17	3
192	22	3
193	23	3
194	27	3
195	28	3
196	32	3
197	37	3
198	46	3
199	47	3
200	48	3
201	49	3
202	50	3
203	51	3
204	52	3
205	54	3
206	55	3
207	56	3
208	57	3
209	58	3
210	60	3
211	61	3
212	62	3
213	63	3
214	65	3
215	67	3
216	68	3
217	69	3
218	70	3
219	71	3
220	72	3
221	73	3
222	74	3
223	75	3
224	76	3
225	77	3
226	81	3
227	82	3
228	83	3
229	88	3
230	89	3
231	92	3
232	94	3
233	97	3
234	98	3
235	99	3
236	100	3
237	101	3
238	102	3
239	103	3
240	104	3
241	105	3
242	106	3
243	107	3
244	108	3
245	109	3
246	110	3
247	111	3
248	113	3
249	114	3
250	115	3
251	116	3
252	117	3
253	119	3
254	120	3
255	121	3
256	122	3
257	123	3
258	132	3
259	133	3
260	134	3
261	136	3
262	138	3
263	147	3
264	149	3
265	150	3
266	151	3
267	153	3
268	154	3
269	156	3
270	157	3
271	159	3
272	161	3
273	163	3
274	165	3
275	172	3
276	174	3
277	175	3
278	176	3
279	178	3
280	179	3
281	180	3
282	181	3
283	182	3
284	7	4
285	8	4
286	11	4
287	15	4
288	16	4
289	17	4
290	27	4
291	28	4
292	32	4
293	37	4
294	46	4
295	47	4
296	48	4
297	49	4
298	50	4
299	51	4
300	52	4
301	54	4
302	55	4
303	56	4
304	57	4
305	58	4
306	60	4
307	61	4
308	62	4
309	63	4
310	70	4
311	71	4
312	72	4
313	73	4
314	74	4
315	75	4
316	81	4
317	82	4
318	83	4
319	88	4
320	89	4
321	92	4
322	94	4
323	97	4
324	98	4
325	99	4
326	100	4
327	101	4
328	103	4
329	105	4
330	106	4
331	107	4
332	108	4
333	109	4
334	110	4
335	111	4
336	113	4
337	114	4
338	115	4
339	116	4
340	117	4
341	119	4
342	120	4
343	132	4
344	133	4
345	134	4
346	136	4
347	138	4
348	147	4
349	149	4
350	150	4
351	151	4
352	153	4
353	154	4
354	157	4
355	161	4
356	174	4
357	175	4
358	176	4
359	178	4
360	179	4
361	180	4
362	181	4
363	182	4
364	1	5
365	2	5
366	17	5
367	19	5
368	80	5
369	84	5
370	85	5
371	86	5
372	87	5
373	112	5
374	124	5
375	125	5
376	127	5
377	128	5
378	129	5
379	130	5
380	131	5
381	166	5
382	168	5
383	169	5
384	171	5
385	174	5
386	177	5
387	184	1
388	184	3
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
2	Public
3	Alpha
4	Gamma
5	sql_lab
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	Admin	User	admin	scrypt:32768:8:1$hLShC7vlYNhlu9vC$833975d4dbfdd1e80ba9bbc050d48509ee88b90c8cef71904f0fbcf6cf5643fe031635e23dc58b4be31e33e143d4e55e9b2677744e03f0260b5f1af712f41f90	t	admin@example.com	2025-03-19 16:38:56.088323	1	0	2025-03-19 16:38:31.908692	2025-03-19 16:38:31.908705	\N	\N
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	SavedQuery
2	CssTemplate
3	ReportSchedule
4	Chart
5	Annotation
6	Dataset
7	Log
8	Dashboard
9	Database
10	Query
11	SupersetIndexView
12	UtilView
13	LocaleView
14	SecurityApi
15	ResetPasswordView
16	ResetMyPasswordView
17	UserInfoEditView
18	AuthDBView
19	UserDBModelView
20	RoleModelView
21	OpenApi
22	SwaggerView
23	MenuApi
24	AsyncEventsRestApi
25	AdvancedDataType
26	AvailableDomains
27	CacheRestApi
28	CurrentUserRestApi
29	UserRestApi
30	DashboardFilterStateRestApi
31	DashboardPermalinkRestApi
32	Datasource
33	EmbeddedDashboard
34	Explore
35	ExploreFormDataRestApi
36	ExplorePermalinkRestApi
37	ImportExportRestApi
38	Row Level Security
39	Tag
40	SQLLab
41	DynamicPlugin
42	Api
43	EmbeddedView
44	KV
45	Superset
47	TableSchemaView
49	TabStateView
50	Tags
51	TagView
53	SecurityRestApi
55	RowLevelSecurity
57	Security
58	List Users
59	List Roles
61	Action Log
62	Home
64	Data
65	Databases
66	Dashboards
68	Charts
69	Datasets
71	Manage
72	Plugins
74	CSS Templates
75	Alerts & Report
76	Annotation Layers
77	SQL Lab
79	SQL Editor
80	Saved Queries
82	Query Search
83	all_datasource_access
85	all_database_access
88	all_query_access
90	[eCHIS Production DB].(id:1)
91	[eCHIS Production DB].[commcarehq_ucr]
92	[eCHIS Production DB].[echis_report_builder]
93	[eCHIS Production DB].[commcarehq_auditcare]
94	[eCHIS Production DB].[postgres]
95	[eCHIS Production DB].[commcarehq_ucr].[information_schema]
96	[eCHIS Production DB].[commcarehq_ucr].[public]
97	[eCHIS Production DB].[echis_report_builder].[information_schema]
98	[eCHIS Production DB].[echis_report_builder].[public]
99	[eCHIS Production DB].[commcarehq_auditcare].[information_schema]
100	[eCHIS Production DB].[commcarehq_auditcare].[public]
101	[eCHIS Production DB].[postgres].[information_schema]
102	[eCHIS Production DB].[postgres].[public]
103	[eCHIS Production DB].[rpt_tt_smart_start_counseling](id:1)
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.alembic_version (version_num) FROM stdin;
48cbb571fa3a
\.


--
-- Data for Name: annotation; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.annotation (created_on, changed_on, id, start_dttm, end_dttm, layer_id, short_descr, long_descr, changed_by_fk, created_by_fk, json_metadata) FROM stdin;
\.


--
-- Data for Name: annotation_layer; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.annotation_layer (created_on, changed_on, id, name, descr, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: cache_keys; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.cache_keys (id, cache_key, cache_timeout, datasource_uid, created_on) FROM stdin;
\.


--
-- Data for Name: css_templates; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.css_templates (created_on, changed_on, id, template_name, css, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: dashboard_roles; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_roles (id, role_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: dashboard_slices; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_slices (id, dashboard_id, slice_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: dashboard_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboard_user (id, user_id, dashboard_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dashboards (created_on, changed_on, id, dashboard_title, position_json, created_by_fk, changed_by_fk, css, description, slug, json_metadata, published, uuid, certified_by, certification_details, is_managed_externally, external_url) FROM stdin;
2025-03-19 16:57:13.196908	2025-03-19 16:57:40.472157	1	[ untitled dashboard ]	{"CHART-AxPb48Qv54_Qac0a4J7V2":{"children":[],"id":"CHART-AxPb48Qv54_Qac0a4J7V2","meta":{"chartId":1,"height":50,"sliceName":"Testing","uuid":"e64ccef4-d81e-4339-8701-a3a75b415811","width":4},"parents":["ROOT_ID","GRID_ID","ROW-j9zdsl_l0jJeXiljtWtyd"],"type":"CHART"},"DASHBOARD_VERSION_KEY":"v2","GRID_ID":{"children":["ROW-j9zdsl_l0jJeXiljtWtyd"],"id":"GRID_ID","parents":["ROOT_ID"],"type":"GRID"},"HEADER_ID":{"id":"HEADER_ID","meta":{"text":"[ untitled dashboard ]"},"type":"HEADER"},"ROOT_ID":{"children":["GRID_ID"],"id":"ROOT_ID","type":"ROOT"},"ROW-j9zdsl_l0jJeXiljtWtyd":{"children":["CHART-AxPb48Qv54_Qac0a4J7V2"],"id":"ROW-j9zdsl_l0jJeXiljtWtyd","meta":{"background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"}}	1	1		\N	\N	{"chart_configuration": {"1": {"id": 1, "crossFilters": {"scope": "global", "chartsInScope": []}}}, "global_chart_configuration": {"scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "chartsInScope": [1]}, "map_label_colors": {"SUM(number_of_children)": "#1FA8C9"}, "color_scheme": "", "refresh_frequency": 0, "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "shared_label_colors": [], "timed_refresh_immune_slices": [], "cross_filters_enabled": true, "default_filters": "{}"}	f	7d9f8033-3ae0-4563-a96d-ce85847f8327			f	\N
\.


--
-- Data for Name: database_user_oauth2_tokens; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.database_user_oauth2_tokens (created_on, changed_on, id, user_id, database_id, access_token, access_token_expiration, refresh_token, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: dbs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dbs (created_on, changed_on, id, database_name, sqlalchemy_uri, created_by_fk, changed_by_fk, password, cache_timeout, extra, select_as_create_table_as, allow_ctas, expose_in_sqllab, force_ctas_schema, allow_run_async, allow_dml, verbose_name, impersonate_user, allow_file_upload, encrypted_extra, server_cert, allow_cvas, uuid, configuration_method, is_managed_externally, external_url) FROM stdin;
2025-03-19 16:52:56.76911	2025-03-19 16:53:04.604029	1	eCHIS Production DB	postgresql+psycopg2://ucrdb:XXXXXXXXXX@192.168.1.31:5432/echis_report_builder	1	1	\\x4b74375242416349694e385a67315933532b743475586a41794179334f4347674a6976344c387a6e6576633d	\N	{"allows_virtual_table_explore":true}	f	f	t	\N	f	f	\N	f	f	\\x4a2f38544e664157642b6e76596c624b6f4e437148513d3d	\N	f	160e3e76-95bf-4444-94b2-644555b5570d	dynamic_form	f	\N
\.


--
-- Data for Name: dynamic_plugin; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.dynamic_plugin (created_on, changed_on, id, name, key, bundle_url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: embedded_dashboards; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.embedded_dashboards (created_on, changed_on, allow_domain_list, uuid, dashboard_id, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: favstar; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.favstar (id, user_id, class_name, obj_id, dttm) FROM stdin;
\.


--
-- Data for Name: key_value; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.key_value (id, resource, value, uuid, created_on, created_by_fk, changed_on, changed_by_fk, expires_on) FROM stdin;
2	superset_metastore_cache	\\x225332636668595430544d57466d6b5261567738736b4e67397146564f623176354d334b6b316b596f5f51674a37336a37575466624e635051314162747831746422	5ca89963-ac5b-3e2f-88b5-a3ff4bae8d97	2025-03-19 16:54:26.113886	1	\N	\N	2025-03-26 16:54:26.111433
1	superset_metastore_cache	\\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20312c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22315f5f7461626c655c222c5c2276697a5f747970655c223a5c22656368617274735f74696d657365726965735f6261725c222c5c22785f617869735c223a5c226865616c74685f706f73745c222c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c22785f617869735f736f72745f6173635c223a747275652c5c22785f617869735f736f72745f7365726965735c223a5c226e616d655c222c5c22785f617869735f736f72745f7365726965735f617363656e64696e675c223a747275652c5c226d6574726963735c223a5b7b5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c22636f6c756d6e5c223a7b5c22616476616e6365645f646174615f747970655c223a6e756c6c2c5c2263657274696669636174696f6e5f64657461696c735c223a6e756c6c2c5c226365727469666965645f62795c223a6e756c6c2c5c22636f6c756d6e5f6e616d655c223a5c226e756d6265725f6f665f6368696c6472656e5c222c5c226465736372697074696f6e5c223a6e756c6c2c5c2265787072657373696f6e5c223a6e756c6c2c5c2266696c74657261626c655c223a747275652c5c2267726f757062795c223a747275652c5c2269645c223a32362c5c2269735f6365727469666965645c223a66616c73652c5c2269735f6474746d5c223a66616c73652c5c22707974686f6e5f646174655f666f726d61745c223a6e756c6c2c5c22747970655c223a5c22494e54454745525c222c5c22747970655f67656e657269635c223a302c5c22766572626f73655f6e616d655c223a6e756c6c2c5c227761726e696e675f6d61726b646f776e5c223a6e756c6c7d2c5c226167677265676174655c223a5c2253554d5c222c5c2273716c45787072657373696f6e5c223a6e756c6c2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c22686173437573746f6d4c6162656c5c223a66616c73652c5c226c6162656c5c223a5c2253554d286e756d6265725f6f665f6368696c6472656e295c222c5c226f7074696f6e4e616d655c223a5c226d65747269635f79673978396675636e61725f746978366a79683370345c227d5d2c5c2267726f757062795c223a5b5d2c5c226164686f635f66696c746572735c223a5b7b5c22636c617573655c223a5c2257484552455c222c5c227375626a6563745c223a5c22696e7365727465645f61745c222c5c226f70657261746f725c223a5c2254454d504f52414c5f52414e47455c222c5c22636f6d70617261746f725c223a5c224e6f2066696c7465725c222c5c2265787072657373696f6e547970655c223a5c2253494d504c455c227d5d2c5c226f726465725f646573635c223a747275652c5c22726f775f6c696d69745c223a31303030302c5c227472756e636174655f6d65747269635c223a747275652c5c2273686f775f656d7074795f636f6c756d6e735c223a747275652c5c22636f6d70617269736f6e5f747970655c223a5c2276616c7565735c222c5c22616e6e6f746174696f6e5f6c61796572735c223a5b5d2c5c22666f726563617374506572696f64735c223a31302c5c22666f726563617374496e74657276616c5c223a302e382c5c226f7269656e746174696f6e5c223a5c22766572746963616c5c222c5c22785f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f706f736974696f6e5c223a5c224c6566745c222c5c22736f72745f7365726965735f747970655c223a5c2273756d5c222c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c226f6e6c795f746f74616c5c223a747275652c5c2273686f775f6c6567656e645c223a747275652c5c226c6567656e64547970655c223a5c227363726f6c6c5c222c5c226c6567656e644f7269656e746174696f6e5c223a5c22746f705c222c5c22785f617869735f74696d655f666f726d61745c223a5c22736d6172745f646174655c222c5c22795f617869735f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c227472756e6361746558417869735c223a747275652c5c22795f617869735f626f756e64735c223a5b6e756c6c2c6e756c6c5d2c5c22726963685f746f6f6c7469705c223a747275652c5c2273686f77546f6f6c746970546f74616c5c223a747275652c5c2273686f77546f6f6c74697050657263656e746167655c223a747275652c5c22746f6f6c74697054696d65466f726d61745c223a5c22736d6172745f646174655c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	3e435894-f309-362b-b97c-3f64df54b7f6	2025-03-19 16:54:26.094126	1	2025-03-19 16:57:03.463641	1	2025-03-26 16:57:03.462822
3	superset_metastore_cache	\\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20312c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a20312c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22315f5f7461626c655c222c5c2276697a5f747970655c223a5c22656368617274735f74696d657365726965735f6261725c222c5c22736c6963655f69645c223a312c5c22785f617869735c223a5c226865616c74685f706f73745c222c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c22785f617869735f736f72745f6173635c223a747275652c5c22785f617869735f736f72745f7365726965735c223a5c226e616d655c222c5c22785f617869735f736f72745f7365726965735f617363656e64696e675c223a747275652c5c226d6574726963735c223a5b7b5c226167677265676174655c223a5c2253554d5c222c5c22636f6c756d6e5c223a7b5c22616476616e6365645f646174615f747970655c223a6e756c6c2c5c2263657274696669636174696f6e5f64657461696c735c223a6e756c6c2c5c226365727469666965645f62795c223a6e756c6c2c5c22636f6c756d6e5f6e616d655c223a5c226e756d6265725f6f665f6368696c6472656e5c222c5c226465736372697074696f6e5c223a6e756c6c2c5c2265787072657373696f6e5c223a6e756c6c2c5c2266696c74657261626c655c223a747275652c5c2267726f757062795c223a747275652c5c2269645c223a32362c5c2269735f6365727469666965645c223a66616c73652c5c2269735f6474746d5c223a66616c73652c5c22707974686f6e5f646174655f666f726d61745c223a6e756c6c2c5c22747970655c223a5c22494e54454745525c222c5c22747970655f67656e657269635c223a302c5c22766572626f73655f6e616d655c223a6e756c6c2c5c227761726e696e675f6d61726b646f776e5c223a6e756c6c7d2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c22686173437573746f6d4c6162656c5c223a66616c73652c5c226c6162656c5c223a5c2253554d286e756d6265725f6f665f6368696c6472656e295c222c5c226f7074696f6e4e616d655c223a5c226d65747269635f79673978396675636e61725f746978366a79683370345c222c5c2273716c45787072657373696f6e5c223a6e756c6c7d5d2c5c2267726f757062795c223a5b5d2c5c226164686f635f66696c746572735c223a5b7b5c22636c617573655c223a5c2257484552455c222c5c22636f6d70617261746f725c223a5c224e6f2066696c7465725c222c5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c226f70657261746f725c223a5c2254454d504f52414c5f52414e47455c222c5c227375626a6563745c223a5c22696e7365727465645f61745c227d5d2c5c226f726465725f646573635c223a747275652c5c22726f775f6c696d69745c223a31303030302c5c227472756e636174655f6d65747269635c223a747275652c5c2273686f775f656d7074795f636f6c756d6e735c223a747275652c5c22636f6d70617269736f6e5f747970655c223a5c2276616c7565735c222c5c22616e6e6f746174696f6e5f6c61796572735c223a5b5d2c5c22666f726563617374506572696f64735c223a31302c5c22666f726563617374496e74657276616c5c223a302e382c5c226f7269656e746174696f6e5c223a5c22766572746963616c5c222c5c22785f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f706f736974696f6e5c223a5c224c6566745c222c5c22736f72745f7365726965735f747970655c223a5c2273756d5c222c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c226f6e6c795f746f74616c5c223a747275652c5c2273686f775f6c6567656e645c223a747275652c5c226c6567656e64547970655c223a5c227363726f6c6c5c222c5c226c6567656e644f7269656e746174696f6e5c223a5c22746f705c222c5c22785f617869735f74696d655f666f726d61745c223a5c22736d6172745f646174655c222c5c22795f617869735f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c227472756e6361746558417869735c223a747275652c5c22795f617869735f626f756e64735c223a5b6e756c6c2c6e756c6c5d2c5c22726963685f746f6f6c7469705c223a747275652c5c2273686f77546f6f6c746970546f74616c5c223a747275652c5c2273686f77546f6f6c74697050657263656e746167655c223a747275652c5c22746f6f6c74697054696d65466f726d61745c223a5c22736d6172745f646174655c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	4f5892c7-acde-3e03-a981-c3b255f51758	2025-03-19 16:57:09.710926	1	\N	\N	2025-03-26 16:57:09.70942
4	superset_metastore_cache	\\x2230505774385661472d58634d513936647a5f753137616533524262674f6c536735594f4c4e4678396f736351514632413846387342784f766a37333946775f6322	e664e2a9-e467-3292-a16e-5cf6196cc2eb	2025-03-19 16:57:09.722449	1	\N	\N	2025-03-26 16:57:09.720522
5	superset_metastore_cache	\\x7b226f776e6572223a20312c202276616c7565223a20227b7d227d	71574a41-7485-3c76-a83b-c6e11d4cc262	2025-03-19 16:57:24.450562	1	2025-03-19 16:57:41.260456	1	2025-06-17 16:57:41.259483
6	superset_metastore_cache	\\x22674c495f79304c344651387564504c2d383635744e4336463267576f355a4a7a4c5563326630517244316846634973595f5a4c4a69506c3939594e613365686122	5c092658-fc69-3cff-b305-f668b612961d	2025-03-19 16:57:24.541436	1	2025-03-19 16:57:41.282597	1	2025-06-17 16:57:41.279286
\.


--
-- Data for Name: keyvalue; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.keyvalue (id, value) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.logs (id, action, user_id, json, dttm, dashboard_id, slice_id, duration_ms, referrer) FROM stdin;
1	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2025-03-19 13:42:41.538012	0	0	0	\N
2	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2025-03-19 16:38:57.483722	0	0	141	http://164.160.184.101:5006/login/?next=/
3	LogRestApi.recent_activity	1	{"path": "/api/v1/log/recent_activity/", "q": "(page_size:6)", "object_ref": "LogRestApi.recent_activity", "rison": {"page_size": 6}}	2025-03-19 16:39:04.632547	0	0	24	http://164.160.184.101:5006/superset/welcome/
4	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2025-03-19 16:39:04.663392	0	0	66	http://164.160.184.101:5006/superset/welcome/
5	SavedQueryRestApi.get_list	1	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2025-03-19 16:39:05.723661	0	0	490	http://164.160.184.101:5006/superset/welcome/
6	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2025-03-19 16:39:05.939717	0	0	86	http://164.160.184.101:5006/superset/welcome/
7	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2025-03-19 16:39:05.980119	0	0	112	http://164.160.184.101:5006/superset/welcome/
8	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2025-03-19 16:39:07.388449	0	0	96	http://164.160.184.101:5006/superset/welcome/
9	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2025-03-19 16:39:07.410634	0	0	13	http://164.160.184.101:5006/superset/welcome/
10	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2025-03-19 16:39:08.113401	0	0	46	http://164.160.184.101:5006/superset/welcome/
11	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2025-03-19 16:39:08.200809	0	0	8	http://164.160.184.101:5006/superset/welcome/
12	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2025-03-19 16:39:08.290542	0	0	48	http://164.160.184.101:5006/superset/welcome/
13	log	1	{"source": "sqlLab", "ts": 1742402345223, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "bkAv1y-i3Fg2Do2k1w3BQ", "visibility": "visible"}	2025-03-19 16:39:09.027308	0	0	0	http://164.160.184.101:5006/superset/welcome/
14	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2025-03-19 16:51:54.766541	0	0	36	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
15	DatabaseRestApi.info	1	{"path": "/api/v1/database/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2025-03-19 16:51:54.95328	0	0	26	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
16	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2025-03-19 16:51:54.971039	0	0	34	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
17	log	1	{"source": "sqlLab", "ts": 1742403115949, "event_name": "spa_navigation", "path": "/databaseview/list/", "event_type": "user", "event_id": "bgvXxxEzi5TiMUQSiqlHM", "visibility": "visible"}	2025-03-19 16:51:55.329054	0	0	0	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
18	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2025-03-19 16:51:57.216183	0	0	29	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
19	DatabaseRestApi.available	1	{"path": "/api/v1/database/available/", "object_ref": "DatabaseRestApi.available"}	2025-03-19 16:51:57.23869	0	0	52	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
20	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true}	2025-03-19 16:52:04.987599	0	0	\N	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
21	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "192.168.1.31"}}	2025-03-19 16:52:12.953497	0	0	\N	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
22	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "192.168.1.31"}}	2025-03-19 16:52:23.695194	0	0	\N	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
30	test_connection_success	1	{"path": "/api/v1/database/", "database_name": "eCHIS Production DB", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "masked_encrypted_extra": "{}", "sqlalchemy_uri": "postgresql+psycopg2://ucrdb:SeRNfOBj4QwTxsTkDDpq@192.168.1.31:5432/echis_report_builder", "engine": "PostgresEngineSpec"}	2025-03-19 16:52:56.735992	0	0	\N	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
37	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2025-03-19 16:53:20.778223	0	0	31	http://164.160.184.101:5006/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
42	DatabaseRestApi.schemas	1	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2025-03-19 16:53:25.593638	0	0	152	http://164.160.184.101:5006/dataset/add/
51	ExploreRestApi.get	1	{"path": "/api/v1/explore/", "viz_type": "echarts_timeseries_bar", "datasource_id": "1", "datasource_type": "table", "object_ref": "ExploreRestApi.get"}	2025-03-19 16:54:24.691315	0	0	34	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table
54	log	1	{"source": "sqlLab", "ts": 1742403266608, "event_name": "mount_explorer", "event_type": "user", "event_id": "Io7xK6z3zHY29xkwuQbER", "visibility": "visible"}	2025-03-19 16:54:26.696665	0	0	0	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table
23	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "192.168.1.31", "port": "5432"}}	2025-03-19 16:52:27.289802	0	0	\N	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
26	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "192.168.1.31", "port": "5432", "database": "echis_report_builder", "username": "ucrdb", "password": "SeRNfOBj4QwTxsTkDDpq"}, "object_ref": "DatabaseRestApi.validate_parameters"}	2025-03-19 16:52:44.453276	0	0	139	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
34	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "id": 1, "configuration_method": "dynamic_form", "database_name": "eCHIS Production DB", "expose_in_sqllab": true, "extra": "{\\"allows_virtual_table_explore\\":true}", "masked_encrypted_extra": "{}", "sqlalchemy_uri": "postgresql+psycopg2://ucrdb:XXXXXXXXXX@192.168.1.31:5432/echis_report_builder", "uuid": "160e3e76-95bf-4444-94b2-644555b5570d", "catalog": [], "query_input": "", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2025-03-19 16:53:05.411861	0	0	836	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
39	log	1	{"source": "sqlLab", "ts": 1742403201832, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "8yulWgu5S06oBh46rcUBG", "visibility": "visible"}	2025-03-19 16:53:21.155753	0	0	0	http://164.160.184.101:5006/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
44	DatabaseRestApi.tables	1	{"path": "/api/v1/database/1/tables/", "q": "(force:!f,schema_name:public)", "url_rule": "/api/v1/database/<int:pk>/tables/", "object_ref": "DatabaseRestApi.tables", "pk": 1, "rison": {"force": false, "schema_name": "public"}}	2025-03-19 16:53:31.132096	0	0	380	http://164.160.184.101:5006/dataset/add/
49	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(columns:!(id,table_name,datasource_type,database.database_name,schema),filters:!((col:table_name,opr:ct,value:rpt_tt_smart_start_counseling)),order_column:table_name,order_direction:asc,page:0,page_size:1)", "rison": {"columns": ["id", "table_name", "datasource_type", "database.database_name", "schema"], "filters": [{"col": "table_name", "opr": "ct", "value": "rpt_tt_smart_start_counseling"}], "order_column": "table_name", "order_direction": "asc", "page": 0, "page_size": 1}}	2025-03-19 16:54:10.574749	0	0	50	http://164.160.184.101:5006/chart/add/?dataset=rpt_tt_smart_start_counseling
58	execute_sql	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"COUNT(age)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"COUNT(age)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}, "result_format": "json", "result_type": "full", "object_ref": "superset.models.core"}	2025-03-19 16:54:57.452284	0	0	289	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
24	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "192.168.1.31", "port": "5432", "database": "echis_report_builder"}}	2025-03-19 16:52:31.793692	0	0	\N	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
27	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "eCHIS Production DB", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "192.168.1.31", "port": "5432", "database": "echis_report_builder", "username": "ucrdb", "password": "SeRNfOBj4QwTxsTkDDpq"}, "object_ref": "DatabaseRestApi.validate_parameters"}	2025-03-19 16:52:55.880127	0	0	120	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
31	DatabaseRestApi.post	1	{"path": "/api/v1/database/", "database_name": "eCHIS Production DB", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "masked_encrypted_extra": "{}", "sqlalchemy_uri": "postgresql+psycopg2://ucrdb:SeRNfOBj4QwTxsTkDDpq@192.168.1.31:5432/echis_report_builder", "object_ref": "DatabaseRestApi.post"}	2025-03-19 16:52:58.065104	0	0	1478	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
36	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2025-03-19 16:53:05.764701	0	0	55	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
41	log	1	{"source": "sqlLab", "ts": 1742403204339, "event_name": "spa_navigation", "path": "/dataset/add/", "event_type": "user", "event_id": "M0MT3nAdXAjz_dImdPS-Z", "visibility": "visible"}	2025-03-19 16:53:23.717078	0	0	0	http://164.160.184.101:5006/dataset/add/
46	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table_metadata/", "name": "rpt_tt_smart_start_counseling", "schema": "public", "url_rule": "/api/v1/database/<int:pk>/table_metadata/", "object_ref": "DatabaseRestApi.table_metadata", "pk": 1}	2025-03-19 16:54:03.972848	0	0	832	http://164.160.184.101:5006/dataset/add/
50	log	1	{"source": "sqlLab", "ts": 1742403264592, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "At3m23Rrfv7S2w0LVAw5O", "visibility": "visible"}	2025-03-19 16:54:24.037338	0	0	0	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table
53	ExploreFormDataRestApi.post	1	{"path": "/api/v1/explore/form_data", "tab_id": "1", "datasource_id": 1, "datasource_type": "table", "form_data": {}, "object_ref": "ExploreFormDataRestApi.post"}	2025-03-19 16:54:26.121865	0	0	65	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table
59	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"COUNT(age)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"COUNT(age)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}, "result_format": "json", "result_type": "full", "object_ref": "ChartDataRestApi.data"}	2025-03-19 16:54:57.593462	0	0	585	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
25	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "192.168.1.31", "port": "5432", "database": "echis_report_builder"}}	2025-03-19 16:52:34.447337	0	0	\N	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
28	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "eCHIS Production DB", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "192.168.1.31", "port": "5432", "database": "echis_report_builder", "username": "ucrdb", "password": "SeRNfOBj4QwTxsTkDDpq"}, "object_ref": "DatabaseRestApi.validate_parameters"}	2025-03-19 16:52:56.083785	0	0	108	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
32	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2025-03-19 16:52:58.42788	0	0	21	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
35	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2025-03-19 16:53:05.756334	0	0	37	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
40	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_column:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_column": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2025-03-19 16:53:23.071651	0	0	46	http://164.160.184.101:5006/dataset/add/
45	DatabaseRestApi.table_metadata	1	{"path": "/api/v1/database/1/table_metadata/", "name": "rpt_tt_usage", "schema": "public", "url_rule": "/api/v1/database/<int:pk>/table_metadata/", "object_ref": "DatabaseRestApi.table_metadata", "pk": 1}	2025-03-19 16:53:50.018131	0	0	839	http://164.160.184.101:5006/dataset/add/
48	log	1	{"source": "sqlLab", "ts": 1742403249168, "event_name": "spa_navigation", "path": "/chart/add/", "event_type": "user", "event_id": "gnJhHeMdtLwX3h4nIda4x", "visibility": "visible"}	2025-03-19 16:54:10.513728	0	0	0	http://164.160.184.101:5006/chart/add/?dataset=rpt_tt_smart_start_counseling
56	log	1	{"source": "sqlLab", "ts": 1742403297067, "event_name": "change_explore_controls", "event_type": "user", "event_id": "fvUxXrR2qE3HivA90mq6i", "visibility": "visible"}	2025-03-19 16:54:56.399688	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
57	log	1	{"source": "sqlLab", "ts": 1742403297086, "event_name": "change_explore_controls", "event_type": "user", "event_id": "tvelH4NlRK-ZcYTd3820V", "visibility": "visible"}	2025-03-19 16:54:56.399692	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
61	log	1	{"source": "sqlLab", "ts": 1742403299518, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "inserted_at"}], "is_cached": null, "force_refresh": false, "row_count": 36, "datasource": "1__table", "start_offset": 34063, "duration": 863, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "tvelH4NlRK-ZcYTd3820V"}	2025-03-19 16:54:58.838538	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
29	test_connection_attempt	1	{"path": "/api/v1/database/", "database_name": "eCHIS Production DB", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true}, "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "masked_encrypted_extra": "{}", "sqlalchemy_uri": "postgresql+psycopg2://ucrdb:SeRNfOBj4QwTxsTkDDpq@192.168.1.31:5432/echis_report_builder", "engine": "PostgresEngineSpec"}	2025-03-19 16:52:56.607017	0	0	\N	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
33	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "id": 1, "configuration_method": "dynamic_form", "database_name": "eCHIS Production DB", "driver": "psycopg2", "expose_in_sqllab": true, "extra": "{\\"allows_virtual_table_explore\\":true}", "masked_encrypted_extra": "{}", "parameters": {"database": "echis_report_builder", "encryption": false, "host": "192.168.1.31", "password": "XXXXXXXXXX", "port": 5432, "query": {}, "username": "ucrdb"}, "sqlalchemy_uri": "postgresql+psycopg2://ucrdb:XXXXXXXXXX@192.168.1.31:5432/echis_report_builder", "uuid": "160e3e76-95bf-4444-94b2-644555b5570d", "engine": "postgresql", "catalog": {}, "query_input": "", "object_ref": "DatabaseRestApi.validate_parameters"}	2025-03-19 16:53:04.290035	0	0	134	http://164.160.184.101:5006/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
38	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2025-03-19 16:53:20.815481	0	0	78	http://164.160.184.101:5006/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
43	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(filters:!((col:database,opr:rel_o_m,value:1),(col:schema,opr:eq,value:public),(col:sql,opr:dataset_is_null_or_empty,value:!t)),page:0)", "rison": {"filters": [{"col": "database", "opr": "rel_o_m", "value": 1}, {"col": "schema", "opr": "eq", "value": "public"}, {"col": "sql", "opr": "dataset_is_null_or_empty", "value": true}], "page": 0}}	2025-03-19 16:53:30.805517	0	0	52	http://164.160.184.101:5006/dataset/add/
47	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "database": 1, "catalog": null, "schema": "public", "table_name": "rpt_tt_smart_start_counseling", "object_ref": "DatasetRestApi.post"}	2025-03-19 16:54:07.145605	0	0	1139	http://164.160.184.101:5006/dataset/add/
52	DatabaseRestApi.table_extra_metadata	1	{"path": "/api/v1/database/1/table_metadata/extra/", "name": "rpt_tt_smart_start_counseling", "catalog": "echis_report_builder", "schema": "public", "url_rule": "/api/v1/database/<int:pk>/table_metadata/extra/", "object_ref": "DatabaseRestApi.table_extra_metadata", "pk": 1}	2025-03-19 16:54:25.457299	0	0	8	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table
55	log	1	{"source": "sqlLab", "ts": 1742403282408, "event_name": "change_explore_controls", "event_type": "user", "event_id": "whqQvplXBIflkre3zkiB7", "visibility": "visible"}	2025-03-19 16:54:42.01406	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
60	ExploreFormDataRestApi.put	1	{"path": "/api/v1/explore/form_data/S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td", "tab_id": "1", "datasource_id": 1, "datasource_type": "table", "form_data": {}, "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td"}	2025-03-19 16:54:57.955994	0	0	20	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
62	execute_sql	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"COUNT_DISTINCT(age)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"COUNT_DISTINCT(age)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}, "result_format": "json", "result_type": "full", "object_ref": "superset.models.core"}	2025-03-19 16:55:15.598568	0	0	27	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
63	log	1	{"source": "sqlLab", "ts": 1742403315876, "event_name": "change_explore_controls", "event_type": "user", "event_id": "Rofpv3y_77nO5lEasYCch", "visibility": "visible"}	2025-03-19 16:55:15.635382	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
64	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"COUNT_DISTINCT(age)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "age", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 21, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(age)", "optionName": "metric_2km0fuakbid_fwm2ydjdbc"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"COUNT_DISTINCT(age)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}, "result_format": "json", "result_type": "full", "object_ref": "ChartDataRestApi.data"}	2025-03-19 16:55:15.677374	0	0	242	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
67	log	1	{"source": "sqlLab", "ts": 1742403335272, "event_name": "change_explore_controls", "event_type": "user", "event_id": "V1P7EOkioQ9mPCGg_P5xz", "visibility": "visible"}	2025-03-19 16:55:34.870655	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
65	ExploreFormDataRestApi.put	1	{"path": "/api/v1/explore/form_data/S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td", "tab_id": "1", "datasource_id": 1, "datasource_type": "table", "form_data": {}, "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td"}	2025-03-19 16:55:16.453189	0	0	184	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
72	log	1	{"source": "sqlLab", "ts": 1742403371316, "event_name": "change_explore_controls", "event_type": "user", "event_id": "XbzkwnSdna8WVKHhm3Igp", "visibility": "visible"}	2025-03-19 16:56:10.938173	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
73	log	1	{"source": "sqlLab", "ts": 1742403371344, "event_name": "change_explore_controls", "event_type": "user", "event_id": "TbSlsmr1ybaWNwBqnlqQB", "visibility": "visible"}	2025-03-19 16:56:10.938176	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
78	ExploreFormDataRestApi.put	1	{"path": "/api/v1/explore/form_data/S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td", "tab_id": "1", "datasource_id": 1, "datasource_type": "table", "form_data": {}, "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td"}	2025-03-19 16:56:20.383531	0	0	32	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
83	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}, "result_format": "json", "result_type": "full", "object_ref": "ChartDataRestApi.data"}	2025-03-19 16:57:02.805533	0	0	266	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
86	ChartRestApi.post	1	{"path": "/api/v1/chart/", "params": "{\\"datasource\\":\\"1__table\\",\\"viz_type\\":\\"echarts_timeseries_bar\\",\\"x_axis\\":\\"health_post\\",\\"time_grain_sqla\\":\\"P1D\\",\\"x_axis_sort_asc\\":true,\\"x_axis_sort_series\\":\\"name\\",\\"x_axis_sort_series_ascending\\":true,\\"metrics\\":[{\\"expressionType\\":\\"SIMPLE\\",\\"column\\":{\\"advanced_data_type\\":null,\\"certification_details\\":null,\\"certified_by\\":null,\\"column_name\\":\\"number_of_children\\",\\"description\\":null,\\"expression\\":null,\\"filterable\\":true,\\"groupby\\":true,\\"id\\":26,\\"is_certified\\":false,\\"is_dttm\\":false,\\"python_date_format\\":null,\\"type\\":\\"INTEGER\\",\\"type_generic\\":0,\\"verbose_name\\":null,\\"warning_markdown\\":null},\\"aggregate\\":\\"SUM\\",\\"sqlExpression\\":null,\\"datasourceWarning\\":false,\\"hasCustomLabel\\":false,\\"label\\":\\"SUM(number_of_children)\\",\\"optionName\\":\\"metric_yg9x9fucnar_tix6jyh3p4\\"}],\\"groupby\\":[],\\"adhoc_filters\\":[{\\"clause\\":\\"WHERE\\",\\"subject\\":\\"inserted_at\\",\\"operator\\":\\"TEMPORAL_RANGE\\",\\"comparator\\":\\"No filter\\",\\"expressionType\\":\\"SIMPLE\\"}],\\"order_desc\\":true,\\"row_limit\\":10000,\\"truncate_metric\\":true,\\"show_empty_columns\\":true,\\"comparison_type\\":\\"values\\",\\"annotation_layers\\":[],\\"forecastPeriods\\":10,\\"forecastInterval\\":0.8,\\"orientation\\":\\"vertical\\",\\"x_axis_title_margin\\":15,\\"y_axis_title_margin\\":15,\\"y_axis_title_position\\":\\"Left\\",\\"sort_series_type\\":\\"sum\\",\\"color_scheme\\":\\"supersetColors\\",\\"only_total\\":true,\\"show_legend\\":true,\\"legendType\\":\\"scroll\\",\\"legendOrientation\\":\\"top\\",\\"x_axis_time_format\\":\\"smart_date\\",\\"y_axis_format\\":\\"SMART_NUMBER\\",\\"truncateXAxis\\":true,\\"y_axis_bounds\\":[null,null],\\"rich_tooltip\\":true,\\"showTooltipTotal\\":true,\\"showTooltipPercentage\\":true,\\"tooltipTimeFormat\\":\\"smart_date\\",\\"extra_form_data\\":{},\\"dashboards\\":[]}", "slice_name": "Testing", "viz_type": "echarts_timeseries_bar", "datasource_id": 1, "datasource_type": "table", "dashboards": [], "owners": [], "query_context": "{\\"datasource\\":{\\"id\\":1,\\"type\\":\\"table\\"},\\"force\\":false,\\"queries\\":[{\\"filters\\":[{\\"col\\":\\"inserted_at\\",\\"op\\":\\"TEMPORAL_RANGE\\",\\"val\\":\\"No filter\\"}],\\"extras\\":{\\"time_grain_sqla\\":\\"P1D\\",\\"having\\":\\"\\",\\"where\\":\\"\\"},\\"applied_time_extras\\":{},\\"columns\\":[{\\"timeGrain\\":\\"P1D\\",\\"columnType\\":\\"BASE_AXIS\\",\\"sqlExpression\\":\\"health_post\\",\\"label\\":\\"health_post\\",\\"expressionType\\":\\"SQL\\"}],\\"metrics\\":[{\\"expressionType\\":\\"SIMPLE\\",\\"column\\":{\\"advanced_data_type\\":null,\\"certification_details\\":null,\\"certified_by\\":null,\\"column_name\\":\\"number_of_children\\",\\"description\\":null,\\"expression\\":null,\\"filterable\\":true,\\"groupby\\":true,\\"id\\":26,\\"is_certified\\":false,\\"is_dttm\\":false,\\"python_date_format\\":null,\\"type\\":\\"INTEGER\\",\\"type_generic\\":0,\\"verbose_name\\":null,\\"warning_markdown\\":null},\\"aggregate\\":\\"SUM\\",\\"sqlExpression\\":null,\\"datasourceWarning\\":false,\\"hasCustomLabel\\":false,\\"label\\":\\"SUM(number_of_children)\\",\\"optionName\\":\\"metric_yg9x9fucnar_tix6jyh3p4\\"}],\\"orderby\\":[[{\\"expressionType\\":\\"SIMPLE\\",\\"column\\":{\\"advanced_data_type\\":null,\\"certification_details\\":null,\\"certified_by\\":null,\\"column_name\\":\\"number_of_children\\",\\"description\\":null,\\"expression\\":null,\\"filterable\\":true,\\"groupby\\":true,\\"id\\":26,\\"is_certified\\":false,\\"is_dttm\\":false,\\"python_date_format\\":null,\\"type\\":\\"INTEGER\\",\\"type_generic\\":0,\\"verbose_name\\":null,\\"warning_markdown\\":null},\\"aggregate\\":\\"SUM\\",\\"sqlExpression\\":null,\\"datasourceWarning\\":false,\\"hasCustomLabel\\":false,\\"label\\":\\"SUM(number_of_children)\\",\\"optionName\\":\\"metric_yg9x9fucnar_tix6jyh3p4\\"},false]],\\"annotation_layers\\":[],\\"row_limit\\":10000,\\"series_columns\\":[],\\"series_limit\\":0,\\"order_desc\\":true,\\"url_params\\":{},\\"custom_params\\":{},\\"custom_form_data\\":{},\\"time_offsets\\":[],\\"post_processing\\":[{\\"operation\\":\\"pivot\\",\\"options\\":{\\"index\\":[\\"health_post\\"],\\"columns\\":[],\\"aggregates\\":{\\"SUM(number_of_children)\\":{\\"operator\\":\\"mean\\"}},\\"drop_missing_columns\\":false}},{\\"operation\\":\\"flatten\\"}]}],\\"form_data\\":{\\"datasource\\":\\"1__table\\",\\"viz_type\\":\\"echarts_timeseries_bar\\",\\"x_axis\\":\\"health_post\\",\\"time_grain_sqla\\":\\"P1D\\",\\"x_axis_sort_asc\\":true,\\"x_axis_sort_series\\":\\"name\\",\\"x_axis_sort_series_ascending\\":true,\\"metrics\\":[{\\"expressionType\\":\\"SIMPLE\\",\\"column\\":{\\"advanced_data_type\\":null,\\"certification_details\\":null,\\"certified_by\\":null,\\"column_name\\":\\"number_of_children\\",\\"description\\":null,\\"expression\\":null,\\"filterable\\":true,\\"groupby\\":true,\\"id\\":26,\\"is_certified\\":false,\\"is_dttm\\":false,\\"python_date_format\\":null,\\"type\\":\\"INTEGER\\",\\"type_generic\\":0,\\"verbose_name\\":null,\\"warning_markdown\\":null},\\"aggregate\\":\\"SUM\\",\\"sqlExpression\\":null,\\"datasourceWarning\\":false,\\"hasCustomLabel\\":false,\\"label\\":\\"SUM(number_of_children)\\",\\"optionName\\":\\"metric_yg9x9fucnar_tix6jyh3p4\\"}],\\"groupby\\":[],\\"adhoc_filters\\":[{\\"clause\\":\\"WHERE\\",\\"subject\\":\\"inserted_at\\",\\"operator\\":\\"TEMPORAL_RANGE\\",\\"comparator\\":\\"No filter\\",\\"expressionType\\":\\"SIMPLE\\"}],\\"order_desc\\":true,\\"row_limit\\":10000,\\"truncate_metric\\":true,\\"show_empty_columns\\":true,\\"comparison_type\\":\\"values\\",\\"annotation_layers\\":[],\\"forecastPeriods\\":10,\\"forecastInterval\\":0.8,\\"orientation\\":\\"vertical\\",\\"x_axis_title_margin\\":15,\\"y_axis_title_margin\\":15,\\"y_axis_title_position\\":\\"Left\\",\\"sort_series_type\\":\\"sum\\",\\"color_scheme\\":\\"supersetColors\\",\\"only_total\\":true,\\"show_legend\\":true,\\"legendType\\":\\"scroll\\",\\"legendOrientation\\":\\"top\\",\\"x_axis_time_format\\":\\"smart_date\\",\\"y_axis_format\\":\\"SMART_NUMBER\\",\\"truncateXAxis\\":true,\\"y_axis_bounds\\":[null,null],\\"rich_tooltip\\":true,\\"showTooltipTotal\\":true,\\"showTooltipPercentage\\":true,\\"tooltipTimeFormat\\":\\"smart_date\\",\\"extra_form_data\\":{},\\"dashboards\\":[],\\"force\\":false,\\"result_format\\":\\"json\\",\\"result_type\\":\\"full\\"},\\"result_format\\":\\"json\\",\\"result_type\\":\\"full\\"}", "object_ref": "ChartRestApi.post"}	2025-03-19 16:57:07.730726	0	0	68	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
91	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "datasourceWarning": false, "expressionType": "SIMPLE", "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4", "sqlExpression": null}], "orderby": [[{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "datasourceWarning": false, "expressionType": "SIMPLE", "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4", "sqlExpression": null}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "datasourceWarning": false, "expressionType": "SIMPLE", "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4", "sqlExpression": null}], "orderby": [[{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "datasourceWarning": false, "expressionType": "SIMPLE", "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4", "sqlExpression": null}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "result_format": "json", "result_type": "full", "object_ref": "ChartDataRestApi.data"}	2025-03-19 16:57:08.83238	0	1	226	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table&save_action=saveas&slice_id=1
94	ExploreFormDataRestApi.post	1	{"path": "/api/v1/explore/form_data", "tab_id": "1", "datasource_id": 1, "datasource_type": "table", "form_data": {}, "chart_id": 1, "object_ref": "ExploreFormDataRestApi.post"}	2025-03-19 16:57:09.731286	0	0	32	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
100	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25,select_columns:!(id,dashboard_title,published,url,slug,changed_by,changed_on_delta_humanized,owners.id,owners.first_name,owners.last_name,owners,tags.id,tags.name,tags.type,status,certified_by,certification_details,changed_on))", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25, "select_columns": ["id", "dashboard_title", "published", "url", "slug", "changed_by", "changed_on_delta_humanized", "owners.id", "owners.first_name", "owners.last_name", "owners", "tags.id", "tags.name", "tags.type", "status", "certified_by", "certification_details", "changed_on"]}}	2025-03-19 16:57:11.775589	0	0	15	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
66	log	1	{"source": "sqlLab", "ts": 1742403317461, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "inserted_at"}], "is_cached": null, "force_refresh": false, "row_count": 36, "datasource": "1__table", "start_offset": 52382, "duration": 488, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "Rofpv3y_77nO5lEasYCch"}	2025-03-19 16:55:16.862932	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
74	execute_sql	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}, "result_format": "json", "result_type": "full", "object_ref": "superset.models.core"}	2025-03-19 16:56:19.283774	0	0	30	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
79	log	1	{"source": "sqlLab", "ts": 1742403381642, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "inserted_at"}], "is_cached": null, "force_refresh": false, "row_count": 36, "datasource": "1__table", "start_offset": 116071, "duration": 980, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "7RP455d0hdINqilVL_MuW"}	2025-03-19 16:56:20.959061	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
87	ExploreRestApi.get	1	{"path": "/api/v1/explore/", "viz_type": "echarts_timeseries_bar", "datasource_id": "1", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "object_ref": "ExploreRestApi.get"}	2025-03-19 16:57:08.134485	0	1	73	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table&save_action=saveas&slice_id=1
93	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2025-03-19 16:57:09.549342	0	0	34	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
99	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2025-03-19 16:57:11.632151	0	0	40	http://164.160.184.101:5006/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
109	DashboardRestApi.get	1	{"path": "/api/v1/dashboard/1", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 1}	2025-03-19 16:57:14.620729	1	0	11	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
115	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2025-03-19 16:57:17.749613	0	0	37	http://164.160.184.101:5006/chart/add?dashboard_id=1
120	log	1	{"source": "sqlLab", "ts": 1742403441864, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "dGHxinSdWlvVQhiNxNraq", "visibility": "visible"}	2025-03-19 16:57:21.174862	0	0	0	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
129	log	1	{"source": "dashboard", "source_id": 1, "impression_id": "rF99hmJRKrHm_7Y5MmqFL", "version": "v2", "ts": 1742403451273, "event_name": "toggle_edit_dashboard", "edit_mode": true, "event_type": "user", "event_id": "XTeEyw1-FHhz4xR9RrCqo", "visibility": "visible"}	2025-03-19 16:57:30.596321	1	0	0	http://164.160.184.101:5006/superset/dashboard/1/?native_filters_key=gLI_y0L4FQ8udPL-865tNC6F2gWo5ZJzLUc2f0QrD1hFcIsY_ZLJiPl99YNa3eha
136	DashboardFilterStateRestApi.post	1	{"path": "/api/v1/dashboard/1/filter_state", "tab_id": "2", "value": "{}", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 1}	2025-03-19 16:57:41.298105	0	0	39	http://164.160.184.101:5006/superset/dashboard/1/
68	log	1	{"source": "sqlLab", "ts": 1742403335294, "event_name": "change_explore_controls", "event_type": "user", "event_id": "ZRTHxqJDy983n8eUhyShL", "visibility": "visible"}	2025-03-19 16:55:34.87066	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
75	log	1	{"source": "sqlLab", "ts": 1742403379606, "event_name": "change_explore_controls", "event_type": "user", "event_id": "KiE46C9C4oq44qTmoYCFN", "visibility": "visible"}	2025-03-19 16:56:19.314797	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
76	log	1	{"source": "sqlLab", "ts": 1742403379626, "event_name": "change_explore_controls", "event_type": "user", "event_id": "7RP455d0hdINqilVL_MuW", "visibility": "visible"}	2025-03-19 16:56:19.314802	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
80	log	1	{"source": "sqlLab", "ts": 1742403419295, "event_name": "change_explore_controls", "event_type": "user", "event_id": "_6s6XMZxz4s5U8-3h-AIq", "visibility": "visible"}	2025-03-19 16:56:58.839201	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
84	ExploreFormDataRestApi.put	1	{"path": "/api/v1/explore/form_data/S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td", "tab_id": "1", "datasource_id": 1, "datasource_type": "table", "form_data": {}, "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td"}	2025-03-19 16:57:03.527962	0	0	65	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
88	ChartRestApi.favorite_status	1	{"path": "/api/v1/chart/favorite_status/", "q": "!(1)", "object_ref": "ChartRestApi.favorite_status", "rison": [1]}	2025-03-19 16:57:08.632711	0	0	22	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table&save_action=saveas&slice_id=1
92	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25,select_columns:!(id,dashboard_title,published,url,slug,changed_by,changed_on_delta_humanized,owners.id,owners.first_name,owners.last_name,owners,tags.id,tags.name,tags.type,status,certified_by,certification_details,changed_on))", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25, "select_columns": ["id", "dashboard_title", "published", "url", "slug", "changed_by", "changed_on_delta_humanized", "owners.id", "owners.first_name", "owners.last_name", "owners", "tags.id", "tags.name", "tags.type", "status", "certified_by", "certification_details", "changed_on"]}}	2025-03-19 16:57:09.543458	0	0	29	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
95	log	1	{"source": "explore", "source_id": 1, "impression_id": "KU125tHbxqmAkREoDT7I0", "version": "v2", "ts": 1742403430184, "event_name": "change_explore_controls", "event_type": "user", "event_id": "j2Uh_-wVbI84WmY3BX1Cc", "visibility": "visible"}	2025-03-19 16:57:10.296791	0	0	0	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
96	log	1	{"source": "explore", "source_id": 1, "impression_id": "KU125tHbxqmAkREoDT7I0", "version": "v2", "ts": 1742403430705, "event_name": "load_chart", "slice_id": 1, "applied_filters": [{"column": "inserted_at"}], "is_cached": null, "force_refresh": false, "row_count": 36, "datasource": "1__table", "start_offset": 165637, "duration": 477, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "j2Uh_-wVbI84WmY3BX1Cc"}	2025-03-19 16:57:10.29681	0	0	0	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
97	log	1	{"source": "explore", "source_id": 1, "impression_id": "KU125tHbxqmAkREoDT7I0", "version": "v2", "ts": 1742403431010, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "jO42Sjjb7-ZQ-vRMXSZiF", "visibility": "visible"}	2025-03-19 16:57:10.296811	0	0	0	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
102	log	1	{"source": "explore", "source_id": 1, "impression_id": "KU125tHbxqmAkREoDT7I0", "version": "v2", "ts": 1742403432656, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "PVdVLgWbSYOgA6ePT3pdc", "visibility": "visible"}	2025-03-19 16:57:12.777118	0	0	0	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
103	log	1	{"source": "explore", "source_id": 1, "impression_id": "KU125tHbxqmAkREoDT7I0", "version": "v2", "ts": 1742403433418, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "3QiAg9k07iktU8FzOFGtp", "visibility": "visible"}	2025-03-19 16:57:12.777123	0	0	0	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
106	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2025-03-19 16:57:14.463555	0	0	35	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
111	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:owners,opr:rel_m_m,value:1)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "owners", "opr": "rel_m_m", "value": 1}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2025-03-19 16:57:15.405898	0	0	46	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
116	log	1	{"source": "sqlLab", "ts": 1742403439269, "event_name": "spa_navigation", "path": "/chart/add", "event_type": "user", "event_id": "IqDzGc88Hz9pQLsZS4igF", "visibility": "visible"}	2025-03-19 16:57:18.715282	0	0	0	http://164.160.184.101:5006/chart/add?dashboard_id=1
69	log	1	{"source": "sqlLab", "ts": 1742403345312, "event_name": "change_explore_controls", "event_type": "user", "event_id": "GH2nTc_Le586xwxT9C3l0", "visibility": "visible"}	2025-03-19 16:55:44.956195	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
70	log	1	{"source": "sqlLab", "ts": 1742403345331, "event_name": "change_explore_controls", "event_type": "user", "event_id": "SV0-nMDkBH6Wdq6py3zoL", "visibility": "visible"}	2025-03-19 16:55:44.956199	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
71	log	1	{"source": "sqlLab", "ts": 1742403363267, "event_name": "change_explore_controls", "event_type": "user", "event_id": "zwTd2RMdPZyvXYYW6kn2U", "visibility": "visible"}	2025-03-19 16:56:02.938002	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
77	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}, "result_format": "json", "result_type": "full", "object_ref": "ChartDataRestApi.data"}	2025-03-19 16:56:19.335587	0	0	210	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
81	log	1	{"source": "sqlLab", "ts": 1742403421758, "event_name": "change_explore_controls", "event_type": "user", "event_id": "2aYDW2-ZMS5nFw-24G3ck", "visibility": "visible"}	2025-03-19 16:57:01.293336	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
82	execute_sql	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}, "result_format": "json", "result_type": "full", "object_ref": "superset.models.core"}	2025-03-19 16:57:02.701269	0	0	29	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
85	log	1	{"source": "sqlLab", "ts": 1742403424679, "event_name": "load_chart", "slice_id": 0, "applied_filters": [{"column": "inserted_at"}], "is_cached": null, "force_refresh": false, "row_count": 36, "datasource": "1__table", "start_offset": 159537, "duration": 551, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "2aYDW2-ZMS5nFw-24G3ck"}	2025-03-19 16:57:03.974754	0	0	0	http://164.160.184.101:5006/explore/?form_data_key=S2cfhYT0TMWFmkRaVw8skNg9qFVOb1v5M3Kk1kYo_QgJ73j7WTfbNcPQ1Abtx1td&viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table
89	DatabaseRestApi.table_extra_metadata	1	{"path": "/api/v1/database/1/table_metadata/extra/", "name": "rpt_tt_smart_start_counseling", "catalog": "echis_report_builder", "schema": "public", "url_rule": "/api/v1/database/<int:pk>/table_metadata/extra/", "object_ref": "DatabaseRestApi.table_extra_metadata", "pk": 1}	2025-03-19 16:57:08.634206	0	0	22	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table&save_action=saveas&slice_id=1
90	execute_sql	1	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "datasourceWarning": false, "expressionType": "SIMPLE", "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4", "sqlExpression": null}], "orderby": [[{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "datasourceWarning": false, "expressionType": "SIMPLE", "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4", "sqlExpression": null}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "datasourceWarning": false, "expressionType": "SIMPLE", "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4", "sqlExpression": null}], "orderby": [[{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "datasourceWarning": false, "expressionType": "SIMPLE", "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4", "sqlExpression": null}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {"datasource_id": "1", "datasource_type": "table", "save_action": "saveas", "slice_id": "1", "viz_type": "echarts_timeseries_bar"}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "result_format": "json", "result_type": "full", "object_ref": "superset.models.core"}	2025-03-19 16:57:08.783487	0	1	26	http://164.160.184.101:5006/explore/?viz_type=echarts_timeseries_bar&datasource=1__table&datasource_id=1&datasource_type=table&save_action=saveas&slice_id=1
98	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2025-03-19 16:57:11.613792	0	0	18	http://164.160.184.101:5006/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
101	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2025-03-19 16:57:11.778284	0	0	27	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
105	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2025-03-19 16:57:14.461727	0	0	32	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
104	dashboard	1	{"path": "/superset/dashboard/1/", "edit": "true", "url_rule": "/superset/dashboard/<dashboard_id_or_slug>/", "object_ref": "Superset.dashboard", "dashboard_id_or_slug": "1", "dashboard_id": 1, "dashboard_version": "v2", "dash_edit_perm": true, "edit_mode": true}	2025-03-19 16:57:13.438056	1	0	48	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
108	DashboardRestApi.get_charts	1	{"path": "/api/v1/dashboard/1/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "1"}	2025-03-19 16:57:14.613397	0	0	6	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
118	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2025-03-19 16:57:20.404236	0	0	16	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
123	DashboardRestApi.get	1	{"path": "/api/v1/dashboard/1", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 1}	2025-03-19 16:57:23.092593	1	0	8	http://164.160.184.101:5006/superset/dashboard/1/
126	log	1	{"source": "sqlLab", "ts": 1742403444738, "event_name": "spa_navigation", "path": "/superset/dashboard/1/", "event_type": "user", "event_id": "NONIyYfzoKiIZstc46LgI", "visibility": "visible"}	2025-03-19 16:57:24.651083	0	0	0	http://164.160.184.101:5006/superset/dashboard/1/
127	log	1	{"source": "dashboard", "source_id": 1, "impression_id": "rF99hmJRKrHm_7Y5MmqFL", "version": "v2", "ts": 1742403445356, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 618, "is_empty": true, "is_published": false, "event_type": "user", "event_id": "AB8IelodP7yFFL4uTxTNL", "visibility": "visible"}	2025-03-19 16:57:24.651089	0	0	0	http://164.160.184.101:5006/superset/dashboard/1/
132	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "1", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "result_format": "json", "result_type": "full", "object_ref": "ChartDataRestApi.data"}	2025-03-19 16:57:34.828816	1	1	292	http://164.160.184.101:5006/superset/dashboard/1/?native_filters_key=gLI_y0L4FQ8udPL-865tNC6F2gWo5ZJzLUc2f0QrD1hFcIsY_ZLJiPl99YNa3eha
107	DashboardRestApi.get_datasets	1	{"path": "/api/v1/dashboard/1/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "1"}	2025-03-19 16:57:14.603309	0	0	11	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
112	log	1	{"source": "sqlLab", "ts": 1742403436012, "event_name": "spa_navigation", "path": "/superset/dashboard/1/", "event_type": "user", "event_id": "Xx-OZfoP3td0NeMUUoB5Z", "visibility": "visible"}	2025-03-19 16:57:15.840073	0	0	0	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
113	log	1	{"source": "dashboard", "source_id": 1, "impression_id": "Q0fzjdusuJtwZi8KNhTaB", "version": "v2", "ts": 1742403436425, "event_name": "mount_dashboard", "is_soft_navigation": false, "is_edit_mode": true, "mount_duration": 1909, "is_empty": true, "is_published": false, "event_type": "user", "event_id": "vV6FoBGKRb7I7dM3M2FMd", "visibility": "visible"}	2025-03-19 16:57:15.840077	0	0	0	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
117	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25,select_columns:!(id,dashboard_title,published,url,slug,changed_by,changed_on_delta_humanized,owners.id,owners.first_name,owners.last_name,owners,tags.id,tags.name,tags.type,status,certified_by,certification_details,changed_on))", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25, "select_columns": ["id", "dashboard_title", "published", "url", "slug", "changed_by", "changed_on_delta_humanized", "owners.id", "owners.first_name", "owners.last_name", "owners", "tags.id", "tags.name", "tags.type", "status", "certified_by", "certification_details", "changed_on"]}}	2025-03-19 16:57:20.37536	0	0	18	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
121	DashboardRestApi.get_datasets	1	{"path": "/api/v1/dashboard/1/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "1"}	2025-03-19 16:57:23.080226	0	0	5	http://164.160.184.101:5006/superset/dashboard/1/
130	fetch_datasource_metadata	1	{"path": "/superset/fetch_datasource_metadata", "datasourceKey": "1__table", "object_ref": "Superset.fetch_datasource_metadata"}	2025-03-19 16:57:34.527181	0	0	56	http://164.160.184.101:5006/superset/dashboard/1/?native_filters_key=gLI_y0L4FQ8udPL-865tNC6F2gWo5ZJzLUc2f0QrD1hFcIsY_ZLJiPl99YNa3eha
134	DashboardRestApi.put	1	{"path": "/api/v1/dashboard/1", "certified_by": "", "certification_details": "", "css": "", "dashboard_title": "[ untitled dashboard ]", "slug": null, "owners": [1], "json_metadata": "{\\"chart_configuration\\":{\\"1\\":{\\"id\\":1,\\"crossFilters\\":{\\"scope\\":\\"global\\",\\"chartsInScope\\":[]}}},\\"global_chart_configuration\\":{\\"scope\\":{\\"rootPath\\":[\\"ROOT_ID\\"],\\"excluded\\":[]},\\"chartsInScope\\":[1]},\\"map_label_colors\\":{\\"SUM(number_of_children)\\":\\"#1FA8C9\\"},\\"color_scheme\\":\\"\\",\\"positions\\":{\\"DASHBOARD_VERSION_KEY\\":\\"v2\\",\\"ROOT_ID\\":{\\"type\\":\\"ROOT\\",\\"id\\":\\"ROOT_ID\\",\\"children\\":[\\"GRID_ID\\"]},\\"GRID_ID\\":{\\"type\\":\\"GRID\\",\\"id\\":\\"GRID_ID\\",\\"children\\":[\\"ROW-j9zdsl_l0jJeXiljtWtyd\\"],\\"parents\\":[\\"ROOT_ID\\"]},\\"HEADER_ID\\":{\\"id\\":\\"HEADER_ID\\",\\"type\\":\\"HEADER\\",\\"meta\\":{\\"text\\":\\"[ untitled dashboard ]\\"}},\\"CHART-AxPb48Qv54_Qac0a4J7V2\\":{\\"type\\":\\"CHART\\",\\"id\\":\\"CHART-AxPb48Qv54_Qac0a4J7V2\\",\\"children\\":[],\\"parents\\":[\\"ROOT_ID\\",\\"GRID_ID\\",\\"ROW-j9zdsl_l0jJeXiljtWtyd\\"],\\"meta\\":{\\"width\\":4,\\"height\\":50,\\"chartId\\":1,\\"sliceName\\":\\"Testing\\"}},\\"ROW-j9zdsl_l0jJeXiljtWtyd\\":{\\"type\\":\\"ROW\\",\\"id\\":\\"ROW-j9zdsl_l0jJeXiljtWtyd\\",\\"children\\":[\\"CHART-AxPb48Qv54_Qac0a4J7V2\\"],\\"parents\\":[\\"ROOT_ID\\",\\"GRID_ID\\"],\\"meta\\":{\\"background\\":\\"BACKGROUND_TRANSPARENT\\"}}},\\"refresh_frequency\\":0,\\"color_scheme_domain\\":[],\\"expanded_slices\\":{},\\"label_colors\\":{},\\"shared_label_colors\\":[],\\"timed_refresh_immune_slices\\":[],\\"cross_filters_enabled\\":true,\\"default_filters\\":\\"{}\\",\\"filter_scopes\\":{}}", "url_rule": "/api/v1/dashboard/<pk>", "object_ref": "DashboardRestApi.put", "pk": "1"}	2025-03-19 16:57:40.520309	0	0	84	http://164.160.184.101:5006/superset/dashboard/1/?native_filters_key=gLI_y0L4FQ8udPL-865tNC6F2gWo5ZJzLUc2f0QrD1hFcIsY_ZLJiPl99YNa3eha
110	DashboardRestApi.favorite_status	1	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [1]}	2025-03-19 16:57:15.367423	0	0	17	http://164.160.184.101:5006/superset/dashboard/1/?edit=true
114	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2025-03-19 16:57:17.745295	0	0	46	http://164.160.184.101:5006/chart/add?dashboard_id=1
119	DashboardRestApi.favorite_status	1	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [1]}	2025-03-19 16:57:20.655015	0	0	3	http://164.160.184.101:5006/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
124	DashboardRestApi.favorite_status	1	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [1]}	2025-03-19 16:57:24.246498	0	0	2	http://164.160.184.101:5006/superset/dashboard/1/
128	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(columns:!(changed_on_delta_humanized,changed_on_utc,datasource_id,datasource_type,datasource_url,datasource_name_text,description_markeddown,description,id,params,slice_name,thumbnail_url,url,viz_type,owners.id,created_by.id),filters:!((col:owners,opr:rel_m_m,value:1)),order_column:changed_on_delta_humanized,order_direction:desc,page_size:200)", "rison": {"columns": ["changed_on_delta_humanized", "changed_on_utc", "datasource_id", "datasource_type", "datasource_url", "datasource_name_text", "description_markeddown", "description", "id", "params", "slice_name", "thumbnail_url", "url", "viz_type", "owners.id", "created_by.id"], "filters": [{"col": "owners", "opr": "rel_m_m", "value": 1}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page_size": 200}}	2025-03-19 16:57:29.829462	0	0	54	http://164.160.184.101:5006/superset/dashboard/1/?native_filters_key=gLI_y0L4FQ8udPL-865tNC6F2gWo5ZJzLUc2f0QrD1hFcIsY_ZLJiPl99YNa3eha
133	log	1	{"source": "dashboard", "source_id": 1, "impression_id": "rF99hmJRKrHm_7Y5MmqFL", "version": "v2", "ts": 1742403456924, "event_name": "load_chart", "slice_id": 1, "applied_filters": [{"column": "inserted_at"}], "is_cached": null, "force_refresh": false, "row_count": 36, "datasource": "1__table", "start_offset": 11271, "duration": 914, "has_extra_filters": false, "viz_type": "echarts_timeseries_bar", "data_age": null, "event_type": "timing", "trigger_event": "XTeEyw1-FHhz4xR9RrCqo"}	2025-03-19 16:57:36.335243	1	0	0	http://164.160.184.101:5006/superset/dashboard/1/?native_filters_key=gLI_y0L4FQ8udPL-865tNC6F2gWo5ZJzLUc2f0QrD1hFcIsY_ZLJiPl99YNa3eha
122	DashboardRestApi.get_charts	1	{"path": "/api/v1/dashboard/1/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "1"}	2025-03-19 16:57:23.086127	0	0	8	http://164.160.184.101:5006/superset/dashboard/1/
125	DashboardFilterStateRestApi.post	1	{"path": "/api/v1/dashboard/1/filter_state", "tab_id": "2", "value": "{}", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 1}	2025-03-19 16:57:24.601109	0	0	149	http://164.160.184.101:5006/superset/dashboard/1/
131	execute_sql	1	{"path": "/api/v1/chart/data", "form_data": {"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}], "slice_id": 1}, "dashboard_id": "1", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [{"col": "inserted_at", "op": "TEMPORAL_RANGE", "val": "No filter"}], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": [{"timeGrain": "P1D", "columnType": "BASE_AXIS", "sqlExpression": "health_post", "label": "health_post", "expressionType": "SQL"}], "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}], "orderby": [[{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "number_of_children", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 26, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "INTEGER", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "datasourceWarning": false, "hasCustomLabel": false, "label": "SUM(number_of_children)", "optionName": "metric_yg9x9fucnar_tix6jyh3p4"}, false]], "annotation_layers": [], "row_limit": 10000, "series_columns": [], "series_limit": 0, "order_desc": true, "url_params": {}, "custom_params": {}, "custom_form_data": {}, "time_offsets": [], "post_processing": [{"operation": "pivot", "options": {"index": ["health_post"], "columns": [], "aggregates": {"SUM(number_of_children)": {"operator": "mean"}}, "drop_missing_columns": false}}, {"operation": "flatten"}]}], "result_format": "json", "result_type": "full", "object_ref": "superset.models.core"}	2025-03-19 16:57:34.715064	1	1	32	http://164.160.184.101:5006/superset/dashboard/1/?native_filters_key=gLI_y0L4FQ8udPL-865tNC6F2gWo5ZJzLUc2f0QrD1hFcIsY_ZLJiPl99YNa3eha
135	DashboardRestApi.get_datasets	1	{"path": "/api/v1/dashboard/1/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "1"}	2025-03-19 16:57:40.885002	0	0	51	http://164.160.184.101:5006/superset/dashboard/1/
137	log	1	{"source": "dashboard", "source_id": 1, "impression_id": "rF99hmJRKrHm_7Y5MmqFL", "version": "v2", "ts": 1742403564228, "event_name": "hide_browser_tab", "start_offset": 119489, "duration": 1536, "event_type": "timing", "trigger_event": "XTeEyw1-FHhz4xR9RrCqo"}	2025-03-19 16:59:25.073506	1	0	0	http://164.160.184.101:5006/superset/dashboard/1/?native_filters_key=gLI_y0L4FQ8udPL-865tNC6F2gWo5ZJzLUc2f0QrD1hFcIsY_ZLJiPl99YNa3eha
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.query (id, client_id, database_id, tmp_table_name, tab_name, sql_editor_id, user_id, status, schema, sql, select_sql, executed_sql, "limit", select_as_cta, select_as_cta_used, progress, rows, error_message, start_time, changed_on, end_time, results_key, start_running_time, end_result_backend_time, tracking_url, extra_json, tmp_schema_name, ctas_method, limiting_factor, catalog) FROM stdin;
\.


--
-- Data for Name: report_execution_log; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_execution_log (id, scheduled_dttm, start_dttm, end_dttm, value, value_row_json, state, error_message, report_schedule_id, uuid) FROM stdin;
\.


--
-- Data for Name: report_recipient; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_recipient (id, type, recipient_config_json, report_schedule_id, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: report_schedule; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_schedule (id, type, name, description, context_markdown, active, crontab, sql, chart_id, dashboard_id, database_id, last_eval_dttm, last_state, last_value, last_value_row_json, validator_type, validator_config_json, log_retention, grace_period, created_on, changed_on, created_by_fk, changed_by_fk, working_timeout, report_format, creation_method, timezone, extra_json, force_screenshot, custom_width, custom_height, email_subject) FROM stdin;
\.


--
-- Data for Name: report_schedule_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.report_schedule_user (id, user_id, report_schedule_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_roles; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.rls_filter_roles (id, role_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.rls_filter_tables (id, table_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: row_level_security_filters; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.row_level_security_filters (created_on, changed_on, id, clause, created_by_fk, changed_by_fk, filter_type, group_key, name, description) FROM stdin;
\.


--
-- Data for Name: saved_query; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.saved_query (created_on, changed_on, id, user_id, db_id, label, schema, sql, description, changed_by_fk, created_by_fk, extra_json, last_run, rows, uuid, template_parameters, catalog) FROM stdin;
\.


--
-- Data for Name: slice_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slice_user (id, user_id, slice_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: slices; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.slices (created_on, changed_on, id, slice_name, datasource_type, datasource_name, viz_type, params, created_by_fk, changed_by_fk, description, cache_timeout, perm, datasource_id, schema_perm, uuid, query_context, last_saved_at, last_saved_by_fk, certified_by, certification_details, is_managed_externally, external_url, catalog_perm) FROM stdin;
2025-03-19 16:57:07.68501	2025-03-19 16:57:07.685017	1	Testing	table	public.rpt_tt_smart_start_counseling	echarts_timeseries_bar	{"datasource":"1__table","viz_type":"echarts_timeseries_bar","x_axis":"health_post","time_grain_sqla":"P1D","x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"number_of_children","description":null,"expression":null,"filterable":true,"groupby":true,"id":26,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"INTEGER","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"SUM","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"SUM(number_of_children)","optionName":"metric_yg9x9fucnar_tix6jyh3p4"}],"groupby":[],"adhoc_filters":[{"clause":"WHERE","subject":"inserted_at","operator":"TEMPORAL_RANGE","comparator":"No filter","expressionType":"SIMPLE"}],"order_desc":true,"row_limit":10000,"truncate_metric":true,"show_empty_columns":true,"comparison_type":"values","annotation_layers":[],"forecastPeriods":10,"forecastInterval":0.8,"orientation":"vertical","x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","y_axis_format":"SMART_NUMBER","truncateXAxis":true,"y_axis_bounds":[null,null],"rich_tooltip":true,"showTooltipTotal":true,"showTooltipPercentage":true,"tooltipTimeFormat":"smart_date","extra_form_data":{},"dashboards":[]}	1	1	\N	\N	[eCHIS Production DB].[rpt_tt_smart_start_counseling](id:1)	1	[eCHIS Production DB].[echis_report_builder].[public]	e64ccef4-d81e-4339-8701-a3a75b415811	{"datasource":{"id":1,"type":"table"},"force":false,"queries":[{"filters":[{"col":"inserted_at","op":"TEMPORAL_RANGE","val":"No filter"}],"extras":{"time_grain_sqla":"P1D","having":"","where":""},"applied_time_extras":{},"columns":[{"timeGrain":"P1D","columnType":"BASE_AXIS","sqlExpression":"health_post","label":"health_post","expressionType":"SQL"}],"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"number_of_children","description":null,"expression":null,"filterable":true,"groupby":true,"id":26,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"INTEGER","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"SUM","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"SUM(number_of_children)","optionName":"metric_yg9x9fucnar_tix6jyh3p4"}],"orderby":[[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"number_of_children","description":null,"expression":null,"filterable":true,"groupby":true,"id":26,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"INTEGER","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"SUM","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"SUM(number_of_children)","optionName":"metric_yg9x9fucnar_tix6jyh3p4"},false]],"annotation_layers":[],"row_limit":10000,"series_columns":[],"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"time_offsets":[],"post_processing":[{"operation":"pivot","options":{"index":["health_post"],"columns":[],"aggregates":{"SUM(number_of_children)":{"operator":"mean"}},"drop_missing_columns":false}},{"operation":"flatten"}]}],"form_data":{"datasource":"1__table","viz_type":"echarts_timeseries_bar","x_axis":"health_post","time_grain_sqla":"P1D","x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"number_of_children","description":null,"expression":null,"filterable":true,"groupby":true,"id":26,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"INTEGER","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"SUM","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"SUM(number_of_children)","optionName":"metric_yg9x9fucnar_tix6jyh3p4"}],"groupby":[],"adhoc_filters":[{"clause":"WHERE","subject":"inserted_at","operator":"TEMPORAL_RANGE","comparator":"No filter","expressionType":"SIMPLE"}],"order_desc":true,"row_limit":10000,"truncate_metric":true,"show_empty_columns":true,"comparison_type":"values","annotation_layers":[],"forecastPeriods":10,"forecastInterval":0.8,"orientation":"vertical","x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","y_axis_format":"SMART_NUMBER","truncateXAxis":true,"y_axis_bounds":[null,null],"rich_tooltip":true,"showTooltipTotal":true,"showTooltipPercentage":true,"tooltipTimeFormat":"smart_date","extra_form_data":{},"dashboards":[],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}	2025-03-19 16:57:07.667542	1	\N	\N	f	\N	[eCHIS Production DB].[echis_report_builder]
\.


--
-- Data for Name: sql_metrics; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sql_metrics (created_on, changed_on, id, metric_name, verbose_name, metric_type, table_id, expression, description, created_by_fk, changed_by_fk, d3format, warning_text, extra, uuid, currency) FROM stdin;
2025-03-19 16:54:07.074961	2025-03-19 16:54:07.074965	1	count	COUNT(*)	count	1	COUNT(*)	\N	1	1	\N	\N	\N	01805c66-7085-4e97-94c7-7151f1f555e6	\N
\.


--
-- Data for Name: sqlatable_user; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.sqlatable_user (id, user_id, table_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ssh_tunnels; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.ssh_tunnels (created_on, changed_on, created_by_fk, changed_by_fk, extra_json, uuid, id, database_id, server_address, server_port, username, password, private_key, private_key_password) FROM stdin;
\.


--
-- Data for Name: tab_state; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tab_state (created_on, changed_on, extra_json, id, user_id, label, active, database_id, schema, sql, query_limit, latest_query_id, autorun, template_params, created_by_fk, changed_by_fk, hide_left_bar, saved_query_id, catalog) FROM stdin;
\.


--
-- Data for Name: table_columns; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_columns (created_on, changed_on, id, table_id, column_name, is_dttm, is_active, type, groupby, filterable, description, created_by_fk, changed_by_fk, expression, verbose_name, python_date_format, uuid, extra, advanced_data_type) FROM stdin;
2025-03-19 16:54:07.049768	2025-03-19 16:54:07.049774	1	1	doc_id	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	7ea57f3d-820d-4e61-9717-ca7ca9555f48	\N	\N
2025-03-19 16:54:07.049813	2025-03-19 16:54:07.049814	2	1	indicator_name	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	c85e8caa-cc5d-40b9-9b01-7380b6b54611	\N	\N
2025-03-19 16:54:07.04983	2025-03-19 16:54:07.049831	3	1	owner_id	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	580bb5ec-a52b-4d08-8f4f-a051c4e24865	\N	\N
2025-03-19 16:54:07.049846	2025-03-19 16:54:07.049847	4	1	report_name	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	1473e930-a7ee-44b4-8367-c9f545ad2a30	\N	\N
2025-03-19 16:54:07.049862	2025-03-19 16:54:07.049863	5	1	inserted_at	t	t	TIMESTAMP WITHOUT TIME ZONE	t	t	\N	1	1	\N	\N	\N	0b648c1f-8f30-4ebf-9429-a509a99653b6	\N	\N
2025-03-19 16:54:07.049878	2025-03-19 16:54:07.049879	6	1	repeat_iteration	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	d52e2e14-feda-4989-8b5d-705bd158ffa4	\N	\N
2025-03-19 16:54:07.049894	2025-03-19 16:54:07.049896	7	1	type	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	fffd3602-6833-433c-af11-949bfc22f946	\N	\N
2025-03-19 16:54:07.049911	2025-03-19 16:54:07.049912	8	1	region	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	7257e6fe-6db1-4739-be39-a00ba52b6bc7	\N	\N
2025-03-19 16:54:07.049926	2025-03-19 16:54:07.049928	9	1	zone	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	9acdba2f-d2a4-4aed-a30b-6f977ed43fcd	\N	\N
2025-03-19 16:54:07.049942	2025-03-19 16:54:07.049943	10	1	woreda	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	366a7c0d-55fb-43a7-b223-3511735a7489	\N	\N
2025-03-19 16:54:07.049958	2025-03-19 16:54:07.049959	11	1	health_center	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	3fb60163-005b-42ed-ad7d-44ce6067d2be	\N	\N
2025-03-19 16:54:07.049974	2025-03-19 16:54:07.049975	12	1	health_post	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	6c733fcd-c9ad-44ba-b198-008f8e89b90a	\N	\N
2025-03-19 16:54:07.049991	2025-03-19 16:54:07.049992	13	1	event_date	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	44c50cf1-faa8-4235-9758-d95cd31c533a	\N	\N
2025-03-19 16:54:07.050007	2025-03-19 16:54:07.050008	14	1	event_date_ethiopian	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	34908026-6d43-428c-b398-364d28dc1186	\N	\N
2025-03-19 16:54:07.050024	2025-03-19 16:54:07.050025	15	1	report_month_event_date	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	ab44000a-07e6-4e75-8bdc-dee9a95acb6b	\N	\N
2025-03-19 16:54:07.05004	2025-03-19 16:54:07.050041	16	1	report_week_event_date	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	f84a6685-2795-4f27-b44f-90326c60bd24	\N	\N
2025-03-19 16:54:07.050056	2025-03-19 16:54:07.050057	17	1	report_fiscal_year	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	0e8f1704-685b-4110-9588-2a8b1de30b9b	\N	\N
2025-03-19 16:54:07.050072	2025-03-19 16:54:07.050073	18	1	hp_gps	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	a50d9897-7e92-47de-b093-70da280e9397	\N	\N
2025-03-19 16:54:07.050088	2025-03-19 16:54:07.050089	19	1	hew_username	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	cad38da0-e93d-4b7e-912f-5ab1cb4ef9b3	\N	\N
2025-03-19 16:54:07.050104	2025-03-19 16:54:07.050105	20	1	name_of_agyw	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	400a30a8-927f-473a-8374-b3fdd983d331	\N	\N
2025-03-19 16:54:07.050119	2025-03-19 16:54:07.050121	21	1	age	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	f30d1fc7-2c71-4ac8-b7c0-0490fb7b284c	\N	\N
2025-03-19 16:54:07.050135	2025-03-19 16:54:07.050136	22	1	marital_status	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	d0a49263-0a11-4f9a-a943-86c2e92c0ff4	\N	\N
2025-03-19 16:54:07.050151	2025-03-19 16:54:07.050152	23	1	level_education	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	12ab292c-f78b-494b-9422-c4c5ba64193a	\N	\N
2025-03-19 16:54:07.050167	2025-03-19 16:54:07.050168	24	1	occupation	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	954d1808-517d-4d68-9820-76d994491c36	\N	\N
2025-03-19 16:54:07.050183	2025-03-19 16:54:07.050184	25	1	date_of_counseling	t	t	DATE	t	t	\N	1	1	\N	\N	\N	bd1cbb79-6147-4ba3-92c6-26a80ca1d940	\N	\N
2025-03-19 16:54:07.050199	2025-03-19 16:54:07.0502	26	1	number_of_children	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	40b704d2-3bf6-48ff-8ec6-1124e67761f0	\N	\N
2025-03-19 16:54:07.050215	2025-03-19 16:54:07.050216	27	1	decided_to_take_method	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	c88b5ddb-6a1b-410e-9ec6-c7b6924c0250	\N	\N
2025-03-19 16:54:07.050231	2025-03-19 16:54:07.050232	28	1	counseled_at_gps	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	e08d7f1b-2465-43de-8bef-95d77319beb9	\N	\N
2025-03-19 16:54:07.050248	2025-03-19 16:54:07.050249	29	1	agyw_counseled	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	ec7605d7-dbf1-42fc-b981-4b51a87a38dc	\N	\N
2025-03-19 16:54:07.050264	2025-03-19 16:54:07.050265	30	1	disaggregation_by_marial_status	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	75cb0dc4-d5c4-4972-92eb-4a5aa392278d	\N	\N
2025-03-19 16:54:07.050279	2025-03-19 16:54:07.050281	31	1	individuals	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	15b48301-70fa-4c4f-98e6-43afbb43988f	\N	\N
2025-03-19 16:54:07.050295	2025-03-19 16:54:07.050296	32	1	couples	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	d61ca35a-085f-43af-b940-d9c0c25726b4	\N	\N
2025-03-19 16:54:07.050312	2025-03-19 16:54:07.050313	33	1	no_of_groups	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	8b459cf7-32ca-410f-bd05-68b36d56a382	\N	\N
2025-03-19 16:54:07.050327	2025-03-19 16:54:07.050329	34	1	clients_with_children	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	660612ac-3548-462e-9883-9e991051c12b	\N	\N
2025-03-19 16:54:07.050344	2025-03-19 16:54:07.050345	35	1	wda	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	37024ca7-04b7-44ff-b73a-ac2fce94c418	\N	\N
2025-03-19 16:54:07.05036	2025-03-19 16:54:07.050361	36	1	husband	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	91b7bbf7-0c19-49a9-8595-10b6e622885f	\N	\N
2025-03-19 16:54:07.050381	2025-03-19 16:54:07.050382	37	1	hew	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	62d08a34-6a51-4bf7-8e6c-cc88ea1bbf53	\N	\N
2025-03-19 16:54:07.050397	2025-03-19 16:54:07.050399	38	1	community_leader	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	25a7415b-58eb-498d-8ae6-f294d1be7739	\N	\N
2025-03-19 16:54:07.050413	2025-03-19 16:54:07.050415	39	1	friends_or_peers	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	81973742-5b26-4312-959d-a7eaf0b8c6bb	\N	\N
2025-03-19 16:54:07.050429	2025-03-19 16:54:07.050431	40	1	others	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	c46a5728-3a34-4acc-9abd-00a5016958c5	\N	\N
2025-03-19 16:54:07.050446	2025-03-19 16:54:07.050447	41	1	test_or_real	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	358c1524-166d-4010-9d17-7c457d285f2a	\N	\N
2025-03-19 16:54:07.050462	2025-03-19 16:54:07.050463	42	1	module	f	t	TEXT	t	t	\N	1	1	\N	\N	\N	41749efd-37b3-4d88-bacd-6ec00869466d	\N	\N
2025-03-19 16:54:07.050478	2025-03-19 16:54:07.050479	43	1	fp_iucd_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	83ce2944-a20a-4f95-8687-e396abb40589	\N	\N
2025-03-19 16:54:07.050493	2025-03-19 16:54:07.050495	44	1	fp_iucd	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	571a247a-f125-4112-bbce-9cf64d826676	\N	\N
2025-03-19 16:54:07.05051	2025-03-19 16:54:07.050511	45	1	fp_condoms_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	9b22b69d-0bfb-41a5-8312-f32611bf0ad5	\N	\N
2025-03-19 16:54:07.050526	2025-03-19 16:54:07.050527	46	1	fp_oral_contraceptives_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	55d2438c-91c3-4849-bb37-e3c75f26ae02	\N	\N
2025-03-19 16:54:07.050542	2025-03-19 16:54:07.050543	47	1	fp_tubal_ligation_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	7535f16f-1a4a-4c1b-bda9-00527b2baf70	\N	\N
2025-03-19 16:54:07.050558	2025-03-19 16:54:07.050559	48	1	fp_partner_vasectomy_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	b5ce4dff-d93e-445a-853b-80e31403f654	\N	\N
2025-03-19 16:54:07.050574	2025-03-19 16:54:07.050575	49	1	fp_emergency_contraceptive_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	c63a3580-4019-4f97-9aef-27d214d78bbc	\N	\N
2025-03-19 16:54:07.05059	2025-03-19 16:54:07.050591	50	1	fp_implants_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	183836eb-a5ba-431e-938f-ee2ac765c759	\N	\N
2025-03-19 16:54:07.050606	2025-03-19 16:54:07.050607	51	1	fp_injections_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	e2a19a34-59a5-4a88-af17-21ea5faa442b	\N	\N
2025-03-19 16:54:07.050622	2025-03-19 16:54:07.050623	52	1	fp_other_before	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	8c158b37-b5dc-42fe-88d2-d501cb26c2d1	\N	\N
2025-03-19 16:54:07.050638	2025-03-19 16:54:07.050639	53	1	fp_condoms	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	7df86192-cd37-4555-840a-12c1c0d9958f	\N	\N
2025-03-19 16:54:07.050654	2025-03-19 16:54:07.050655	54	1	fp_oral_contraceptives	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	463bd1db-1bad-4286-902e-287f67af41b7	\N	\N
2025-03-19 16:54:07.05067	2025-03-19 16:54:07.050671	55	1	fp_tubal_ligation	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	cc7a90a8-d772-4492-82c6-324cde281d1a	\N	\N
2025-03-19 16:54:07.050686	2025-03-19 16:54:07.050688	56	1	fp_partner_vasectomy	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	6a9cede6-efa6-49dc-90cb-60b527d37c13	\N	\N
2025-03-19 16:54:07.050703	2025-03-19 16:54:07.050704	57	1	fp_emergency_contraceptive	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	c93f8d68-4045-42f0-9db9-56cf82822e93	\N	\N
2025-03-19 16:54:07.050719	2025-03-19 16:54:07.05072	58	1	fp_implants	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	87fd4df2-5813-4e0a-826f-24ef6f51e553	\N	\N
2025-03-19 16:54:07.050736	2025-03-19 16:54:07.050737	59	1	fp_injections	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	f69ca95a-59d3-4de3-a08e-5ecb7ecc0595	\N	\N
2025-03-19 16:54:07.050753	2025-03-19 16:54:07.050754	60	1	fp_other	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	943dac65-c9cf-40b2-bfe7-54983b1f85e1	\N	\N
\.


--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.table_schema (created_on, changed_on, extra_json, id, tab_state_id, database_id, schema, "table", description, expanded, created_by_fk, changed_by_fk, catalog) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tables (created_on, changed_on, id, table_name, main_dttm_col, default_endpoint, database_id, created_by_fk, changed_by_fk, "offset", description, is_featured, cache_timeout, schema, sql, params, perm, filter_select_enabled, fetch_values_predicate, is_sqllab_view, template_params, schema_perm, extra, uuid, is_managed_externally, external_url, normalize_columns, always_filter_main_dttm, catalog, catalog_perm) FROM stdin;
2025-03-19 16:54:06.63241	2025-03-19 16:54:07.069583	1	rpt_tt_smart_start_counseling	inserted_at	\N	1	1	1	0	\N	f	\N	public	\N	\N	[eCHIS Production DB].[rpt_tt_smart_start_counseling](id:1)	t	\N	f	\N	[eCHIS Production DB].[echis_report_builder].[public]	\N	550b2ec5-dbf5-4033-9543-579c67e41b51	f	\N	f	f	echis_report_builder	[eCHIS Production DB].[echis_report_builder]
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tag (created_on, changed_on, id, name, type, created_by_fk, changed_by_fk, description) FROM stdin;
\.


--
-- Data for Name: tagged_object; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.tagged_object (created_on, changed_on, id, tag_id, object_id, object_type, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.user_attribute (created_on, changed_on, id, user_id, welcome_dashboard_id, created_by_fk, changed_by_fk, avatar_url) FROM stdin;
\.


--
-- Data for Name: user_favorite_tag; Type: TABLE DATA; Schema: public; Owner: superset
--

COPY public.user_favorite_tag (user_id, tag_id) FROM stdin;
\.


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 112, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 198, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 388, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 5, true);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 1, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 1, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 103, true);


--
-- Name: annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.annotation_id_seq', 1, false);


--
-- Name: annotation_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.annotation_layer_id_seq', 1, false);


--
-- Name: cache_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.cache_keys_id_seq', 1, false);


--
-- Name: css_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.css_templates_id_seq', 1, false);


--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_roles_id_seq', 1, false);


--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_slices_id_seq', 1, true);


--
-- Name: dashboard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboard_user_id_seq', 1, true);


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 1, true);


--
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.database_user_oauth2_tokens_id_seq', 1, false);


--
-- Name: dbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dbs_id_seq', 1, true);


--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.dynamic_plugin_id_seq', 1, false);


--
-- Name: favstar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.favstar_id_seq', 1, false);


--
-- Name: key_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.key_value_id_seq', 6, true);


--
-- Name: keyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.keyvalue_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.logs_id_seq', 137, true);


--
-- Name: query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.query_id_seq', 1, false);


--
-- Name: report_execution_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_execution_log_id_seq', 1, false);


--
-- Name: report_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_recipient_id_seq', 1, false);


--
-- Name: report_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_schedule_id_seq', 1, false);


--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.report_schedule_user_id_seq', 1, false);


--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.rls_filter_roles_id_seq', 1, false);


--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.rls_filter_tables_id_seq', 1, false);


--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.row_level_security_filters_id_seq', 1, false);


--
-- Name: saved_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.saved_query_id_seq', 1, false);


--
-- Name: slice_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slice_user_id_seq', 1, true);


--
-- Name: slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.slices_id_seq', 1, true);


--
-- Name: sql_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sql_metrics_id_seq', 1, true);


--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.sqlatable_user_id_seq', 1, true);


--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.ssh_tunnels_id_seq', 1, false);


--
-- Name: tab_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tab_state_id_seq', 1, false);


--
-- Name: table_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.table_columns_id_seq', 60, true);


--
-- Name: table_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.table_schema_id_seq', 1, false);


--
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tables_id_seq', 1, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: tagged_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.tagged_object_id_seq', 1, false);


--
-- Name: user_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: superset
--

SELECT pg_catalog.setval('public.user_attribute_id_seq', 1, false);


--
-- Name: tables _customer_location_uc; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT _customer_location_uc UNIQUE (database_id, schema, table_name);


--
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: annotation_layer annotation_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_pkey PRIMARY KEY (id);


--
-- Name: annotation annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_pkey PRIMARY KEY (id);


--
-- Name: cache_keys cache_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.cache_keys
    ADD CONSTRAINT cache_keys_pkey PRIMARY KEY (id);


--
-- Name: query client_id; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT client_id UNIQUE (client_id);


--
-- Name: css_templates css_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_pkey PRIMARY KEY (id);


--
-- Name: dashboard_roles dashboard_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_pkey PRIMARY KEY (id);


--
-- Name: dashboard_slices dashboard_slices_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_pkey PRIMARY KEY (id);


--
-- Name: dashboard_user dashboard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_pkey PRIMARY KEY (id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_database_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_database_name_key UNIQUE (database_name);


--
-- Name: dbs dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_verbose_name_key UNIQUE (verbose_name);


--
-- Name: dynamic_plugin dynamic_plugin_key_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_key_key UNIQUE (key);


--
-- Name: dynamic_plugin dynamic_plugin_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_name_key UNIQUE (name);


--
-- Name: dynamic_plugin dynamic_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_pkey PRIMARY KEY (id);


--
-- Name: favstar favstar_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_pkey PRIMARY KEY (id);


--
-- Name: dashboards idx_unique_slug; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT idx_unique_slug UNIQUE (slug);


--
-- Name: key_value key_value_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_pkey PRIMARY KEY (id);


--
-- Name: keyvalue keyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.keyvalue
    ADD CONSTRAINT keyvalue_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- Name: report_execution_log report_execution_log_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_pkey PRIMARY KEY (id);


--
-- Name: report_recipient report_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_pkey PRIMARY KEY (id);


--
-- Name: report_schedule report_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_pkey PRIMARY KEY (id);


--
-- Name: report_schedule_user report_schedule_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_roles rls_filter_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_tables rls_filter_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_pkey PRIMARY KEY (id);


--
-- Name: row_level_security_filters row_level_security_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_pkey PRIMARY KEY (id);


--
-- Name: saved_query saved_query_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_pkey PRIMARY KEY (id);


--
-- Name: slice_user slice_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_pkey PRIMARY KEY (id);


--
-- Name: slices slices_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_pkey PRIMARY KEY (id);


--
-- Name: sql_metrics sql_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_pkey PRIMARY KEY (id);


--
-- Name: sqlatable_user sqlatable_user_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_pkey PRIMARY KEY (id);


--
-- Name: ssh_tunnels ssh_tunnels_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ssh_tunnels
    ADD CONSTRAINT ssh_tunnels_pkey PRIMARY KEY (id);


--
-- Name: tab_state tab_state_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_pkey PRIMARY KEY (id);


--
-- Name: table_columns table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_pkey PRIMARY KEY (id);


--
-- Name: table_schema table_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_pkey PRIMARY KEY (id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tagged_object tagged_object_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_pkey PRIMARY KEY (id);


--
-- Name: tagged_object uix_tagged_object; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT uix_tagged_object UNIQUE (tag_id, object_id, object_type);


--
-- Name: dashboard_slices uq_dashboard_slice; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT uq_dashboard_slice UNIQUE (dashboard_id, slice_id);


--
-- Name: dashboards uq_dashboards_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT uq_dashboards_uuid UNIQUE (uuid);


--
-- Name: dbs uq_dbs_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT uq_dbs_uuid UNIQUE (uuid);


--
-- Name: report_schedule uq_report_schedule_name_type; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT uq_report_schedule_name_type UNIQUE (name, type);


--
-- Name: row_level_security_filters uq_rls_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT uq_rls_name UNIQUE (name);


--
-- Name: saved_query uq_saved_query_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT uq_saved_query_uuid UNIQUE (uuid);


--
-- Name: slices uq_slices_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT uq_slices_uuid UNIQUE (uuid);


--
-- Name: sql_metrics uq_sql_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_metric_name UNIQUE (metric_name, table_id);


--
-- Name: sql_metrics uq_sql_metrics_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_uuid UNIQUE (uuid);


--
-- Name: table_columns uq_table_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_column_name UNIQUE (column_name, table_id);


--
-- Name: table_columns uq_table_columns_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_uuid UNIQUE (uuid);


--
-- Name: tables uq_tables_uuid; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT uq_tables_uuid UNIQUE (uuid);


--
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- Name: idx_user_id_database_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX idx_user_id_database_id ON public.database_user_oauth2_tokens USING btree (user_id, database_id);


--
-- Name: ix_cache_keys_datasource_uid; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_cache_keys_datasource_uid ON public.cache_keys USING btree (datasource_uid);


--
-- Name: ix_creation_method; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_creation_method ON public.report_schedule USING btree (creation_method);


--
-- Name: ix_key_value_expires_on; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_key_value_expires_on ON public.key_value USING btree (expires_on);


--
-- Name: ix_key_value_uuid; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_key_value_uuid ON public.key_value USING btree (uuid);


--
-- Name: ix_logs_user_id_dttm; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_logs_user_id_dttm ON public.logs USING btree (user_id, dttm);


--
-- Name: ix_query_results_key; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_query_results_key ON public.query USING btree (results_key);


--
-- Name: ix_report_execution_log_report_schedule_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_execution_log_report_schedule_id ON public.report_execution_log USING btree (report_schedule_id);


--
-- Name: ix_report_execution_log_start_dttm; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_execution_log_start_dttm ON public.report_execution_log USING btree (start_dttm);


--
-- Name: ix_report_recipient_report_schedule_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_recipient_report_schedule_id ON public.report_recipient USING btree (report_schedule_id);


--
-- Name: ix_report_schedule_active; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_report_schedule_active ON public.report_schedule USING btree (active);


--
-- Name: ix_row_level_security_filters_filter_type; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_row_level_security_filters_filter_type ON public.row_level_security_filters USING btree (filter_type);


--
-- Name: ix_sql_editor_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_sql_editor_id ON public.query USING btree (sql_editor_id);


--
-- Name: ix_ssh_tunnels_database_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_ssh_tunnels_database_id ON public.ssh_tunnels USING btree (database_id);


--
-- Name: ix_ssh_tunnels_uuid; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_ssh_tunnels_uuid ON public.ssh_tunnels USING btree (uuid);


--
-- Name: ix_tab_state_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_tab_state_id ON public.tab_state USING btree (id);


--
-- Name: ix_table_schema_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE UNIQUE INDEX ix_table_schema_id ON public.table_schema USING btree (id);


--
-- Name: ix_tagged_object_object_id; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ix_tagged_object_object_id ON public.tagged_object USING btree (object_id);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ti_dag_state ON public.annotation USING btree (layer_id, start_dttm, end_dttm);


--
-- Name: ti_user_id_changed_on; Type: INDEX; Schema: public; Owner: superset
--

CREATE INDEX ti_user_id_changed_on ON public.query USING btree (user_id, changed_on);


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.annotation_layer(id);


--
-- Name: css_templates css_templates_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: dbs dbs_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: favstar favstar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dashboard_roles fk_dashboard_roles_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT fk_dashboard_roles_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_roles fk_dashboard_roles_role_id_ab_role; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT fk_dashboard_roles_role_id_ab_role FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- Name: dashboard_slices fk_dashboard_slices_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT fk_dashboard_slices_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_slices fk_dashboard_slices_slice_id_slices; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT fk_dashboard_slices_slice_id_slices FOREIGN KEY (slice_id) REFERENCES public.slices(id) ON DELETE CASCADE;


--
-- Name: dashboard_user fk_dashboard_user_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT fk_dashboard_user_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_user fk_dashboard_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT fk_dashboard_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: embedded_dashboards fk_embedded_dashboards_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.embedded_dashboards
    ADD CONSTRAINT fk_embedded_dashboards_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: report_schedule_user fk_report_schedule_user_report_schedule_id_report_schedule; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT fk_report_schedule_user_report_schedule_id_report_schedule FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id) ON DELETE CASCADE;


--
-- Name: report_schedule_user fk_report_schedule_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT fk_report_schedule_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: slice_user fk_slice_user_slice_id_slices; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT fk_slice_user_slice_id_slices FOREIGN KEY (slice_id) REFERENCES public.slices(id) ON DELETE CASCADE;


--
-- Name: slice_user fk_slice_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT fk_slice_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: sql_metrics fk_sql_metrics_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT fk_sql_metrics_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: sqlatable_user fk_sqlatable_user_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT fk_sqlatable_user_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: sqlatable_user fk_sqlatable_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT fk_sqlatable_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: table_columns fk_table_columns_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT fk_table_columns_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: key_value key_value_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: key_value key_value_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: logs logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: query query_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: query query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: report_execution_log report_execution_log_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_recipient report_recipient_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_schedule report_schedule_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_chart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_chart_id_fkey FOREIGN KEY (chart_id) REFERENCES public.slices(id);


--
-- Name: report_schedule report_schedule_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: report_schedule report_schedule_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: rls_filter_roles rls_filter_roles_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_roles rls_filter_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: rls_filter_tables rls_filter_tables_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_tables rls_filter_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: row_level_security_filters row_level_security_filters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: row_level_security_filters row_level_security_filters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_db_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_db_id_fkey FOREIGN KEY (db_id) REFERENCES public.dbs(id);


--
-- Name: tab_state saved_query_id; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT saved_query_id FOREIGN KEY (saved_query_id) REFERENCES public.saved_query(id) ON DELETE SET NULL;


--
-- Name: saved_query saved_query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slices slices_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_last_saved_by_fk; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_last_saved_by_fk FOREIGN KEY (last_saved_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ssh_tunnels ssh_tunnels_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.ssh_tunnels
    ADD CONSTRAINT ssh_tunnels_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tab_state tab_state_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: tab_state tab_state_latest_query_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_latest_query_id_fkey FOREIGN KEY (latest_query_id) REFERENCES public.query(client_id) ON DELETE SET NULL;


--
-- Name: tab_state tab_state_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: table_schema table_schema_tab_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_tab_state_id_fkey FOREIGN KEY (tab_state_id) REFERENCES public.tab_state(id) ON DELETE CASCADE;


--
-- Name: tables tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tag tag_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tag tag_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: user_attribute user_attribute_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_welcome_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_welcome_dashboard_id_fkey FOREIGN KEY (welcome_dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: user_favorite_tag user_favorite_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_favorite_tag
    ADD CONSTRAINT user_favorite_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: user_favorite_tag user_favorite_tag_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: superset
--

ALTER TABLE ONLY public.user_favorite_tag
    ADD CONSTRAINT user_favorite_tag_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- PostgreSQL database dump complete
--

