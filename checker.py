import os
import time
from datetime import datetime

SITES = ["google.com", "thisfakesiteeee.com", "link-that-will-fail.com"]

def monitor():
    while True:
        with open("health_log.txt", "a") as f:
            
            now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            print(f"--- Running Check at {now} ---")

            for site in SITES:
                response = os.system(f"ping -c 1 {site} > /dev/null 2>&1")
                
                if response == 0:
                    status = "UP"
                else:
                    status = "DOWN"
                
                log_entry = f"[{now}] {site}: {status}\n"
                f.write(log_entry)
                print(f"Logged: {site} is {status}")

            gap_in_between = "\n"
            f.write(gap_in_between)

        print("Waiting 30 seconds...")
        time.sleep(30)

if __name__ == "__main__":
    monitor()