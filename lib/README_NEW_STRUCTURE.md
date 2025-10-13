# Cấu trúc mới - Đơn giản và có thể mở rộng

## Demo: Categories page (Riverpod + Dio)

Add route to open `CategoriesPage` and ensure backend running at `http://127.0.0.1:8000`.

Usage example:

```dart
// Somewhere in your router or a button:
Navigator.of(context).push(
  MaterialPageRoute(builder: (_) => const CategoriesPage()),
);
```

## 📁 **Cấu trúc thư mục mới:**

```
lib/
├── data/                          # ← Data layer chung
│   ├── models/                    # ← Tất cả models
│   │   ├── recipe.dart            # ← Recipe model
│   │   ├── api_response.dart      # ← API response wrapper
│   │   └── user.dart              # ← User model (sẽ thêm sau)
│   │
│   └── services/                  # ← Tất cả services  
│       ├── api_service.dart       # ← Base API service
│       ├── recipe_service.dart    # ← Recipe-specific service
│       └── auth_service.dart      # ← Auth service (sẽ thêm sau)
│
├── pages/                         # ← Tất cả pages
│   ├── home_page.dart            # ← Trang chủ
│   ├── recipes_page.dart         # ← Trang công thức
│   ├── favorites_page.dart       # ← Trang yêu thích
│   └── profile_page.dart         # ← Trang cá nhân
│
├── widgets/                       # ← Widgets tổ chức theo chức năng
│   ├── common/                   # ← Widgets dùng chung
│   │   ├── base_page.dart        # ← Base page (tránh lặp code)
│   │   └── app_header.dart       # ← Header component
│   │
│   ├── recipe/                   # ← Recipe widgets
│   │   ├── recipe_card.dart      # ← Recipe card
│   │   └── recipe_list.dart      # ← Recipe list (sẽ thêm sau)
│   │
│   └── auth/                     # ← Auth widgets (sẽ thêm sau)
│       ├── login_form.dart
│       └── register_form.dart
│
├── core/                         # ← Core utilities (giữ nguyên)
│   ├── constants/
│   ├── router/
│   └── theme/
│
└── features/                     # ← CHỈ cho features phức tạp
    └── recipes/                  # ← Complex recipe features
        ├── providers/            # ← Riverpod providers
        ├── pages/               # ← Advanced recipe pages
        └── widgets/             # ← Complex recipe widgets
```

## 🔄 **So sánh với cấu trúc cũ:**

### ❌ **Cấu trúc cũ - Over-engineering:**
```
features/
├── home/presentation/pages/           # 50+ dòng AppHeader lặp lại
├── recipes/
│   ├── data/datasources/             # Quá nhiều abstraction
│   ├── data/models/                  # Code generation phức tạp
│   ├── data/repositories/            # Repository pattern không cần thiết
│   ├── domain/entities/              # Entity vs Model redundant
│   ├── domain/repositories/          # Abstract repository
│   ├── domain/usecases/              # UseCase cho CRUD đơn giản
│   └── presentation/
│       ├── pages/                    # 50+ dòng AppHeader lặp lại
│       └── providers/                # Provider phức tạp
├── favorites/presentation/pages/      # 50+ dòng AppHeader lặp lại
└── profile/presentation/pages/        # 50+ dòng AppHeader lặp lại
```

### ✅ **Cấu trúc mới - Đơn giản và scalable:**
```
data/models/recipe.dart               # 1 file, manual JSON
data/services/recipe_service.dart     # 1 file, simple API calls
pages/home_page.dart                  # Sử dụng BasePage, không lặp code
widgets/common/base_page.dart         # DRY principle
widgets/recipe/recipe_card.dart       # Reusable component
```

## 🎯 **Lợi ích của cấu trúc mới:**

### 1. **Đơn giản hóa:**
- ✅ Giảm 80% code lặp lại
- ✅ Không cần Clean Architecture cho features đơn giản
- ✅ Manual JSON parsing thay vì code generation
- ✅ Service pattern thay vì Repository pattern

### 2. **Dễ học và maintain:**
- ✅ Cấu trúc flat, dễ navigate
- ✅ Ít abstraction, code dễ hiểu
- ✅ Không cần hiểu Clean Architecture để contribute

### 3. **Scalable:**
- ✅ Thêm feature mới chỉ cần tạo file, không cần tạo cả cây thư mục
- ✅ Widgets tổ chức theo chức năng, dễ tái sử dụng
- ✅ Có thể upgrade lên Clean Architecture sau nếu cần

### 4. **Performance:**
- ✅ Ít provider dependencies
- ✅ Không có code generation overhead
- ✅ Simple API calls

## 🚀 **Cách thêm feature mới:**

### Ví dụ: Thêm feature Authentication

**Chỉ cần tạo:**
```
data/models/user.dart                 # User model
data/services/auth_service.dart       # Auth API calls
pages/login_page.dart                 # Login page (extends BasePage)
pages/register_page.dart              # Register page (extends BasePage)
widgets/auth/login_form.dart          # Login form widget
widgets/auth/register_form.dart       # Register form widget
```

**Không cần tạo:**
- ❌ features/auth/data/datasources/
- ❌ features/auth/data/models/
- ❌ features/auth/data/repositories/
- ❌ features/auth/domain/entities/
- ❌ features/auth/domain/repositories/
- ❌ features/auth/domain/usecases/
- ❌ features/auth/presentation/pages/
- ❌ features/auth/presentation/providers/

## 🛠 **Cách migrate từ cấu trúc cũ:**

### 1. **Models:**
```dart
// Cũ: features/recipes/data/models/recipe_model.dart + recipe_model.g.dart
// Mới: data/models/recipe.dart (manual JSON)
```

### 2. **API Calls:**
```dart
// Cũ: 
// - features/recipes/data/datasources/recipe_remote_datasource.dart
// - features/recipes/data/repositories/recipe_repository_impl.dart
// - features/recipes/domain/repositories/recipe_repository.dart
// - features/recipes/domain/usecases/get_recipes.dart

// Mới: 
// - data/services/api_service.dart (base)
// - data/services/recipe_service.dart (recipe-specific)
```

### 3. **Pages:**
```dart
// Cũ: features/*/presentation/pages/*.dart (50+ dòng lặp lại)
// Mới: pages/*.dart (extends BasePage, DRY)
```

## 📋 **TODO cho việc migration:**

- [x] Tạo cấu trúc mới
- [x] Migrate models và services
- [x] Migrate pages
- [x] Tổ chức widgets
- [ ] Xóa cấu trúc cũ
- [ ] Update router để sử dụng pages mới
- [ ] Update pubspec.yaml (remove riverpod_generator, riverpod_lint)
- [ ] Test toàn bộ app

## 🎉 **Kết luận:**

Cấu trúc mới này:
- **Đơn giản hơn** cho developer mới
- **Ít code lặp lại** hơn nhiều 
- **Dễ mở rộng** khi thêm features
- **Phù hợp** với quy mô project hiện tại
- **Có thể nâng cấp** về Clean Architecture sau nếu cần

**Nguyên tắc:** Start simple, scale when needed! 🚀