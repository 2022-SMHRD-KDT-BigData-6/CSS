package kr.smhrd.mapper;

import java.util.List;

import kr.smhrd.model.FreqVO;

public interface FreqMapper {
	
	public List<FreqVO> freqList();

	public List<FreqVO> searchList(String sdate);

}
