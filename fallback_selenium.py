#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#
#def download_with_selenium(url, output_dir):
#    # Tor proxy setup
#    proxy = "socks5://127.0.0.1:9050"  # Default Tor proxy
#    options = Options()
#    options.add_argument(f"--proxy-server={proxy}")
#    options.add_argument("--headless")  # Run in headless mode for no GUI
#
#    # Initialize the Firefox WebDriver
#    driver = webdriver.Firefox(options=options)
#    try:
#        # Access the URL
#        driver.get(url)
#
#        # Infer filename from the URL
#        filename = os.path.join(output_dir, os.path.basename(url))
#        if not filename:  # Fallback for URLs without a filename
#            filename = os.path.join(output_dir, "downloaded_content.html")
#
#        # Determine content type
#        if url.endswith(('.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp')):
#            # Save binary image content
#            with open(filename, "wb") as file:
#                file.write(driver.find_element_by_tag_name("body").screenshot_as_png)
#        else:
#            # Save page source for non-image URLs
#            with open(filename, "w", encoding="utf-8") as file:
#                file.write(driver.page_source)
#
#        print(f"Downloaded: {filename}")
#        return 0
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#        return 1
#    finally:
#        driver.quit()
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    sys.exit


#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#
#def download_image(image_url, output_dir):
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL or content-disposition header
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#def download_with_selenium(url, output_dir):
#    # Tor proxy setup
#    proxy = "socks5://127.0.0.1:9050"  # Default Tor proxy
#    options = Options()
#    options.add_argument(f"--proxy-server={proxy}")
#    options.add_argument("--headless")  # Run in headless mode for no GUI
#
#    # Initialize the Firefox WebDriver
#    driver = webdriver.Firefox(options=options)
#    try:
#        # Access the URL
#        driver.get(url)
#
#        # Find all image elements
#        images = driver.find_elements_by_tag_name("img")
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Download each image
#        for img in images:
#            image_url = img.get_attribute("src")
#            if image_url:
#                download_image(image_url, output_dir)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    download_with_selenium(url, output_dir)


#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#from bs4 import BeautifulSoup
#
#def download_image(image_url, output_dir):
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#def scrape_with_selenium_and_bs4(url, output_dir):
#    proxy = "socks5://127.0.0.1:9050"  # Tor proxy
#    options = Options()
#    options.add_argument(f"--proxy-server={proxy}")
#    options.add_argument("--headless")
#
#    driver = webdriver.Firefox(options=options)
#    try:
#        driver.get(url)
#
#        # Use Beautiful Soup to parse the page source
#        soup = BeautifulSoup(driver.page_source, "html.parser")
#        images = soup.find_all("img")
#
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Download each image
#        for img in images:
#            image_url = img.get("src")
#            if image_url:
#                download_image(image_url, output_dir)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: hybrid_selenium_bs4.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_bs4(url, output_dir)

#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#from bs4 import BeautifulSoup
#from urllib.parse import urljoin
#from concurrent.futures import ThreadPoolExecutor
#
#def download_image(image_url, output_dir):
#    """
#    Download an image from a given URL to the specified output directory.
#    """
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#def scrape_with_selenium_and_bs4(url, output_dir, proxy=None):
#    """
#    Use Selenium and BeautifulSoup to scrape images from a webpage and save them.
#    """
#    options = Options()
#    if proxy:
#        options.add_argument(f"--proxy-server={proxy}")
#    options.add_argument("--headless")
#
#    # Configure the Firefox WebDriver
#    driver = webdriver.Firefox(options=options)
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#
#        # Use BeautifulSoup to parse the page source
#        soup = BeautifulSoup(driver.page_source, "html.parser")
#        images = soup.find_all("img")
#
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        image_urls = []
#        for img in images:
#            src = img.get("src")
#            if src:
#                # Ensure the image URL is absolute
#                image_url = urljoin(url, src)
#                image_urls.append(image_url)
#
#        if not image_urls:
#            print(f"No valid image URLs found on the page: {url}")
#            return
#
#        # Download images concurrently
#        with ThreadPoolExecutor() as executor:
#            executor.map(lambda img_url: download_image(img_url, output_dir), image_urls)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: hybrid_selenium_bs4.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    # Use Tor proxy for anonymity if desired
#    tor_proxy = "socks5://127.0.0.1:9050"  # Adjust or remove if not using Tor
#    scrape_with_selenium_and_bs4(url, output_dir, proxy=tor_proxy)


#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#from bs4 import BeautifulSoup
#from urllib.parse import urljoin
#import base64
#from concurrent.futures import ThreadPoolExecutor
#
#def save_base64_image(base64_string, output_dir, filename):
#    """
#    Save a base64-encoded image to a file.
#    """
#    try:
#        header, data = base64_string.split(',')
#        file_extension = header.split('/')[1].split(';')[0]
#        filepath = os.path.join(output_dir, f"{filename}.{file_extension}")
#
#        with open(filepath, "wb") as file:
#            file.write(base64.b64decode(data))
#
#        print(f"Downloaded base64 image: {filepath}")
#    except Exception as e:
#        print(f"Error saving base64 image: {e}")
#
#def download_image(image_url, output_dir):
#    """
#    Download an image from a given URL to the specified output directory.
#    """
#    try:
#        if image_url.startswith("data:image/"):
#            # Handle base64-encoded images
#            filename = "base64_image"
#            save_base64_image(image_url, output_dir, filename)
#        else:
#            # Handle regular image URLs
#            response = requests.get(image_url, stream=True)
#            response.raise_for_status()
#
#            filename = os.path.basename(image_url.split("?")[0])
#            filepath = os.path.join(output_dir, filename)
#
#            with open(filepath, "wb") as file:
#                for chunk in response.iter_content(chunk_size=8192):
#                    file.write(chunk)
#
#            print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#def scrape_with_selenium_and_bs4(url, output_dir, proxy=None):
#    """
#    Use Selenium and BeautifulSoup to scrape images from a webpage and save them.
#    """
#    options = Options()
#    if proxy:
#        options.add_argument(f"--proxy-server={proxy}")
#    options.add_argument("--headless")
#
#    driver = webdriver.Firefox(options=options)
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#
#        # Use BeautifulSoup to parse the page source
#        soup = BeautifulSoup(driver.page_source, "html.parser")
#        images = soup.find_all("img")
#
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        image_urls = []
#        for img in images:
#            src = img.get("src")
#            if src:
#                # Ensure the image URL is absolute
#                image_url = urljoin(url, src) if not src.startswith("data:image/") else src
#                image_urls.append(image_url)
#
#        if not image_urls:
#            print(f"No valid image URLs found on the page: {url}")
#            return
#
#        # Download images concurrently
#        with ThreadPoolExecutor() as executor:
#            executor.map(lambda img_url: download_image(img_url, output_dir), image_urls)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    # Use Tor proxy for anonymity if desired
#    tor_proxy = "socks5://127.0.0.1:9050"  # Adjust or remove if not using Tor
#    scrape_with_selenium_and_bs4(url, output_dir, proxy=tor_proxy)


#import sys
#import os
#import base64
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#from bs4 import BeautifulSoup
#
#def save_base64_image(data_url, output_dir):
#    try:
#        # Split the base64 string from its header
#        header, base64_data = data_url.split(',', 1)
#        mime_type = header.split(';')[0].split(':')[1]
#        extension = mime_type.split('/')[1] if '/' in mime_type else 'png'
#
#        # Decode and save the image
#        filename = f"base64_image.{extension}"
#        filepath = os.path.join(output_dir, filename)
#        with open(filepath, "wb") as file:
#            file.write(base64.b64decode(base64_data))
#
#        print(f"Downloaded base64 image: {filepath}")
#    except Exception as e:
#        print(f"Error saving base64 image: {e}")
#
#def download_image(image_url, output_dir):
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#def scrape_with_selenium_and_bs4(url, output_dir):
#    options = Options()
#    options.add_argument("--headless")
#
#    driver = webdriver.Firefox(options=options)
#    try:
#        driver.get(url)
#
#        # Use Beautiful Soup to parse the page source
#        soup = BeautifulSoup(driver.page_source, "html.parser")
#        images = soup.find_all("img")
#
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Download each image
#        for img in images:
#            image_url = img.get("src")
#            if image_url:
#                if image_url.startswith("data:image"):
#                    save_base64_image(image_url, output_dir)
#                else:
#                    download_image(image_url, output_dir)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_bs4(url, output_dir)


#import os
#import requests
#import sys
#
#def download_image_direct(image_url, output_dir):
#    headers = {
#        "User-Agent": (
#            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
#            "(KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
#        )
#    }
#
#    try:
#        # Request the image URL
#        response = requests.get(image_url, headers=headers, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except requests.exceptions.RequestException as e:
#        print(f"Error downloading image {image_url}: {e}")
#    except Exception as e:
#        print(f"Unexpected error: {e}")
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <image_url> <output_dir>")
#        sys.exit(1)
#
#    image_url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    # Download the image
#    download_image_direct(image_url, output_dir)


#this worked with tor alone -----------------
#import os
#import requests
#import sys
#
#def download_image_direct_with_tor(image_url, output_dir):
#    # Set up Tor SOCKS5 proxy
#    proxies = {
#        "http": "socks5h://127.0.0.1:9050",
#        "https": "socks5h://127.0.0.1:9050",
#    }
#
#    headers = {
#        "User-Agent": (
#            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
#            "(KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
#        )
#    }
#
#    try:
#        # Request the image URL via Tor proxy
#        response = requests.get(image_url, headers=headers, proxies=proxies, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except requests.exceptions.RequestException as e:
#        print(f"Error downloading image {image_url}: {e}")
#    except Exception as e:
#        print(f"Unexpected error: {e}")
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <image_url> <output_dir>")
#        sys.exit(1)
#
#    image_url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    # Download the image via Tor
#    download_image_direct_with_tor(image_url, output_dir)


#import os
#import sys
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#import requests
#
#
#def download_image(image_url, output_dir):
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    # Set up Firefox options
#    options = Options()
#    options.headless = True  # Use headless mode (optional)
#
#    # Set up Tor proxy
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"
#    proxy.socks_version = 5
#    proxy.no_proxy = ""  # Don't bypass proxy for any URL
#
#    capabilities = webdriver.DesiredCapabilities.FIREFOX
#    proxy.add_to_capabilities(capabilities)
#
#    # Set up the WebDriver
#    service = Service(executable_path="/path/to/geckodriver")  # Update the path to geckodriver
#    driver = webdriver.Firefox(options=options, desired_capabilities=capabilities, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#
#        # Extract image URLs
#        images = driver.find_elements_by_tag_name("img")
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Download each image
#        for img in images:
#            image_url = img.get_attribute("src")
#            if image_url:
#                download_image(image_url, output_dir)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium_tor.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)

#Works for direct picture not explicit or reddit -----------------------------------
#import os
#import sys
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from urllib.parse import urljoin
#
#
#def download_image_direct(image_url, output_dir):
#    """
#    Downloads an image directly from the URL using Tor.
#    """
#    proxies = {
#        "http": "socks5h://127.0.0.1:9050",
#        "https": "socks5h://127.0.0.1:9050",
#    }
#
#    headers = {
#        "User-Agent": (
#            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
#            "(KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
#        )
#    }
#
#    try:
#        response = requests.get(image_url, headers=headers, proxies=proxies, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through Tor proxy.
#    """
#    # Configure Firefox options for headless mode and Tor proxy
#    options = Options()
#    options.headless = True
#
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"
#    proxy.socks_version = 5
#    options.proxy = proxy
#
#    # Set up WebDriver
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#
#        # Locate all <img> tags on the webpage
#        images = driver.find_elements_by_tag_name("img")
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Collect and download image URLs
#        for img in images:
#            image_url = img.get_attribute("src")
#            if image_url and (image_url.startswith("http") or image_url.startswith("https")):
#                image_url = urljoin(url, image_url)
#                download_image_direct(image_url, output_dir)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    # If URL points directly to an image, download it directly
#    if url.lower().endswith((".jpg", ".jpeg", ".png", ".gif", ".bmp", ".webp")):
#        print(f"Direct image URL detected: {url}")
#        download_image_direct(url, output_dir)
#    else:
#        # Otherwise, use Selenium for webpage scraping
#        scrape_with_selenium_and_tor(url, output_dir)


#works with pornpics ----------------------------
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.firefox.service import Service
#from bs4 import BeautifulSoup
#import time
#
#def download_image(image_url, output_dir):
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    options = Options()
#    options.headless = True  # Run in headless mode (no GUI)
#
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#
#        # Handle age verification pop-up
#        try:
#            time.sleep(5)  # Wait for the pop-up to appear
#            age_button = driver.find_element(By.XPATH, "//button[contains(text(), '18')]")
#            age_button.click()
#            print("Clicked on the age verification button.")
#        except Exception as e:
#            print("Age verification pop-up not found or already dismissed.")
#
#        # Parse the page source with BeautifulSoup
#        soup = BeautifulSoup(driver.page_source, "html.parser")
#        images = soup.find_all("img")
#
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Download images
#        for img in images:
#            image_url = img.get("src")
#            if image_url:
#                download_image(image_url, output_dir)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    import sys
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)


#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from bs4 import BeautifulSoup
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads an image from a given URL to the specified output directory.
#    """
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def dismiss_age_verification(driver):
#    """
#    Attempts to dismiss the age verification pop-up if present.
#    """
#    try:
#        # Look for a button or link containing age verification text
#        agree_button = driver.find_element("xpath", "//button[contains(text(), 'Agree') or contains(text(), 'Yes') or contains(text(), '18')]")
#        agree_button.click()
#        print("Age verification pop-up dismissed.")
#    except Exception as e:
#        print("Age verification pop-up not found or already dismissed:", str(e))
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    # Configure Firefox options
#    options = Options()
#    options.headless = True  # Run in headless mode (no GUI)
#
#    # Set up Tor proxy
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"  # Tor SOCKS5 proxy
#    proxy.socks_version = 5
#    proxy.no_proxy = ""  # Do not bypass the proxy for any URL
#
#    # Add proxy to Firefox options
#    options.proxy = proxy
#
#    # Set up WebDriver with the specified `geckodriver` path
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#
#        # Attempt to dismiss the age verification pop-up
#        dismiss_age_verification(driver)
#
#        # Parse the page source with BeautifulSoup
#        soup = BeautifulSoup(driver.page_source, "html.parser")
#        images = soup.find_all("img")
#
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Filter and download images
#        for img in images:
#            image_url = img.get("src")
#            if image_url:
#                if image_url.startswith("http") or image_url.startswith("https"):
#                    download_image(image_url, output_dir)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)


#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.webdriver.common.by import By
#from selenium.webdriver.support.ui import WebDriverWait
#from selenium.webdriver.support import expected_conditions as EC
#from selenium.common.exceptions import TimeoutException, NoSuchElementException
#from bs4 import BeautifulSoup
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads an image from a given URL to the specified output directory.
#    """
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def dismiss_pop_up(driver):
#    """
#    Tries multiple strategies to dismiss a pop-up.
#    """
#    try:
#        print("Attempting to dismiss pop-up...")
#        
#        # Strategy 1: JavaScript to hide pop-ups
#        driver.execute_script("""
#            const popups = document.querySelectorAll('div, iframe, modal');
#            popups.forEach(popup => popup.style.display = 'none');
#        """)
#        print("Pop-up dismissed using JavaScript.")
#        return True
#
#    except Exception as e:
#        print(f"Error during JavaScript dismissal: {e}")
#
#    try:
#        # Strategy 2: Detect and click close buttons
#        wait = WebDriverWait(driver, 10)
#        close_button = wait.until(
#            EC.element_to_be_clickable((By.XPATH, "//button[contains(text(), 'Agree') or contains(text(), 'Close') or contains(text(), 'I am 18')]"))
#        )
#        close_button.click()
#        print("Pop-up dismissed by clicking button.")
#        return True
#
#    except TimeoutException:
#        print("No pop-up detected or pop-up already dismissed.")
#        return False
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    # Configure Firefox options
#    options = Options()
#    options.headless = True  # Run in headless mode (no GUI)
#
#    # Set up Tor proxy
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"  # Tor SOCKS5 proxy
#    proxy.socks_version = 5
#    proxy.no_proxy = ""  # Do not bypass the proxy for any URL
#
#    # Add proxy to Firefox options
#    options.proxy = proxy
#
#    # Set up WebDriver with the specified `geckodriver` path
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#
#        # Attempt to dismiss any pop-ups
#        dismissed = dismiss_pop_up(driver)
#        if dismissed:
#            print("Pop-up was dismissed successfully.")
#
#        # Parse the page source with BeautifulSoup
#        soup = BeautifulSoup(driver.page_source, "html.parser")
#        images = soup.find_all("img")
#
#        if not images:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Filter and download images
#        for img in images:
#            image_url = img.get("src")
#            if image_url:
#                if image_url.startswith("http") or image_url.startswith("https"):
#                    download_image(image_url, output_dir)
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)

#works with pornpics and without logos --------------------------------------
#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.webdriver.support.ui import WebDriverWait
#from selenium.webdriver.support import expected_conditions as EC
#from urllib.parse import urlparse
#import time
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads an image from a given URL to the specified output directory.
#    """
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(urlparse(image_url).path)
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def handle_pop_up(driver):
#    """
#    Tries multiple strategies to dismiss a pop-up.
#    """
#    try:
#        print("Attempting to dismiss pop-up...")
#        
#        # Strategy 1: JavaScript to hide pop-ups
#        driver.execute_script("""
#            const popups = document.querySelectorAll('div, iframe, modal');
#            popups.forEach(popup => popup.style.display = 'none');
#        """)
#        print("Pop-up dismissed using JavaScript.")
#        return True
#
#    except Exception as e:
#        print(f"Error during JavaScript dismissal: {e}")
#
#    try:
#        # Strategy 2: Detect and click close buttons
#        wait = WebDriverWait(driver, 10)
#        close_button = wait.until(
#            EC.element_to_be_clickable((By.XPATH, "//button[contains(text(), 'Agree') or contains(text(), 'Close') or contains(text(), 'I am 18')]"))
#        )
#        close_button.click()
#        print("Pop-up dismissed by clicking button.")
#        return True
#
#    except TimeoutException:
#        print("No pop-up detected or pop-up already dismissed.")
#        return F
#
#
#def is_valid_image(driver, img_element):
#    """
#    Validates an image element based on its natural size.
#    """
#    try:
#        width = driver.execute_script("return arguments[0].naturalWidth;", img_element)
#        height = driver.execute_script("return arguments[0].naturalHeight;", img_element)
#        return width > 200 and height > 200  # Consider images larger than 200x200 pixels
#    except Exception as e:
#        print(f"Error checking image dimensions: {e}")
#        return False
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    # Configure Firefox options
#    options = Options()
#    options.headless = True  # Run in headless mode (no GUI)
#
#    # Set up Tor proxy
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"  # Tor SOCKS5 proxy
#    proxy.socks_version = 5
#
#    # Add proxy to Firefox options
#    options.proxy = proxy
#
#    # Set up WebDriver with the specified `geckodriver` path
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#        time.sleep(3)  # Wait for dynamic content to load
#
#        # Handle potential pop-ups
#        pop_up_handled = handle_pop_up(driver)
#        if not pop_up_handled:
#            print("No pop-up was found to dismiss.")
#
#        # Find all image elements
#        img_elements = driver.find_elements(By.TAG_NAME, "img")
#
#        if not img_elements:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Validate and download images
#        for img in img_elements:
#            try:
#                src = img.get_attribute("src")
#                if src and is_valid_image(driver, img):
#                    if not src.startswith("http"):
#                        src = f"https:{src}"  # Handle relative URLs
#                    download_image(src, output_dir)
#            except Exception as e:
#                print(f"Error processing image element: {e}")
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)

#works great with everyhting but still doesnt catch reddit logo and log in -----------------------
#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.webdriver.support.ui import WebDriverWait
#from selenium.webdriver.support import expected_conditions as EC
#from selenium.common.exceptions import TimeoutException
#from urllib.parse import urlparse
#import time
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads an image from a given URL to the specified output directory.
#    """
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(urlparse(image_url).path)
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def handle_pop_up(driver):
#    """
#    Tries multiple strategies to dismiss a pop-up.
#    """
#    try:
#        print("Attempting to dismiss pop-up...")
#        
#        # Strategy 1: JavaScript to hide pop-ups
#        driver.execute_script("""
#            document.querySelectorAll('div, iframe, modal, [role="dialog"]').forEach(
#                popup => popup.style.display = 'none'
#            );
#        """)
#        print("Pop-up dismissed using JavaScript.")
#        return True
#
#    except Exception as e:
#        print(f"Error during JavaScript dismissal: {e}")
#
#    try:
#        # Strategy 2: Detect and click close buttons
#        wait = WebDriverWait(driver, 10)
#        close_button = wait.until(
#            EC.element_to_be_clickable((By.XPATH, "//button[contains(text(), 'Agree') or contains(text(), 'Close') or contains(text(), 'I am 18')]"))
#        )
#        close_button.click()
#        print("Pop-up dismissed by clicking button.")
#        return True
#
#    except TimeoutException:
#        print("No pop-up detected or pop-up already dismissed.")
#        return False
#
#
#def is_valid_image(driver, img_element):
#    """
#    Validates an image element based on its natural size.
#    """
#    try:
#        width = driver.execute_script("return arguments[0].naturalWidth;", img_element)
#        height = driver.execute_script("return arguments[0].naturalHeight;", img_element)
#        return width > 200 and height > 200  # Consider images larger than 200x200 pixels
#    except Exception as e:
#        print(f"Error checking image dimensions: {e}")
#        return False
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    # Configure Firefox options
#    options = Options()
#    options.headless = True  # Run in headless mode (no GUI)
#
#    # Set up Tor proxy
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"  # Tor SOCKS5 proxy
#    proxy.socks_version = 5
#
#    # Add proxy to Firefox options
#    options.proxy = proxy
#
#    # Set up WebDriver with the specified `geckodriver` path
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#        time.sleep(3)  # Wait for dynamic content to load
#
#        # Handle potential pop-ups
#        pop_up_handled = handle_pop_up(driver)
#        if not pop_up_handled:
#            print("No pop-up was found to dismiss.")
#
#        # Find all image elements
#        img_elements = driver.find_elements(By.TAG_NAME, "img")
#
#        if not img_elements:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Validate and download images
#        for img in img_elements:
#            try:
#                src = img.get_attribute("src")
#                if src and is_valid_image(driver, img):
#                    if not src.startswith("http"):
#                        src = f"https:{src}"  # Handle relative URLs
#                    download_image(src, output_dir)
#            except Exception as e:
#                print(f"Error processing image element: {e}")
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)


#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.webdriver.support.ui import WebDriverWait
#from selenium.webdriver.support import expected_conditions as EC
#from selenium.common.exceptions import TimeoutException
#from urllib.parse import urlparse
#import time
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads an image from a given URL to the specified output directory.
#    """
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(urlparse(image_url).path)
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def handle_pop_up(driver):
#    """
#    Tries multiple strategies to dismiss a pop-up.
#    """
#    try:
#        print("Attempting to dismiss pop-up...")
#        
#        # Strategy 1: JavaScript to hide pop-ups
#        driver.execute_script("""
#            document.querySelectorAll('div, iframe, modal, [role="dialog"]').forEach(
#                popup => popup.style.display = 'none'
#            );
#        """)
#        print("Pop-up dismissed using JavaScript.")
#        return True
#
#    except Exception as e:
#        print(f"Error during JavaScript dismissal: {e}")
#
#    try:
#        # Strategy 2: Detect and click close buttons
#        wait = WebDriverWait(driver, 10)
#        close_button = wait.until(
#            EC.element_to_be_clickable((By.XPATH, "//button[contains(text(), 'Agree') or contains(text(), 'Close') or contains(text(), 'I am 18')]"))
#        )
#        close_button.click()
#        print("Pop-up dismissed by clicking button.")
#        return True
#
#    except TimeoutException:
#        print("No pop-up detected or pop-up already dismissed.")
#        return False
#
#
#def is_valid_image(driver, img_element):
#    """
#    Validates an image element based on its natural size and excludes unwanted sources.
#    """
#    try:
#        src = img_element.get_attribute("src")
#        if not src or any(kw in src.lower() for kw in ["logo", "avatar", "icon"]):
#            return False  # Exclude images with unwanted keywords in the source URL
#
#        width = driver.execute_script("return arguments[0].naturalWidth;", img_element)
#        height = driver.execute_script("return arguments[0].naturalHeight;", img_element)
#
#        # Exclude images with small dimensions or unusual aspect ratios
#        aspect_ratio = width / height if height > 0 else 0
#        if width < 200 or height < 200 or aspect_ratio < 0.5 or aspect_ratio > 2:
#            return False
#
#        return True  # Valid image
#    except Exception as e:
#        print(f"Error checking image dimensions: {e}")
#        return False
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    # Configure Firefox options
#    options = Options()
#    options.headless = True  # Run in headless mode (no GUI)
#
#    # Set up Tor proxy
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"  # Tor SOCKS5 proxy
#    proxy.socks_version = 5
#
#    # Add proxy to Firefox options
#    options.proxy = proxy
#
#    # Set up WebDriver with the specified `geckodriver` path
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#        time.sleep(3)  # Wait for dynamic content to load
#
#        # Handle potential pop-ups
#        pop_up_handled = handle_pop_up(driver)
#        if not pop_up_handled:
#            print("No pop-up was found to dismiss.")
#
#        # Find all image elements
#        img_elements = driver.find_elements(By.TAG_NAME, "img")
#
#        if not img_elements:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Validate and download images
#        for img in img_elements:
#            try:
#                if is_valid_image(driver, img_element=img):
#                    src = img.get_attribute("src")
#                    if not src.startswith("http"):
#                        src = f"https:{src}"  # Handle relative URLs
#                    download_image(src, output_dir)
#            except Exception as e:
#                print(f"Error processing image element: {e}")
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)




#works very nicely to handle 400's and grab all galleries ----------------------------------------
#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.webdriver.support.ui import WebDriverWait
#from selenium.webdriver.support import expected_conditions as EC
#from selenium.common.exceptions import TimeoutException
#from urllib.parse import urlparse
#import time
#
#
#def is_url_valid(image_url):
#    """
#    Validates a URL by sending a HEAD request and verifying the status code.
#    """
#    try:
#        response = requests.head(image_url, timeout=5, allow_redirects=True)
#        if 200 <= response.status_code < 400:
#            return True
#        print(f"Skipping invalid URL (HTTP {response.status_code}): {image_url}")
#        return False
#    except requests.RequestException as e:
#        print(f"Error validating URL {image_url}: {e}")
#        return False
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads a valid image from the specified URL to the output directory.
#    """
#    if not is_url_valid(image_url):
#        return  # Skip invalid URLs
#
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(urlparse(image_url).path)
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def handle_pop_up(driver):
#    """
#    Attempts to dismiss any pop-ups on the page.
#    """
#    try:
#        print("Attempting to dismiss pop-up...")
#        driver.execute_script("""
#            document.querySelectorAll('div, iframe, modal, [role="dialog"]').forEach(
#                popup => popup.style.display = 'none'
#            );
#        """)
#        print("Pop-up dismissed using JavaScript.")
#        return True
#    except Exception as e:
#        print(f"Error during JavaScript dismissal: {e}")
#    return False
#
#
#def is_valid_image(driver, img_element):
#    """
#    Validates an image element based on dimensions and content.
#    """
#    try:
#        src = img_element.get_attribute("src")
#        if not src:
#            return False  # Skip if no source
#
#        # Skip common placeholder or ad images
#        if any(kw in src.lower() for kw in ["logo", "placeholder", "icon", "ad", "avatar"]):
#            print(f"Skipping unwanted image: {src}")
#            return False
#
#        # Check image dimensions
#        width = driver.execute_script("return arguments[0].naturalWidth;", img_element)
#        height = driver.execute_script("return arguments[0].naturalHeight;", img_element)
#
#        # Validate dimensions
#        if width < 200 or height < 200:
#            print(f"Skipping small image: {src} (Dimensions: {width}x{height})")
#            return False
#
#        return True
#    except Exception as e:
#        print(f"Error checking image dimensions: {e}")
#        return False
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    # Validate the page URL first
#    if not is_url_valid(url):
#        print(f"Skipping entire page due to invalid URL: {url}")
#        return
#
#    # Configure Firefox options
#    options = Options()
#    options.headless = True  # Run in headless mode
#
#    # Set up Tor proxy
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"  # Tor SOCKS5 proxy
#    proxy.socks_version = 5
#    options.proxy = proxy
#
#    # Set up WebDriver
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#        time.sleep(3)  # Wait for dynamic content to load
#
#        # Handle potential pop-ups
#        handle_pop_up(driver)
#
#        # Find all image elements
#        img_elements = driver.find_elements(By.TAG_NAME, "img")
#        if not img_elements:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Validate and download images
#        for img in img_elements:
#            try:
#                src = img.get_attribute("src")
#                if src and is_valid_image(driver, img):
#                    if not src.startswith("http"):
#                        src = f"https:{src}"  # Handle relative URLs
#                    download_image(src, output_dir)
#            except Exception as e:
#                print(f"Error processing image element: {e}")
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)


#works great for both galleries and solo pics and headless -----------------------------------
#import sys
#import os
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.webdriver.support.ui import WebDriverWait
#from selenium.webdriver.support import expected_conditions as EC
#from selenium.common.exceptions import TimeoutException
#from urllib.parse import urlparse
#import time
#
#
#def is_url_valid(image_url):
#    """
#    Validates a URL by sending a HEAD request and verifying the status code.
#    """
#    try:
#        response = requests.head(image_url, timeout=5, allow_redirects=True)
#        if 200 <= response.status_code < 400:
#            return True
#        print(f"Skipping invalid URL (HTTP {response.status_code}): {image_url}")
#        return False
#    except requests.RequestException as e:
#        print(f"Error validating URL {image_url}: {e}")
#        return False
#
#
#def is_image_url(url):
#    """
#    Checks if a URL points directly to an image based on its file extension.
#    """
#    valid_extensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp', '.tiff']
#    return any(url.lower().endswith(ext) for ext in valid_extensions)
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads a valid image from the specified URL to the output directory.
#    """
#    if not is_url_valid(image_url):
#        return  # Skip invalid URLs
#
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#
#        # Infer filename from URL
#        filename = os.path.basename(urlparse(image_url).path)
#        filepath = os.path.join(output_dir, filename)
#
#        # Save the image
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def handle_pop_up(driver):
#    """
#    Attempts to dismiss any pop-ups on the page.
#    """
#    try:
#        print("Attempting to dismiss pop-up...")
#        driver.execute_script("""
#            document.querySelectorAll('div, iframe, modal, [role="dialog"]').forEach(
#                popup => popup.style.display = 'none'
#            );
#        """)
#        print("Pop-up dismissed using JavaScript.")
#        return True
#    except Exception as e:
#        print(f"Error during JavaScript dismissal: {e}")
#    return False
#
#
#def is_valid_image(driver, img_element):
#    """
#    Validates an image element based on dimensions and content.
#    """
#    try:
#        src = img_element.get_attribute("src")
#        if not src:
#            return False  # Skip if no source
#
#        # Skip common placeholder or ad images
#        if any(kw in src.lower() for kw in ["logo", "placeholder", "icon", "ad", "avatar"]):
#            print(f"Skipping unwanted image: {src}")
#            return False
#
#        # Check image dimensions
#        width = driver.execute_script("return arguments[0].naturalWidth;", img_element)
#        height = driver.execute_script("return arguments[0].naturalHeight;", img_element)
#
#        # Validate dimensions
#        if width < 200 or height < 200:
#            print(f"Skipping small image: {src} (Dimensions: {width}x{height})")
#            return False
#
#        return True
#    except Exception as e:
#        print(f"Error checking image dimensions: {e}")
#        return False
#
#
#def scrape_with_selenium_and_tor(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    If the URL itself is a direct link to an image, downloads it directly.
#    """
#    # Check if the URL is a direct image link
#    if is_image_url(url):
#        print(f"Direct image URL detected: {url}")
#        download_image(url, output_dir)
#        return
#
#    # Validate the page URL first
#    if not is_url_valid(url):
#        print(f"Skipping entire page due to invalid URL: {url}")
#        return
#
#    # Configure Firefox options
#    options = Options()
#    options.headless = True  # Run in headless mode
#
#    # Set up Tor proxy
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"  # Tor SOCKS5 proxy
#    proxy.socks_version = 5
#    options.proxy = proxy
#    options.add_argument("--headless")
#    options.add_argument("--disable-gpu")
#    options.add_argument("--no-sandbox")
#    options.add_argument("--disable-dev-shm-usage")
#
#
#    # Set up WebDriver
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#        time.sleep(3)  # Wait for dynamic content to load
#
#        # Handle potential pop-ups
#        handle_pop_up(driver)
#
#        # Find all image elements
#        img_elements = driver.find_elements(By.TAG_NAME, "img")
#        if not img_elements:
#            print(f"No images found on the page: {url}")
#            return
#
#        # Validate and download images
#        for img in img_elements:
#            try:
#                src = img.get_attribute("src")
#                if src and is_valid_image(driver, img):
#                    if not src.startswith("http"):
#                        src = f"https:{src}"  # Handle relative URLs
#                    download_image(src, output_dir)
#            except Exception as e:
#                print(f"Error processing image element: {e}")
#
#    except Exception as e:
#        print(f"Error processing URL {url}: {e}")
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#    os.makedirs(output_dir, exist_ok=True)
#
#    scrape_with_selenium_and_tor(url, output_dir)


#import sys
#import os
#import subprocess
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.webdriver.support.ui import WebDriverWait
#from selenium.webdriver.support import expected_conditions as EC
#from selenium.common.exceptions import TimeoutException
#import time
#import random
#
## Hardcoded path to gallery-dl config file
#BASE_DIR = os.path.dirname(os.path.abspath(__file__))
#GALLERY_DL_CONFIG = os.path.join(BASE_DIR, ".config/gallery-dl/config.json")
#
#def run_gallery_dl(url, output_dir):
#    """
#    Runs gallery-dl with the given URL and output directory, using a SOCKS proxy and additional options.
#    """
#    user_agents = [
#        "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
#        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
#        "Mozilla/5.0 (X11; Linux x86_64)",
#        "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)",
#        "Mozilla/5.0 (Android 11; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0"
#    ]
#    
#    # Randomly select a user agent
#    user_agent = random.choice(user_agents)
#    
#    gallery_dl_command = [
#        "gallery-dl",
#        "--proxy", "socks5://127.0.0.1:9050",  # Use Tor proxy
#        "--verbose",                            # Detailed output for debugging
#        "--no-mtime",                           # Avoid modifying file timestamps
#        "--dest", output_dir,                   # Specify output directory
#        "--filename", "{category}_{id}_{num}.{extension}",  # Custom file naming
#        "--user-agent", user_agent,             # Set the user agent
#        url
#    ]
#    
#    try:
#        print("Running Gallery-dl with command:", " ".join(gallery_dl_command))
#        result = subprocess.run(gallery_dl_command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
#        print(result.stdout.decode("utf-8"))
#        return True
#    except subprocess.CalledProcessError as e:
#        print(f"Gallery-dl failed: {e.stderr.decode('utf-8')}")
#        return False
#
#
#
#def is_url_valid(image_url):
#    """
#    Validates a URL by sending a HEAD request and verifying the status code.
#    """
#    try:
#        response = requests.head(image_url, timeout=5, allow_redirects=True)
#        if 200 <= response.status_code < 400:
#            return True
#        print(f"Skipping invalid URL (HTTP {response.status_code}): {image_url}")
#        return False
#    except requests.RequestException as e:
#        print(f"Error validating URL {image_url}: {e}")
#        return False
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads a valid image from the specified URL to the output directory.
#    """
#    if not is_url_valid(image_url):
#        return
#
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#        filename = os.path.basename(image_url.split("?")[0])  # Handle URLs with query params
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def handle_pop_up(driver):
#    """
#    Attempts to dismiss any pop-ups on the page.
#    """
#    try:
#        driver.execute_script("""
#            document.querySelectorAll('div, iframe, modal, [role="dialog"]').forEach(
#                popup => popup.style.display = 'none'
#            );
#        """)
#        print("Pop-up dismissed using JavaScript.")
#    except Exception as e:
#        print(f"Error during pop-up dismissal: {e}")
#
#
#def scrape_with_selenium(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    # Configure Firefox options
#    options = Options()
#    options.headless = True
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"
#    proxy.socks_version = 5
#    options.proxy = proxy
#
#    # Set up WebDriver
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#        time.sleep(3)
#
#        handle_pop_up(driver)
#
#        img_elements = driver.find_elements(By.TAG_NAME, "img")
#        if not img_elements:
#            print(f"No images found on the page: {url}")
#            return
#
#        for img in img_elements:
#            try:
#                src = img.get_attribute("src")
#                if src and is_url_valid(src):
#                    download_image(src, output_dir)
#            except Exception as e:
#                print(f"Error processing image: {e}")
#
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#
#    os.makedirs(output_dir, exist_ok=True)
#
#    # Set GALLERY_DL_CONFIG environment variable
#    os.environ["GALLERY_DL_CONFIG"] = GALLERY_DL_CONFIG
#
#    # First, try running gallery-dl
#    success = run_gallery_dl(url, output_dir)
#
#    # If gallery-dl fails, fall back to Selenium
#    if not success:
#        print("Falling back to Selenium...")
#        scrape_with_selenium(url, output_dir)


#import sys
#import os
#import subprocess
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.common.exceptions import TimeoutException
#import time
#import random
#
## Hardcoded path to gallery-dl config file
#BASE_DIR = os.path.dirname(os.path.abspath(__file__))
#GALLERY_DL_CONFIG = os.path.join(BASE_DIR, ".config/gallery-dl/config.json")
#
#def run_gallery_dl(url, output_dir):
#    """
#    Runs gallery-dl with the given URL and output directory, using a SOCKS proxy and additional options.
#    """
#    user_agents = [
#        "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
#        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
#        "Mozilla/5.0 (X11; Linux x86_64)",
#        "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)",
#        "Mozilla/5.0 (Android 11; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0",
#    ]
#    user_agent = random.choice(user_agents)
#
#    gallery_dl_command = [
#        "gallery-dl",
#        "--proxy", "socks5://127.0.0.1:9050",
#        "--verbose",
#        "--no-mtime",
#        "--dest", output_dir,
#        "--filename", "{category}_{id}_{num}.{extension}",
#        "--user-agent", user_agent,
#        url,
#    ]
#
#    try:
#        print("Running Gallery-dl with command:", " ".join(gallery_dl_command))
#        result = subprocess.run(
#            gallery_dl_command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
#        )
#        print(result.stdout.decode("utf-8"))
#        return True
#    except subprocess.CalledProcessError as e:
#        print(f"Gallery-dl failed: {e.stderr.decode('utf-8')}")
#        return False
#
#
#def is_url_valid(image_url):
#    """
#    Validates a URL by sending a HEAD request and verifying the status code.
#    """
#    try:
#        response = requests.head(image_url, timeout=5, allow_redirects=True)
#        if 200 <= response.status_code < 400:
#            return True
#        print(f"Skipping invalid URL (HTTP {response.status_code}): {image_url}")
#        return False
#    except requests.RequestException as e:
#        print(f"Error validating URL {image_url}: {e}")
#        return False
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads a valid image from the specified URL to the output directory.
#    """
#    if not is_url_valid(image_url):
#        return
#
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def is_valid_image(driver, img_element):
#    """
#    Validates an image element based on dimensions and content.
#    """
#    try:
#        src = img_element.get_attribute("src")
#        if not src:
#            return False
#
#        if any(keyword in src.lower() for keyword in ["logo", "placeholder", "icon", "ad", "avatar"]):
#            print(f"Skipping unwanted image: {src}")
#            return False
#
#        width = driver.execute_script("return arguments[0].naturalWidth;", img_element)
#        height = driver.execute_script("return arguments[0].naturalHeight;", img_element)
#        if width < 200 or height < 200:
#            print(f"Skipping small image: {src} (Dimensions: {width}x{height})")
#            return False
#
#        return True
#    except Exception as e:
#        print(f"Error validating image: {e}")
#        return False
#
#
#def handle_pop_up(driver):
#    """
#    Attempts to dismiss any pop-ups on the page.
#    """
#    try:
#        driver.execute_script("""
#            document.querySelectorAll('div, iframe, modal, [role="dialog"]').forEach(
#                popup => popup.style.display = 'none'
#            );
#        """)
#        print("Pop-up dismissed using JavaScript.")
#    except Exception as e:
#        print(f"Error during pop-up dismissal: {e}")
#
#
#def scrape_with_selenium(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    options = Options()
#    options.headless = True
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"
#    proxy.socks_version = 5
#    options.proxy = proxy
#    options.add_argument("--headless")
#    options.add_argument("--disable-gpu")
#    options.add_argument("--no-sandbox")
#    options.add_argument("--disable-dev-shm-usage")
#
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#        time.sleep(3)
#
#        handle_pop_up(driver)
#
#        img_elements = driver.find_elements(By.TAG_NAME, "img")
#        if not img_elements:
#            print(f"No images found on the page: {url}")
#            return
#
#        for img in img_elements:
#            if is_valid_image(driver, img):
#                src = img.get_attribute("src")
#                download_image(src, output_dir)
#
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#
#    os.makedirs(output_dir, exist_ok=True)
#
#    os.environ["GALLERY_DL_CONFIG"] = GALLERY_DL_CONFIG
#
#    success = run_gallery_dl(url, output_dir)
#
#    if not success:
#        print("Falling back to Selenium...")
#        scrape_with_selenium(url, output_dir)



#import sys
#import os
#import subprocess
#import requests
#from selenium import webdriver
#from selenium.webdriver.common.by import By
#from selenium.webdriver.firefox.options import Options
#from selenium.webdriver.common.proxy import Proxy, ProxyType
#from selenium.webdriver.firefox.service import Service
#from selenium.common.exceptions import TimeoutException
#import time
#import random
#
## Hardcoded path to gallery-dl config file
#BASE_DIR = os.path.dirname(os.path.abspath(__file__))
#GALLERY_DL_CONFIG = os.path.join(BASE_DIR, ".config/gallery-dl/config.json")
#
#
#def check_url_status(url):
#    """
#    Checks the status of the given URL. Returns True if the status is 200-399, otherwise False.
#    """
#    try:
#        response = requests.head(url, timeout=5, allow_redirects=True)
#        if 200 <= response.status_code < 400:
#            return True
#        print(f"Skipping URL due to HTTP {response.status_code}: {url}")
#        return False
#    except requests.RequestException as e:
#        print(f"Error checking URL status: {e}")
#        return False
#
#
#def run_gallery_dl(url, output_dir):
#    """
#    Runs gallery-dl with the given URL and output directory, using a SOCKS proxy and additional options.
#    """
#    user_agents = [
#        "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
#        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
#        "Mozilla/5.0 (X11; Linux x86_64)",
#        "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)",
#        "Mozilla/5.0 (Android 11; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0",
#    ]
#    user_agent = random.choice(user_agents)
#
#    gallery_dl_command = [
#        "gallery-dl",
#        "--proxy", "socks5://127.0.0.1:9050",
#        "--verbose",
#        "--no-mtime",
#        "--dest", output_dir,
#        "--filename", "{category}_{id}_{num}.{extension}",
#        "--user-agent", user_agent,
#        url,
#    ]
#
#    try:
#        print("Running Gallery-dl with command:", " ".join(gallery_dl_command))
#        result = subprocess.run(
#            gallery_dl_command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
#        )
#        output = result.stdout.decode("utf-8")
#        print(output)
#
#        # Check for HTTP errors in gallery-dl output
#        if "HTTPError" in output or "403 Forbidden" in output or "400 Bad Request" in output:
#            print("Gallery-dl encountered an HTTP error. Falling back to Selenium...")
#            return False
#
#        return True
#    except subprocess.CalledProcessError as e:
#        print(f"Gallery-dl failed: {e.stderr.decode('utf-8')}")
#        return False
#
#
#def download_image(image_url, output_dir):
#    """
#    Downloads a valid image from the specified URL to the output directory.
#    """
#    if not check_url_status(image_url):
#        return
#
#    try:
#        response = requests.get(image_url, stream=True)
#        response.raise_for_status()
#        filename = os.path.basename(image_url.split("?")[0])
#        filepath = os.path.join(output_dir, filename)
#
#        with open(filepath, "wb") as file:
#            for chunk in response.iter_content(chunk_size=8192):
#                file.write(chunk)
#
#        print(f"Downloaded: {filepath}")
#    except Exception as e:
#        print(f"Error downloading image {image_url}: {e}")
#
#
#def is_valid_image(driver, img_element):
#    """
#    Validates an image element based on dimensions and content.
#    """
#    try:
#        src = img_element.get_attribute("src")
#        if not src:
#            return False
#
#        if any(keyword in src.lower() for keyword in ["logo", "placeholder", "icon", "ad", "avatar"]):
#            print(f"Skipping unwanted image: {src}")
#            return False
#
#        width = driver.execute_script("return arguments[0].naturalWidth;", img_element)
#        height = driver.execute_script("return arguments[0].naturalHeight;", img_element)
#        if width < 200 or height < 200:
#            print(f"Skipping small image: {src} (Dimensions: {width}x{height})")
#            return False
#
#        return True
#    except Exception as e:
#        print(f"Error validating image: {e}")
#        return False
#
#
#def handle_pop_up(driver):
#    """
#    Attempts to dismiss any pop-ups on the page.
#    """
#    try:
#        driver.execute_script("""
#            document.querySelectorAll('div, iframe, modal, [role="dialog"]').forEach(
#                popup => popup.style.display = 'none'
#            );
#        """)
#        print("Pop-up dismissed using JavaScript.")
#    except Exception as e:
#        print(f"Error during pop-up dismissal: {e}")
#
#
#def scrape_with_selenium(url, output_dir):
#    """
#    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
#    """
#    options = Options()
#    options.headless = True
#    proxy = Proxy()
#    proxy.proxy_type = ProxyType.MANUAL
#    proxy.socks_proxy = "127.0.0.1:9050"
#    proxy.socks_version = 5
#    options.proxy = proxy
#    options.add_argument("--headless")
#    options.add_argument("--disable-gpu")
#    options.add_argument("--no-sandbox")
#    options.add_argument("--disable-dev-shm-usage")
#
#    service = Service(executable_path="/usr/local/bin/geckodriver")
#    driver = webdriver.Firefox(options=options, service=service)
#
#    try:
#        print(f"Loading page: {url}")
#        driver.get(url)
#        time.sleep(3)
#
#        handle_pop_up(driver)
#
#        img_elements = driver.find_elements(By.TAG_NAME, "img")
#        if not img_elements:
#            print(f"No images found on the page: {url}")
#            return
#
#        for img in img_elements:
#            if is_valid_image(driver, img):
#                src = img.get_attribute("src")
#                download_image(src, output_dir)
#
#    finally:
#        driver.quit()
#
#
#if __name__ == "__main__":
#    if len(sys.argv) < 3:
#        print("Usage: python fallback_selenium.py <url> <output_dir>")
#        sys.exit(1)
#
#    url = sys.argv[1]
#    output_dir = sys.argv[2]
#
#    os.makedirs(output_dir, exist_ok=True)
#
#    # Early exit if the URL is invalid
#    if not check_url_status(url):
#        sys.exit(1)
#
#    # Set GALLERY_DL_CONFIG environment variable
#    os.environ["GALLERY_DL_CONFIG"] = GALLERY_DL_CONFIG
#
#    # First, try running gallery-dl
#    success = run_gallery_dl(url, output_dir)
#
#    # If gallery-dl fails, fall back to Selenium
#    if not success:
#        print("Falling back to Selenium...")
#        scrape_with_selenium(url, output_dir)


import sys
import os
import subprocess
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.common.proxy import Proxy, ProxyType
from selenium.webdriver.firefox.service import Service
from selenium.webdriver import FirefoxProfile
from selenium.common.exceptions import TimeoutException
import time
import random

# Hardcoded path to gallery-dl config file
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
GALLERY_DL_CONFIG = os.path.join(BASE_DIR, ".config/gallery-dl/config.json")

def is_reddit_url(url):
    """
    Checks if the given URL is a Reddit URL.
    """
    return "reddit" in url

def check_url_status(url):
    """
    Checks the status of the given URL. Returns True if the status is 200-399 or if it's a Reddit URL with 403.
    """
    try:
        response = requests.head(url, timeout=15, allow_redirects=True)
        if 200 <= response.status_code < 400:
            return True
        if response.status_code == 403 and is_reddit_url(url):
            print(f"Reddit URL with HTTP 403 detected. Proceeding with gallery-dl: {url}")
            return True
        print(f"Skipping URL due to HTTP {response.status_code}: {url}")
        return False
    except requests.RequestException as e:
        print(f"Error checking URL status: {e}")
        return False

def run_gallery_dl(url, output_dir):
    """
    Runs gallery-dl with the given URL and output directory, using a SOCKS proxy and additional options.
    """
    gallery_dl_command = [
        "gallery-dl",
        "--config", GALLERY_DL_CONFIG,
        "--verbose",
        "--no-mtime",
        "--dest", output_dir,
        "--filename", "{category}_{id}_{num}.{extension}",
        url,
    ]

    try:
        print("Running Gallery-dl with command:", " ".join(gallery_dl_command))
        result = subprocess.run(
            gallery_dl_command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )
        output = result.stdout.decode("utf-8")
        print(output)
        
        # Check for successful HTTP 200 responses in gallery-dl output
        if 'HTTP/1.1" 200' in output:
            print("Gallery-dl encountered some successful downloads.")
            return True
        else:
            print("No successful downloads found. Falling back to Selenium...")
            return False
            
    except subprocess.CalledProcessError as e:
        print(f"Gallery-dl failed: {e.stderr.decode('utf-8')}")
        return False

def download_image(image_url, output_dir):
    """
    Downloads a valid image from the specified URL to the output directory.
    """
    if not check_url_status(image_url):
        return

    try:
        response = requests.get(image_url, stream=True)
        response.raise_for_status()
        filename = os.path.basename(image_url.split("?")[0])
        filepath = os.path.join(output_dir, filename)

        with open(filepath, "wb") as file:
            for chunk in response.iter_content(chunk_size=8192):
                file.write(chunk)

        print(f"Downloaded: {filepath}")
    except Exception as e:
        print(f"Error downloading image {image_url}: {e}")

def is_valid_image(driver, img_element):
    """
    Validates an image element based on dimensions and content.
    """
    try:
        src = img_element.get_attribute("src")
        if not src:
            return False

        if any(keyword in src.lower() for keyword in ["logo", "placeholder", "icon", "ad", "avatar"]):
            print(f"Skipping unwanted image: {src}")
            return False

        width = driver.execute_script("return arguments[0].naturalWidth;", img_element)
        height = driver.execute_script("return arguments[0].naturalHeight;", img_element)
        if width < 200 or height < 200:
            print(f"Skipping small image: {src} (Dimensions: {width}x{height})")
            return False

        return True
    except Exception as e:
        print(f"Error validating image: {e}")
        return False

def handle_pop_up(driver):
    """
    Attempts to dismiss any pop-ups on the page.
    """
    try:
        driver.execute_script("""
            document.querySelectorAll('div, iframe, modal, [role="dialog"]').forEach(
                popup => popup.style.display = 'none'
            );
        """)
        print("Pop-up dismissed using JavaScript.")
    except Exception as e:
        print(f"Error during pop-up dismissal: {e}")

def scrape_with_selenium(url, output_dir):
    """
    Scrapes images from a webpage using Selenium through a Tor proxy and saves them locally.
    """
    
    options = Options()
    options.headless = True
    # Remove if unnecessary
    options.add_argument("--headless")
    options.add_argument("--disable-gpu")
    # Remove if unnecessary
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")

    # Directly define the proxy capabilities dictionary
    proxy_dict = {
        "proxyType": "manual",
        "socksProxy": "127.0.0.1:9050",
        "socksVersion": 5
    }

    options.set_capability("proxy", proxy_dict)
#    service = Service("/usr/local/bin/geckodriver")

    driver = webdriver.Firefox(
        options=options,
        executable_path="/usr/local/bin/geckodriver"
#        service=service
    )

    try:
        print(f"Loading page: {url}")
        driver.get(url)
        time.sleep(3)

        handle_pop_up(driver)

        img_elements = driver.find_elements(By.TAG_NAME, "img")
        if not img_elements:
            print(f"No images found on the page: {url}")
            return

        for img in img_elements:
            if is_valid_image(driver, img):
                src = img.get_attribute("src")
                download_image(src, output_dir)

    finally:
        driver.quit()

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python fallback_selenium.py <url> <output_dir>")
        sys.exit(1)

    url = sys.argv[1]
    output_dir = sys.argv[2]

    os.makedirs(output_dir, exist_ok=True)

    # Early exit if the URL is invalid (except Reddit URLs with 403)
    if not check_url_status(url):
        sys.exit(1)

    # Set GALLERY_DL_CONFIG environment variable
    os.environ["GALLERY_DL_CONFIG"] = GALLERY_DL_CONFIG

    # First, try running gallery-dl
    success = run_gallery_dl(url, output_dir)

    # If gallery-dl fails, fall back to Selenium
    if not success:
        print("Falling back to Selenium...")
        scrape_with_selenium(url, output_dir)
