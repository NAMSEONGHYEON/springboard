<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<style>
#modDiv{
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;	
}
</style>
</head>
<body>
	<h2>Ajax Test Page</h2>
	<div>
		<div>
			REPLYER <input type='text' name='replyer' id='newReplyWriter'>
		</div>
		<div>
			REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	<div id='modDiv' style="display:none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>	
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
			<button type="button" id="CloseBtn">Close</button>		
		</div>
	</div>
	
	
	<ul id="replies"></ul>
	
	<ul class="pagination"></ul>
	
	<script>
	var bno =9;
	getPageList(1);
	function getAllList(){
	$.getJSON("/replies/all/"+bno, function(data){
	
		var str="";
		console.log(data.length);
		
		$(data).each(
			function(){
				str+="<li data-rno='"+ this.rno+"' class='replyLi'>"+this.rno+ ":" + this.replytext+"<button>수정</button></li>";
			});
		$("#replies").html(str);		
	});
	}
	
	
	$("#replyAddBtn").on("click", function(){
		var replyer = $("#newReplyWriter").val();
		var replytext = $("#newReplyText").val();
		
		$.ajax({
			type:'post',
			url:'/replies/',
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dateType:'text',
			data:JSON.stringify({
				bno:bno,
				replyer:replyer,
				replytext:replytext
			}),
			success:function(result){
				console.log(result);
				if(result=='success'){
					alert("등록되었습니다");
					getAllList();
				}
			}
		});
	});
	
	
	$("#replies").on("click", ".replyLi button",function(){
		var reply = $(this).parent();
		
		var rno = reply.attr("data-rno");
		var replytext = reply.text();
		
		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
		
		/* console.log(replytext);
		alert(rno+":"+replytext); */
	});
	
	$("#replyDelBtn").on("click", function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'delete',
			url:'/replies/'+rno,
			header:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"DELETE"
			},
			dateType:'text',
			success:function(result){
				console.log("result: "+result);
				if(result=='success'){
					alert("삭제되었습니다.");
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});
	
	$("#CloseBtn").on("click",function(){
		$("#modDiv").hide("slow");
		getAllList();
	});
	
	$("#replyModBtn").on("click", function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'patch',
			url:'/replies/'+rno,
			header:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PATCH"},
			data:JSON.stringify({replytext:replytext}),
			dateType:'text',
			success:function(result){
				console.log(result);
				if(result=='success'){
					alert("수정되었습니다");
					$("#modDiv").hide("slow");
					/* getAllList(); */
					getPageList(replyPage);
				}
				
			}
		});
	});
	
	function getPageList(page){
		$.getJSON("/replies/"+bno+"/"+page, function(data){
			console.log(data.list.length);
			
			var str ="";
			
			$(data.list).each(function(){
				str+="<li data-rno='"+this.rno+"' class='replyLi'>"
				+this.rno+":"+this.replytext+
				"<button>수정</button></li>";
			});
			$("#replies").html(str);
			printPaging(data.pageMaker);
		});
	}
	
	function printPaging(pageMaker){
		var str="";
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}
		for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
			var strClass=pageMaker.cri.page == i? 'class=active':'';
			str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		if(pageMaker.next){
			str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
		}
		$('.pagination').html(str);
	}
	
	var replyPage=1;
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		replyPage=$(this).attr("href");
		getPageList(replyPage);
	});
	
	</script>
</body>
</html>