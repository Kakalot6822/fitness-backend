FROM node:18-slim
WORKDIR /usr/src/app

# คัดลอกไฟล์จัดการ package
COPY backend/package*.json ./

# ติดตั้งเฉพาะ library ที่จำเป็นสำหรับรัน (ลดโอกาส error จาก devDependencies)
RUN npm install --omit=dev --no-audit

# คัดลอกโค้ดทั้งหมดจาก backend
COPY backend/ .

# ตรวจสอบว่ามีไฟล์อยู่จริงก่อนรัน (เพื่อ debug ใน log)
RUN ls -la

EXPOSE 8080
CMD [ "npm", "start" ]
