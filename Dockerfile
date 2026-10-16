# استخدام صورة Playwright الرسمية (تحتوي على Python وجميع متطلبات المتصفح جاهزة)
FROM mcr.microsoft.com/playwright/python:v1.48.0-jammy

# تعيين مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ ملف المتطلبات وتثبيتها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# تثبيت متصفح Chromium الخاص بمكتبة patchright
RUN patchright install chromium

# نسخ باقي ملفات المشروع إلى داخل الحاوية
COPY . .

# كشف المنفذ الذي يعمل عليه التطبيق (5000)
EXPOSE 5000

# أمر تشغيل التطبيق
CMD ["python", "api_solver.py"]