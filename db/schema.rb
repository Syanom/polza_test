# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_14_093659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_in_menus", force: :cascade do |t|
    t.bigint "dish_id"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_dish_in_menus_on_dish_id"
    t.index ["menu_id"], name: "index_dish_in_menus_on_menu_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_in_dishes", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_ingredient_in_dishes_on_dish_id"
    t.index ["ingredient_id"], name: "index_ingredient_in_dishes_on_ingredient_id"
  end

  create_table "ingredient_in_menus", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_in_menus_on_ingredient_id"
    t.index ["menu_id"], name: "index_ingredient_in_menus_on_menu_id"
  end

  create_table "ingredient_to_ignores", force: :cascade do |t|
    t.bigint "menu_order_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_to_ignores_on_ingredient_id"
    t.index ["menu_order_id"], name: "index_ingredient_to_ignores_on_menu_order_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_orders", force: :cascade do |t|
    t.boolean "delivered_to_kitchen", default: false
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_orders_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
