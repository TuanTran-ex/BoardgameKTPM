# BoardgameKTPM

- Dự án web bán boardagame trực tuyến
- Mô phỏng trang boargame.vn

## Công nghệ

- ASP .NET CORE 3.1
- NodeJS
- MS SQL SERVER 2019
- BOOTSTRAP 4 HTML JAVASCRIPT

## API Nodejs

### Install NodeJS

[Link](https://nodejs.org/en/)  
Cài đặt bản 16.15.0 LTS

### Run API

```cmd
cd api_nodejs
```

**Install package (chỉ chạy lệnh ở lần đầu tiên)**

```js
// Nếu có cài yarn
yarn
// or
npm i
```

Tạo file .env trong thư mục api_nodejs

> DB_USER=<DB Username trên máy local, mặc định "sa">  
> DB_PWD=<DB Password trên máy local>  
> DB_NAME=Boardgame  
> PRIVATE_KEY=<String tùy ý>

**Chạy API**

```npm
npm run dev
```
