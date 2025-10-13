## Luồng dữ liệu: Categories (Riverpod + Dio)

Tài liệu này mô tả cách trang `CategoriesPage` lấy dữ liệu từ API dev và hiển thị danh sách categories, hỗ trợ `search`, `ordering`, và phân trang `page`/`page_size`.

### Tổng quan luồng
- UI (`CategoriesPage`) → đọc state truy vấn từ Riverpod → gọi provider bất đồng bộ
- Provider (`categoriesFutureProvider`) → gọi service (`CategoriesService.getCategories`)
- Service (Dio) → gửi HTTP GET đến `http://127.0.0.1:8000/api/categories/` với query
- Backend trả JSON phân trang → parse thành `PaginatedResponse<CategoryModel>` → UI render

Sơ đồ đơn giản:

```
User Action (gõ search / đổi page)
        ↓
categoriesQueryProvider (State)
        ↓ (watch)
categoriesFutureProvider (Future)
        ↓ (uses)
CategoriesService.getCategories
        ↓ (Dio GET)
http://127.0.0.1:8000/api/categories/?page=..&page_size=..&search=..&ordering=..
        ↓ (JSON)
PaginatedResponse<CategoryModel>
        ↓
UI: ListView + nút Prev/Next
```

### Endpoint
- Base URL (dev): `http://127.0.0.1:8000`
- Endpoint: `GET /api/categories/`
- Tham số query hỗ trợ:
  - `page` (mặc định 1)
  - `page_size` (mặc định 20)
  - `search` (tìm theo `name`, `name_vi`)
  - `ordering` (`sort_order`, `name_vi`, `created_at`)

Ví dụ request:
```bash
curl "http://127.0.0.1:8000/api/categories/?page=1&page_size=20&search=pho&ordering=name_vi"
```

### Các file chính
- Model: `lib/features/categories/data/models/category_model.dart`
  - `CategoryModel` biểu diễn 1 category
  - `PaginatedResponse<T>` dùng chung để parse response phân trang (fields: `count`, `next`, `previous`, `results`)

- Service: `lib/features/categories/data/services/categories_service.dart`
  - `getCategories({ page, pageSize, search, ordering })`
  - Gọi `GET /api/categories/` bằng Dio, ép `baseUrl` về dev (`http://127.0.0.1:8000`) chỉ cho request này

- Providers: `lib/features/categories/presentation/providers/categories_providers.dart`
  - `categoriesQueryProvider`: giữ state truy vấn (page, pageSize, search, ordering)
  - `categoriesFutureProvider`: thực thi gọi API dựa trên state hiện tại và trả về `PaginatedResponse<CategoryModel>`

- UI Page: `lib/features/categories/presentation/pages/categories_page.dart`
  - TextField tìm kiếm (Enter để áp dụng)
  - Dropdown sắp xếp
  - ListView hiển thị kết quả
  - Nút Prev/Next đổi `page`

### Cách hoạt động trong UI
1) Người dùng nhập từ khóa rồi nhấn Enter → cập nhật `categoriesQueryProvider` với `search` mới và `page = 1`.
2) Provider `categoriesFutureProvider` tự động chạy lại do `watch(query)` thay đổi → gọi service.
3) Service request API, parse JSON → `PaginatedResponse<CategoryModel>`.
4) UI nhận `asyncValue.data` và render danh sách; nếu `loading` thì `CircularProgressIndicator`, nếu `error` hiển thị thông báo lỗi.
5) Nút Prev/Next cập nhật `page` trong `categoriesQueryProvider` → lặp lại bước 2-4.

### Tùy chỉnh nhanh
- Đổi kích thước trang: cập nhật `pageSize` trong `categoriesQueryProvider`.
- Sửa tiêu chí sắp xếp: set `ordering` thành `sort_order` | `name_vi` | `created_at`.
- Áp dụng filter khác: thêm key vào query trong `CategoriesService.getCategories` theo API hỗ trợ.

### Gợi ý điều hướng
Mở trang từ bất kỳ nơi nào bằng:
```dart
Navigator.of(context).push(
  MaterialPageRoute(builder: (_) => const CategoriesPage()),
);
```

### Lưu ý & lỗi thường gặp
- Dev API phải chạy tại `http://127.0.0.1:8000`.
- Nếu chạy trên thiết bị/simulator:
  - Android emulator: dùng `10.0.2.2` thay cho `127.0.0.1`.
  - iOS simulator: `127.0.0.1` vẫn dùng được.
  - Thiết bị thật: dùng IP LAN của máy chạy server (ví dụ `http://192.168.x.x:8000`).
- CORS (trên web): đảm bảo backend cho phép nguồn gốc (origin) phù hợp.
- Timeout/mất mạng: xem `core/network/dio_client.dart` cho xử lý lỗi mạng cơ bản.

### Mẹo học Riverpod qua ví dụ này
- State tách khỏi UI: `categoriesQueryProvider` là state thuần, UI chỉ đọc và set.
- Side-effect (HTTP call) nằm trong `FutureProvider`, tự động re-run khi input (query) thay đổi.
- Dữ liệu bất đồng bộ được UI xử lý qua `when(loading/error/data)` giúp rõ ràng luồng hiển thị.


