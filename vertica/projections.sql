/* Projections were created with the Vertica Management Consol Database Designer */

CREATE PROJECTION IF NOT EXISTS store_sales_DBD_1_seg_tpcsd_b0 /*+basename(store_sales_DBD_1_seg_tpcsd),createtype(D)*/
(
 ss_sold_date_sk ENCODING RLE, 
 ss_sold_time_sk ENCODING DELTARANGE_COMP, 
 ss_item_sk ENCODING GCDDELTA, 
 ss_customer_sk ENCODING DELTARANGE_COMP, 
 ss_cdemo_sk ENCODING BLOCK_DICT, 
 ss_hdemo_sk ENCODING DELTARANGE_COMP, 
 ss_addr_sk ENCODING DELTARANGE_COMP, 
 ss_store_sk ENCODING RLE, 
 ss_promo_sk ENCODING DELTAVAL, 
 ss_ticket_number ENCODING DELTARANGE_COMP, 
 ss_quantity ENCODING DELTAVAL, 
 ss_wholesale_cost ENCODING AUTO, 
 ss_list_price ENCODING AUTO, 
 ss_sales_price ENCODING AUTO, 
 ss_ext_discount_amt ENCODING RLE, 
 ss_ext_sales_price ENCODING AUTO, 
 ss_ext_wholesale_cost ENCODING AUTO, 
 ss_ext_list_price ENCODING AUTO, 
 ss_ext_tax ENCODING AUTO, 
 ss_coupon_amt ENCODING RLE, 
 ss_net_paid ENCODING AUTO, 
 ss_net_paid_inc_tax ENCODING AUTO, 
 ss_net_profit ENCODING AUTO
)
AS
 SELECT ss_sold_date_sk, 
        ss_sold_time_sk, 
        ss_item_sk, 
        ss_customer_sk, 
        ss_cdemo_sk, 
        ss_hdemo_sk, 
        ss_addr_sk, 
        ss_store_sk, 
        ss_promo_sk, 
        ss_ticket_number, 
        ss_quantity, 
        ss_wholesale_cost, 
        ss_list_price, 
        ss_sales_price, 
        ss_ext_discount_amt, 
        ss_ext_sales_price, 
        ss_ext_wholesale_cost, 
        ss_ext_list_price, 
        ss_ext_tax, 
        ss_coupon_amt, 
        ss_net_paid, 
        ss_net_paid_inc_tax, 
        ss_net_profit
 FROM public.store_sales 
 ORDER BY ss_sold_date_sk,
          ss_store_sk,
          ss_net_profit
SEGMENTED BY MODULARHASH (ss_sold_date_sk) ALL NODES KSAFE 1;


CREATE PROJECTION IF NOT EXISTS store_sales_DBD_2_seg_tpcsd_b0 /*+basename(store_sales_DBD_2_seg_tpcsd),createtype(D)*/
(
 ss_sold_date_sk ENCODING RLE, 
 ss_customer_sk ENCODING DELTARANGE_COMP, 
 ss_hdemo_sk ENCODING DELTARANGE_COMP, 
 ss_addr_sk ENCODING DELTARANGE_COMP, 
 ss_store_sk ENCODING RLE, 
 ss_ticket_number ENCODING DELTARANGE_COMP, 
 ss_ext_sales_price ENCODING AUTO, 
 ss_ext_list_price ENCODING AUTO, 
 ss_ext_tax ENCODING AUTO, 
 ss_coupon_amt ENCODING RLE, 
 ss_net_profit ENCODING AUTO
)
AS
 SELECT ss_sold_date_sk, 
        ss_customer_sk, 
        ss_hdemo_sk, 
        ss_addr_sk, 
        ss_store_sk, 
        ss_ticket_number, 
        ss_ext_sales_price, 
        ss_ext_list_price, 
        ss_ext_tax, 
        ss_coupon_amt, 
        ss_net_profit
 FROM public.store_sales 
 ORDER BY ss_sold_date_sk,
          ss_store_sk,
          ss_net_profit
SEGMENTED BY MODULARHASH (ss_hdemo_sk) ALL NODES KSAFE 1;



CREATE PROJECTION IF NOT EXISTS store_sales_DBD_3_seg_tpcsd_b0 /*+basename(store_sales_DBD_3_seg_tpcsd),createtype(D)*/
(
 ss_sold_date_sk ENCODING RLE, 
 ss_item_sk ENCODING GCDDELTA, 
 ss_ext_sales_price ENCODING AUTO
)
AS
 SELECT ss_sold_date_sk, 
        ss_item_sk, 
        ss_ext_sales_price
 FROM public.store_sales 
 ORDER BY ss_sold_date_sk,
          ss_ext_sales_price
SEGMENTED BY MODULARHASH (ss_item_sk) ALL NODES KSAFE 1;


CREATE PROJECTION IF NOT EXISTS customer_demographics_DBD_4_seg_tpcsd_b0 /*+basename(customer_demographics_DBD_4_seg_tpcsd),createtype(D)*/
(
 cd_demo_sk ENCODING COMMONDELTA_COMP, 
 cd_gender ENCODING RLE, 
 cd_marital_status ENCODING RLE, 
 cd_education_status ENCODING RLE, 
 cd_purchase_estimate ENCODING COMMONDELTA_COMP, 
 cd_credit_rating ENCODING AUTO, 
 cd_dep_count ENCODING COMMONDELTA_COMP, 
 cd_dep_employed_count ENCODING COMMONDELTA_COMP, 
 cd_dep_college_count ENCODING COMMONDELTA_COMP
)
AS
 SELECT cd_demo_sk, 
        cd_gender, 
        cd_marital_status, 
        cd_education_status, 
        cd_purchase_estimate, 
        cd_credit_rating, 
        cd_dep_count, 
        cd_dep_employed_count, 
        cd_dep_college_count
 FROM public.customer_demographics 
 ORDER BY cd_marital_status,
          cd_gender,
          cd_education_status,
          cd_demo_sk
SEGMENTED BY MODULARHASH (cd_demo_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS date_dim_DBD_5_seg_tpcsd_b0 /*+basename(date_dim_DBD_5_seg_tpcsd),createtype(D)*/
(
 d_date_sk ENCODING COMMONDELTA_COMP, 
 d_date_id ENCODING AUTO, 
 d_date ENCODING COMMONDELTA_COMP, 
 d_month_seq ENCODING COMMONDELTA_COMP, 
 d_week_seq ENCODING COMMONDELTA_COMP, 
 d_quarter_seq ENCODING COMMONDELTA_COMP, 
 d_year ENCODING COMMONDELTA_COMP, 
 d_dow ENCODING BLOCKDICT_COMP, 
 d_moy ENCODING COMMONDELTA_COMP, 
 d_dom ENCODING COMMONDELTA_COMP, 
 d_qoy ENCODING COMMONDELTA_COMP, 
 d_fy_year ENCODING COMMONDELTA_COMP, 
 d_fy_quarter_seq ENCODING COMMONDELTA_COMP, 
 d_fy_week_seq ENCODING COMMONDELTA_COMP, 
 d_day_name ENCODING AUTO, 
 d_quarter_name ENCODING AUTO, 
 d_holiday ENCODING AUTO, 
 d_weekend ENCODING AUTO, 
 d_following_holiday ENCODING AUTO, 
 d_first_dom ENCODING COMMONDELTA_COMP, 
 d_last_dom ENCODING COMMONDELTA_COMP, 
 d_same_day_ly ENCODING COMMONDELTA_COMP, 
 d_same_day_lq ENCODING COMMONDELTA_COMP, 
 d_current_day ENCODING AUTO, 
 d_current_week ENCODING AUTO, 
 d_current_month ENCODING AUTO, 
 d_current_quarter ENCODING AUTO, 
 d_current_year ENCODING AUTO
)
AS
 SELECT d_date_sk, 
        d_date_id, 
        d_date, 
        d_month_seq, 
        d_week_seq, 
        d_quarter_seq, 
        d_year, 
        d_dow, 
        d_moy, 
        d_dom, 
        d_qoy, 
        d_fy_year, 
        d_fy_quarter_seq, 
        d_fy_week_seq, 
        d_day_name, 
        d_quarter_name, 
        d_holiday, 
        d_weekend, 
        d_following_holiday, 
        d_first_dom, 
        d_last_dom, 
        d_same_day_ly, 
        d_same_day_lq, 
        d_current_day, 
        d_current_week, 
        d_current_month, 
        d_current_quarter, 
        d_current_year
 FROM public.date_dim 
 ORDER BY d_date_sk
SEGMENTED BY MODULARHASH (d_date_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS time_dim_DBD_6_seg_tpcsd_b0 /*+basename(time_dim_DBD_6_seg_tpcsd),createtype(D)*/
(
 t_time_sk ENCODING COMMONDELTA_COMP, 
 t_time_id ENCODING AUTO, 
 t_time ENCODING COMMONDELTA_COMP, 
 t_hour ENCODING RLE, 
 t_minute ENCODING COMMONDELTA_COMP, 
 t_second ENCODING COMMONDELTA_COMP, 
 t_am_pm ENCODING RLE, 
 t_shift ENCODING RLE, 
 t_sub_shift ENCODING RLE, 
 t_meal_time ENCODING RLE
)
AS
 SELECT t_time_sk, 
        t_time_id, 
        t_time, 
        t_hour, 
        t_minute, 
        t_second, 
        t_am_pm, 
        t_shift, 
        t_sub_shift, 
        t_meal_time
 FROM public.time_dim 
 ORDER BY t_am_pm,
          t_shift,
          t_sub_shift,
          t_meal_time,
          t_hour,
          t_time
SEGMENTED BY MODULARHASH (t_time) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS item_DBD_7_seg_tpcsd_b0 /*+basename(item_DBD_7_seg_tpcsd),createtype(D)*/
(
 i_item_sk ENCODING DELTARANGE_COMP, 
 i_item_id ENCODING AUTO, 
 i_rec_start_date ENCODING AUTO, 
 i_rec_end_date ENCODING AUTO, 
 i_item_desc ENCODING AUTO, 
 i_current_price ENCODING AUTO, 
 i_wholesale_cost ENCODING AUTO, 
 i_brand_id ENCODING BLOCKDICT_COMP, 
 i_brand ENCODING AUTO, 
 i_class_id ENCODING BLOCKDICT_COMP, 
 i_class ENCODING AUTO, 
 i_category_id ENCODING BLOCKDICT_COMP, 
 i_category ENCODING AUTO, 
 i_manufact_id ENCODING DELTAVAL, 
 i_manufact ENCODING AUTO, 
 i_size ENCODING AUTO, 
 i_formulation ENCODING AUTO, 
 i_color ENCODING AUTO, 
 i_units ENCODING AUTO, 
 i_container ENCODING AUTO, 
 i_manager_id ENCODING RLE, 
 i_product_name ENCODING AUTO
)
AS
 SELECT i_item_sk, 
        i_item_id, 
        i_rec_start_date, 
        i_rec_end_date, 
        i_item_desc, 
        i_current_price, 
        i_wholesale_cost, 
        i_brand_id, 
        i_brand, 
        i_class_id, 
        i_class, 
        i_category_id, 
        i_category, 
        i_manufact_id, 
        i_manufact, 
        i_size, 
        i_formulation, 
        i_color, 
        i_units, 
        i_container, 
        i_manager_id, 
        i_product_name
 FROM public.item 
 ORDER BY i_manager_id,
          i_item_sk
SEGMENTED BY MODULARHASH (i_item_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS item_DBD_8_seg_tpcsd_b0 /*+basename(item_DBD_8_seg_tpcsd),createtype(D)*/
(
 i_item_sk ENCODING DELTAVAL, 
 i_item_id ENCODING AUTO, 
 i_rec_start_date ENCODING AUTO, 
 i_rec_end_date ENCODING AUTO, 
 i_item_desc ENCODING AUTO, 
 i_current_price ENCODING AUTO, 
 i_wholesale_cost ENCODING AUTO, 
 i_brand_id ENCODING DELTARANGE_COMP, 
 i_brand ENCODING AUTO, 
 i_class_id ENCODING COMMONDELTA_COMP, 
 i_class ENCODING RLE, 
 i_category_id ENCODING RLE, 
 i_category ENCODING RLE, 
 i_manufact_id ENCODING DELTAVAL, 
 i_manufact ENCODING AUTO, 
 i_size ENCODING AUTO, 
 i_formulation ENCODING AUTO, 
 i_color ENCODING AUTO, 
 i_units ENCODING AUTO, 
 i_container ENCODING AUTO, 
 i_manager_id ENCODING DELTAVAL, 
 i_product_name ENCODING AUTO
)
AS
 SELECT i_item_sk, 
        i_item_id, 
        i_rec_start_date, 
        i_rec_end_date, 
        i_item_desc, 
        i_current_price, 
        i_wholesale_cost, 
        i_brand_id, 
        i_brand, 
        i_class_id, 
        i_class, 
        i_category_id, 
        i_category, 
        i_manufact_id, 
        i_manufact, 
        i_size, 
        i_formulation, 
        i_color, 
        i_units, 
        i_container, 
        i_manager_id, 
        i_product_name
 FROM public.item 
 ORDER BY i_category,
          i_class,
          i_item_id,
          i_item_desc,
          i_current_price
SEGMENTED BY MODULARHASH (i_item_sk) ALL NODES KSAFE 1;


CREATE PROJECTION IF NOT EXISTS item_DBD_9_seg_tpcsd_b0 /*+basename(item_DBD_9_seg_tpcsd),createtype(D)*/
(
 i_item_sk ENCODING DELTARANGE_COMP, 
 i_brand_id ENCODING BLOCKDICT_COMP, 
 i_brand ENCODING AUTO, 
 i_manufact_id ENCODING RLE
)
AS
 SELECT i_item_sk, 
        i_brand_id, 
        i_brand, 
        i_manufact_id
 FROM public.item 
 ORDER BY i_manufact_id,
          i_item_sk
SEGMENTED BY MODULARHASH (i_item_sk) ALL NODES KSAFE 1;


CREATE PROJECTION IF NOT EXISTS store_DBD_10_seg_tpcsd_b0 /*+basename(store_DBD_10_seg_tpcsd),createtype(D)*/
(
 s_store_sk ENCODING AUTO, 
 s_store_id ENCODING AUTO, 
 s_rec_start_date ENCODING AUTO, 
 s_rec_end_date ENCODING BLOCKDICT_COMP, 
 s_closed_date_sk ENCODING BLOCKDICT_COMP, 
 s_store_name ENCODING AUTO, 
 s_number_employees ENCODING AUTO, 
 s_floor_space ENCODING AUTO, 
 s_hours ENCODING AUTO, 
 s_manager ENCODING AUTO, 
 s_market_id ENCODING AUTO, 
 s_geography_class ENCODING AUTO, 
 s_market_desc ENCODING AUTO, 
 s_market_manager ENCODING AUTO, 
 s_division_id ENCODING COMMONDELTA_COMP, 
 s_division_name ENCODING AUTO, 
 s_company_id ENCODING COMMONDELTA_COMP, 
 s_company_name ENCODING AUTO, 
 s_street_number ENCODING AUTO, 
 s_street_name ENCODING AUTO, 
 s_street_type ENCODING AUTO, 
 s_suite_number ENCODING AUTO, 
 s_city ENCODING AUTO, 
 s_county ENCODING AUTO, 
 s_state ENCODING AUTO, 
 s_zip ENCODING AUTO, 
 s_country ENCODING AUTO, 
 s_gmt_offset ENCODING BLOCKDICT_COMP, 
 s_tax_precentage ENCODING BLOCKDICT_COMP
)
AS
 SELECT s_store_sk, 
        s_store_id, 
        s_rec_start_date, 
        s_rec_end_date, 
        s_closed_date_sk, 
        s_store_name, 
        s_number_employees, 
        s_floor_space, 
        s_hours, 
        s_manager, 
        s_market_id, 
        s_geography_class, 
        s_market_desc, 
        s_market_manager, 
        s_division_id, 
        s_division_name, 
        s_company_id, 
        s_company_name, 
        s_street_number, 
        s_street_name, 
        s_street_type, 
        s_suite_number, 
        s_city, 
        s_county, 
        s_state, 
        s_zip, 
        s_country, 
        s_gmt_offset, 
        s_tax_precentage
 FROM public.store 
 ORDER BY s_store_sk
SEGMENTED BY MODULARHASH (s_store_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS store_DBD_10_seg_tpcsd_b1 /*+basename(store_DBD_10_seg_tpcsd),createtype(D)*/
(
 s_store_sk ENCODING AUTO, 
 s_store_id ENCODING AUTO, 
 s_rec_start_date ENCODING AUTO, 
 s_rec_end_date ENCODING BLOCKDICT_COMP, 
 s_closed_date_sk ENCODING BLOCKDICT_COMP, 
 s_store_name ENCODING AUTO, 
 s_number_employees ENCODING AUTO, 
 s_floor_space ENCODING AUTO, 
 s_hours ENCODING AUTO, 
 s_manager ENCODING AUTO, 
 s_market_id ENCODING AUTO, 
 s_geography_class ENCODING AUTO, 
 s_market_desc ENCODING AUTO, 
 s_market_manager ENCODING AUTO, 
 s_division_id ENCODING COMMONDELTA_COMP, 
 s_division_name ENCODING AUTO, 
 s_company_id ENCODING COMMONDELTA_COMP, 
 s_company_name ENCODING AUTO, 
 s_street_number ENCODING AUTO, 
 s_street_name ENCODING AUTO, 
 s_street_type ENCODING AUTO, 
 s_suite_number ENCODING AUTO, 
 s_city ENCODING AUTO, 
 s_county ENCODING AUTO, 
 s_state ENCODING AUTO, 
 s_zip ENCODING AUTO, 
 s_country ENCODING AUTO, 
 s_gmt_offset ENCODING BLOCKDICT_COMP, 
 s_tax_precentage ENCODING BLOCKDICT_COMP
)
AS
 SELECT s_store_sk, 
        s_store_id, 
        s_rec_start_date, 
        s_rec_end_date, 
        s_closed_date_sk, 
        s_store_name, 
        s_number_employees, 
        s_floor_space, 
        s_hours, 
        s_manager, 
        s_market_id, 
        s_geography_class, 
        s_market_desc, 
        s_market_manager, 
        s_division_id, 
        s_division_name, 
        s_company_id, 
        s_company_name, 
        s_street_number, 
        s_street_name, 
        s_street_type, 
        s_suite_number, 
        s_city, 
        s_county, 
        s_state, 
        s_zip, 
        s_country, 
        s_gmt_offset, 
        s_tax_precentage
 FROM public.store 
 ORDER BY s_store_sk
SEGMENTED BY MODULARHASH (s_store_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS customer_DBD_11_seg_tpcsd_b0 /*+basename(customer_DBD_11_seg_tpcsd),createtype(D)*/
(
 c_customer_sk ENCODING DELTARANGE_COMP, 
 c_customer_id ENCODING AUTO, 
 c_current_cdemo_sk ENCODING DELTAVAL, 
 c_current_hdemo_sk ENCODING DELTAVAL, 
 c_current_addr_sk ENCODING DELTAVAL, 
 c_first_shipto_date_sk ENCODING DELTAVAL, 
 c_first_sales_date_sk ENCODING DELTAVAL, 
 c_salutation ENCODING AUTO, 
 c_first_name ENCODING AUTO, 
 c_last_name ENCODING AUTO, 
 c_preferred_cust_flag ENCODING AUTO, 
 c_birth_day ENCODING BLOCKDICT_COMP, 
 c_birth_month ENCODING BLOCKDICT_COMP, 
 c_birth_year ENCODING BLOCKDICT_COMP, 
 c_birth_country ENCODING AUTO, 
 c_login ENCODING AUTO, 
 c_email_address ENCODING AUTO, 
 c_last_review_date ENCODING COMMONDELTA_COMP
)
AS
 SELECT c_customer_sk, 
        c_customer_id, 
        c_current_cdemo_sk, 
        c_current_hdemo_sk, 
        c_current_addr_sk, 
        c_first_shipto_date_sk, 
        c_first_sales_date_sk, 
        c_salutation, 
        c_first_name, 
        c_last_name, 
        c_preferred_cust_flag, 
        c_birth_day, 
        c_birth_month, 
        c_birth_year, 
        c_birth_country, 
        c_login, 
        c_email_address, 
        c_last_review_date
 FROM public.customer 
 ORDER BY c_customer_sk
SEGMENTED BY MODULARHASH (c_customer_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS customer_DBD_12_seg_tpcsd_b0 /*+basename(customer_DBD_12_seg_tpcsd),createtype(D)*/
(
 c_customer_sk ENCODING DELTAVAL, 
 c_current_addr_sk ENCODING COMMONDELTA_COMP, 
 c_first_name ENCODING AUTO, 
 c_last_name ENCODING AUTO
)
AS
 SELECT c_customer_sk, 
        c_current_addr_sk, 
        c_first_name, 
        c_last_name
 FROM public.customer 
 ORDER BY c_current_addr_sk
SEGMENTED BY MODULARHASH (c_current_addr_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS promotion_DBD_13_seg_tpcsd_b0 /*+basename(promotion_DBD_13_seg_tpcsd),createtype(D)*/
(
 p_promo_sk ENCODING COMMONDELTA_COMP, 
 p_promo_id ENCODING AUTO, 
 p_start_date_sk ENCODING DELTAVAL, 
 p_end_date_sk ENCODING DELTAVAL, 
 p_item_sk ENCODING DELTAVAL, 
 p_cost ENCODING RLE, 
 p_response_target ENCODING RLE, 
 p_promo_name ENCODING AUTO, 
 p_channel_dmail ENCODING AUTO, 
 p_channel_email ENCODING RLE, 
 p_channel_catalog ENCODING RLE, 
 p_channel_tv ENCODING AUTO, 
 p_channel_radio ENCODING AUTO, 
 p_channel_press ENCODING AUTO, 
 p_channel_event ENCODING RLE, 
 p_channel_demo ENCODING AUTO, 
 p_channel_details ENCODING AUTO, 
 p_purpose ENCODING AUTO, 
 p_discount_active ENCODING AUTO
)
AS
 SELECT p_promo_sk, 
        p_promo_id, 
        p_start_date_sk, 
        p_end_date_sk, 
        p_item_sk, 
        p_cost, 
        p_response_target, 
        p_promo_name, 
        p_channel_dmail, 
        p_channel_email, 
        p_channel_catalog, 
        p_channel_tv, 
        p_channel_radio, 
        p_channel_press, 
        p_channel_event, 
        p_channel_demo, 
        p_channel_details, 
        p_purpose, 
        p_discount_active
 FROM public.promotion 
 ORDER BY p_channel_email,
          p_channel_event,
          p_cost,
          p_response_target,
          p_channel_catalog,
          p_promo_id
SEGMENTED BY MODULARHASH (p_promo_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS household_demographics_DBD_14_seg_tpcsd_b0 /*+basename(household_demographics_DBD_14_seg_tpcsd),createtype(D)*/
(
 hd_demo_sk ENCODING COMMONDELTA_COMP, 
 hd_income_band_sk ENCODING COMMONDELTA_COMP, 
 hd_buy_potential ENCODING RLE, 
 hd_dep_count ENCODING RLE, 
 hd_vehicle_count ENCODING RLE
)
AS
 SELECT hd_demo_sk, 
        hd_income_band_sk, 
        hd_buy_potential, 
        hd_dep_count, 
        hd_vehicle_count
 FROM public.household_demographics 
 ORDER BY hd_buy_potential,
          hd_vehicle_count,
          hd_dep_count,
          hd_demo_sk
SEGMENTED BY MODULARHASH (hd_demo_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS customer_address_DBD_15_seg_tpcsd_b0 /*+basename(customer_address_DBD_15_seg_tpcsd),createtype(D)*/
(
 ca_address_sk ENCODING COMMONDELTA_COMP, 
 ca_address_id ENCODING AUTO, 
 ca_street_number ENCODING AUTO, 
 ca_street_name ENCODING AUTO, 
 ca_street_type ENCODING AUTO, 
 ca_suite_number ENCODING AUTO, 
 ca_city ENCODING AUTO, 
 ca_county ENCODING AUTO, 
 ca_state ENCODING AUTO, 
 ca_zip ENCODING AUTO, 
 ca_country ENCODING AUTO, 
 ca_gmt_offset ENCODING BLOCKDICT_COMP, 
 ca_location_type ENCODING AUTO
)
AS
 SELECT ca_address_sk, 
        ca_address_id, 
        ca_street_number, 
        ca_street_name, 
        ca_street_type, 
        ca_suite_number, 
        ca_city, 
        ca_county, 
        ca_state, 
        ca_zip, 
        ca_country, 
        ca_gmt_offset, 
        ca_location_type
 FROM public.customer_address 
 ORDER BY ca_address_sk
SEGMENTED BY MODULARHASH (ca_address_sk) ALL NODES KSAFE 1;

CREATE PROJECTION IF NOT EXISTS inventory_DBD_16_seg_tpcsd_b0 /*+basename(inventory_DBD_16_seg_tpcsd),createtype(D)*/
(
 inv_date_sk ENCODING AUTO, 
 inv_item_sk ENCODING AUTO, 
 inv_warehouse_sk ENCODING AUTO, 
 inv_quantity_on_hand ENCODING AUTO
)
AS
 SELECT inv_date_sk, 
        inv_item_sk, 
        inv_warehouse_sk, 
        inv_quantity_on_hand
 FROM public.inventory 
 ORDER BY inv_date_sk,
          inv_item_sk,
          inv_warehouse_sk,
          inv_quantity_on_hand
SEGMENTED BY MODULARHASH (inv_date_sk, inv_item_sk, inv_warehouse_sk, inv_quantity_on_hand) ALL NODES KSAFE 1;

