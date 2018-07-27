# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180727164603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_addons", force: :cascade do |t|
    t.integer  "subscription_id"
    t.integer  "addon_id"
    t.string   "custom_name",     limit: 255
    t.decimal  "price",                       precision: 8, scale: 2
    t.integer  "billing_cycles"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "kind",            limit: 255
  end

  add_index "active_addons", ["addon_id"], name: "index_active_addons_on_addon_id", using: :btree
  add_index "active_addons", ["subscription_id"], name: "index_active_addons_on_subscription_id", using: :btree

  create_table "active_addons_sites", id: false, force: :cascade do |t|
    t.integer "active_addon_id"
    t.integer "site_id"
  end

  add_index "active_addons_sites", ["active_addon_id", "site_id"], name: "index_active_addons_sites_on_active_addon_id_and_site_id", using: :btree

  create_table "active_discounts", force: :cascade do |t|
    t.integer  "subscription_id"
    t.integer  "discount_id"
    t.integer  "discount_coupon_id"
    t.string   "custom_name",        limit: 255
    t.decimal  "price",                          precision: 8, scale: 2
    t.integer  "billing_cycles"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "active_discounts", ["discount_coupon_id"], name: "index_active_discounts_on_discount_coupon_id", using: :btree
  add_index "active_discounts", ["discount_id"], name: "index_active_discounts_on_discount_id", using: :btree
  add_index "active_discounts", ["subscription_id"], name: "index_active_discounts_on_subscription_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.string   "kind",            limit: 255
    t.integer  "user_id"
    t.integer  "subject_id"
    t.string   "subject_type",    limit: 255
    t.integer  "secondary_id"
    t.string   "secondary_type",  limit: 255
    t.integer  "shadow_id"
    t.integer  "job_id"
    t.text     "action"
    t.boolean  "pinned",                      default: false
    t.datetime "completed_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "organization_id"
    t.integer  "priority",                    default: 0
    t.string   "type"
    t.jsonb    "meta"
  end

  add_index "activities", ["job_id"], name: "index_activities_on_job_id", using: :btree
  add_index "activities", ["kind"], name: "index_activities_on_kind", using: :btree
  add_index "activities", ["meta"], name: "index_activities_on_meta", using: :gin
  add_index "activities", ["organization_id"], name: "index_activities_on_organization_id", using: :btree
  add_index "activities", ["secondary_type", "secondary_id"], name: "index_activities_on_secondary_type_and_secondary_id", using: :btree
  add_index "activities", ["shadow_id"], name: "index_activities_on_shadow_id", using: :btree
  add_index "activities", ["subject_type", "subject_id"], name: "index_activities_on_subject_type_and_subject_id", using: :btree
  add_index "activities", ["type"], name: "index_activities_on_type", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "addons", force: :cascade do |t|
    t.string   "key",         limit: 255
    t.string   "name",        limit: 255
    t.datetime "archived_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "admin_notes", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "resource_type", limit: 255
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "priority",                  default: 0
    t.datetime "deleted_at"
  end

  add_index "admin_notes", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree
  add_index "admin_notes", ["user_id"], name: "index_admin_notes_on_user_id", using: :btree

  create_table "affiliate_clicks", force: :cascade do |t|
    t.integer  "affiliate_id"
    t.text     "http_referer"
    t.datetime "created_at",                  null: false
    t.string   "remote_ip",       limit: 255
    t.text     "user_agent"
    t.string   "custom_page_url", limit: 255
  end

  add_index "affiliate_clicks", ["affiliate_id"], name: "index_affiliate_clicks_on_affiliate_id", using: :btree

  create_table "affiliates", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "status",                 limit: 255
    t.string   "phone",                  limit: 32
    t.string   "address_1",              limit: 255
    t.string   "address_2",              limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.string   "zip_code",               limit: 255
    t.string   "country",                limit: 255
    t.string   "website",                limit: 255
    t.string   "paypal_email",           limit: 255
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "short_url",              limit: 255
    t.datetime "approved_on"
    t.boolean  "terms_of_service"
    t.string   "kind",                   limit: 255, default: "affiliate"
    t.string   "account_type",           limit: 255
    t.boolean  "arbitrary_url_approved",             default: false
    t.boolean  "agree"
    t.string   "description"
    t.string   "referral_method"
    t.string   "other_information"
    t.string   "custom_branding"
  end

  create_table "api_auth_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "key"
    t.string   "secret"
    t.string   "hostname"
    t.string   "user_agent"
    t.datetime "expires_at"
    t.datetime "last_connected_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_settings", force: :cascade do |t|
    t.string   "key",           limit: 255
    t.text     "value"
    t.integer  "value_numeric",             default: 0
    t.text     "data"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audit_stats", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "email_count"
    t.integer  "disk_usage_www",                                                default: 0,     null: false
    t.integer  "disk_usage_host"
    t.integer  "disk_total_host"
    t.integer  "memory"
    t.integer  "memory_percent"
    t.text     "plugins"
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.date     "audit_at"
    t.text     "changed_files"
    t.text     "sha1sums"
    t.string   "php_version",               limit: 255
    t.string   "kernel",                    limit: 255
    t.integer  "visitors"
    t.text     "openssl"
    t.decimal  "cache_hit_percent",                     precision: 8, scale: 4
    t.text     "themes"
    t.text     "admins"
    t.text     "unmonitored_processes"
    t.boolean  "completed",                                                     default: false
    t.boolean  "notified_storage_warning",                                      default: false
    t.boolean  "notified_storage_over",                                         default: false
    t.boolean  "notified_visitors_warning",                                     default: false
    t.boolean  "notified_visitors_over",                                        default: false
    t.boolean  "overage_checked",                                               default: false
    t.text     "malware_report"
    t.integer  "disk_usage_staging",                                            default: 0,     null: false
    t.integer  "disk_usage_production",                                         default: 0,     null: false
    t.integer  "disk_usage_database",                                           default: 0,     null: false
    t.integer  "disk_usage_site_db"
  end

  add_index "audit_stats", ["audit_at"], name: "index_audit_stats_on_audit_at", using: :btree
  add_index "audit_stats", ["site_id"], name: "index_audit_stats_on_site_id", using: :btree

  create_table "auth_tokens", force: :cascade do |t|
    t.integer  "authable_id"
    t.string   "authable_type", limit: 255
    t.string   "key",           limit: 255
    t.string   "secret",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "expires_at"
  end

  add_index "auth_tokens", ["authable_type", "authable_id"], name: "auth_tokens_authable", using: :btree

  create_table "available_addons", force: :cascade do |t|
    t.integer  "pricing_plan_id"
    t.integer  "addon_id"
    t.boolean  "included"
    t.decimal  "price",           precision: 8, scale: 2
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "ordering",                                default: 0
  end

  add_index "available_addons", ["addon_id"], name: "index_available_addons_on_addon_id", using: :btree
  add_index "available_addons", ["pricing_plan_id"], name: "index_available_addons_on_pricing_plan_id", using: :btree

  create_table "backup_batches", id: :bigserial, force: :cascade do |t|
    t.integer  "batch_size"
    t.boolean  "complete",   default: false
    t.string   "status"
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.date     "day"
  end

  create_table "backup_downloads", force: :cascade do |t|
    t.integer  "backup_id"
    t.integer  "creator_id"
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "backups", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "status",                limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.datetime "backed_up_at"
    t.text     "data"
    t.string   "restore_status",        limit: 255
    t.text     "restore_error_message"
    t.integer  "wordpress_version_id"
    t.boolean  "full_directory",                    default: true
    t.integer  "chef_version_id"
    t.text     "comment"
    t.boolean  "cloned"
    t.integer  "creator_id"
    t.integer  "backup_batch_id"
  end

  add_index "backups", ["backup_batch_id"], name: "index_backups_on_backup_batch_id", using: :btree
  add_index "backups", ["chef_version_id"], name: "index_backups_on_chef_version_id", using: :btree
  add_index "backups", ["creator_id"], name: "index_backups_on_creator_id", using: :btree
  add_index "backups", ["restore_status"], name: "index_backups_on_restore_status", using: :btree
  add_index "backups", ["site_id"], name: "index_backups_on_site_id", using: :btree
  add_index "backups", ["wordpress_version_id"], name: "index_backups_on_wordpress_version_id", using: :btree

  create_table "bandwidth_usage_stats", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "domain",      limit: 255
    t.integer  "granularity"
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.integer  "hour"
    t.integer  "bandwidth",   limit: 8
    t.integer  "requests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bans", force: :cascade do |t|
    t.string   "ip",                 limit: 255
    t.string   "reason",             limit: 255
    t.integer  "server_instance_id"
    t.datetime "ban_time"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "bans", ["ip", "ban_time", "reason", "server_instance_id"], name: "index_bans_on_ip_and_ban_time_and_reason_and_server_instance_id", using: :btree

  create_table "blueprint_memberships", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "account_type", limit: 255
    t.integer  "blueprint_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "blueprint_memberships", ["account_id", "account_type"], name: "accounts", using: :btree
  add_index "blueprint_memberships", ["account_type", "account_id", "blueprint_id"], name: "template_members_v2", using: :btree
  add_index "blueprint_memberships", ["blueprint_id"], name: "index_site_template_membership_on_blueprint_id", using: :btree

  create_table "blueprints", force: :cascade do |t|
    t.string   "label",      limit: 255
    t.integer  "creator_id"
    t.integer  "backup_id"
    t.text     "file_url"
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
    t.string   "avatar",     limit: 255
    t.text     "data"
  end

  create_table "bootstrap_scripts", force: :cascade do |t|
    t.string   "kind",       limit: 255
    t.text     "script"
    t.boolean  "active",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "os_version", limit: 255
  end

  create_table "bt_active_addons", force: :cascade do |t|
    t.string   "subscription_code",        limit: 255
    t.string   "addon_code",               limit: 255
    t.decimal  "price",                                precision: 8, scale: 2
    t.integer  "number_of_billing_cycles"
    t.date     "expires_at"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  add_index "bt_active_addons", ["addon_code"], name: "index_bt_active_addons_on_addon_code", using: :btree
  add_index "bt_active_addons", ["subscription_code"], name: "index_bt_active_addons_on_subscription_code", using: :btree

  create_table "bt_active_discounts", force: :cascade do |t|
    t.string   "subscription_code",        limit: 255
    t.string   "discount_code",            limit: 255
    t.decimal  "price",                                precision: 8, scale: 2
    t.integer  "number_of_billing_cycles"
    t.date     "expires_at"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  add_index "bt_active_discounts", ["discount_code"], name: "index_bt_active_discounts_on_discount_code", using: :btree
  add_index "bt_active_discounts", ["subscription_code"], name: "index_bt_active_discounts_on_subscription_code", using: :btree

  create_table "bt_addons", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "key",         limit: 255
    t.datetime "archived_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "bt_addons", ["code"], name: "index_bt_addons_on_code", unique: true, using: :btree

  create_table "bt_cards", force: :cascade do |t|
    t.string   "code",                limit: 255
    t.string   "customer_code",       limit: 255
    t.string   "cardholder_name",     limit: 255
    t.string   "country_of_issuance", limit: 255
    t.string   "last_four",           limit: 255
    t.string   "card_type",           limit: 255
    t.integer  "expiration_month"
    t.integer  "expiration_year"
    t.string   "description",         limit: 255
    t.datetime "deleted_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "bt_cards", ["code"], name: "index_bt_cards_on_code", unique: true, using: :btree
  add_index "bt_cards", ["customer_code"], name: "index_bt_cards_on_customer_code", using: :btree

  create_table "bt_customers", force: :cascade do |t|
    t.string   "code",              limit: 255
    t.integer  "user_id"
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "organization_id"
    t.string   "organization_name", limit: 255
    t.string   "email",             limit: 255
    t.datetime "synced_at"
  end

  add_index "bt_customers", ["code"], name: "index_bt_customers_on_code", unique: true, using: :btree
  add_index "bt_customers", ["organization_id"], name: "index_bt_customers_on_organization_id", using: :btree
  add_index "bt_customers", ["user_id"], name: "index_bt_customers_on_user_id", using: :btree

  create_table "bt_discounts", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "key",         limit: 255
    t.datetime "archived_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "bt_discounts", ["code"], name: "index_bt_discounts_on_code", unique: true, using: :btree

  create_table "bt_plans", force: :cascade do |t|
    t.string   "code",              limit: 255
    t.string   "name",              limit: 255
    t.integer  "billing_frequency"
    t.string   "default",           limit: 255
    t.datetime "archived_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "bt_plans", ["code"], name: "index_bt_plans_on_code", unique: true, using: :btree

  create_table "bt_subscriptions", force: :cascade do |t|
    t.string   "code",               limit: 255
    t.integer  "subscription_id"
    t.string   "plan_code",          limit: 255
    t.string   "card_code",          limit: 255
    t.string   "status",             limit: 255
    t.decimal  "price",                          precision: 8, scale: 2
    t.date     "paid_through_date"
    t.date     "first_billing_date"
    t.datetime "cancelled_at"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "bt_subscriptions", ["card_code"], name: "index_bt_subscriptions_on_card_code", using: :btree
  add_index "bt_subscriptions", ["code"], name: "index_bt_subscriptions_on_code", unique: true, using: :btree
  add_index "bt_subscriptions", ["plan_code"], name: "index_bt_subscriptions_on_plan_code", using: :btree
  add_index "bt_subscriptions", ["subscription_id"], name: "index_bt_subscriptions_on_subscription_id", using: :btree

  create_table "bt_transactions", force: :cascade do |t|
    t.string   "code",                      limit: 255
    t.string   "subscription_code",         limit: 255
    t.string   "card_code",                 limit: 255
    t.decimal  "amount",                                precision: 8, scale: 2
    t.string   "status",                    limit: 255
    t.boolean  "refunded",                                                      default: false
    t.string   "refund_ids",                limit: 255
    t.string   "transaction_type",          limit: 255
    t.boolean  "voided",                                                        default: false
    t.string   "refunded_transaction_code", limit: 255
    t.datetime "remote_updated_at"
    t.datetime "billed_at"
    t.boolean  "single",                                                        default: false
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.date     "bt_disbursement_date"
    t.date     "fw_disbursement_date"
    t.text     "description"
  end

  add_index "bt_transactions", ["card_code"], name: "index_bt_transactions_on_card_code", using: :btree
  add_index "bt_transactions", ["code"], name: "index_bt_transactions_on_code", unique: true, using: :btree
  add_index "bt_transactions", ["refunded_transaction_code"], name: "index_bt_transactions_on_refunded_transaction_code", using: :btree
  add_index "bt_transactions", ["subscription_code"], name: "index_bt_transactions_on_subscription_code", using: :btree

  create_table "bt_webhook_notifications", force: :cascade do |t|
    t.text     "signature"
    t.text     "payload"
    t.string   "status",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "subscription_id"
    t.string   "kind",              limit: 255
    t.string   "subscription_code", limit: 255
  end

  add_index "bt_webhook_notifications", ["subscription_id"], name: "index_notifications_on_subscription_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cdn_stats", force: :cascade do |t|
    t.integer  "site_id"
    t.date     "audit_at"
    t.integer  "bandwidth",        limit: 8, default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "completed",                  default: false
    t.boolean  "notified_warning",           default: false
    t.boolean  "notified_over",              default: false
  end

  add_index "cdn_stats", ["site_id"], name: "index_cdn_stats_on_site_id", using: :btree

  create_table "certificate_challenges", force: :cascade do |t|
    t.string   "domain",             limit: 255
    t.text     "challenge_hash"
    t.integer  "ssl_certificate_id"
    t.string   "status",             limit: 255
    t.string   "filename",           limit: 255
    t.string   "file_content",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "authorization_uri"
  end

  create_table "cheers", force: :cascade do |t|
    t.integer  "zendesk_ticket_id",  limit: 8
    t.integer  "zendesk_user_id",    limit: 8
    t.string   "zendesk_user_email", limit: 255
    t.string   "zendesk_agent",      limit: 255
    t.string   "score",              limit: 255
    t.text     "comment"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "slack_post",                     default: false
  end

  create_table "cloud_sql_machine_types", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.boolean  "default",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "cluster_members", force: :cascade do |t|
    t.integer  "cluster_id"
    t.integer  "instance_id"
    t.boolean  "primary"
    t.text     "dbuser"
    t.text     "dbpass"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "health_checks"
    t.datetime "poor_health_at"
    t.text     "routing",        default: "inactive"
    t.text     "monitoring",     default: "inactive"
  end

  add_index "cluster_members", ["cluster_id", "instance_id"], name: "index_cluster_members_on_cluster_id_and_instance_id", using: :btree
  add_index "cluster_members", ["cluster_id"], name: "index_cluster_members_on_cluster_id", using: :btree
  add_index "cluster_members", ["instance_id"], name: "index_cluster_members_on_instance_id", using: :btree

  create_table "clusters", force: :cascade do |t|
    t.text     "name"
    t.text     "admin_domain"
    t.text     "main_domain"
    t.text     "master_log_file"
    t.integer  "master_log_position"
    t.boolean  "file_replication_enabled"
    t.text     "private_key"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "status",                   limit: 255
    t.integer  "backup_id"
    t.boolean  "replica_db_write_enabled",             default: false
    t.text     "enterprise_custom"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.integer  "parent_comment_id"
    t.string   "content"
    t.integer  "vote_count",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissions", force: :cascade do |t|
    t.integer  "affiliate_id"
    t.string   "commission_type",     limit: 255
    t.decimal  "amount",                          precision: 8, scale: 2
    t.decimal  "revenue",                         precision: 8, scale: 2
    t.string   "status",              limit: 255
    t.string   "notes",               limit: 255
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.integer  "payout_id"
    t.integer  "subscription_id"
    t.boolean  "legacy",                                                  default: false
    t.boolean  "approved",                                                default: false
    t.string   "cancellation_reason"
  end

  create_table "daily_email_stats", force: :cascade do |t|
    t.integer  "server_instance_id"
    t.date     "audit_at"
    t.integer  "sent",               default: 0
    t.integer  "hard_bounces",       default: 0
    t.integer  "soft_bounces",       default: 0
    t.integer  "rejects",            default: 0
    t.integer  "complaints",         default: 0
    t.integer  "total",              default: 0
    t.decimal  "percentage",         default: 0.0
    t.boolean  "completed",          default: false
    t.boolean  "notified_warning",   default: false
    t.boolean  "notified_over",      default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "daily_email_stats", ["server_instance_id"], name: "index_daily_email_stats_on_server_instance_id", using: :btree

  create_table "debug_sessions", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "user_id"
    t.integer  "node_port"
    t.boolean  "active",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "delegates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
  end

  add_index "delegates", ["organization_id", "site_id"], name: "index_delegates_on_organization_id_and_site_id", using: :btree
  add_index "delegates", ["site_id"], name: "index_delegates_on_site_id", using: :btree
  add_index "delegates", ["user_id", "site_id"], name: "site_users", using: :btree
  add_index "delegates", ["user_id"], name: "index_delegates_on_user_id", using: :btree

  create_table "digitalocean_db_servers", force: :cascade do |t|
    t.integer "do_id"
    t.string  "name",           limit: 255
    t.boolean "default"
    t.string  "queue",          limit: 255
    t.string  "ip_address",     limit: 255
    t.integer "server_size_id"
    t.integer "datacenter_id"
    t.string  "status",         limit: 255
    t.integer "image_id"
    t.string  "branch",         limit: 255
    t.boolean "locked"
  end

  create_table "digitalocean_download_servers", force: :cascade do |t|
    t.string  "name",       limit: 255
    t.boolean "default"
    t.string  "queue",      limit: 255
    t.string  "ip_address", limit: 255
  end

  create_table "digitalocean_keys", force: :cascade do |t|
    t.integer  "do_id"
    t.string   "name",         limit: 255
    t.boolean  "default",                  default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "provisioning"
  end

  create_table "discount_coupons", force: :cascade do |t|
    t.integer  "discount_id"
    t.integer  "user_id"
    t.string   "code",                      limit: 255
    t.boolean  "multiuse",                              default: false
    t.boolean  "unlimited",                             default: false
    t.datetime "redeemed_at"
    t.datetime "expires_at"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.text     "description"
    t.boolean  "annual_upgrade",                        default: false
    t.integer  "annual_upgrade_multiplier"
    t.string   "ad_image_url",              limit: 255
    t.string   "ad_headline",               limit: 255
    t.string   "ad_text",                   limit: 255
    t.boolean  "has_demo_time_length",                  default: false
    t.integer  "demo_time_length"
    t.boolean  "for_signup",                            default: false
    t.jsonb    "data",                                  default: {},    null: false
    t.string   "redirect_url"
    t.boolean  "verify_user"
  end

  add_index "discount_coupons", ["data"], name: "index_discount_coupons_on_data", using: :gin
  add_index "discount_coupons", ["discount_id"], name: "index_discount_coupons_on_discount_id", using: :btree

  create_table "discounts", force: :cascade do |t|
    t.string   "key",         limit: 255
    t.string   "name",        limit: 255
    t.datetime "archived_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "domains", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "url",              limit: 255
    t.boolean  "primary"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.datetime "deleted_at"
    t.boolean  "sucuri_monitor",               default: false
    t.integer  "parent_domain_id"
    t.boolean  "secondary",                    default: false
    t.boolean  "dns_pointed",                  default: false
    t.datetime "dns_checked_at"
    t.jsonb    "dns_cache"
  end

  add_index "domains", ["parent_domain_id"], name: "index_domains_on_parent_domain_id", using: :btree
  add_index "domains", ["site_id"], name: "index_domains_on_site_id", using: :btree

  create_table "ec2_keys", force: :cascade do |t|
    t.string  "ec2_id",       limit: 255
    t.string  "name",         limit: 255
    t.boolean "default"
    t.boolean "provisioning"
  end

  create_table "edges", force: :cascade do |t|
    t.integer  "fleet_id"
    t.inet     "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_stats", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "year"
    t.integer  "month"
    t.integer  "sent",         default: 0
    t.integer  "hard_bounces", default: 0
    t.integer  "soft_bounces", default: 0
    t.integer  "rejects",      default: 0
    t.integer  "complaints",   default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "total",        default: 0
    t.decimal  "percentage",   default: 0.0
  end

  add_index "email_stats", ["site_id"], name: "index_email_stats_on_site_id", using: :btree

  create_table "event_tokens", force: :cascade do |t|
    t.string   "blob",        limit: 255
    t.string   "type",        limit: 255
    t.integer  "target_id"
    t.string   "target_type", limit: 255
    t.text     "data"
    t.datetime "expires_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "extra",       limit: 255
    t.string   "extra_2",     limit: 255
    t.datetime "used_at"
    t.datetime "revoked_at"
  end

  add_index "event_tokens", ["extra"], name: "index_event_tokens_on_extra", using: :btree
  add_index "event_tokens", ["target_type", "target_id"], name: "target", using: :btree
  add_index "event_tokens", ["type", "id"], name: "index_event_tokens_on_type_and_id", using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "type",               limit: 255
    t.boolean  "enabled",                        default: false
    t.text     "data"
    t.integer  "site_id"
    t.integer  "server_instance_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "staging_site_id"
  end

  add_index "features", ["server_instance_id"], name: "index_features_on_server_instance_id", using: :btree
  add_index "features", ["server_instance_id"], name: "index_features_on_wordpress_id", using: :btree
  add_index "features", ["site_id"], name: "index_features_on_site_id", using: :btree
  add_index "features", ["staging_site_id"], name: "index_features_on_staging_site_id", using: :btree
  add_index "features", ["type", "id"], name: "index_features_on_type_and_id", using: :btree

  create_table "financial_stats", force: :cascade do |t|
    t.date     "date"
    t.float    "mrr"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "monthly_mrr"
    t.float    "annual_mrr"
  end

  create_table "financials_activities", id: :bigserial, force: :cascade do |t|
    t.integer  "service_id"
    t.string   "description"
    t.string   "movement_type"
    t.integer  "activity_arr"
    t.integer  "activity_mrr"
    t.integer  "activity_mrr_movement"
    t.string   "currency"
    t.string   "currency_sign"
    t.datetime "activity_created_at"
    t.integer  "subscription_id"
    t.integer  "discount_amount"
    t.integer  "discount_percent"
    t.integer  "discount_amount_previous"
    t.integer  "discount_percent_previous"
    t.integer  "flywheel_plan_id"
    t.integer  "service_customer_id"
    t.string   "flywheel_customer_hash"
    t.string   "string"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "financials_activities", ["flywheel_customer_hash"], name: "index_financials_activities_on_flywheel_customer_hash", using: :btree
  add_index "financials_activities", ["flywheel_plan_id"], name: "index_financials_activities_on_flywheel_plan_id", using: :btree
  add_index "financials_activities", ["service_id"], name: "index_financials_activities_on_service_id", unique: true, using: :btree
  add_index "financials_activities", ["subscription_id"], name: "index_financials_activities_on_subscription_id", using: :btree

  create_table "financials_customers", id: :bigserial, force: :cascade do |t|
    t.integer  "service_id"
    t.string   "flywheel_account_hash"
    t.string   "status"
    t.datetime "customer_since"
    t.integer  "arr"
    t.integer  "mrr"
    t.string   "billing_system_url"
    t.string   "service_url"
    t.integer  "payment_processor_customer_id"
    t.string   "data_source_uuid"
    t.string   "lead_created_at"
    t.string   "free_trial_started_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "financials_customers", ["flywheel_account_hash"], name: "index_financials_customers_on_flywheel_account_hash", using: :btree
  add_index "financials_customers", ["service_id"], name: "index_financials_customers_on_service_id", unique: true, using: :btree

  create_table "financials_key_metrics", id: :bigserial, force: :cascade do |t|
    t.integer  "date"
    t.decimal  "arpa"
    t.decimal  "arr"
    t.decimal  "asp"
    t.decimal  "customer_churn_rate"
    t.integer  "customers"
    t.decimal  "ltv"
    t.decimal  "mrr"
    t.decimal  "mrr_churn_rate"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "financials_key_metrics", ["date"], name: "index_financials_key_metrics_on_date", unique: true, using: :btree

  create_table "financials_subscriptions", id: :bigserial, force: :cascade do |t|
    t.integer  "service_id"
    t.string   "external_id"
    t.string   "plan"
    t.integer  "quantity"
    t.integer  "mrr"
    t.integer  "arr"
    t.string   "status"
    t.string   "billing_cycle"
    t.integer  "billing_cycle_count"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "financial_customer_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "financials_subscriptions", ["financial_customer_id"], name: "index_financials_subscriptions_on_financial_customer_id", using: :btree
  add_index "financials_subscriptions", ["service_id"], name: "index_financials_subscriptions_on_service_id", unique: true, using: :btree

  create_table "fleet_databases", force: :cascade do |t|
    t.integer  "fleet_id"
    t.boolean  "default"
    t.string   "name",                      limit: 255
    t.text     "host"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "full",                                  default: false
    t.boolean  "reserved",                              default: false
    t.string   "ip_address",                            default: ""
    t.string   "status"
    t.boolean  "create_remote",                         default: false
    t.integer  "cloud_sql_machine_type_id"
  end

  create_table "fleet_session_stores", force: :cascade do |t|
    t.integer  "fleet_id"
    t.boolean  "default"
    t.string   "name",       limit: 255
    t.text     "host"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fleets", force: :cascade do |t|
    t.boolean  "default"
    t.integer  "datacenter_id"
    t.string   "name",                       limit: 255
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rds_jump_host",              limit: 255
    t.string   "database_manager_domain"
    t.string   "support_dashboard_base_url"
    t.boolean  "legacy",                                 default: false
    t.string   "debug_terminal_url"
    t.integer  "site_capacity"
    t.integer  "instance_capacity"
  end

  create_table "free_payment_tokens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "free_payment_tokens", ["owner_type", "owner_id"], name: "index_free_payment_tokens_on_owner_type_and_owner_id", using: :btree

  create_table "free_subscriptions", force: :cascade do |t|
    t.integer  "subscription_id"
    t.integer  "payment_token_id"
    t.date     "paid_through_date"
    t.date     "first_billing_date"
    t.decimal  "amount",             precision: 8, scale: 2
    t.datetime "cancelled_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "free_subscriptions", ["payment_token_id"], name: "index_free_subscriptions_on_payment_token_id", using: :btree
  add_index "free_subscriptions", ["subscription_id"], name: "index_free_subscriptions_on_subscription_id", using: :btree

  create_table "free_transactions", force: :cascade do |t|
    t.integer  "subscription_id"
    t.decimal  "amount",          precision: 8, scale: 2
    t.datetime "billed_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "free_transactions", ["subscription_id"], name: "index_free_transactions_on_subscription_id", using: :btree

  create_table "geoip_asns", force: :cascade do |t|
    t.inet     "ip_address"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geoip_countries", force: :cascade do |t|
    t.inet     "ip_address"
    t.text     "code"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "global_nginx_rules", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "script"
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "global_referer_blocks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "url"
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "hypervisor_upgrades", force: :cascade do |t|
    t.datetime "finished_at"
    t.string   "from",               limit: 255
    t.string   "message",            limit: 255
    t.integer  "server_instance_id"
    t.string   "status",             limit: 255
    t.string   "to",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installed_plugins", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "plugin_id"
    t.string   "version",           limit: 255
    t.string   "status",            limit: 255
    t.boolean  "upgrade_available"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "installed_plugins", ["plugin_id"], name: "index_installed_plugins_on_plugin_id", using: :btree
  add_index "installed_plugins", ["site_id"], name: "index_installed_plugins_on_site_id", using: :btree

  create_table "instance_list_items", force: :cascade do |t|
    t.integer  "instance_id"
    t.integer  "instance_list_id"
    t.string   "status",           limit: 255
    t.text     "data"
    t.integer  "sort"
    t.string   "sort_string",      limit: 255
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "removed_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "invoiced_payment_tokens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "invoiced_payment_tokens", ["owner_type", "owner_id"], name: "index_invoiced_payment_tokens_on_owner_type_and_owner_id", using: :btree

  create_table "invoiced_subscriptions", force: :cascade do |t|
    t.integer  "subscription_id"
    t.integer  "payment_token_id"
    t.date     "paid_through_date"
    t.date     "first_billing_date"
    t.decimal  "amount",             precision: 8, scale: 2
    t.datetime "cancelled_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "invoiced_subscriptions", ["payment_token_id"], name: "index_invoiced_subscriptions_on_payment_token_id", using: :btree
  add_index "invoiced_subscriptions", ["subscription_id"], name: "index_invoiced_subscriptions_on_subscription_id", using: :btree

  create_table "invoiced_transactions", force: :cascade do |t|
    t.integer  "subscription_id"
    t.decimal  "amount",          precision: 8, scale: 2
    t.datetime "billed_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.datetime "paid_at"
  end

  add_index "invoiced_transactions", ["subscription_id"], name: "index_invoiced_transactions_on_subscription_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "type",          limit: 255
    t.string   "jobable_type",  limit: 255
    t.integer  "jobable_id"
    t.string   "uuid",          limit: 255
    t.string   "status",        limit: 255
    t.string   "message",       limit: 255
    t.text     "error_message"
    t.text     "settings"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "completed_at"
    t.text     "job_output"
    t.integer  "site_id"
    t.datetime "stale_at"
    t.integer  "instance_id"
    t.integer  "fleet_id"
    t.string   "task_uuid",     limit: 255
  end

  add_index "jobs", ["created_at"], name: "index_jobs_on_created_at", using: :btree
  add_index "jobs", ["fleet_id"], name: "index_jobs_on_fleet_id", using: :btree
  add_index "jobs", ["instance_id"], name: "index_jobs_on_instance_id", using: :btree
  add_index "jobs", ["jobable_id", "jobable_type"], name: "index_jobs_on_jobable_id_and_jobable_type", using: :btree
  add_index "jobs", ["site_id", "status"], name: "index_jobs_on_site_id_and_status", using: :btree
  add_index "jobs", ["site_id"], name: "index_jobs_on_site_id", using: :btree
  add_index "jobs", ["stale_at"], name: "index_jobs_on_stale_at", using: :btree
  add_index "jobs", ["status"], name: "index_jobs_on_status", using: :btree
  add_index "jobs", ["type", "id"], name: "index_jobs_on_type_and_id", using: :btree
  add_index "jobs", ["uuid"], name: "index_jobs_on_uuid", using: :btree

  create_table "linode_ftp_servers", force: :cascade do |t|
    t.integer "li_id"
    t.string  "name",       limit: 255
    t.boolean "default"
    t.string  "queue",      limit: 255
    t.string  "ip_address", limit: 255
  end

  create_table "linode_kernels", force: :cascade do |t|
    t.integer "li_id"
    t.string  "name",    limit: 255
    t.boolean "isxen"
    t.boolean "ispvops"
    t.boolean "default"
  end

  create_table "logins", force: :cascade do |t|
    t.integer  "user_id"
    t.inet     "ip_address"
    t.text     "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logins", ["user_id"], name: "index_logins_on_user_id", using: :btree

  create_table "mail_configs", force: :cascade do |t|
    t.integer  "instance_id"
    t.text     "kind"
    t.text     "username"
    t.text     "password"
    t.text     "api_key"
    t.text     "status"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "mail_whitelabel_id"
    t.boolean  "skip_provider",      default: false
  end

  add_index "mail_configs", ["instance_id"], name: "index_mail_configs_on_instance_id", using: :btree
  add_index "mail_configs", ["mail_whitelabel_id"], name: "index_mail_configs_on_mail_whitelabel_id", using: :btree

  create_table "mail_whitelabels", force: :cascade do |t|
    t.text     "status"
    t.text     "domain"
    t.text     "subdomain"
    t.integer  "sendgrid_id"
    t.text     "cname_domain"
    t.text     "dkim1_host"
    t.text     "dkim1_domain"
    t.text     "dkim2_host"
    t.text     "dkim2_domain"
    t.text     "verified"
    t.text     "validations"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "mail_config_id"
  end

  add_index "mail_whitelabels", ["mail_config_id"], name: "index_mail_whitelabels_on_mail_config_id", using: :btree

  create_table "malware_code_blocks", force: :cascade do |t|
    t.text     "kind"
    t.text     "digest"
    t.text     "code"
    t.boolean  "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "malware_code_blocks", ["digest"], name: "index_malware_code_blocks_on_digest", using: :btree

  create_table "malware_exploits", force: :cascade do |t|
    t.string   "kind",        limit: 255
    t.string   "category",    limit: 255
    t.text     "rules"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "malware_removals", force: :cascade do |t|
    t.string   "kind",        limit: 255
    t.text     "rule"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "marketing_list_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "marketing_list_memberships", ["list_id"], name: "index_marketing_list_memberships_on_list_id", using: :btree
  add_index "marketing_list_memberships", ["user_id"], name: "index_marketing_list_memberships_on_user_id", using: :btree

  create_table "marketing_lists", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "zapier_hook", limit: 255
  end

  create_table "marketing_users", force: :cascade do |t|
    t.string   "email",        limit: 255
    t.integer  "user_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "unsubscribed",             default: false
    t.text     "fields"
  end

  add_index "marketing_users", ["email"], name: "index_marketing_users_on_email", unique: true, using: :btree
  add_index "marketing_users", ["user_id"], name: "index_marketing_users_on_user_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "kind",            limit: 255
    t.datetime "deleted_at"
  end

  add_index "memberships", ["organization_id"], name: "index_memberships_on_organization_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "migration_request_credentials", force: :cascade do |t|
    t.text     "username"
    t.text     "password"
    t.string   "host",           limit: 255
    t.string   "root_directory", limit: 255
    t.string   "protocol",       limit: 255, default: "http"
    t.integer  "owner_id"
    t.string   "owner_type",     limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.text     "message"
    t.datetime "deleted_at"
  end

  create_table "migration_request_files", force: :cascade do |t|
    t.text     "file_url"
    t.integer  "migration_request_site_id"
    t.text     "status"
    t.datetime "deleted_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "migration_request_groups", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "owner_type"
    t.integer  "owner_id",                limit: 8
    t.string   "creator_type"
    t.integer  "creator_id",              limit: 8
    t.datetime "started_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.datetime "completed_at"
    t.datetime "deleted_at"
    t.integer  "hosting_subscription_id", limit: 8
  end

  add_index "migration_request_groups", ["creator_type", "creator_id"], name: "index_migration_request_groups_on_creator_type_and_creator_id", using: :btree
  add_index "migration_request_groups", ["hosting_subscription_id"], name: "index_migration_request_groups_on_hosting_subscription_id", using: :btree
  add_index "migration_request_groups", ["owner_type", "owner_id"], name: "index_migration_request_groups_on_owner_type_and_owner_id", using: :btree

  create_table "migration_request_sets", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.text     "comments"
    t.string   "state",                  limit: 255
    t.integer  "owner_id"
    t.string   "owner_type",             limit: 255
    t.integer  "assigned_user_id"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "creator_id"
    t.string   "creator_type",           limit: 255
    t.string   "migration_request_type", limit: 255, default: "group"
    t.datetime "deleted_at"
    t.integer  "zendesk_id"
  end

  add_index "migration_request_sets", ["assigned_user_id"], name: "index_migration_request_sets_on_assigned_user_id", using: :btree
  add_index "migration_request_sets", ["creator_id"], name: "index_migration_request_sets_on_creator_id", using: :btree
  add_index "migration_request_sets", ["owner_id"], name: "index_migration_request_sets_on_owner_id", using: :btree

  create_table "migration_request_sites", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.string   "state",                    limit: 255
    t.string   "url",                      limit: 255
    t.string   "site_type",                limit: 255
    t.boolean  "expedited",                            default: false
    t.boolean  "use_existing_site",                    default: false
    t.integer  "assigned_to_user_id"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer  "site_id"
    t.integer  "subscription_id"
    t.integer  "migration_request_set_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "comment"
    t.datetime "deleted_at"
    t.string   "important_directory",      limit: 255
    t.text     "customer_comment"
  end

  add_index "migration_request_sites", ["assigned_to_user_id"], name: "index_migration_request_sites_on_assigned_to_user_id", using: :btree
  add_index "migration_request_sites", ["migration_request_set_id"], name: "index_migration_request_sites_on_migration_request_set_id", using: :btree
  add_index "migration_request_sites", ["site_id"], name: "index_migration_request_sites_on_site_id", using: :btree
  add_index "migration_request_sites", ["subscription_id"], name: "index_migration_request_sites_on_subscription_id", using: :btree

  create_table "migration_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "url",                        limit: 255
    t.string   "wp_username",                limit: 255
    t.string   "wp_password",                limit: 255
    t.string   "ftp_protocol",               limit: 255
    t.string   "ftp_host",                   limit: 255
    t.string   "ftp_username",               limit: 255
    t.string   "ftp_password",               limit: 255
    t.boolean  "use_existing_site"
    t.integer  "site_id"
    t.boolean  "has_root_directories"
    t.string   "root_directories",           limit: 255
    t.text     "comments"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.datetime "completed_at"
    t.integer  "worker_id"
    t.string   "migration_type",             limit: 255
    t.string   "wpe_login",                  limit: 255
    t.string   "wpe_password",               limit: 255
    t.string   "zip_file",                   limit: 255
    t.string   "wpcom_login",                limit: 255
    t.string   "wpcom_password",             limit: 255
    t.boolean  "use_bulk_plan"
    t.integer  "subscription_id"
    t.boolean  "site_owner"
    t.string   "name",                       limit: 255
    t.boolean  "expedite",                               default: false
    t.string   "status",                     limit: 255
    t.integer  "zendesk_id"
    t.integer  "owner_id"
    t.string   "owner_type",                 limit: 255
    t.integer  "migration_request_set_id"
    t.integer  "site_region_id"
    t.string   "former_host_name",           limit: 255
    t.string   "former_host_username",       limit: 255
    t.string   "former_host_password",       limit: 255
    t.string   "expected_visits",            limit: 255
    t.boolean  "is_multisite"
    t.boolean  "migrate_single_multisite"
    t.string   "multisite_to_migrate",       limit: 255
    t.datetime "claimed_at"
    t.integer  "total_minutes"
    t.datetime "cancelled_at"
    t.integer  "migration_request_group_id", limit: 8
    t.integer  "sort_index",                             default: 0
    t.text     "error_comment"
  end

  add_index "migration_requests", ["migration_request_group_id"], name: "index_migration_requests_on_migration_request_group_id", using: :btree
  add_index "migration_requests", ["migration_request_set_id"], name: "index_migration_requests_on_migration_request_set_id", using: :btree
  add_index "migration_requests", ["site_id"], name: "index_migration_requests_on_site_id", using: :btree
  add_index "migration_requests", ["subscription_id"], name: "index_migration_requests_on_subscription_id", using: :btree
  add_index "migration_requests", ["user_id"], name: "index_migration_requests_on_user_id", using: :btree
  add_index "migration_requests", ["worker_id"], name: "index_migration_requests_on_worker_id", using: :btree

  create_table "migrations", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "status",        limit: 255
    t.string   "archive",       limit: 255
    t.text     "error_message"
    t.text     "job_output"
    t.datetime "completed_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.text     "url"
    t.string   "initiated_by",              default: "generic", null: false
  end

  add_index "migrations", ["site_id"], name: "index_migrations_on_site_id", using: :btree

  create_table "object_lists", force: :cascade do |t|
    t.string   "type",             limit: 255
    t.string   "name",             limit: 255
    t.text     "description"
    t.string   "status",           limit: 255
    t.integer  "object_count"
    t.integer  "concurrency"
    t.string   "strategy_gather",  limit: 255
    t.string   "strategy_process", limit: 255
    t.boolean  "needs_review"
    t.text     "data"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "kind",             limit: 255
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "avatar",             limit: 255
    t.string   "slug",               limit: 255
    t.datetime "deleted_at"
    t.integer  "creator_id"
    t.string   "username",           limit: 255
    t.string   "contact_email",      limit: 255
    t.text     "settings"
    t.boolean  "gravatar",                       default: true
    t.boolean  "verified",                       default: false
    t.string   "unique_hash",        limit: 255
    t.integer  "referrer_id"
    t.string   "referrer_type",      limit: 255
    t.integer  "autoupgrade_policy",             default: 0,     null: false
    t.datetime "vip_until"
    t.string   "chart_mogul_uuid"
    t.integer  "default_region_id",  limit: 8
  end

  add_index "organizations", ["creator_id"], name: "index_organizations_on_creator_id", using: :btree
  add_index "organizations", ["default_region_id"], name: "index_organizations_on_default_region_id", using: :btree
  add_index "organizations", ["username", "contact_email"], name: "index_organizations_on_username_and_contact_email", using: :btree
  add_index "organizations", ["username"], name: "index_organizations_on_username", using: :btree
  add_index "organizations", ["vip_until"], name: "index_organizations_on_vip_until", using: :btree

  create_table "payout_line_items", force: :cascade do |t|
    t.integer  "payout_id"
    t.integer  "affiliate_id"
    t.string   "paypal_email", limit: 64
    t.decimal  "amount",                  precision: 8, scale: 2
    t.string   "currency",     limit: 16
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "payouts", force: :cascade do |t|
    t.datetime "paid_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "status",     limit: 255
  end

  create_table "plan_tokens", force: :cascade do |t|
    t.integer  "pricing_plan_id"
    t.string   "token",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "plan_tokens", ["pricing_plan_id"], name: "index_plan_tokens_on_pricing_plan_id", using: :btree

  create_table "platform_upgrades_site_upgrade_windows", id: :bigserial, force: :cascade do |t|
    t.integer  "site_id",                             limit: 8
    t.integer  "platform_upgrades_upgrade_window_id", limit: 8
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "platform_upgrades_site_upgrade_windows", ["platform_upgrades_upgrade_window_id"], name: "index_upgrade_windows_on_site_upgrade_window_id", using: :btree
  add_index "platform_upgrades_site_upgrade_windows", ["site_id"], name: "index_site_upgrade_windows_on_upgrade_window_id", using: :btree

  create_table "platform_upgrades_upgrade_windows", id: :bigserial, force: :cascade do |t|
    t.integer  "capacity"
    t.tsrange  "time_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plugins", force: :cascade do |t|
    t.string   "slug",            limit: 255
    t.text     "name"
    t.text     "description"
    t.string   "website",         limit: 255
    t.string   "safe_version",    limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "custom",                      default: false
    t.text     "alternatives"
    t.boolean  "discouraged",                 default: false
    t.string   "current_version", limit: 255
    t.datetime "imported_at"
  end

  add_index "plugins", ["slug"], name: "index_plugins_on_slug", using: :btree

  create_table "pricing_plans", force: :cascade do |t|
    t.string   "key",                limit: 255
    t.string   "name",               limit: 255
    t.string   "kind",               limit: 255
    t.integer  "server_size_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.datetime "archived_at"
    t.integer  "monthly_price"
    t.integer  "yearly_price"
    t.text     "data"
    t.integer  "visitors"
    t.integer  "storage"
    t.integer  "bandwidth"
    t.integer  "emails"
    t.integer  "sites"
    t.integer  "cdn_bandwidth"
    t.integer  "sites_per_instance"
    t.boolean  "reusable",                                                default: false
    t.decimal  "cdn_overage_per_gb",             precision: 3,  scale: 2, default: 0.08
    t.decimal  "billing_percentage",             precision: 4,  scale: 3, default: 0.0
    t.decimal  "included_billing",               precision: 10, scale: 2, default: 0.0
    t.boolean  "flywheel_blue",                                           default: false
  end

  add_index "pricing_plans", ["server_size_id"], name: "index_pricing_plans_on_server_size_id", using: :btree

  create_table "reporting_stats", force: :cascade do |t|
    t.date     "date"
    t.string   "category",   limit: 255
    t.string   "key",        limit: 255
    t.decimal  "value",                  precision: 12, scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "restore_servers", force: :cascade do |t|
    t.integer "provider_id"
    t.string  "provider",      limit: 255
    t.integer "datacenter_id"
    t.string  "name",          limit: 255
    t.boolean "default"
    t.string  "queue",         limit: 255
    t.string  "ip_address",    limit: 255
    t.string  "status",        limit: 255
    t.integer "image_id"
    t.string  "branch",        limit: 255
    t.integer "size_id"
    t.integer "version_id"
    t.text    "data"
    t.string  "provider_name", limit: 255
    t.integer "server_type",               default: 0
  end

  create_table "secure_uploads", force: :cascade do |t|
    t.text     "token"
    t.integer  "user_id"
    t.integer  "site_id"
    t.integer  "requestor_id"
    t.integer  "zendesk_id"
    t.integer  "size"
    t.text     "status"
    t.text     "secure_files"
    t.text     "comments"
    t.datetime "submitted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "server_datacenters", force: :cascade do |t|
    t.integer  "provider_id"
    t.string   "name",               limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "default",                        default: false
    t.string   "type",               limit: 255
    t.string   "slug",               limit: 255
    t.text     "settings"
    t.integer  "restore_server_id"
    t.boolean  "distribute",                     default: true,  null: false
    t.string   "backup_bucket_name"
  end

  create_table "server_images", force: :cascade do |t|
    t.integer  "provider_id"
    t.string   "name",                 limit: 255
    t.string   "distribution",         limit: 255
    t.boolean  "default",                          default: false
    t.string   "status",               limit: 255
    t.text     "error_message"
    t.text     "job_output"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version_id"
    t.datetime "deleted_at"
    t.integer  "instance_provider_id"
    t.integer  "wordpress_version_id"
    t.integer  "chef_version_id"
    t.integer  "instance_id"
    t.string   "kind",                 limit: 255
    t.string   "regions",              limit: 255
    t.integer  "image_id"
    t.string   "ip_address",           limit: 255
    t.string   "type",                 limit: 255
    t.string   "slug",                 limit: 255
    t.string   "os_version",           limit: 255
    t.string   "php_version"
  end

  add_index "server_images", ["chef_version_id"], name: "index_server_images_on_chef_version_id", using: :btree
  add_index "server_images", ["image_id"], name: "index_server_images_on_image_id", using: :btree
  add_index "server_images", ["instance_id"], name: "index_server_images_on_instance_id", using: :btree
  add_index "server_images", ["wordpress_version_id"], name: "index_server_images_on_wordpress_version_id", using: :btree

  create_table "server_instances", force: :cascade do |t|
    t.integer  "provider_id"
    t.string   "name",                      limit: 255
    t.string   "status",                    limit: 255
    t.string   "ip_address",                limit: 255
    t.integer  "datacenter_id"
    t.integer  "server_image_id"
    t.integer  "server_size_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.datetime "deleted_at"
    t.text     "settings"
    t.string   "static_domain",             limit: 255
    t.text     "public_key"
    t.integer  "site_id"
    t.string   "root_password",             limit: 255
    t.datetime "errored_at"
    t.string   "provider",                  limit: 255
    t.integer  "version_id"
    t.integer  "subscription_id"
    t.boolean  "autoupgrade",                           default: true
    t.boolean  "postfix_disabled"
    t.boolean  "fail2ban_enabled",                      default: true
    t.datetime "dist_upgrade_at"
    t.datetime "heartbeat_at"
    t.integer  "server_instance_mirror_id"
    t.text     "private_key"
    t.string   "root_account_password",     limit: 255
    t.string   "root_account_crypt_iv",     limit: 255
    t.string   "root_account_crypt_key",    limit: 255
    t.string   "hypervisor",                limit: 255
    t.text     "mysql_version"
    t.string   "os_version",                limit: 255
    t.string   "php_version"
    t.boolean  "php_version_locked",                    default: false
    t.jsonb    "metadata",                              default: {},    null: false
  end

  add_index "server_instances", ["datacenter_id"], name: "index_instances_on_datacenter_id", using: :btree
  add_index "server_instances", ["metadata"], name: "index_server_instances_on_metadata", using: :gin
  add_index "server_instances", ["server_image_id"], name: "index_instances_on_server_image_id", using: :btree
  add_index "server_instances", ["server_image_id"], name: "index_server_instances_on_server_image_id", using: :btree
  add_index "server_instances", ["server_size_id"], name: "index_instances_on_server_size_id", using: :btree
  add_index "server_instances", ["server_size_id"], name: "index_server_instances_on_server_size_id", using: :btree
  add_index "server_instances", ["site_id"], name: "index_server_instances_on_site_id", unique: true, using: :btree
  add_index "server_instances", ["subscription_id"], name: "index_server_instances_on_subscription_id", using: :btree
  add_index "server_instances", ["version_id"], name: "index_server_instances_on_version_id", using: :btree

  create_table "server_regions", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "slug",            limit: 255
    t.boolean  "enabled",                     default: false
    t.boolean  "default",                     default: false
    t.integer  "digitalocean_id"
    t.integer  "linode_id"
    t.datetime "archived_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.text     "settings"
    t.integer  "picard_id"
  end

  create_table "server_sizes", force: :cascade do |t|
    t.integer "provider_id"
    t.string  "name",                 limit: 255
    t.boolean "default",                          default: false
    t.string  "plan_name",            limit: 255
    t.text    "performance_settings"
    t.string  "type",                 limit: 255
    t.integer "memory"
    t.integer "disk"
    t.string  "slug",                 limit: 255
    t.boolean "outdated",                         default: false
    t.integer "replicas",                         default: 1,     null: false
    t.boolean "ignored",                          default: false
    t.string  "tool_tip"
  end

  create_table "server_stats", force: :cascade do |t|
    t.integer  "cpu"
    t.integer  "memory"
    t.integer  "disk"
    t.integer  "server_instance_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "server_transfers", force: :cascade do |t|
    t.datetime "finished_at"
    t.integer  "from_id"
    t.integer  "to_id"
    t.string   "status",               limit: 255, default: "new", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.datetime "downtime_started_at"
    t.datetime "downtime_finished_at"
  end

  add_index "server_transfers", ["batch_id"], name: "index_server_transfers_on_batch_id", using: :btree
  add_index "server_transfers", ["from_id"], name: "index_server_transfers_on_from_id", using: :btree
  add_index "server_transfers", ["to_id"], name: "index_server_transfers_on_to_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "ip",         limit: 255
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "sftp_servers", force: :cascade do |t|
    t.string   "branch",              limit: 255
    t.text     "data"
    t.integer  "datacenter_id"
    t.integer  "database_id"
    t.integer  "image_id"
    t.string   "ip_address",          limit: 255
    t.integer  "load_balancer_id"
    t.string   "name",                limit: 255
    t.string   "provider",            limit: 255
    t.integer  "provider_id"
    t.string   "status",              limit: 255
    t.integer  "size_id"
    t.string   "type",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "root_password",       limit: 255
    t.string   "nss_password",        limit: 255
    t.string   "nss_shadow_password", limit: 255
  end

  create_table "site_list_items", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "site_list_id"
    t.datetime "removed_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "status",       limit: 255
    t.datetime "started_at"
    t.datetime "finished_at"
    t.text     "data"
    t.integer  "sort"
    t.string   "sort_string",  limit: 255
  end

  add_index "site_list_items", ["site_id"], name: "index_site_list_items_on_site_id", using: :btree
  add_index "site_list_items", ["site_list_id"], name: "index_site_list_items_on_site_list_id", using: :btree

  create_table "site_lists", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "status",           limit: 255
    t.integer  "site_count"
    t.integer  "concurrency"
    t.string   "strategy_gather",  limit: 255
    t.string   "strategy_process", limit: 255
    t.boolean  "needs_review"
    t.text     "data"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.text     "description"
    t.integer  "owner_id"
    t.string   "owner_type",             limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "avatar",                 limit: 255
    t.string   "slug",                   limit: 255
    t.string   "status",                 limit: 255
    t.text     "settings"
    t.datetime "deleted_at"
    t.boolean  "disable_primary_domain"
    t.text     "server_settings"
    t.integer  "upgrade_id"
    t.boolean  "needs_rebuilt"
    t.datetime "backed_up_at"
    t.integer  "creator_id"
    t.integer  "deletor_id"
    t.boolean  "autoupgrade",                        default: true
    t.datetime "heartbeat_at"
    t.integer  "version_id"
    t.boolean  "protected",                          default: true
    t.string   "default_domain",         limit: 255
    t.string   "password",               limit: 255
    t.datetime "errored_at"
    t.integer  "server_instance_id"
    t.integer  "cloned_backup_id"
    t.string   "unique_hash",            limit: 255
    t.datetime "malware_cleared_at"
    t.boolean  "cluster"
    t.integer  "postfix_port"
    t.datetime "nightly_backup_at"
    t.integer  "fleet_id"
    t.integer  "edge_id"
    t.integer  "autoupgrade_policy"
    t.integer  "fleet_database_id"
    t.boolean  "forward_proxy_enabled",              default: false
    t.integer  "reserved_fleet_id"
  end

  add_index "sites", ["created_at"], name: "index_active_sites_on_created_at", where: "(deleted_at IS NULL)", using: :btree
  add_index "sites", ["creator_id"], name: "index_sites_on_creator_id", using: :btree
  add_index "sites", ["deletor_id"], name: "index_sites_on_deletor_id", using: :btree
  add_index "sites", ["edge_id"], name: "index_sites_on_edge_id", using: :btree
  add_index "sites", ["owner_type", "owner_id"], name: "index_sites_on_owner_type_and_owner_id", using: :btree
  add_index "sites", ["server_instance_id"], name: "index_sites_on_server_instance_id", using: :btree
  add_index "sites", ["slug"], name: "index_sites_on_slug", using: :btree
  add_index "sites", ["version_id"], name: "index_sites_on_version_id", using: :btree

  create_table "slackable_settings", force: :cascade do |t|
    t.string   "slackable_type",                limit: 255
    t.integer  "slackable_id"
    t.string   "temp_token",                    limit: 255
    t.text     "response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "feature_and_fixes_notified_at"
  end

  create_table "ssl_certificates", force: :cascade do |t|
    t.integer  "site_id"
    t.text     "key"
    t.text     "csr"
    t.text     "crt"
    t.string   "status",         limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "external_key",               default: false
    t.string   "domain",         limit: 255
    t.string   "filename",       limit: 255
    t.string   "file_content",   limit: 255
    t.text     "challenge_hash"
    t.boolean  "email_sent"
    t.string   "ssl_type",       limit: 255
    t.datetime "expires_at"
    t.string   "names",          limit: 255
    t.text     "settings"
  end

  add_index "ssl_certificates", ["site_id"], name: "index_ssl_certificates_on_site_id", using: :btree

  create_table "staging_sites", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "version_id"
    t.boolean  "protected",                          default: true
    t.string   "password",               limit: 255
    t.string   "primary_domain_url",     limit: 255
    t.string   "status",                 limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "wpdebug"
    t.text     "pushing"
    t.datetime "failed_at"
    t.text     "custom_salts"
    t.text     "original_salts"
    t.boolean  "use_new_staging_domain",             default: true
  end

  add_index "staging_sites", ["site_id"], name: "index_staging_sites_on_site_id", using: :btree
  add_index "staging_sites", ["version_id"], name: "index_staging_sites_on_version_id", using: :btree

  create_table "stats", force: :cascade do |t|
    t.integer  "site_id"
    t.date     "date"
    t.integer  "count"
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "stats", ["site_id"], name: "index_stats_on_site_id", using: :btree
  add_index "stats", ["type", "id"], name: "index_stats_on_type_and_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "statuses", ["name"], name: "index_statuses_on_name", using: :btree

  create_table "stripe_accounts", force: :cascade do |t|
    t.integer  "white_label_portal_id"
    t.string   "stripe_user_id",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.boolean  "deauthorized",                      default: false
  end

  add_index "stripe_accounts", ["white_label_portal_id"], name: "index_stripe_account_on_wl_sub_id", using: :btree

  create_table "stripe_customer_accounts", force: :cascade do |t|
    t.integer  "white_label_client_id"
    t.string   "remote_id"
    t.string   "last_four"
    t.string   "exp_month"
    t.string   "exp_year"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "stripe_customer_accounts", ["white_label_client_id"], name: "index_stripe_customer_accounts_on_white_label_client_id", using: :btree

  create_table "stripe_transactions", force: :cascade do |t|
    t.integer  "stripe_account_id"
    t.integer  "white_label_billing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                             default: 0
    t.string   "remote_charge_id",       limit: 255
    t.string   "message"
    t.integer  "billed_amount",                                  null: false
    t.integer  "billed_overage_fee",                             null: false
    t.integer  "prorated_overage_fee",                           null: false
  end

  add_index "stripe_transactions", ["status"], name: "index_stripe_transactions_on_status", using: :btree
  add_index "stripe_transactions", ["stripe_account_id"], name: "index_stripe_transactions_on_stripe_account_id", using: :btree
  add_index "stripe_transactions", ["white_label_billing_id"], name: "index_stripe_transactions_on_white_label_billing_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "title"
    t.string   "content"
    t.string   "user_id"
    t.integer  "category_id"
    t.integer  "vote_count",  default: 0
    t.integer  "status_id"
  end

  add_index "submissions", ["category_id"], name: "index_submissions_on_category_id", using: :btree
  add_index "submissions", ["status_id"], name: "index_submissions_on_status_id", using: :btree

  create_table "subscription_histories", force: :cascade do |t|
    t.string  "kind",                limit: 255
    t.integer "subscription_id"
    t.integer "pricing_plan_id"
    t.integer "payment_method_id"
    t.string  "payment_method_type", limit: 255
    t.decimal "price",                           precision: 8, scale: 2
    t.integer "billing_frequency"
    t.text    "addons"
    t.text    "discounts"
  end

  add_index "subscription_histories", ["payment_method_type", "payment_method_id"], name: "index_subscription_histories_on_payment_method_v2", using: :btree
  add_index "subscription_histories", ["pricing_plan_id"], name: "index_subscription_histories_on_pricing_plan_id", using: :btree
  add_index "subscription_histories", ["subscription_id"], name: "index_subscription_histories_on_subscription_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "payment_method_id"
    t.string   "payment_method_type",      limit: 255
    t.integer  "remote_subscription_id"
    t.string   "remote_subscription_type", limit: 255
    t.integer  "pricing_plan_id"
    t.string   "token",                    limit: 255
    t.integer  "billing_frequency"
    t.string   "status",                   limit: 255
    t.date     "paid_through_date"
    t.date     "first_billing_date"
    t.datetime "options_updated_at"
    t.boolean  "first_warning",                        default: false
    t.string   "cancellation_reason",      limit: 255
    t.text     "cancellation_comments"
    t.datetime "cancelled_at"
    t.datetime "expires_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "locked",                               default: false
    t.datetime "next_email_at"
    t.boolean  "needs_import",                         default: false
    t.integer  "owner_id"
    t.string   "owner_type",               limit: 255
    t.string   "kind",                     limit: 255
    t.string   "name",                     limit: 255
    t.text     "locks"
    t.boolean  "overage_legacy",                       default: false
    t.boolean  "overage_exempt",                       default: false
    t.text     "billing_info"
    t.string   "email_contacts",           limit: 255
    t.integer  "autoupgrade_policy"
    t.string   "type",                     limit: 255
  end

  add_index "subscriptions", ["owner_type", "owner_id"], name: "index_subscriptions_on_owner_type_and_owner_id", using: :btree
  add_index "subscriptions", ["payment_method_id", "payment_method_type"], name: "index_subscriptions_on_payment_method", using: :btree
  add_index "subscriptions", ["pricing_plan_id"], name: "index_subs_on_pricing_plan_id", using: :btree
  add_index "subscriptions", ["remote_subscription_id", "remote_subscription_type"], name: "index_subscriptions_on_remote_subscription", using: :btree
  add_index "subscriptions", ["site_id"], name: "index_subs_on_site_id", using: :btree
  add_index "subscriptions", ["type"], name: "index_subscriptions_on_type", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "subscription_id"
    t.integer  "remote_transaction_id"
    t.string   "remote_transaction_type", limit: 255
    t.integer  "payment_method_id"
    t.string   "payment_method_type",     limit: 255
    t.decimal  "amount",                              precision: 8, scale: 2
    t.string   "kind",                    limit: 255
    t.string   "status",                  limit: 255
    t.boolean  "receipt_sent",                                                default: false
    t.integer  "refunded_transaction_id"
    t.text     "data"
    t.datetime "billed_at"
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.integer  "migration_request_id"
    t.string   "owner_type",              limit: 255
    t.integer  "owner_id"
    t.date     "bt_disbursement_date"
    t.date     "fw_disbursement_date"
    t.string   "refund_reason"
  end

  add_index "transactions", ["migration_request_id"], name: "index_transactions_on_migration_request_id", using: :btree
  add_index "transactions", ["owner_type", "owner_id"], name: "index_transactions_on_owner_type_and_owner_id", using: :btree
  add_index "transactions", ["payment_method_type", "payment_method_id"], name: "index_transactions_on_payment_method_v2", using: :btree
  add_index "transactions", ["refunded_transaction_id"], name: "index_transactions_on_refunded_transaction_id", using: :btree
  add_index "transactions", ["remote_transaction_id", "remote_transaction_type"], name: "index_transactions_on_remote_transaction", using: :btree
  add_index "transactions", ["subscription_id"], name: "index_transactions_on_subscription_id", using: :btree

  create_table "transfer_batches", force: :cascade do |t|
    t.integer  "concurrency"
    t.integer  "count"
    t.datetime "finished_at"
    t.string   "from_version",     limit: 255
    t.integer  "instance_list_id"
    t.string   "status",           limit: 255
    t.string   "to_version",       limit: 255
    t.integer  "transfers_count",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transfer_batches", ["instance_list_id"], name: "index_transfer_batches_on_instance_list_id", using: :btree

  create_table "upgrade_batches", force: :cascade do |t|
    t.integer  "count"
    t.integer  "concurrency"
    t.integer  "threshold"
    t.boolean  "complete",                              default: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "status",                    limit: 255
    t.integer  "from_version_id"
    t.integer  "to_version_id"
    t.integer  "from_wordpress_version_id"
    t.integer  "from_chef_version_id"
    t.integer  "to_wordpress_version_id"
    t.integer  "to_chef_version_id"
    t.string   "name",                      limit: 255
    t.string   "kind",                      limit: 255
    t.string   "type",                      limit: 255
    t.integer  "site_list_id"
    t.integer  "instance_list_id"
    t.boolean  "chef_only",                             default: false
  end

  add_index "upgrade_batches", ["from_chef_version_id"], name: "index_upgrade_batches_on_from_chef_version_id", using: :btree
  add_index "upgrade_batches", ["from_version_id"], name: "index_upgrade_batches_on_from_version_id", using: :btree
  add_index "upgrade_batches", ["from_wordpress_version_id"], name: "index_upgrade_batches_on_from_wordpress_version_id", using: :btree
  add_index "upgrade_batches", ["instance_list_id"], name: "index_upgrade_batches_on_instance_list_id", using: :btree
  add_index "upgrade_batches", ["to_chef_version_id"], name: "index_upgrade_batches_on_to_chef_version_id", using: :btree
  add_index "upgrade_batches", ["to_version_id"], name: "index_upgrade_batches_on_to_version_id", using: :btree
  add_index "upgrade_batches", ["to_wordpress_version_id"], name: "index_upgrade_batches_on_to_wordpress_version_id", using: :btree

  create_table "upgrades", force: :cascade do |t|
    t.string   "type",                      limit: 255
    t.string   "upgradable_type",           limit: 255
    t.integer  "upgradable_id"
    t.integer  "from_version_id"
    t.integer  "to_version_id"
    t.string   "status",                    limit: 255
    t.string   "message",                   limit: 255
    t.text     "error_message"
    t.text     "settings"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.boolean  "current",                               default: false
    t.string   "prior_code",                limit: 255
    t.integer  "upgrade_batch_id"
    t.string   "post_code",                 limit: 255
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "from_wordpress_version_id"
    t.integer  "from_chef_version_id"
    t.integer  "to_wordpress_version_id"
    t.integer  "to_chef_version_id"
    t.boolean  "notice_sent",                           default: true
  end

  add_index "upgrades", ["from_chef_version_id"], name: "index_upgrades_on_from_chef_version_id", using: :btree
  add_index "upgrades", ["from_version_id"], name: "index_upgrades_on_from_version_id", using: :btree
  add_index "upgrades", ["from_wordpress_version_id"], name: "index_upgrades_on_from_wordpress_version_id", using: :btree
  add_index "upgrades", ["to_chef_version_id"], name: "index_upgrades_on_to_chef_version_id", using: :btree
  add_index "upgrades", ["to_version_id"], name: "index_upgrades_on_to_version_id", using: :btree
  add_index "upgrades", ["to_wordpress_version_id"], name: "index_upgrades_on_to_wordpress_version_id", using: :btree
  add_index "upgrades", ["type", "id"], name: "index_upgrades_on_type_and_id", using: :btree
  add_index "upgrades", ["upgradable_id"], name: "index_upgrades_on_upgradable_id", using: :btree
  add_index "upgrades", ["upgradable_type", "upgradable_id"], name: "index_upgrades_on_upgradable_type_and_upgradable_id", using: :btree
  add_index "upgrades", ["upgrade_batch_id"], name: "index_upgrades_on_upgrade_batch_id", using: :btree

  create_table "uptime_monitors", force: :cascade do |t|
    t.integer  "site_id"
    t.text     "uptime_robot_id"
    t.text     "status"
    t.text     "url"
    t.integer  "interval"
    t.integer  "alert_delay"
    t.float    "ratio"
    t.datetime "down_at"
    t.text     "down_detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uptime_monitors", ["site_id"], name: "index_uptime_monitors_on_site_id", using: :btree
  add_index "uptime_monitors", ["uptime_robot_id"], name: "index_uptime_monitors_on_uptime_robot_id", using: :btree

  create_table "user_stats", force: :cascade do |t|
    t.date     "date"
    t.integer  "account_id"
    t.decimal  "mrr_owned",                              precision: 12, scale: 2
    t.decimal  "mrr_transferred",                        precision: 12, scale: 2
    t.decimal  "revenue_owned"
    t.decimal  "revenue_transferred"
    t.integer  "total_sites"
    t.integer  "new_sites"
    t.integer  "deleted_sites"
    t.integer  "total_subscriptions"
    t.integer  "new_subscriptions"
    t.integer  "cancelled_subscriptions"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.integer  "owned_sites"
    t.integer  "tiny_plans"
    t.integer  "personal_plans"
    t.integer  "professional_plans"
    t.integer  "freelance_plans"
    t.integer  "agency_plans"
    t.integer  "custom_plans"
    t.integer  "days_since_last_creation"
    t.integer  "migrations_submitted"
    t.decimal  "commission_value",                       precision: 12, scale: 2
    t.string   "account_type",               limit: 255
    t.integer  "total_commissions"
    t.integer  "total_earned_commissions"
    t.decimal  "commission_value_earned",                precision: 12, scale: 2
    t.integer  "number_of_collaborations"
    t.integer  "users_referred"
    t.integer  "zendesk_tickets"
    t.integer  "total_paid_subscriptions"
    t.integer  "total_unpaid_subscriptions"
    t.decimal  "mrr_referred",                           precision: 12, scale: 2
    t.datetime "mrr_first_seen_date"
    t.integer  "transferred_sites"
    t.decimal  "mrr_total",                              precision: 12, scale: 2
    t.decimal  "revenue_total",                          precision: 12, scale: 2
    t.decimal  "orgs_mrr",                               precision: 12, scale: 2
    t.decimal  "orgs_revenue",                           precision: 12, scale: 2
    t.integer  "affiliate_id"
    t.string   "paypal"
  end

  add_index "user_stats", ["account_id"], name: "index_user_stats_on_account_id", using: :btree
  add_index "user_stats", ["account_type"], name: "index_user_stats_on_account_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.boolean  "admin"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "versions", force: :cascade do |t|
    t.boolean  "primary"
    t.text     "settings"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "type",           limit: 255
    t.string   "commit_id",      limit: 255
    t.string   "commit_message", limit: 255
    t.datetime "commit_date"
    t.string   "branch",         limit: 255
    t.boolean  "minimum"
    t.boolean  "experimental",               default: false
    t.datetime "notice_sent_at"
    t.float    "major_version"
    t.integer  "minor_version"
    t.text     "notes"
  end

  add_index "versions", ["type", "id"], name: "index_versions_on_type_and_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "weight",    default: 1, null: false
    t.integer "user_id"
    t.string  "post_type"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  create_table "white_label_billing_items", force: :cascade do |t|
    t.integer  "white_label_billing_id"
    t.integer  "white_label_service_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
  end

  add_index "white_label_billing_items", ["white_label_billing_id"], name: "index_white_label_billing_items_on_white_label_billing_id", using: :btree
  add_index "white_label_billing_items", ["white_label_service_id"], name: "index_white_label_billing_items_on_white_label_service_id", using: :btree

  create_table "white_label_billings", force: :cascade do |t|
    t.integer  "white_label_site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "first_attempt_date"
  end

  add_index "white_label_billings", ["white_label_site_id"], name: "index_white_label_billings_on_white_label_site_id", using: :btree

  create_table "white_label_clients", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "white_label_portal_id"
    t.datetime "deleted_at"
  end

  add_index "white_label_clients", ["deleted_at"], name: "index_white_label_clients_on_deleted_at", using: :btree
  add_index "white_label_clients", ["email", "white_label_portal_id"], name: "index_white_label_clients_on_email_and_white_label_portal_id", unique: true, using: :btree
  add_index "white_label_clients", ["white_label_portal_id"], name: "index_white_label_clients_on_white_label_portal_id", using: :btree

  create_table "white_label_password_reset_tokens", force: :cascade do |t|
    t.integer  "white_label_client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "white_label_password_reset_tokens", ["white_label_client_id"], name: "index_wl_password_reset_tokens_on_white_label_client_id", using: :btree

  create_table "white_label_portals", force: :cascade do |t|
    t.string   "company_name",      limit: 255
    t.string   "email",             limit: 255
    t.string   "mailing_address",   limit: 255
    t.string   "city",              limit: 255
    t.string   "state",             limit: 255
    t.string   "postal_code",       limit: 255
    t.string   "country",           limit: 255
    t.string   "phone_number",      limit: 255
    t.string   "company_logo",      limit: 255
    t.string   "subdomain",         limit: 255
    t.integer  "account_id"
    t.string   "account_type",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subscription_id"
    t.string   "slug"
    t.string   "hex_color"
    t.string   "hex_color_dark"
    t.string   "company_logo_name"
    t.string   "company_logo_size"
    t.datetime "deleted_at"
  end

  add_index "white_label_portals", ["account_type", "account_id"], name: "index_white_label_portals_on_account_type_and_account_id", using: :btree
  add_index "white_label_portals", ["slug"], name: "index_white_label_portals_on_slug", unique: true, using: :btree
  add_index "white_label_portals", ["subdomain"], name: "index_active_portals_on_subdomain", unique: true, where: "(deleted_at IS NULL)", using: :btree
  add_index "white_label_portals", ["subscription_id"], name: "index_wl_portal_on_sub_id", using: :btree

  create_table "white_label_services", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description"
    t.decimal  "price",                           precision: 8, scale: 2
    t.integer  "white_label_site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                                                  default: 1
  end

  add_index "white_label_services", ["status"], name: "index_white_label_services_on_status", using: :btree
  add_index "white_label_services", ["white_label_site_id"], name: "index_white_label_services_on_white_label_site_id", using: :btree

  create_table "white_label_sessions", id: :bigserial, force: :cascade do |t|
    t.integer  "white_label_client_id", limit: 8
    t.string   "token"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "white_label_sessions", ["white_label_client_id"], name: "index_white_label_sessions_on_white_label_client_id", using: :btree

  create_table "white_label_sites", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "white_label_portal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                default: 0
    t.string   "email"
    t.date     "paid_through_date"
    t.date     "first_billing_date"
    t.integer  "white_label_client_id"
    t.datetime "deleted_at"
  end

  add_index "white_label_sites", ["deleted_at"], name: "index_white_label_sites_on_deleted_at", using: :btree
  add_index "white_label_sites", ["site_id"], name: "index_white_label_sites_on_site_id", using: :btree
  add_index "white_label_sites", ["status"], name: "index_white_label_sites_on_status", using: :btree
  add_index "white_label_sites", ["white_label_client_id"], name: "index_white_label_sites_on_white_label_client_id", using: :btree
  add_index "white_label_sites", ["white_label_portal_id"], name: "index_white_label_sites_on_white_label_portal_id", using: :btree

  create_table "white_label_transfer_tokens", force: :cascade do |t|
    t.integer  "white_label_site_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "white_label_client_id", limit: 8
  end

  add_index "white_label_transfer_tokens", ["white_label_client_id"], name: "index_white_label_transfer_tokens_on_white_label_client_id", using: :btree
  add_index "white_label_transfer_tokens", ["white_label_site_id"], name: "index_white_label_transfer_tokens_on_white_label_site_id", using: :btree

  create_table "whitelists", force: :cascade do |t|
    t.string   "ip",          limit: 255
    t.integer  "instance_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "reason"
  end

  add_index "whitelists", ["instance_id"], name: "index_whitelists_on_instance_id", using: :btree

  create_table "wordpress_users", force: :cascade do |t|
    t.integer  "wordpress_id"
    t.integer  "user_id"
    t.boolean  "default",                     default: false
    t.string   "username",        limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "wordpress_users", ["user_id"], name: "index_wordpress_users_on_user_id", using: :btree
  add_index "wordpress_users", ["wordpress_id"], name: "index_wordpress_users_on_wordpress_id", using: :btree

  create_table "wordpresses", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "dbname",                    limit: 255
    t.string   "dbuser",                    limit: 255
    t.string   "dbpass",                    limit: 255
    t.string   "dbhost",                    limit: 255
    t.string   "dbprefix",                  limit: 255
    t.string   "wpadmin",                   limit: 255
    t.string   "wppassword",                limit: 255
    t.boolean  "wpdebug"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.text     "settings"
    t.datetime "deleted_at"
    t.boolean  "disable_charset_collate"
    t.text     "salts"
    t.boolean  "multisite"
    t.boolean  "multisite_subdomains"
    t.string   "multisite_path",            limit: 255
    t.string   "multisite_site_id",         limit: 255
    t.string   "multisite_blog_id",         limit: 255
    t.boolean  "sunrise"
    t.string   "language",                  limit: 255
    t.boolean  "wpcache",                               default: false
    t.text     "charset_selection",                     default: "utf8"
    t.text     "custom"
    t.text     "original_salts"
    t.string   "wp_siteurl_config",         limit: 255
    t.boolean  "wpdebuglog",                            default: false
    t.boolean  "mail_header_compatibility",             default: false
    t.datetime "flywheel_user_expires_at"
  end

  add_index "wordpresses", ["flywheel_user_expires_at"], name: "index_wordpresses_on_flywheel_user_expires_at", using: :btree
  add_index "wordpresses", ["site_id"], name: "index_wordpresses_on_site_id", unique: true, using: :btree

  add_foreign_key "certificate_challenges", "ssl_certificates", on_delete: :cascade
  add_foreign_key "fleet_databases", "cloud_sql_machine_types"
  add_foreign_key "platform_upgrades_site_upgrade_windows", "platform_upgrades_upgrade_windows"
  add_foreign_key "platform_upgrades_site_upgrade_windows", "sites"
  add_foreign_key "sites", "fleets", name: "reserved_fleet_id"
  add_foreign_key "white_label_clients", "white_label_portals"
  add_foreign_key "white_label_password_reset_tokens", "white_label_clients"
  add_foreign_key "white_label_services", "white_label_sites", on_delete: :cascade
  add_foreign_key "white_label_sessions", "white_label_clients"
  add_foreign_key "white_label_sites", "white_label_clients"
  add_foreign_key "white_label_transfer_tokens", "white_label_clients", on_delete: :cascade
end
