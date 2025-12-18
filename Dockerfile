FROM node:18-slim
WORKDIR /usr/src/app

# คัดลอก package files ทั้งหมดจาก backend เข้ามาที่ทำงานปัจจุบัน (.)
COPY backend/package*.json ./

# รัน install โดยข้ามขั้นตอนการเช็คแพลตฟอร์มบางอย่างเพื่อความเร็วและลด error
RUN npm install --quiet

# คัดลอกโค้ดที่เหลือทั้งหมดจาก backend มาวาง
COPY backend/ .

# กำหนด Port และคำสั่งรัน
EXPOSE 8080
CMD [ "npm", "start" ]
