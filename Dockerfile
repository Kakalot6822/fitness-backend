FROM node:18-slim
WORKDIR /usr/src/app

# คัดลอกไฟล์ package
COPY package*.json ./

# ติดตั้ง library แบบสะอาดที่สุด
RUN npm install --omit=dev --no-audit --no-fund

# คัดลอกไฟล์ทั้งหมด (ซึ่งตอนนี้อยู่ที่ระดับเดียวกันหมดแล้ว)
COPY . .

# ตรวจสอบโครงสร้างไฟล์ภายใน container เพื่อความชัวร์ (ดูได้ใน log)
RUN ls -la

EXPOSE 8080
CMD [ "npm", "start" ]
