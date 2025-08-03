import os
import time
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select, WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.firefox.service import Service as FirefoxService
from selenium.webdriver.edge.service import Service as EdgeService
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.firefox.options import Options as FirefoxOption
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.common.exceptions import TimeoutException



# ─── Paths ──────────────────────────────────────────────────────────────────────
BASE_DIR   = os.path.dirname(os.path.abspath(__file__))
DRIVER_DIR = os.path.join(BASE_DIR, "drivers")
CSV_PATH   = os.path.join(BASE_DIR, "data", "products.csv")

# ─── Driver Factory ────────────────────────────────────────────────────────────
def get_driver(browser_name):
    if browser_name == "chrome":
        svc = ChromeService(os.path.join(DRIVER_DIR, "chromedriver.exe"))
        opts = ChromeOptions()
        # ← point to your actual chrome.exe path
        opts.binary_location = r"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
        return webdriver.Chrome(service=svc, options=opts)

    if browser_name == "firefox":
        svc = FirefoxService(os.path.join(DRIVER_DIR, "geckodriver.exe"))
        opts = FirefoxOption()
        # <-- point to your actual firefox.exe location
        opts.binary_location = r"C:\Program Files\Mozilla Firefox\firefox.exe"
        return webdriver.Firefox(service=svc, options=opts)

    if browser_name == "edge":
        svc = EdgeService(os.path.join(DRIVER_DIR, "msedgedriver.exe"))
        return webdriver.Edge(service=svc)

    raise ValueError(f"Unsupported browser: {browser_name}")

# ─── Login ──────────────────────────────────────────────────────────────────────
def login_as_admin(driver):
    driver.get("https://practicesoftwaretesting.com/auth/login")
    wait = WebDriverWait(driver, 10)
    # wait for email field
    wait.until(EC.presence_of_element_located((By.ID, "email"))).send_keys("admin@practicesoftwaretesting.com")
    driver.find_element(By.ID, "password").send_keys("welcome01")
    # click the input[type=submit]
    driver.find_element(By.CSS_SELECTOR, "input[data-test='login-submit']").click()
    # wait for redirect into /admin
    wait.until(EC.url_contains("/admin"))
    print("[🔐] Logged in successfully.")

# ─── Test Runner ────────────────────────────────────────────────────────────────
def run_add_product_test(base_url, browser_name):
    if not os.path.exists(CSV_PATH):
        print(f"[❌] CSV not found at {CSV_PATH}")
        return

    df = pd.read_csv(CSV_PATH)
    df = df.fillna('')  # Replace NaN with empty string
    driver = get_driver(browser_name)
    driver.maximize_window()
    wait = WebDriverWait(driver, 10)

    test_results = []

    try:
        login_as_admin(driver)

        for _, row in df.iterrows():
            product_name = str(row['Product Name'])
            print(f"\n[🧪] {browser_name.upper()} → Adding '{product_name}'")

            try:
                driver.get(base_url)
                wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "h2[data-test='page-title']")))

                # clear + fill text fields
                if str(row["Product Name"]).strip().lower() != "null":
                    driver.find_element(By.ID, "name").clear()
                    driver.find_element(By.ID, "name").send_keys(row["Product Name"])

                if str(row["Description"]).strip().lower() != "null":
                    driver.find_element(By.ID, "description").clear()
                    driver.find_element(By.ID, "description").send_keys(str(row["Description"]))

                if str(row["Stock"]).strip().lower() != "null":
                    driver.find_element(By.ID, "stock").clear()
                    driver.find_element(By.ID, "stock").send_keys(str(row["Stock"]))

                if str(row["Price"]).strip().lower() != "null":
                    driver.find_element(By.ID, "price").clear()
                    driver.find_element(By.ID, "price").send_keys(str(row["Price"]))


                # Checkboxes
                if str(row["Location Offer"]).strip().lower() == "yes":
                    cb = driver.find_element(By.ID, "is_location_offer")
                    if not cb.is_selected():
                        cb.click()
                if str(row["Item for Rent"]).strip().lower() == "yes":
                    cb = driver.find_element(By.ID, "is_rental")
                    if not cb.is_selected():
                        cb.click()

                # Dropdowns
                time.sleep(5)
                if str(row["Brand"]).strip().lower() != "null":
                    Select(driver.find_element(By.ID, "brand_id")).select_by_visible_text(row["Brand"])
                if str(row["Category"]).strip().lower() != "null":
                    Select(driver.find_element(By.ID, "category_id")).select_by_visible_text(row["Category"])
                if str(row["Image"]).strip().lower() != "null":
                    Select(driver.find_element(By.ID, "product_image_id")).select_by_visible_text(row["Image"])


                # Submit form
                driver.find_element(By.CSS_SELECTOR, "button[data-test='product-submit']").click()

                # Wait for alert (success or error)
                try:
                    alert = WebDriverWait(driver, 5).until(
                        EC.presence_of_element_located((
                            By.CSS_SELECTOR,
                            "div[role='alert'].alert-success, div[role='alert'].alert-danger"
                        ))
                    )
                    alert_text = alert.text.strip()
                    alert_class = alert.get_attribute("class")

                    if "alert-success" in alert_class:
                        print(f"[✅] '{product_name}' added successfully.")
                        test_results.append({
                            "Browser": browser_name,
                            "Product Name": product_name,
                            "Result": "Pass",
                            "Message": alert_text
                        })

                    elif "alert-danger" in alert_class:
                        print(f"[❌] Error alert when adding '{product_name}': {alert_text}")
                        test_results.append({
                            "Browser": browser_name,
                            "Product Name": product_name,
                            "Result": "Fail",
                            "Message": alert_text
                        })

                    else:
                        print(f"[❌] Unknown alert type for '{product_name}'")
                        test_results.append({
                            "Browser": browser_name,
                            "Product Name": product_name,
                            "Result": "Fail",
                            "Message": f"Unknown alert type: {alert_class}"
                        })

                except TimeoutException:
                    print(f"[❌] No alert shown after submitting '{product_name}'")
                    test_results.append({
                        "Browser": browser_name,
                        "Product Name": product_name,
                        "Result": "Fail",
                        "Message": "No success or error alert found after waiting"
                    })

            except Exception as e:
                print(f"[❌] Failed to add '{product_name}': {str(e)}")
                test_results.append({
                    "Browser": browser_name,
                    "Product Name": product_name,
                    "Result": "Fail",
                    "Message": str(e)
                })

    finally:
        driver.quit()

        # Export result to CSV
        results_df = pd.DataFrame(test_results)
        out_path = os.path.join(BASE_DIR, f"results_{browser_name}.csv")
        results_df.to_csv(out_path, index=False)
        print(f"[📄] Results saved to {out_path}")


# ─── Entrypoint ────────────────────────────────────────────────────────────────
if __name__ == "__main__":
    for browser in ["edge"]:
        print(f"\n===== Running on {browser.upper()} =====")
        run_add_product_test(
            base_url="https://practicesoftwaretesting.com/admin/products/add",
            browser_name=browser
        )
