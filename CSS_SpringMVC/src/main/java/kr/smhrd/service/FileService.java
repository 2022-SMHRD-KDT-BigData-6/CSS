package kr.smhrd.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileService {

	public Map upload(MultipartHttpServletRequest multipart, String path) {

		// 1. multipart 안에서 데이터를 하나씩 꺼내와서 정제
		Enumeration<String> data = multipart.getParameterNames();  // 열거형 자료형
 
		Map map = new HashMap();  // <K, V>는 삭제가능, Map으로 업캐스팅... 
		
		// 2. data안에는 parametername값들이 하나씩 들어가 있을거다. (몇 개인지 정확하지 않다)
		while(data.hasMoreElements()) {  // data가 있는 동안만 반복 hasMoreElements()가 값이 있을때 true로 반환 
			String key = data.nextElement();   // name
			String value = multipart.getParameter(key);  // name의 value값
			
			map.put(key, value);
		}		
		// input type이  "text" / "password" / "textarea" 를 위한 코드
		////////////////////////////////////////////////////////////////////////////// 
		
		
		// 3. input type이 file을 위한 코드 : file들도 하나씩 가져와서 정제하는 작업
		Iterator<String> it = multipart.getFileNames();
		List<String> list = new ArrayList<String>(); // 파일 이름을 저장할 변수 --> result.jsp로 보내주기 위해
		
		while(it.hasNext()){
			// 파일 명칭 하나씩 가져오기  file1, file2, file2,....
			String fileName = it.next();
			// 실제 파일을 multipart로부터 꺼내오기 --> name값에 대응하는 value 꺼내오기
			MultipartFile realFile = multipart.getFile(fileName);
			// list에 저장할 수 있게끔 String형식으로 변환
			String f = realFile.getOriginalFilename();
			list.add(f);  // --> result.jsp에 보내주기 위해서 저장하는 중!!!
			
			// 파일 업로드
			File file = new File(path+"\\"+f);
			
			// 파일이 존재하는지 여부 체크 : 0이 아닌 경우
			if(realFile.getSize() != 0) {
				
				try {
					realFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}		
		}
		
		map.put("fileList", list);
		
		// 파일에 대한 정보 + input 태그안에 들어있는 정보가 한번에 담겨져 있는 자료
		return map; 		
		
	}

	
}
