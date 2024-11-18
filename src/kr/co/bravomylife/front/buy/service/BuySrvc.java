/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BuySrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241003231521][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.buy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.front.buy.dao.BuyDao;
import kr.co.bravomylife.front.buy.dto.BuyDataDto;
import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyDto;
import kr.co.bravomylife.front.buy.dto.BuyListDto;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.pay.dao.PayDao;
import kr.co.bravomylife.front.pay.dto.PayDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.buy.service.BuySrvc")
public class BuySrvc {
	
	@Inject
	BuyDao buyDao;
	
	@Inject
	PayDao payDao;
	
	public BuyMasterDto pointUseHistoryMain(BuyMasterDto buyMasterDto) {
		return buyDao.pointUseHistoryMain(buyMasterDto);
	}
	
	@Transactional("txFront")
	public boolean updateByDealNum(String deal_num, int updater, String flg_success) {
		
		int result = 0;
		
		PayDto payDto = new PayDto();
		payDto.setDeal_num(deal_num);
		payDto.setFlg_success(flg_success);			// 성공(Y), 실패(N)
		result += payDao.updateByDealNum(payDto);
		
		payDto = payDao.select(payDto);
		BuyMasterDto buyMasterDto = new BuyMasterDto();
		buyMasterDto.setSeq_buy_mst(payDto.getSeq_buy_mst());
		buyMasterDto.setCd_state_pay(flg_success);	// 결제 전(NULL), 결제 완료(Y), 결제 실패(N), 결제 취소(C)
		buyMasterDto.setUpdater(updater);
		result += buyDao.update(buyMasterDto);
		
		if (result == 2) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}

	@Transactional("txFront")
	public boolean historyDelete(BuyDto buyDto) {
		
		int result = buyDao.historyDelete(buyDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public BuyListDto mergedcancelList(BuyListDto cancelListMst, BuyListDto cancelListDtl) {
		
		List<BuyDto> cancelMst = (List<BuyDto>) cancelListMst.getList();
		List<BuyDto> cancelDtl = (List<BuyDto>) cancelListDtl.getList();
		
		Map<Integer, List<BuyDataDto>> cancelMap = new HashMap<>();
		
		for (BuyDto listDtl : cancelDtl) {
			
			int seqBuyMst = listDtl.getSeq_buy_mst();
			String sleNm = listDtl.getSle_nm();
			int count = listDtl.getCount();
			int price = listDtl.getPrice();
			String img = listDtl.getImg();
			int totalPrice = listDtl.getTotal_price();
			
			if (!cancelMap.containsKey(seqBuyMst)) {
				
				cancelMap.put(seqBuyMst, new ArrayList<>());
			}
			BuyDataDto buyDataDto = new BuyDataDto();
			buyDataDto.setSle_nm(sleNm);
			buyDataDto.setCount(count);
			buyDataDto.setPrice(price);
			buyDataDto.setImg(img);
			buyDataDto.setTotal_price(totalPrice);
			
			cancelMap.get(seqBuyMst).add(buyDataDto);
		}
		for (BuyDto listMst : cancelMst) {
			
			int seqBuyMst = listMst.getSeq_buy_mst();
			
			List<BuyDataDto> cancelResultList = cancelMap.get(seqBuyMst);
			
			if (cancelResultList != null) {
				
				listMst.setBuyDatas(cancelResultList);
			}
		}
		BuyListDto mergedCancelListDto = new BuyListDto();
		mergedCancelListDto.setBuy(cancelListMst.getBuy());
		mergedCancelListDto.setList(cancelMst);
		
		return mergedCancelListDto;
	}
	
	public BuyListDto cancelDtl(BuyDto buyDto) {
		
		BuyListDto buyListDto = new BuyListDto();
		
		buyListDto.setList(buyDao.cancelDtl(buyDto));
		
		return buyListDto;
	}
	
	@SuppressWarnings("unchecked")
	public BuyListDto cancelMst(BuyDto buyDto) {
		
		BuyListDto buyListDto = new BuyListDto();
		
		buyListDto.setList(buyDao.cancelMst(buyDto));
		
		List<BuyDto> buyList = (List<BuyDto>) buyListDto.getList();
		
		int seqButMst = buyList.get(0).getSeq_buy_mst();
		int seqPay = buyList.get(0).getSeq_pay();
		String dealNum = buyList.get(0).getDeal_num();
		String cdState = buyList.get(0).getCd_state();
		int buyPrice = buyList.get(0).getBuy_price();
		int totalPriceSum = buyList.get(0).getTotal_price_sum();
		String dtReg = buyList.get(0).getDt_reg();
		String dtUpt = buyList.get(0).getDt_upt();
		
		buyDto.setSeq_buy_mst(seqButMst);
		buyDto.setSeq_pay(seqPay);
		buyDto.setDeal_num(dealNum);
		buyDto.setCd_state(cdState);
		buyDto.setBuy_price(buyPrice);
		buyDto.setTotal_price_sum(totalPriceSum);
		buyDto.setDt_reg(dtReg);
		buyDto.setDt_upt(dtUpt);
		
		buyListDto.setBuy(buyDto);
		
		return buyListDto;
	}
	
	@SuppressWarnings("unchecked")
	public BuyListDto mergedbuyDelivery(BuyListDto deliveryListMst, BuyListDto deliveryListDtl) {
		
		List<BuyDto> deliveryMst = (List<BuyDto>) deliveryListMst.getList();
		List<BuyDto> deliveryDtl = (List<BuyDto>) deliveryListDtl.getList();
		
		Map<Integer, List<BuyDataDto>> deliveryMap = new HashMap<>();
		
		for (BuyDto listDtl : deliveryDtl) {
			
			int seqBuyMst = listDtl.getSeq_buy_mst();
			String sleNm = listDtl.getSle_nm();
			int count = listDtl.getCount();
			int price = listDtl.getPrice();
			
			if (!deliveryMap.containsKey(seqBuyMst)) {
				
				deliveryMap.put(seqBuyMst, new ArrayList<>());
			}
			BuyDataDto buyDataDto = new BuyDataDto();
			buyDataDto.setSle_nm(sleNm);
			buyDataDto.setCount(count);
			buyDataDto.setPrice(price);
			
			deliveryMap.get(seqBuyMst).add(buyDataDto);
		}
		for (BuyDto listMst : deliveryMst) {
			
			int seqBuyMst = listMst.getSeq_buy_mst();
			
			List<BuyDataDto> buyDeliveryList = deliveryMap.get(seqBuyMst);
			
			if (buyDeliveryList != null) {
				
				listMst.setBuyDatas(buyDeliveryList);
			}
		}
		BuyListDto mergedDeliveryListDto = new BuyListDto();
		mergedDeliveryListDto.setBuy(deliveryListMst.getBuy());
		mergedDeliveryListDto.setList(deliveryMst);
		
		return mergedDeliveryListDto;
	}
	
	public BuyListDto deliveryListDtl(BuyDto buyDto) {
		
		BuyListDto buyListDto = new BuyListDto();
		
		buyListDto.setList(buyDao.deliveryListDtl(buyDto));
		
		return buyListDto;
	}
	
	public BuyListDto deliveryListMst(BuyDto buyDto) {
		
		BuyListDto buyListDto = new BuyListDto();
		
		buyListDto.setList(buyDao.deliveryListMst(buyDto));
		
		return buyListDto;
	}
	
	public PagingListDto pointListDtl(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = buyDao.buyPointCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.pointListDtl(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto pointListMst(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = buyDao.buyPointCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.pointListMst(pagingDto));
		
		return pagingListDto;
	}
	
	@SuppressWarnings("unchecked")
	public PagingListDto mergedPointList(PagingListDto pointListMst, PagingListDto pointListDtl) {
		
		List<BuyMasterDto> pointListMstList = (List<BuyMasterDto>) pointListMst.getList();
		List<BuyDetailDto> pointListDtlList = (List<BuyDetailDto>) pointListDtl.getList();
		
		Map<Integer, List<BuyDataDto>> pointMap = new HashMap<>();
		
		for (BuyDetailDto pointDtl : pointListDtlList) {
			
			int seqBuyMst = pointDtl.getSeq_buy_mst();
			int seqBuyDtl = pointDtl.getSeq_buy_dtl();
			int seqSle = pointDtl.getSeq_sle();
			String sleNm = pointDtl.getSle_nm();
			int count = pointDtl.getCount();
			int price = pointDtl.getPrice();
			String dtReg = pointDtl.getDt_reg();
			String img = pointDtl.getImg();
			int discount_sale = pointDtl.getDiscount_sale();
			int point_stack = pointDtl.getPoint_stack();
			String cd_ctg_m = pointDtl.getCd_ctg_m();
			String cd_ctg_b = pointDtl.getCd_ctg_b();
			int price_sale = pointDtl.getPrice_sale();
			int discount = pointDtl.getDiscount();
			
			if (!pointMap.containsKey(seqBuyMst)) {
				
				pointMap.put(seqBuyMst, new ArrayList<>());
			}
			BuyDataDto buyDataDto = new BuyDataDto();
			buyDataDto.setSeq_buy_dtl(seqBuyDtl);
			buyDataDto.setSeq_sle(seqSle);
			buyDataDto.setSle_nm(sleNm);
			buyDataDto.setCount(count);
			buyDataDto.setPrice(price);
			buyDataDto.setDt_reg(dtReg);
			buyDataDto.setImg(img);
			buyDataDto.setDiscount_sale(discount_sale);
			buyDataDto.setPoint_stack(point_stack);
			buyDataDto.setCd_ctg_m(cd_ctg_m);
			buyDataDto.setCd_ctg_b(cd_ctg_b);
			buyDataDto.setPrice_sale(price_sale);
			buyDataDto.setDiscount(discount);
			
			pointMap.get(seqBuyMst).add(buyDataDto);
		}
		for (BuyMasterDto pointMst : pointListMstList) {
			
			int seqBuyMst = pointMst.getSeq_buy_mst();
			
			List<BuyDataDto> buyDataList = pointMap.get(seqBuyMst);
			
			if (buyDataList != null) {
				
				pointMst.setBuyDatas(buyDataList);
			}
		}
		PagingListDto mergedPointListDto = new PagingListDto();
		mergedPointListDto.setPaging(pointListMst.getPaging());
		mergedPointListDto.setList(pointListMstList);
		
		return mergedPointListDto;
	}
	
	@SuppressWarnings("unchecked")
	public PagingListDto mergedBuyList(PagingListDto buyListMst, PagingListDto buyListDtl) {
		
		List<BuyMasterDto> buyListMstList = (List<BuyMasterDto>) buyListMst.getList();
		List<BuyDetailDto> buyListDtlList = (List<BuyDetailDto>) buyListDtl.getList();
		
		Map<Integer, List<BuyDataDto>> buyMap = new HashMap<>();
		
		for (BuyDetailDto buyDtl : buyListDtlList) {
			
			int seqBuyMst = buyDtl.getSeq_buy_mst();
			int seqBuyDtl = buyDtl.getSeq_buy_dtl();
			int seqSle = buyDtl.getSeq_sle();
			String sleNm = buyDtl.getSle_nm();
			int count = buyDtl.getCount();
			int price = buyDtl.getPrice();
			String dtReg = buyDtl.getDt_reg();
			String img = buyDtl.getImg();
			int discount_sale = buyDtl.getDiscount_sale();
			int point_stack = buyDtl.getPoint_stack();
			String cd_ctg_m = buyDtl.getCd_ctg_m();
			String cd_ctg_b = buyDtl.getCd_ctg_b();
			int price_sale = buyDtl.getPrice_sale();
			int discount = buyDtl.getDiscount();
			
			if (!buyMap.containsKey(seqBuyMst)) {
				
				buyMap.put(seqBuyMst, new ArrayList<>());
			}
			BuyDataDto buyDataDto = new BuyDataDto();
			buyDataDto.setSeq_buy_dtl(seqBuyDtl);
			buyDataDto.setSeq_sle(seqSle);
			buyDataDto.setSle_nm(sleNm);
			buyDataDto.setCount(count);
			buyDataDto.setPrice(price);
			buyDataDto.setDt_reg(dtReg);
			buyDataDto.setImg(img);
			buyDataDto.setDiscount_sale(discount_sale);
			buyDataDto.setPoint_stack(point_stack);
			buyDataDto.setCd_ctg_m(cd_ctg_m);
			buyDataDto.setCd_ctg_b(cd_ctg_b);
			buyDataDto.setPrice_sale(price_sale);
			buyDataDto.setDiscount(discount);
			
			buyMap.get(seqBuyMst).add(buyDataDto);
		}
		for (BuyMasterDto buyMst : buyListMstList) {
			
			int seqBuyMst = buyMst.getSeq_buy_mst();
			
			List<BuyDataDto> buyDataList = buyMap.get(seqBuyMst);
			
			if (buyDataList != null) {
				
				buyMst.setBuyDatas(buyDataList);
			}
		}
		PagingListDto mergedBuyListDto = new PagingListDto();
		mergedBuyListDto.setPaging(buyListMst.getPaging());
		mergedBuyListDto.setList(buyListMstList);
		
		return mergedBuyListDto;
	}
	
	public PagingListDto buyListDtl(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = buyDao.buyCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.buyListDtl(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto buyListMst(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = buyDao.buyCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.buyListMst(pagingDto));
		
		return pagingListDto;
	}
	
	@Transactional("txFront")
	public boolean updateCancle(BuyDetailDto buyDetailDto) {
		
		int result = buyDao.updateCancle(buyDetailDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public BuyDetailDto cancel(BuyDetailDto buyDetailDto) {
		return buyDao.cancel(buyDetailDto);
	}
	
	public PagingListDto pointHistory(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = buyDao.pointCount(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.pointHistory(pagingDto));
		
		return pagingListDto;
	}
	
	@Transactional("txFront")
	public boolean update(String deal_num, int updater, String flg_success) {
		
		int result = 0;
				
		// Null 체크 필요
		if (deal_num == null || flg_success == null) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return false;
			}
		
		PayDto payDto = new PayDto();
		payDto.setDeal_num(deal_num);
		payDto.setFlg_success(flg_success);			// 성공(Y), 실패(N)
		result += payDao.update(payDto);
		
		// payDto가 null일 경우를 대비한 처리
		payDto = payDao.select(payDto);
			if (payDto == null) {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return false;
			}
			
			System.out.println("seq_buy_mst 확인" + payDto.getSeq_buy_mst());
			
		BuyMasterDto buyMasterDto = new BuyMasterDto();
		buyMasterDto.setSeq_buy_mst(payDto.getSeq_buy_mst());
		buyMasterDto.setCd_state_pay(flg_success);	// 결제 완료(Y), 결제 전(N), 결제 취소(C)
		buyMasterDto.setUpdater(updater);
		result += buyDao.update(buyMasterDto);
		
		if (result == 2) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean insert(BuyMasterDto buyMasterDto, ArrayList<BuyDetailDto> listBuyDetailDto, String deal_num, MemberDto memberDto) {
			
		int result = 0;
		int bestCount = 0;
		
		// 구매 마스터 정보
		buyMasterDto.setSeq_buy_mst(buyDao.sequenceMaster());
		result += buyDao.insertMaster(buyMasterDto);
		
		// 구매 상세 정보들
		for (int loop = 0; loop < listBuyDetailDto.size(); loop++) {
			
			listBuyDetailDto.get(loop).setSeq_best(buyDao.sequenceBest());
			listBuyDetailDto.get(loop).setSeq_buy_dtl(buyDao.sequenceDetail());
			listBuyDetailDto.get(loop).setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
			listBuyDetailDto.get(loop).setRegister(buyMasterDto.getRegister());
			listBuyDetailDto.get(loop).setSeq_mbr_addr(memberDto.getSeq_mbr_addr());
			
			result += buyDao.insertDetail(listBuyDetailDto.get(loop));
			result += buyDao.updateCountStock(listBuyDetailDto.get(loop));
			
			int check = buyDao.insertBestCheck(listBuyDetailDto.get(loop));
			
			if (check >= 1) {
				
				buyDao.updateBestMst(listBuyDetailDto.get(loop));
			}
			else if (check == 0) {
				
				buyDao.insertBestMst(listBuyDetailDto.get(loop));
			}
			bestCount = listBuyDetailDto.get(loop).getCount();
			
			for (int _loop = 0; _loop < bestCount; _loop++) {
				
				buyDao.insertBest(listBuyDetailDto.get(loop));
			}
			
			buyDao.updateBasket(listBuyDetailDto.get(loop));
		}
		
		// 결제 정보
		PayDto payDto = new PayDto();
		payDto.setSeq_pay(payDao.sequence());
		payDto.setSeq_mbr(buyMasterDto.getSeq_mbr());
		payDto.setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
		payDto.setDeal_num(deal_num);
		payDto.setRegister(buyMasterDto.getSeq_mbr());
		result += payDao.insert(payDto);
		
		if (result == 1 + listBuyDetailDto.size() + listBuyDetailDto.size() + 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public String selectTotal(BuyDetailDto buyDetailDto) {
		return buyDao.selectTotal(buyDetailDto);
	}
	
	public List<BuyDetailDto> historyList(BuyDetailDto buyDetailDto) {
		return buyDao.historyList(buyDetailDto);
	}
}
