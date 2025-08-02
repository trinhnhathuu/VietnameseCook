# Vietnamese Cooking App

Ứng dụng nấu ăn Việt Nam được xây dựng với Flutter, sử dụng Clean Architecture và Riverpod.

## 🏗️ Cấu trúc project

```
lib/
├── core/                           # Core functionality
│   ├── constants/                  # App constants
│   ├── data/                      # Core data layer
│   ├── error/                     # Error handling
│   ├── network/                   # Network layer
│   ├── router/                    # App routing
│   ├── theme/                     # App theme
│   ├── usecases/                  # Core use cases
│   └── utils/                     # Utilities
├── data/                          # Data layer
│   ├── datasources/               # API & local data sources
│   ├── models/                    # Data models (JSON serialization)
│   ├── repositories/              # Repository implementations
│   └── services/                  # External services
├── demo/                          # Demo pages & examples
├── domain/                        # Business logic
│   ├── entities/                  # Business entities
│   ├── repositories/              # Repository contracts
│   └── usecases/                  # Use cases (business logic)
├── features/                      # Feature modules
│   ├── favorites/                 # Favorites feature
│   ├── home/                      # Home screen
│   ├── profile/                   # User profile
│   ├── recipes/                   # Recipe management
│   └── splash/                    # Splash screen
├── provider/                      # Riverpod providers (state management)
│   └── recipe/                    # Recipe-related providers
├── widgets/                       # Shared UI components
│   ├── common/                    # Common widgets
│   ├── recipe/                    # Recipe-specific widgets
│   └── utils/                     # Widget utilities
└── main.dart                      # App entry point
```

### 📝 Giải thích cấu trúc:

- **`core/`**: Chứa các thành phần cốt lõi được sử dụng chung trong toàn app
- **`data/`**: Xử lý dữ liệu từ API, database, cache
- **`domain/`**: Business logic thuần túy, không phụ thuộc UI framework
- **`features/`**: Các tính năng chính của app, mỗi feature độc lập
- **`provider/`**: Quản lý state với Riverpod, kết nối business logic với UI
- **`widgets/`**: UI components tái sử dụng

## 🛠️ Setup

### 1. Cài đặt dependencies
```bash
flutter pub get
```

### 2. Generate code
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 3. Chạy app
```bash
flutter run
```

## 📦 Dependencies chính

- **flutter_riverpod**: State management
- **go_router**: Navigation
- **dio**: HTTP client
- **freezed**: Code generation cho immutable classes
- **json_annotation**: JSON serialization
- **dartz**: Functional programming (Either, Option)
- **equatable**: Value equality

## 🏛️ Clean Architecture

### Domain Layer
- **Entities**: Business objects thuần túy
- **Repositories**: Interfaces cho data access
- **Use Cases**: Business logic

### Data Layer  
- **Models**: Data transfer objects
- **Data Sources**: API/Database access
- **Repository Implementations**: Implement domain repositories

### Presentation Layer
- **Pages**: UI screens
- **Providers**: Riverpod state management
- **Widgets**: Reusable UI components

## 🎯 Riverpod Patterns

### Providers
```dart
// Simple provider
final serviceProvider = Provider<Service>((ref) => Service());

// Future provider
final dataProvider = FutureProvider<Data>((ref) async {
  return await ref.watch(serviceProvider).getData();
});

// State notifier provider
final notifierProvider = StateNotifierProvider<Notifier, State>((ref) {
  return Notifier(ref.watch(serviceProvider));
});
```

### State Notifier với Freezed
```dart
@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.loading() = _Loading;
  const factory AppState.loaded(Data data) = _Loaded;
  const factory AppState.error(String message) = _Error;
}
```

## 📝 Code Generation

Chạy lệnh sau khi thêm annotations:

```bash
# One-time generation
flutter packages pub run build_runner build

# Watch for changes
flutter packages pub run build_runner watch

# Clean and rebuild
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## 🧪 Sample Feature: Recipes

Project đã setup sẵn một feature mẫu `recipes` để demo cách sử dụng:

- **Entity**: `Recipe` - domain object
- **Repository**: `RecipeRepository` - interface  
- **Use Case**: `GetRecipes` - business logic
- **Model**: `RecipeModel` - data object
- **Data Source**: `RecipeRemoteDataSource` - API calls
- **Provider**: `recipeNotifierProvider` - state management
- **State**: `RecipeState` với Freezed

## 🚀 Cách thêm feature mới

1. Tạo folder trong `features/`
2. Tạo 3 layers: `data/`, `domain/`, `presentation/`
3. Follow cấu trúc của `recipes` feature
4. Tạo providers trong `presentation/providers/`
5. Sử dụng trong UI với `Consumer`/`ref.watch`

## 📱 Usage Example

```dart
class MyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeState = ref.watch(recipeNotifierProvider);
    
    return recipeState.when(
      initial: () => Text('Khởi tạo'),
      loading: () => LoadingWidget(),
      loaded: (recipes) => ListView.builder(...),
      error: (message) => ErrorDisplayWidget(message: message),
    );
  }
}
```
