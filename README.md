# TooL82 - Software Group Buying Platform

A web platform for group buying software licenses.

## Features

- **Member Management**: Registration, Login/Logout, My Page, Profile Edit, Account Deletion
- **Product Management**: Create/Edit/Delete products, Image upload
- **Categories**: Games, Music, Video, Utilities
- **Group Buying**: Join parties, Progress tracking, Deadline management
- **Transaction History**: View purchase/sales history for buyers and sellers

## Tech Stack

- **Framework**: ASP.NET Core MVC (.NET 10)
- **Database**: SQL Server (LocalDB)
- **ORM**: Entity Framework Core
- **Authentication**: Session-based authentication
- **Security**: BCrypt password hashing
- **Frontend**: Bootstrap 4, jQuery

## Project Structure

```
TooL82/
├── Controllers/          # MVC Controllers
├── Models/
│   ├── Entities/         # Database entities
│   └── ViewModels/       # View models
├── Services/
│   ├── Interfaces/       # Service interfaces
│   └── Implementations/  # Service implementations
├── Data/                 # DbContext
├── Views/                # Razor views
├── Infrastructure/       # Utility classes
└── wwwroot/              # Static files (CSS, JS, images)
```

## Getting Started

### Prerequisites
- .NET 8 SDK
- SQL Server LocalDB

### Installation & Run

```bash
# Clone the repository
git clone https://github.com/seungjun-Lee0/TooL82.git
cd TooL82

# Restore packages
dotnet restore

# Run the application
dotnet run
```

Open your browser and navigate to `https://localhost:5001` or `http://localhost:5000`

---

# TooL82 - 소프트웨어 공동구매 플랫폼

소프트웨어 라이선스를 공동구매할 수 있는 웹 플랫폼입니다.

## 주요 기능

- **회원 관리**: 회원가입, 로그인/로그아웃, 마이페이지, 정보수정, 회원탈퇴
- **상품 관리**: 상품 등록/수정/삭제, 이미지 업로드
- **카테고리**: 게임, 음악, 영상, 유틸리티
- **공동구매**: 파티 참여, 진행률 표시, 마감일 관리
- **구매/판매 내역**: 구매자/판매자별 거래 내역 조회

## 기술 스택

- **프레임워크**: ASP.NET Core MVC (.NET 10)
- **데이터베이스**: SQL Server (LocalDB)
- **ORM**: Entity Framework Core
- **인증**: 세션 기반 인증
- **보안**: BCrypt 비밀번호 해싱
- **프론트엔드**: Bootstrap 4, jQuery

## 실행 방법

### 사전 요구사항
- .NET 8 SDK
- SQL Server LocalDB

### 설치 및 실행

```bash
# 프로젝트 클론
git clone https://github.com/seungjun-Lee0/TooL82.git
cd TooL82

# 패키지 복원
dotnet restore

# 실행
dotnet run
```

브라우저에서 `https://localhost:5001` 또는 `http://localhost:5000` 접속

## License

This project is for educational purposes.
