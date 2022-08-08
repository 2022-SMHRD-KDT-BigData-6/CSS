package kr.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.model.FreqVO;
import kr.smhrd.service.FreqService;

@RestController
public class FreqRESTController {

	@Autowired
	private FreqService fservice;
	
	@RequestMapping("/freqListAjax.do")
	public List<FreqVO> freqListAjax(){
		List<FreqVO> flist = fservice.freqListAjax();
		
		return flist;		
	}
	
	@RequestMapping("/seldateFreqAjax.do")
	public List<FreqVO> seldateFreqAjax(String sdate){
		List<FreqVO> searchlist = fservice.seldateFreqAjax(sdate);
		
		return searchlist;
	}
}
