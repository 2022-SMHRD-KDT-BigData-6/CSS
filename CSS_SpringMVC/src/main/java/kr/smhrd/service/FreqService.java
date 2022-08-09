package kr.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.smhrd.mapper.FreqMapper;
import kr.smhrd.model.FreqVO;

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



}
