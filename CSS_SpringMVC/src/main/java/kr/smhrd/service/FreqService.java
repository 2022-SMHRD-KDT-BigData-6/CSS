package kr.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.smhrd.mapper.FreqMapper;
import kr.smhrd.model.FreqVO;
import kr.smhrd.model.RecogVO;

@Service
public class FreqService {
	
	@Autowired 	
	private FreqMapper fmapper;

	public List<FreqVO> freqListAjax() {
		List<FreqVO> flist = fmapper.freqList();
		return flist;
	}

	public List<FreqVO> seldateFreqAjax(String sdate) {
		List<FreqVO> searchlist = fmapper.searchList(sdate);		
		return searchlist;
	}
	
	public String insertsl(RecogVO vo) {
		RecogVO vo2 = fmapper.selectuse(vo);
		FreqVO vo3 = new FreqVO();
		vo3.setSl_index(vo2.getSl_index());
		vo3.setSl_word(vo2.getSl_word());		
		fmapper.insertsl(vo3);
		return vo.getSl_word();
	}
	
	public RecogVO selectsl(int sl_index) {
		System.out.println("현재상태는?"+sl_index);
		RecogVO vo = fmapper.selectsl(sl_index);
		return vo;
	}

	
	

}
