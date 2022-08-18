package kr.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.model.FreqVO;
import kr.smhrd.model.RecogVO;
import kr.smhrd.service.FreqService;

@RestController
public class FreqRESTController {

	@Autowired
	private FreqService fservice;

	@RequestMapping("/freqListAjax.do")
	public List<FreqVO> freqListAjax() {
		List<FreqVO> flist = fservice.freqListAjax();

		return flist;
	}

	@RequestMapping("/seldateFreqAjax.do")
	public List<FreqVO> seldateFreqAjax(String sdate) {
		List<FreqVO> searchlist = fservice.seldateFreqAjax(sdate);

		return searchlist;
	}

	@RequestMapping("/insertslAjax.do")
	public void insertsl(String sl_index) {
		RecogVO vo = new RecogVO();
		int sl_index2 = Integer.parseInt(sl_index);
		vo.setSl_index(sl_index2);
		fservice.insertsl(vo);
	}

	@RequestMapping("/selectslAjax.do")
	public RecogVO selectsl(int sl_index) {
		RecogVO vo = fservice.selectsl(sl_index);
		return vo;
	}

}
