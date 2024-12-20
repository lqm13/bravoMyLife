﻿CREATE TABLE "TB_SLE" (
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"SLE_NM"	VARCHAR2(256)		NOT NULL,
	"DESCES"	VARCHAR2(256)		NOT NULL,
	"IMG"	VARCHAR2(256)		NULL,
	"PRICE_SALE"	NUMBER(10)		NOT NULL,
	"CD_CTG_B"	CHAR(1)		NOT NULL,
	"CD_CTG_M"	CHAR(1)		NOT NULL,
	"CD_STATE_SALE"	CHAR(1)		NOT NULL,
	"PRD_TYPE"	CHAR(1)		NOT NULL,
	"COUNT_STOCK"	NUMBER(10)		NOT NULL,
	"CORP_NM"	VARCHAR2(64)		NOT NULL,
	"POINT_STACK"	NUMBER(2)		NULL,
	"FLG_DELETE"	CHAR(1)		NOT NULL,
	"DT_SALE_START"	DATE		NOT NULL,
	"DT_SALE_END"	DATE		NOT NULL,
	"DISCOUNT"	NUMBER(2)		NULL,
	"ORIGIN_SALE"	NUMBER(10)		NOT NULL,
	"MARGIN_RATE"	NUMBER(2)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_SLE"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_SLE"."SLE_NM" IS '판매 상품명';

COMMENT ON COLUMN "TB_SLE"."DESCES" IS '설명';

COMMENT ON COLUMN "TB_SLE"."IMG" IS '이미지(대표)';

COMMENT ON COLUMN "TB_SLE"."PRICE_SALE" IS '판매 가격';

COMMENT ON COLUMN "TB_SLE"."CD_CTG_B" IS '상품 카테고리 : 1(기능별), 2(성분별), 3(대상별)';

COMMENT ON COLUMN "TB_SLE"."CD_CTG_M" IS '상품 카테고리 중분류 : 1-9';

COMMENT ON COLUMN "TB_SLE"."CD_STATE_SALE" IS '판매 상품 상태 코드 : 대기(1), 판매(2), 중지(2), 재고 소진(9)';

COMMENT ON COLUMN "TB_SLE"."PRD_TYPE" IS '상품 제품 타입 : 1(액상), 2(정), 3(캡슐), 4(베지캡슐), 5(젤리), 6(분말), 7(츄어블)';

COMMENT ON COLUMN "TB_SLE"."COUNT_STOCK" IS '판매 상품 재고';

COMMENT ON COLUMN "TB_SLE"."CORP_NM" IS '회사명=브랜드명';

COMMENT ON COLUMN "TB_SLE"."POINT_STACK" IS '포인트 적립률';

COMMENT ON COLUMN "TB_SLE"."FLG_DELETE" IS '삭제 처리 여부 : N(기본값), Y(삭제 처리)';

COMMENT ON COLUMN "TB_SLE"."DT_SALE_START" IS '판매 시작 일시';

COMMENT ON COLUMN "TB_SLE"."DT_SALE_END" IS '판매 종료 일시';

COMMENT ON COLUMN "TB_SLE"."DISCOUNT" IS '할인율';

COMMENT ON COLUMN "TB_SLE"."ORIGIN_SALE" IS '원가';

COMMENT ON COLUMN "TB_SLE"."MARGIN_RATE" IS '마진율 : 기본값 1';

COMMENT ON COLUMN "TB_SLE"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_SLE"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_SLE"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_SLE"."UPDATER" IS '수정자';

CREATE TABLE "TB_SLE_IMG" (
	"SEQ_SLE_IMG"	NUMBER(10)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"IMG"	VARCHAR2(256)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL
);

COMMENT ON COLUMN "TB_SLE_IMG"."SEQ_SLE_IMG" IS '판매 상품 이미지 일련번호';

COMMENT ON COLUMN "TB_SLE_IMG"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_SLE_IMG"."IMG" IS '이미지';

COMMENT ON COLUMN "TB_SLE_IMG"."DT_REG" IS '등록일시';

COMMENT ON COLUMN "TB_SLE_IMG"."REGISTER" IS '등록자';

CREATE TABLE "TB_MBR_MST" (
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"EMAIL"	VARCHAR2(64)		NOT NULL,
	"PASSWD"	VARCHAR2(64)		NOT NULL,
	"FLG_SUR"	CHAR(1)		NULL,
	"CD_STATE"	NUMBER(3)		NOT NULL,
	"MBR_NM"	VARCHAR2(64)		NOT NULL,
	"AGE"	DATE		NOT NULL,
	"GENDER"	CHAR(1)		NOT NULL,
	"PHONE"	VARCHAR2(64)		NOT NULL,
	"TOTAL_POINT"	NUMBER(10)		NULL,
	"LAST_IP"	VARCHAR2(16)		NULL,
	"LAST_DT"	DATE		NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_MBR_MST"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_MBR_MST"."EMAIL" IS '이메일';

COMMENT ON COLUMN "TB_MBR_MST"."PASSWD" IS '비밀번호';

COMMENT ON COLUMN "TB_MBR_MST"."FLG_SUR" IS '맞춤 건강 분석';

COMMENT ON COLUMN "TB_MBR_MST"."CD_STATE" IS '상태 코드 : 폐기(-1), 대기(0), 사용중(1), 자퇴(8), 강퇴(9)';

COMMENT ON COLUMN "TB_MBR_MST"."MBR_NM" IS '성명';

COMMENT ON COLUMN "TB_MBR_MST"."AGE" IS '나이';

COMMENT ON COLUMN "TB_MBR_MST"."GENDER" IS '성별 : 남자(M), 여자(F)';

COMMENT ON COLUMN "TB_MBR_MST"."PHONE" IS '연락처(예: 010-9898-4526)';

COMMENT ON COLUMN "TB_MBR_MST"."TOTAL_POINT" IS '포인트 총합';

COMMENT ON COLUMN "TB_MBR_MST"."LAST_IP" IS '마지막 로그인 IPd';

COMMENT ON COLUMN "TB_MBR_MST"."LAST_DT" IS '마지막 로그인 일시';

COMMENT ON COLUMN "TB_MBR_MST"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_MBR_MST"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_MBR_MST"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_MBR_MST"."UPDATER" IS '수정자';

CREATE TABLE "TB_MBR_DTL" (
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"POST"	VARCHAR2(32)		NOT NULL,
	"ADDR1"	VARCHAR2(256)		NOT NULL,
	"ADDR2"	VARCHAR2(256)		NOT NULL,
	"FLG_SMS"	CHAR(1)		NOT NULL,
	"FLG_EMAIL"	CHAR(1)		NOT NULL,
	"DT_SMS"	DATE		NOT NULL,
	"DT_EMAIL"	DATE		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_MBR_DTL"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_MBR_DTL"."POST" IS '우편번호';

COMMENT ON COLUMN "TB_MBR_DTL"."ADDR1" IS '주소1';

COMMENT ON COLUMN "TB_MBR_DTL"."ADDR2" IS '주소2';

COMMENT ON COLUMN "TB_MBR_DTL"."FLG_SMS" IS '수신 여부 SMS';

COMMENT ON COLUMN "TB_MBR_DTL"."FLG_EMAIL" IS '수신 여부 EMAIL';

COMMENT ON COLUMN "TB_MBR_DTL"."DT_SMS" IS '수신 여부 SMS 일시';

COMMENT ON COLUMN "TB_MBR_DTL"."DT_EMAIL" IS '수신 여부 EMAIL 일시';

COMMENT ON COLUMN "TB_MBR_DTL"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_MBR_DTL"."UPDATER" IS '수정자';

CREATE TABLE "TB_TRM_AGR" (
	"SEQ_TRM_AGR"	NUMBER(19)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"SEQ_TRM"	NUMBER(3)		NOT NULL,
	"FLG_AGR"	CHAR(1)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL
);

COMMENT ON COLUMN "TB_TRM_AGR"."SEQ_TRM_AGR" IS '약관 동의 일련번호';

COMMENT ON COLUMN "TB_TRM_AGR"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_TRM_AGR"."SEQ_TRM" IS '약관 일련번호';

COMMENT ON COLUMN "TB_TRM_AGR"."FLG_AGR" IS '수락 여부';

COMMENT ON COLUMN "TB_TRM_AGR"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_TRM_AGR"."REGISTER" IS '등록자';

CREATE TABLE "TB_HP_SUR" (
	"SEQ_HP_SUR"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"AGE"	NUMBER(3)		NOT NULL,
	"GENDER"	CHAR(1)		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_HP_SUR"."SEQ_HP_SUR" IS '검사 일련번호';

COMMENT ON COLUMN "TB_HP_SUR"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_HP_SUR"."AGE" IS '나이';

COMMENT ON COLUMN "TB_HP_SUR"."GENDER" IS '성별';

COMMENT ON COLUMN "TB_HP_SUR"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_HP_SUR"."DT_REG" IS '등록일시';

COMMENT ON COLUMN "TB_HP_SUR"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_HP_SUR"."UPDATER" IS '수정자';

CREATE TABLE "TB_MNG" (
	"SEQ_MNG"	NUMBER(10)		NOT NULL,
	"EMAIL"	VARCHAR2(32)		NOT NULL,
	"PASSWD"	VARCHAR2(32)		NOT NULL,
	"CD_STATE"	NUMBER(3)		NOT NULL,
	"MNG_NM"	VARCHAR2(32)		NOT NULL,
	"PHONE"	VARCHAR2(16)		NOT NULL,
	"POST"	VARCHAR2(8)		NULL,
	"ADDR1"	VARCHAR2(128)		NULL,
	"ADDR2"	VARCHAR2(128)		NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_MNG"."SEQ_MNG" IS '관리자 일련번호';

COMMENT ON COLUMN "TB_MNG"."EMAIL" IS '이메일';

COMMENT ON COLUMN "TB_MNG"."PASSWD" IS '비밀번호';

COMMENT ON COLUMN "TB_MNG"."CD_STATE" IS '상태 코드: 대기(0), 사용중(1), 사퇴(8), 해고(9)';

COMMENT ON COLUMN "TB_MNG"."MNG_NM" IS '성명';

COMMENT ON COLUMN "TB_MNG"."PHONE" IS '연락처';

COMMENT ON COLUMN "TB_MNG"."POST" IS '우편번호';

COMMENT ON COLUMN "TB_MNG"."ADDR1" IS '주소1';

COMMENT ON COLUMN "TB_MNG"."ADDR2" IS '주소2';

COMMENT ON COLUMN "TB_MNG"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_MNG"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_MNG"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_MNG"."UPDATER" IS '수정자';

CREATE TABLE "TB_BUY_MST" (
	"SEQ_BUY_MST"	NUMBER(19)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"SEQ_MBR_ADDR"	NUMBER(10)		NOT NULL,
	"BUY_INFO"	VARCHAR2(128)		NOT NULL,
	"BUY_COUNT"	NUMBER(3)		NOT NULL,
	"BUY_PRICE"	NUMBER(10)		NOT NULL,
	"BUY_POINT"	NUMBER(10)		NOT NULL,
	"FLG_DELETE"	CHAR(1)		NULL,
	"CD_STATE"	CHAR(1)		NULL,
	"CD_STATE_PAY"	CHAR(1)		NULL,
	"CD_STATE_DELIVERY"	CHAR(1)		NULL,
	"USE_POINT"	NUMBER(10)		NULL,
	"DELIVERY_REQUEST"	VARCHAR2(128)		NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_BUY_MST"."SEQ_BUY_MST" IS '구매 마스터 일련번호';

COMMENT ON COLUMN "TB_BUY_MST"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_BUY_MST"."SEQ_MBR_ADDR" IS '배송지 일련번호';

COMMENT ON COLUMN "TB_BUY_MST"."BUY_INFO" IS '구매 상품 정보';

COMMENT ON COLUMN "TB_BUY_MST"."BUY_COUNT" IS '구매 상품 총 갯수';

COMMENT ON COLUMN "TB_BUY_MST"."BUY_PRICE" IS '구매 상품 총 금액';

COMMENT ON COLUMN "TB_BUY_MST"."BUY_POINT" IS '구매 상품 총 포인트';

COMMENT ON COLUMN "TB_BUY_MST"."FLG_DELETE" IS '삭제 처리 여부 : N(기본값), Y(삭제 처리)';

COMMENT ON COLUMN "TB_BUY_MST"."CD_STATE" IS '구매 상품 상태 : 결제 실패(NULL),1(결제), 2(취소), 3(교환), 4(환불)';

COMMENT ON COLUMN "TB_BUY_MST"."CD_STATE_PAY" IS '결제 상태 코드: 결제 실패(NULL), 실패(N), 성공(Y),  취소(C)';

COMMENT ON COLUMN "TB_BUY_MST"."CD_STATE_DELIVERY" IS '배송 상태 코드: 결제 실패(NULL), 판매 확인중(C), 배송 준비중(P), 배송중(D), 배송 완료(Y)';

COMMENT ON COLUMN "TB_BUY_MST"."USE_POINT" IS '가용 포인트';

COMMENT ON COLUMN "TB_BUY_MST"."DELIVERY_REQUEST" IS '배송 요청사항';

COMMENT ON COLUMN "TB_BUY_MST"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_BUY_MST"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_BUY_MST"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_BUY_MST"."UPDATER" IS '수정자';

CREATE TABLE "TB_BSK" (
	"SEQ_BSK"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"SLE_NM"	VARCHAR2(256)		NOT NULL,
	"PRICE"	NUMBER(10)		NOT NULL,
	"COUNT"	NUMBER(10)		NOT NULL,
	"IMG"	VARCHAR2(256)		NOT NULL,
	"POINT_STACK"	NUMBER(2)		NOT NULL,
	"CD_CTG_M"	CHAR(1)		NOT NULL,
	"CD_CTG_B"	CHAR(1)		NOT NULL,
	"PRICE_SALE"	NUMBER(10)		NOT NULL,
	"DISCOUNT"	NUMBER(2)		NULL,
	"FLG_DELETE"	CHAR(1)		NULL,
	"DT_REG"	DATE		NOT NULL,
	"DT_UPT"	DATE		NULL
);

COMMENT ON COLUMN "TB_BSK"."SEQ_BSK" IS '장바구니 일련번호';

COMMENT ON COLUMN "TB_BSK"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_BSK"."SEQ_SLE" IS '판매 일련번호';

COMMENT ON COLUMN "TB_BSK"."SLE_NM" IS '판매 상품명';

COMMENT ON COLUMN "TB_BSK"."PRICE" IS '판매 상품 가격';

COMMENT ON COLUMN "TB_BSK"."COUNT" IS '구매 수량';

COMMENT ON COLUMN "TB_BSK"."IMG" IS '판매 상품 이미지';

COMMENT ON COLUMN "TB_BSK"."POINT_STACK" IS '포인트 적립률';

COMMENT ON COLUMN "TB_BSK"."CD_CTG_M" IS '상품 카테고리 중분류 : 1-9';

COMMENT ON COLUMN "TB_BSK"."CD_CTG_B" IS '상품 카테고리 : 1(기능별), 2(성분별), 3(대상별)';

COMMENT ON COLUMN "TB_BSK"."PRICE_SALE" IS '판매 상품 원가 가격';

COMMENT ON COLUMN "TB_BSK"."DISCOUNT" IS '할인율';

COMMENT ON COLUMN "TB_BSK"."FLG_DELETE" IS '삭제 여부';

COMMENT ON COLUMN "TB_BSK"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_BSK"."DT_UPT" IS '수정 일시';

CREATE TABLE "TB_PAY" (
	"SEQ_PAY"	NUMBER(19)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"SEQ_BUY_MST"	NUMBER(19)		NOT NULL,
	"CD_PG"	NUMBER(3)		NOT NULL,
	"DEAL_NUM"	VARCHAR2(64)		NOT NULL,
	"CD_RESPONSE"	VARCHAR2(8)		NULL,
	"CD_PAY_METHOD"	NUMBER(3)		NULL,
	"FLG_SUCCESS"	CHAR(1)		NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(3)		NOT NULL
);

COMMENT ON COLUMN "TB_PAY"."SEQ_PAY" IS '결제 일련번호';

COMMENT ON COLUMN "TB_PAY"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_PAY"."SEQ_BUY_MST" IS '구매 마스터 일련번호';

COMMENT ON COLUMN "TB_PAY"."CD_PG" IS 'PG사 코드: 페이업(1)';

COMMENT ON COLUMN "TB_PAY"."DEAL_NUM" IS '거래(트랜잭션) 번호';

COMMENT ON COLUMN "TB_PAY"."CD_RESPONSE" IS '응답 코드(PG 기준)';

COMMENT ON COLUMN "TB_PAY"."CD_PAY_METHOD" IS '결제 수단 코드(예: 카드, 이체등)';

COMMENT ON COLUMN "TB_PAY"."FLG_SUCCESS" IS '성공 여부: 기본(NULL), 실패(N), 성공(Y)';

COMMENT ON COLUMN "TB_PAY"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_PAY"."REGISTER" IS '등록자';

CREATE TABLE "TB_BUY_DTL" (
	"SEQ_BUY_DTL"	NUMBER(19)		NOT NULL,
	"SEQ_BUY_MST"	NUMBER(19)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"SEQ_MBR_ADDR"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"SEQ_REVIEW"	NUMBER(10)		NULL,
	"SLE_NM"	VARCHAR2(256)		NOT NULL,
	"COUNT"	NUMBER(3)		NOT NULL,
	"PRICE"	NUMBER(10)		NOT NULL,
	"POINT"	NUMBER(10)		NOT NULL,
	"FLG_REVIEW"	CHAR(1)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL
);

COMMENT ON COLUMN "TB_BUY_DTL"."SEQ_BUY_DTL" IS '구매 상세 일련번호';

COMMENT ON COLUMN "TB_BUY_DTL"."SEQ_BUY_MST" IS '구매 마스터 일련번호';

COMMENT ON COLUMN "TB_BUY_DTL"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_BUY_DTL"."SEQ_MBR_ADDR" IS '배송지 일련번호';

COMMENT ON COLUMN "TB_BUY_DTL"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_BUY_DTL"."SEQ_REVIEW" IS '리뷰 일련번호';

COMMENT ON COLUMN "TB_BUY_DTL"."SLE_NM" IS '판매 상품명';

COMMENT ON COLUMN "TB_BUY_DTL"."COUNT" IS '판매 상품 개수';

COMMENT ON COLUMN "TB_BUY_DTL"."PRICE" IS '판매 상품 가격';

COMMENT ON COLUMN "TB_BUY_DTL"."POINT" IS '개별 포인트';

COMMENT ON COLUMN "TB_BUY_DTL"."FLG_REVIEW" IS '리뷰 처리';

COMMENT ON COLUMN "TB_BUY_DTL"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_BUY_DTL"."REGISTER" IS '등록자';

CREATE TABLE "TB_BBS" (
	"SEQ_BBS"	NUMBER(10)		NOT NULL,
	"SEQ_BBS_PARENT"	NUMBER(10)		NULL,
	"CD_BBS_TYPE"	NUMBER(3)		NULL,
	"TITLE"	VARCHAR2(512)		NOT NULL,
	"CD_CTG"	NUMBER(3)		NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"FLG_TOP"	CHAR(1)		NULL,
	"FLG_REPLY"	CHAR(1)		NULL,
	"FLG_DELETE"	CHAR(1)		NULL,
	"READED"	NUMBER(10)		NULL,
	"IMG"	VARCHAR2(256)		NULL,
	"FILE_SAVE"	VARCHAR2(256)		NULL,
	"FILE_ORIG"	VARCHAR2(64)		NULL,
	"SEQ_SLE"	NUMBER(10)		NULL,
	"CD_CTG_B"	CHAR(1)		NULL,
	"CD_CTG_M"	CHAR(1)		NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_BBS"."SEQ_BBS" IS '게시판 일련번호';

COMMENT ON COLUMN "TB_BBS"."SEQ_BBS_PARENT" IS '게시판 상위 일련번호(=문의 게시판 일련번호)';

COMMENT ON COLUMN "TB_BBS"."CD_BBS_TYPE" IS '게시판 타입 코드: 공지사항(1), FAQ(2), 고객문의(3), 새소식(4)';

COMMENT ON COLUMN "TB_BBS"."TITLE" IS '제목';

COMMENT ON COLUMN "TB_BBS"."CD_CTG" IS '카테고리: 가입 및 탈퇴(1), 상품(2), 구매(3), 결제(4), 배송(5), 환불(6), 기타(9)';

COMMENT ON COLUMN "TB_BBS"."CONTENT" IS '내용';

COMMENT ON COLUMN "TB_BBS"."FLG_TOP" IS '최상위 여부';

COMMENT ON COLUMN "TB_BBS"."FLG_REPLY" IS '답변 여부(문의)';

COMMENT ON COLUMN "TB_BBS"."FLG_DELETE" IS '삭제 처리 여부 : N(기본값), Y(삭제 처리)';

COMMENT ON COLUMN "TB_BBS"."READED" IS '조회수';

COMMENT ON COLUMN "TB_BBS"."IMG" IS '이미지';

COMMENT ON COLUMN "TB_BBS"."FILE_SAVE" IS '파일 저장명(경로 포함)';

COMMENT ON COLUMN "TB_BBS"."FILE_ORIG" IS '파일 원본명';

COMMENT ON COLUMN "TB_BBS"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_BBS"."CD_CTG_B" IS '상품 카테고리 : 1(기능별), 2(성분별), 3(대상별)';

COMMENT ON COLUMN "TB_BBS"."CD_CTG_M" IS '상품 카테고리 중분류 : 1-9';

COMMENT ON COLUMN "TB_BBS"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_BBS"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_BBS"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_BBS"."UPDATER" IS '수정자';

CREATE TABLE "TB_LIKE" (
	"SEQ_LIKE"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"FLG_LIKE"	CHAR(1)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_LIKE"."SEQ_LIKE" IS '찜 일련번호';

COMMENT ON COLUMN "TB_LIKE"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_LIKE"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_LIKE"."FLG_LIKE" IS '찜 표시';

COMMENT ON COLUMN "TB_LIKE"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_LIKE"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_LIKE"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_LIKE"."UPDATER" IS '수정자';

CREATE TABLE "TB_BEST" (
	"SEQ_BEST"	NUMBER(10)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"FLG_BEST"	CHAR(1)		NULL,
	"DT_REG"	DATE		NOT NULL,
	"COUNT"	NUMBER(10)		NOT NULL,
	"CD_CTG_B"	CHAR(1)		NOT NULL,
	"CD_CTG_M"	CHAR(1)		NOT NULL,
	"DT_UPT"	DATE		NULL
);

COMMENT ON COLUMN "TB_BEST"."SEQ_BEST" IS '인기 상품 일련번호';

COMMENT ON COLUMN "TB_BEST"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_BEST"."FLG_BEST" IS '베스트 상품 여부';

COMMENT ON COLUMN "TB_BEST"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_BEST"."COUNT" IS '판매 상품 개수';

COMMENT ON COLUMN "TB_BEST"."CD_CTG_B" IS '상품 카테고리 : 1(기능별), 2(성분별), 3(대상별)';

COMMENT ON COLUMN "TB_BEST"."CD_CTG_M" IS '상품 카테고리 중분류 : 1-9';

COMMENT ON COLUMN "TB_BEST"."DT_UPT" IS '수정 일시';

CREATE TABLE "TB_RATE" (
	"SEQ_RATE"	NUMBER(10)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"SEQ_REVIEW"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"COUNT"	NUMBER(10)		NOT NULL,
	"RATE_STAR"	NUMBER(10)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_RATE"."SEQ_RATE" IS '평가 일련번호';

COMMENT ON COLUMN "TB_RATE"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_RATE"."SEQ_REVIEW" IS '리뷰 일련번호';

COMMENT ON COLUMN "TB_RATE"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_RATE"."COUNT" IS '평점 개수';

COMMENT ON COLUMN "TB_RATE"."RATE_STAR" IS '평점';

COMMENT ON COLUMN "TB_RATE"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_RATE"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_RATE"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_RATE"."UPDATER" IS '수정자';

CREATE TABLE "TB_REVIEW" (
	"SEQ_REVIEW"	NUMBER(10)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"FLG_DELETE"	CHAR(1)		NOT NULL,
	"RATE_REVIEW"	VARCHAR2(1000)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_REVIEW"."SEQ_REVIEW" IS '리뷰 일련번호';

COMMENT ON COLUMN "TB_REVIEW"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_REVIEW"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_REVIEW"."FLG_DELETE" IS '삭제 처리';

COMMENT ON COLUMN "TB_REVIEW"."RATE_REVIEW" IS '리뷰 내용';

COMMENT ON COLUMN "TB_REVIEW"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_REVIEW"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_REVIEW"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_REVIEW"."UPDATER" IS '수정자';

CREATE TABLE "TB_REVIEW_IMG" (
	"SEQ_REVIEW_IMG"	NUMBER(10)		NOT NULL,
	"SEQ_REVIEW"	NUMBER(10)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"FILE_SAVE"	VARCHAR2(256)		NULL,
	"FILE_ORIG"	VARCHAR2(64)		NULL
);

COMMENT ON COLUMN "TB_REVIEW_IMG"."SEQ_REVIEW_IMG" IS '리뷰 이미지 일련번호';

COMMENT ON COLUMN "TB_REVIEW_IMG"."SEQ_REVIEW" IS '리뷰 일련번호';

COMMENT ON COLUMN "TB_REVIEW_IMG"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_REVIEW_IMG"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_REVIEW_IMG"."FILE_SAVE" IS '파일 저장명(경로 포함)';

COMMENT ON COLUMN "TB_REVIEW_IMG"."FILE_ORIG" IS '파일 원본명';

CREATE TABLE "TB_BEST_DTL" (
	"SEQ_BEST_DTL"	NUMBER(10)		NOT NULL,
	"SEQ_BEST"	NUMBER(10)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL,
	"CD_CTG_B"	CHAR(1)		NOT NULL,
	"CD_CTG_M"	CHAR(1)		NOT NULL,
	"DT_REG"	DATE		NOT NULL
);

COMMENT ON COLUMN "TB_BEST_DTL"."SEQ_BEST_DTL" IS '인기 상품 상세 일련번호';

COMMENT ON COLUMN "TB_BEST_DTL"."SEQ_BEST" IS '인기 상품 일련번호';

COMMENT ON COLUMN "TB_BEST_DTL"."SEQ_SLE" IS '판매 상품 일련번호';

COMMENT ON COLUMN "TB_BEST_DTL"."CD_CTG_B" IS '상품 카테고리 : 1(기능별), 2(성분별), 3(대상별)';

COMMENT ON COLUMN "TB_BEST_DTL"."CD_CTG_M" IS '상품 카테고리 중분류 : 1-9';

COMMENT ON COLUMN "TB_BEST_DTL"."DT_REG" IS '등록 일시';

CREATE TABLE "TB_MBR_ADDR" (
	"SEQ_MBR_ADDR"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"POST"	VARCHAR2(32)		NOT NULL,
	"ADDR1"	VARCHAR2(256)		NOT NULL,
	"ADDR2"	VARCHAR2(256)		NOT NULL,
	"FLG_DELETE"	CHAR(1)		NULL,
	"FLG_DEFAULT"	CHAR(1)		NOT NULL,
	"DT_REG"	DATE		NOT NULL,
	"REGISTER"	NUMBER(10)		NOT NULL,
	"DT_UPT"	DATE		NULL,
	"UPDATER"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "TB_MBR_ADDR"."SEQ_MBR_ADDR" IS '배송지 일련번호';

COMMENT ON COLUMN "TB_MBR_ADDR"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_MBR_ADDR"."POST" IS '우편번호';

COMMENT ON COLUMN "TB_MBR_ADDR"."ADDR1" IS '주소1';

COMMENT ON COLUMN "TB_MBR_ADDR"."ADDR2" IS '주소2';

COMMENT ON COLUMN "TB_MBR_ADDR"."FLG_DELETE" IS '삭제 처리 여부 : N(기본값), Y(삭제 처리)';

COMMENT ON COLUMN "TB_MBR_ADDR"."FLG_DEFAULT" IS '기본 배송지 여부';

COMMENT ON COLUMN "TB_MBR_ADDR"."DT_REG" IS '등록 일시';

COMMENT ON COLUMN "TB_MBR_ADDR"."REGISTER" IS '등록자';

COMMENT ON COLUMN "TB_MBR_ADDR"."DT_UPT" IS '수정 일시';

COMMENT ON COLUMN "TB_MBR_ADDR"."UPDATER" IS '수정자';

CREATE TABLE "TB_HP_SUR_DTL" (
	"SEQ_HP_SUR_DTL"	NUMBER(10)		NOT NULL,
	"SEQ_HP_SUR"	NUMBER(10)		NOT NULL,
	"SEQ_MBR"	NUMBER(10)		NOT NULL,
	"CD_CTG_M"	CHAR(1)		NOT NULL,
	"CD_CTG_B"	CHAR(1)		NOT NULL,
	"SEQ_SLE"	NUMBER(10)		NOT NULL
);

COMMENT ON COLUMN "TB_HP_SUR_DTL"."SEQ_HP_SUR_DTL" IS '검사 상세 일련번호';

COMMENT ON COLUMN "TB_HP_SUR_DTL"."SEQ_HP_SUR" IS '검사 일련번호';

COMMENT ON COLUMN "TB_HP_SUR_DTL"."SEQ_MBR" IS '회원 일련번호';

COMMENT ON COLUMN "TB_HP_SUR_DTL"."CD_CTG_M" IS '상품 카테고리 중분류 : 1-9';

COMMENT ON COLUMN "TB_HP_SUR_DTL"."CD_CTG_B" IS '상품 카테고리 : 1(기능별), 2(성분별), 3(대상별)';

COMMENT ON COLUMN "TB_HP_SUR_DTL"."SEQ_SLE" IS '판매 상품 일련번호';

ALTER TABLE "TB_SLE" ADD CONSTRAINT "PK_TB_SLE" PRIMARY KEY (
	"SEQ_SLE"
);

ALTER TABLE "TB_SLE_IMG" ADD CONSTRAINT "PK_TB_SLE_IMG" PRIMARY KEY (
	"SEQ_SLE_IMG"
);

ALTER TABLE "TB_MBR_MST" ADD CONSTRAINT "PK_TB_MBR_MST" PRIMARY KEY (
	"SEQ_MBR"
);

ALTER TABLE "TB_MBR_DTL" ADD CONSTRAINT "PK_TB_MBR_DTL" PRIMARY KEY (
	"SEQ_MBR"
);

ALTER TABLE "TB_TRM_AGR" ADD CONSTRAINT "PK_TB_TRM_AGR" PRIMARY KEY (
	"SEQ_TRM_AGR"
);

ALTER TABLE "TB_HP_SUR" ADD CONSTRAINT "PK_TB_HP_SUR" PRIMARY KEY (
	"SEQ_HP_SUR"
);

ALTER TABLE "TB_MNG" ADD CONSTRAINT "PK_TB_MNG" PRIMARY KEY (
	"SEQ_MNG"
);

ALTER TABLE "TB_BUY_MST" ADD CONSTRAINT "PK_TB_BUY_MST" PRIMARY KEY (
	"SEQ_BUY_MST"
);

ALTER TABLE "TB_BSK" ADD CONSTRAINT "PK_TB_BSK" PRIMARY KEY (
	"SEQ_BSK"
);

ALTER TABLE "TB_PAY" ADD CONSTRAINT "PK_TB_PAY" PRIMARY KEY (
	"SEQ_PAY"
);

ALTER TABLE "TB_BUY_DTL" ADD CONSTRAINT "PK_TB_BUY_DTL" PRIMARY KEY (
	"SEQ_BUY_DTL"
);

ALTER TABLE "TB_BBS" ADD CONSTRAINT "PK_TB_BBS" PRIMARY KEY (
	"SEQ_BBS"
);

ALTER TABLE "TB_LIKE" ADD CONSTRAINT "PK_TB_LIKE" PRIMARY KEY (
	"SEQ_LIKE"
);

ALTER TABLE "TB_BEST" ADD CONSTRAINT "PK_TB_BEST" PRIMARY KEY (
	"SEQ_BEST"
);

ALTER TABLE "TB_RATE" ADD CONSTRAINT "PK_TB_RATE" PRIMARY KEY (
	"SEQ_RATE"
);

ALTER TABLE "TB_REVIEW" ADD CONSTRAINT "PK_TB_REVIEW" PRIMARY KEY (
	"SEQ_REVIEW"
);

ALTER TABLE "TB_REVIEW_IMG" ADD CONSTRAINT "PK_TB_REVIEW_IMG" PRIMARY KEY (
	"SEQ_REVIEW_IMG"
);

ALTER TABLE "TB_BEST_DTL" ADD CONSTRAINT "PK_TB_BEST_DTL" PRIMARY KEY (
	"SEQ_BEST_DTL"
);

ALTER TABLE "TB_MBR_ADDR" ADD CONSTRAINT "PK_TB_MBR_ADDR" PRIMARY KEY (
	"SEQ_MBR_ADDR"
);

ALTER TABLE "TB_HP_SUR_DTL" ADD CONSTRAINT "PK_TB_HP_SUR_DTL" PRIMARY KEY (
	"SEQ_HP_SUR_DTL"
);

ALTER TABLE "TB_MBR_DTL" ADD CONSTRAINT "FK_TB_MBR_MST_TO_TB_MBR_DTL_1" FOREIGN KEY (
	"SEQ_MBR"
)
REFERENCES "TB_MBR_MST" (
	"SEQ_MBR"
);

