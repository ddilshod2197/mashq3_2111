/* 1. Narxi 1,000,000–5,000,000 oralig‘ida
      va chegirmasi 10% dan yuqori bo‘lgan mahsulotlar */
SELECT *
FROM mahsulotlar
WHERE price BETWEEN 1000000 AND 5000000
  AND discount >= 10;


/* 2. Har bir brend bo‘yicha mahsulotlar soni va o‘rtacha narxi */
SELECT brand,
       COUNT(*) AS mahsulot_soni,
       AVG(price) AS ortacha_narx
FROM mahsulotlar
GROUP BY brand;


/* 3. Omborda 100 dan kam qolgan va holati active bo‘lgan mahsulotlar –
      narxi bo‘yicha kamayish tartibida */
SELECT *
FROM mahsulotlar
WHERE stock < 100
  AND status = 'active'
ORDER BY price DESC;


/* 4. 2024-yil avgust oyida qo‘shilgan
      va category_id 6 yoki 7 bo‘lgan mahsulotlar – nomi va narxi */
SELECT name, price
FROM mahsulotlar
WHERE category_id IN (6, 7)
  AND created_at >= '2024-08-01'
  AND created_at <  '2024-09-01';


/* 5. Eng qimmat 5 ta mahsulot – nomi, narxi, chegirmasi, yakuniy narxi */
SELECT name,
       price,
       discount,
       (price - discount) AS yakuniy_narx
FROM mahsulotlar
ORDER BY price DESC
LIMIT 5;


/* 6. Rangi “Qora” va vazni 1 kg dan kam bo‘lgan mahsulotlar –
      umumiy ombordagi soni */
SELECT SUM(stock) AS umumiy_ombor_soni
FROM mahsulotlar
WHERE color = 'Qora'
  AND weight < 1;

