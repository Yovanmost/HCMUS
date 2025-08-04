import os
import time
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select, WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.edge.service import Service as EdgeService
from selenium.webdriver.firefox.service import Service as FirefoxService
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.common.exceptions import TimeoutException
from datetime import datetime

# ─── Paths ──────────────────────────────────────────────────────────────────────
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DRIVER_DIR = os.path.join(BASE_DIR, "drivers")
CSV_PATH = os.path.join(BASE_DIR, "data", "users_with_bugs.csv")

# ─── Driver Factory ─────────────────────────────────────────────────────────────
def get_driver(browser_name):
    if browser_name == "chrome":
        svc = ChromeService(os.path.join(DRIVER_DIR, "chromedriver.exe"))
        opts = ChromeOptions()
        opts.binary_location = r"C:\Program Files\Google\Chrome\Application\chrome.exe"
        return webdriver.Chrome(service=svc, options=opts)

    if browser_name == "firefox":
        svc = FirefoxService(os.path.join(DRIVER_DIR, "geckodriver.exe"))
        opts = FirefoxOptions()
        opts.binary_location = r"C:\Program Files\Mozilla Firefox\firefox.exe"
        return webdriver.Firefox(service=svc, options=opts)

    if browser_name == "edge":
        svc = EdgeService(os.path.join(DRIVER_DIR, "msedgedriver.exe"))
        return webdriver.Edge(service=svc)

    raise ValueError(f"Unsupported browser: {browser_name}")

# ─── Login ──────────────────────────────────────────────────────────────────────
def login_as_admin(driver):
    driver.get("https://with-bugs.practicesoftwaretesting.com/#/auth/login")
    wait = WebDriverWait(driver, 10)

    wait.until(EC.presence_of_element_located((By.ID, "email"))).send_keys("admin@practicesoftwaretesting.com")

    # Use data-test or CSS selector instead of By.ID
    driver.find_element(By.CSS_SELECTOR, "input[data-test='password']").send_keys("welcome01")

    driver.find_element(By.CSS_SELECTOR, "input[data-test='login-submit']").click()
    wait.until(EC.url_contains("/admin"))
    print("[🔐] Logged in successfully.")

# ─── Test Runner ────────────────────────────────────────────────────────────────
def run_add_user_test(base_url, browser_name):
    if not os.path.exists(CSV_PATH):
        print(f"[❌] CSV not found at {CSV_PATH}")
        return

    df = pd.read_csv(CSV_PATH).fillna('')
    driver = get_driver(browser_name)
    driver.maximize_window()
    wait = WebDriverWait(driver, 10)
    results = []

    try:
        login_as_admin(driver)

        for index, row in df.iterrows():
            user_email = row['Email']
            test_case_id = row['Test case ID']
            expected_result = row['Expected Result']
            print(f"\n[🧪] {browser_name.upper()} → Adding '{test_case_id}'")
            time.sleep(5)

            try:
                driver.get(base_url)
                wait.until(EC.presence_of_element_located((By.ID, "firstname")))

                # Fill in the form
                fields = {
                    "firstname": row['First Name'],
                    "lastname": row['Last Name'],
                    "dob": row['Date of Birth'],
                    "address": row['Address'],
                    "postcode": row['Postal Code'],
                    "city": row['City'],
                    "state": row['State'],
                    "country": row['Country'],
                    "phone": row['Phone'],
                    "email": row['Email'],
                    "password": row['Password']
                }

                time.sleep(3)
                for field_id, value in fields.items():
                    if str(value).strip().lower() != "null":
                        if field_id == "dob":
                            date_value = str(value)
                            js_script = f"""
                                var dobInput = document.getElementById('dob');
                                dobInput.value = '{date_value}';
                                dobInput.dispatchEvent(new Event('input', {{ bubbles: true }})); // Try 'input' instead of 'change'
                                dobInput.dispatchEvent(new Event('blur', {{ bubbles: true }}));  // Trigger the blur event
                            """
                            driver.execute_script(js_script)
                            print(f"[✏️] Set 'dob' using JS, fired 'input' and 'blur' events: {date_value}")


                        elif field_id == "country":
                            Select(driver.find_element(By.ID, field_id)).select_by_visible_text(str(value))

                        else:
                            field = driver.find_element(By.ID, field_id)
                            field.clear()
                            field.send_keys(str(value))


                # Enabled checkbox
                enabled = str(row['Enabled']).strip().lower()
                checkbox = driver.find_element(By.ID, "enabled")
                if enabled == "true" and not checkbox.is_selected():
                    checkbox.click()
                elif enabled == "false" and checkbox.is_selected():
                    checkbox.click()

                # Submit
                # wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-test='user-submit']"))).click()
                # driver.find_element(By.CSS_SELECTOR, "button[data-test='user-submit']").click()
                submit_button = wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-test='user-submit']")))
                driver.execute_script("arguments[0].click();", submit_button)

                # Alert check
                try:
                    alert = WebDriverWait(driver, 5).until(
                        EC.presence_of_element_located((
                            By.CSS_SELECTOR,
                            "div[role='alert'].alert-success, div[role='alert'].alert-danger"
                        ))
                    )
                    alert_text = alert.text.strip()
                    alert_class = alert.get_attribute("class")

                    result = "Pass" if "alert-success" in alert_class else "Fail"

                    if "alert-success" in alert_class:
                        print(f"[✅] '{test_case_id}' added successfully.")

                    elif "alert-danger" in alert_class:
                        print(f"[❌] Error alert when adding '{test_case_id}': {alert_text}")

                    else:
                        print(f"[❌] Unknown alert type for '{test_case_id}'")

                    print(f"\nExpected result: {expected_result}")
                    results.append({
                        "Browser": browser_name,
                        "Test case ID": test_case_id,
                        "Message": alert_text,
                        "Result": result,
                        "Expected Result": expected_result
                    })

                except TimeoutException:
                    print(f"[❌] No alert shown after submitting '{test_case_id}'")
                    print(f"\nExpected result: {expected_result}")
                    results.append({
                        "Browser": browser_name,
                        "Test case ID": test_case_id,
                        "Message": "No alert displayed",
                        "Result": "Fail",
                        "Expected Result": expected_result
                    })

            except Exception as e:
                print(f"[❌] Error adding user '{user_email}': {str(e)}")
                print(f"\nExpected result: {expected_result}")
                results.append({
                    "Browser": browser_name,
                    "Test case ID": test_case_id,
                    "Message": str(e),
                    "Result": "Fail",
                    "Expected Result": expected_result
                })

    finally:
        driver.quit()
        output_file = os.path.join(BASE_DIR, "result", f"results_add_users_{browser_name}_with_bugs.csv")
        pd.DataFrame(results).to_csv(output_file, index=False)
        print(f"[📄] Results saved to: {output_file}")

# ─── Entrypoint ────────────────────────────────────────────────────────────────
if __name__ == "__main__":
    for browser in ["edge"]:
        print(f"\n===== Running on {browser.upper()} =====")
        run_add_user_test(
            base_url="https://with-bugs.practicesoftwaretesting.com/#/admin/users/add",
            browser_name=browser
        )
