CREATE DATABASE _01_DBSAMPLE_1;
USE _01_DBSAMPLE_1;
CREATE TABLE member(
	mem_id VARCHAR(30),
    mem_pw VARCHAR(30),
    mem_name VARCHAR(20)
);

CREATE TABLE item(
	item_id INT PRIMARY KEY AUTO_INCREMENT, #id
    item_name VARCHAR(30), #이름
    item_price INT(6), #가격
    item_img VARCHAR(50), #이미지
    item_info TEXT, #정보
    iten_discount INT default 0, #할인
    item_sold INT #재고
);

CREATE TABLE cart(
	cart_id INT PRIMARY KEY AUTO_INCREMENT,
    cart_itemName varchar(30),
    cart_price int(6),
    cart_img varchar(50),
    cart_count int(4)
);

INSERT INTO member VALUES
('QQQQ', 'QQQQ', '김땡땡'),
('WWWW', 'WWWW', '이땡땡'),
('EEEE', 'EEEE', '박땡땡'),
('AAAA', 'AAAA', '최땡땡'),
('1', '1', '지현');

INSERT INTO item (item_name, item_price, item_img, item_info, iten_discount, item_sold) VALUES
('바나나', 4980, '델몬트 바나나.jpg', '필리핀)델몬트바나나', 20, 10),
('밀감', 9900, '밀감.jpg', '고당도)타이벡밀감(1.5KG/팩)', 0, 20),
('사과', 19900, '감흥사과.jpg', '찐한 단맛 감홍사과 46입(봉)', 20, 50),
('맛밤', 8800, '맛밤.jpg', 'JC)맛밤 60GX4번들', 15, 30),
('단감', 7900, '단감.jpg', '신선특별시)단감(5~7입/봉)', 0, 30),
('레몬', 1880, '레몬.jpg', '호주)레몬(1입)', 3, 5),
('골드키위', 1120, '골드키위.jpg', '뉴질랜드)제스프리골드키위(개)', 0, 40),
('냉동블루베리', 11900, '냉동블루베리.jpg', '미국)냉동블루베리', 10, 30),
('아보키도', 9900, '아보카도.jpg', '뉴질랜드)아보카도(3~5입)', 30, 20),
('샤인머스켓', 16900, '샤인머스켓.jpg', '샤인머스켓(2kg/박스)', 10, 5),
('뚫어뻥', 5900, '뚤어뻥.png', '뚫어뻥1개', 0, 10),
('드릴펑', 7700, '드릴펑.jpg', '드릴펑[배수관세정]', 5, 10),
('목살', 9900, '목살.jpg', '목살300kg', 0, 20),
('생삼겹살', 18900, '생삼겹살600g.jpg', '생삼겹살600g', 20, 20),
('욕실화', 3000, '욕실화.jpg', '욕실화1켤레', 0, 30),
('주방세제', 6500, '주방세제.jpg', '주방세제 1L', 0, 10),
('향락스', 8000, '향락스.jpg', '향락스 2kg', 10, 10);

ALTER TABLE member
ADD COLUMN mem_gender VARCHAR(10),
ADD COLUMN mem_age INT;

UPDATE member SET mem_gender='남', mem_age=20 WHERE mem_id='QQQQ';
UPDATE member SET mem_gender='남', mem_age=17 WHERE mem_id='WWWW';
UPDATE member SET mem_gender='여', mem_age=40 WHERE mem_id='EEEE';
UPDATE member SET mem_gender='여', mem_age=25 WHERE mem_id='AAAA';
UPDATE member SET mem_gender='여', mem_age=36 WHERE mem_id='1';
UPDATE member SET mem_name='1' WHERE mem_id='1';
UPDATE item SET item_sold='0' WHERE item_id='5';

ALTER TABLE cart
ADD COLUMN mem_cartId VARCHAR(30);
delete from cart where cart_id=26 or cart_id= 27;
delete from member where mem_name='11';

SELECT * FROM member;
SELECT * FROM item;
SELECT * FROM cart;