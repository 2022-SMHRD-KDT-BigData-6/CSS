package kr.smhrd.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.smhrd.service.FileService;

@Controller
public class FileController {

	@Autowired
	private FileService service;
	
	@RequestMapping("/Home")
	public String Home() {
		return "Home";
	}

//	redirect:/
	@RequestMapping("/RecogSl")
	public String RecogSl() {
		return "RecogSl";
	}	
	
	@RequestMapping("/FreqSl")
	public String FreqSl() {
		return "FreqSl";
	}
	
}
