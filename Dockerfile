# ใช้ Node.js 20
FROM node:20

# ตั้งค่าโฟลเดอร์ทำงานใน container
WORKDIR /usr/src/app

# คัดลอกไฟล์ package.json และ package-lock.json ไปยัง container
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอกไฟล์โปรเจคทั้งหมดไปยัง container
COPY . .

# สร้างไฟล์ dist จาก TypeScript
RUN npm run build

# เปิด port 8080 ซึ่งเป็นพอร์ตที่ Cloud Run ใช้
EXPOSE 8080

# รันแอปพลิเคชัน
CMD ["node", "dist/main"]
