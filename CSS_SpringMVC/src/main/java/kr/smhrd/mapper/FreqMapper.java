package kr.smhrd.mapper;

import java.util.List;

import kr.smhrd.model.FreqVO;
import kr.smhrd.model.RecogVO;

public interface FreqMapper {
	
	public List<FreqVO> freqList();

	public List<FreqVO> searchList(String sdate);
	
	public void insertsl(FreqVO vo);
	
	public RecogVO selectsl(int sl_index);
	
	public RecogVO selectuse(RecogVO vo);

}
