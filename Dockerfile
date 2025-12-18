FROM node:18-slim
WORKDIR /usr/src/app

# คัดลอกเฉพาะ package.json มาก่อนเพื่อสร้าง Layer Cache
COPY backend/package*.json ./

# รัน install โดยลบ cache เก่าทิ้งและข้าม optional dependencies
RUN npm cache clean --force &&     npm install --no-audit --no-fund

# คัดลอกไฟล์โค้ดทั้งหมด (ยกเว้น node_modules ถ้ามีในเครื่อง)
COPY backend/ .

EXPOSE 8080
# มั่นใจว่า start script ใน package.json ถูกต้อง
CMD [ "npm", "start" ]
