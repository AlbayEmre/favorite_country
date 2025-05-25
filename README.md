# 🌍 Favorite Country App

**Favorite Country**, Flutter ile geliştirilmiş, ülkeleri listeleyen ve kullanıcıların favori ülkelerini seçip saklayabildiği sade ve işlevsel bir uygulamadır. REST API ile ülke verileri çekilir, favoriler `shared_preferences` ile lokal olarak saklanır. Modern Flutter teknikleri ve clean code prensipleri ile yapılandırılmıştır.

---

## ✨ Özellikler

- 🌐 API'den ülke verilerini çekme (Dio & HTTP)
- ⭐ Ülkeleri favorilere ekleyip çıkarabilme
- 💾 Favorileri cihazda saklama (`shared_preferences`)
- 🧠 Provider ile state yönetimi
- ⚙️ Otomatik model oluşturma (`json_serializable`)
- 🧼 Clean code, sade mimari

---

## 🛠️ Kullanılan Paketler

| Paket                | Amaç                                     |
|----------------------|-------------------------------------------|
| **dio**              | API istekleri                            |
| **http**             | Alternatif ağ istekleri                  |
| **provider**         | State management                         |
| **shared_preferences** | Favorileri lokal olarak saklama       |
| **json_annotation**  | JSON modelleme işaretleme                |
| **json_serializable**| Otomatik model üretimi                   |
| **build_runner**     | Kod üretme işlemleri                     |

---

## 🚀 Kurulum

```bash
# 1. Depoyu klonla
git clone https://github.com/AlbayEmre/favorite_country.git
cd favorite_country

# 2. Paketleri yükle
flutter pub get

# 3. JSON modellerini üret
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Uygulamayı çalıştır
flutter run
