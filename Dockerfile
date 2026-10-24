FROM python:3.10-slim

# نصب کروم و درایور مورد نیاز برای اجرای Selenium
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# اجرای فایل اصلی ربات
CMD ["python", "main.py"]
