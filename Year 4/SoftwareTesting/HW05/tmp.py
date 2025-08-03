tmp.py
# def run_add_product_test(base_url, browser_name):
#     if not os.path.exists(CSV_PATH):
#         print(f"[❌] CSV not found at {CSV_PATH}")
#         return

#     df = pd.read_csv(CSV_PATH)
#     driver = get_driver(browser_name)
#     driver.maximize_window()
#     wait = WebDriverWait(driver, 10)

#     try:
#         login_as_admin(driver)

#         for _, row in df.iterrows():
#             print(f"\n[🧪] {browser_name.upper()} → Adding '{row['Product Name']}'")
#             driver.get(base_url)
#             # wait for form title
#             wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "h2[data-test='page-title']")))
#             time.sleep(5) # I want to change this part to something more suitable for web

#             # fill text fields
#             driver.find_element(By.ID, "name").send_keys(row["Product Name"])
#             driver.find_element(By.ID, "description").send_keys(row["Description"])
#             driver.find_element(By.ID, "stock").send_keys(str(row["Stock"]))
#             driver.find_element(By.ID, "price").send_keys(str(row["Price"]))

#             # Location Offer checkbox
#             if str(row["Location Offer"]).strip().lower() == "yes":
#                 try:
#                     cb = driver.find_element(By.ID, "is_location_offer")
#                     if not cb.is_selected():
#                         cb.click()
#                 except NoSuchElementException:
#                     print("⚠️ 'Location Offer' checkbox not found")

#             # Item for Rent checkbox (id="is_rental")
#             if str(row["Item for Rent"]).strip().lower() == "yes":
#                 try:
#                     cb = driver.find_element(By.ID, "is_rental")
#                     if not cb.is_selected():
#                         cb.click()
#                 except NoSuchElementException:
#                     print("⚠️ 'Item for Rent' checkbox not found")

#             # dropdowns
#             wait = WebDriverWait(driver, 5)
#             Select(driver.find_element(By.ID,    "brand_id"         )).select_by_visible_text(row["Brand"])
#             Select(driver.find_element(By.ID,    "category_id"      )).select_by_visible_text(row["Category"])
#             Select(driver.find_element(By.ID,    "product_image_id" )).select_by_visible_text(row["Image"])

#             # submit
#             driver.find_element(By.CSS_SELECTOR, "button[data-test='product-submit']").click()

#             # wait for success (URL or flash message)
#             success_alert = WebDriverWait(driver, 5).until(
#                 EC.visibility_of_element_located((By.CSS_SELECTOR, ".alert-success"))
#             )
#             msg = success_alert.text.strip().lower()

#             # accept either “product saved” or “successfully added”
#             if "product saved" in msg or "successfully added" in msg:
#                 print(f"[✅] '{row['Product Name']}' confirmed by flash message: '{success_alert.text}'")
#             else:
#                 raise AssertionError(f"Unexpected alert text: '{success_alert.text}'")

#     finally:
#         driver.quit()
