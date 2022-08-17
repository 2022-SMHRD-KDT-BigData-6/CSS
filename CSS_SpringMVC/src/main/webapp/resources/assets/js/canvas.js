	

	const videoElement = document.getElementsByClassName('input_video')[0];
    const canvasElement = document.getElementsByClassName('output_canvas')[0];
    const canvasCtx = canvasElement.getContext('2d');
    
    
    function wait(sec) {
    let start = Date.now(), now = start;
    while (now - start < sec * 10) {
        now = Date.now();
    }
	}
    let dictObject = {}
    dictObject['x'] = null;
	dictObject['y'] = null;
	dictObject['z'] = null;
    let left=[];
	let right=[];
   function onResults(results) {
  	canvasCtx.save();
  	canvasCtx.clearRect(0, 0, canvasElement.width, canvasElement.height);
  	canvasCtx.drawImage(
      results.image, 0, 0, canvasElement.width, canvasElement.height);
  if (results.multiHandLandmarks) {
    for (const landmarks of results.multiHandLandmarks) {
     for(var i=0; i<2; i++){
          drawConnectors(canvasCtx, landmarks, HAND_CONNECTIONS,
                     {color: 'blue', lineWidth: 5});
          drawLandmarks(canvasCtx, landmarks, {color: 'red', lineWidth: 2});

      }
    
       //if((results.multiHandedness[0].index)==1){
       //console.log("왼손")
       //}else{
       //console.log("오른손")
       //}
      if((results.multiHandLandmarks.length)>=1){
        if((results.multiHandLandmarks.length)==2){
          for (var ii =0;ii<21;ii++){
          left.push(results.multiHandLandmarks[0][ii]);
          right.push(results.multiHandLandmarks[1][ii]);
          }
        }else{
          if((results.multiHandedness[0].index)==1){
            for (var ii =0;ii<21;ii++){
              left.push(results.multiHandLandmarks[0][ii]); 
              right.push(dictObject);
            }
          }else{
            for (var ii =0;ii<21;ii++){
              left.push(dictObject);
              right.push(results.multiHandLandmarks[0][ii]); 

          }


        }
			
        }
      }
      else{
      }
    
       	
  }

  
  }

}

canvasCtx.restore();
   
   
   
   
   
   
   
   
   
   
   
    const hands = new Hands({locateFile: (file) => {
      return `https://cdn.jsdelivr.net/npm/@mediapipe/hands/${file}`;
    }});
    hands.setOptions({
      maxNumHands: 2,
      modelComplexity: 1,
      minDetectionConfidence: 0.6,
      minTrackingConfidence: 0.6
    });
    hands.onResults(onResults);
    
     const camera = new Camera(videoElement, {
     onFrame: async () => {
     await hands.send({image: videoElement});
      },
      width: 1920,
      height: 1080
    });
    camera.start();

    
    
    
   $('button').click(function() {
		// 1. 버튼을 클릭하면 서버에 데이터를 요청하는 ajax 함수를 실행
		Give(); // --->호출!!!
	})

	// 2. 서버에 요청하는 ajax 함수를 생성
	function Give() {
		console.log(left);
		console.log(right);
		$.ajax({
			// 서버 url
			url : 'http://172.30.1.10:8081/urlmapping',
			data : {"left" : JSON.stringify(left),
			"right": JSON.stringify(right)},
			type : "POST",
			success : function(res) {
				console.log(res);
				
				
				
				
				
				
				
				function listView(data){
    		console.log(data);	     		
    		var blist = ""; 
    			blist += "<br><br><img class='img' src='resources/slimg3/"+data.sl_index+".jpg'>"
    			blist += "<br><br><h3>　　　　　　"+data.sl_word+"</h3>" 
    		$('#image1').html(blist);    	
    	 }
	
    function selectsl(){
	    	$.ajax({
	    		url:'${cpath}/selectslAjax.do',
	    		type : 'get',
	    		data:{'sl_index':res},
	    		dataType : 'json',
	    		success : listView,
	    		error: function(){
	    			alert("실패!");
	    		}
	    	})	
    	}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			},
			error : function() {
				alert('실패!');
			}
		})
	} 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    