<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript"
      src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css"
      href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
   <script type="text/javascript"
      src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/index.css">
</head>   
<body>
   <div>   
   <jsp:include page="common/manageHeader.jsp"/>
   </div>
   
   <div class="body">
      <div class="body_sub">
         <div class="left">
            <div class="board">
               <div class="title_box">
                  <a href="">우편 목록</a>
                  <a href="" class="more">more</a>
                  <div class="boardwrite" style="margin-top:10px;height: 1409%;; border:solid black 1px;">
                     <iframe src="http://localhost:8080/FinalWebProject/delivery" style="width:100%;height:100%;"></iframe>
                  </div>
               </div>
            </div>
         </div>
         <div class="middle">
            <div class="photo">
               <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                 <ol class="carousel-indicators">
                   <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                   <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                   <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                 </ol>
                 <div class="carousel-inner">
                   <div class="carousel-item active">
                     <img src="resources/images/postpage1.jpg" class="d-block w-100" alt="안녕하십니까">
                   </div>
                   <div class="carousel-item">
                     <img src="resources/images/postpage2.jpg" class="d-block w-100" alt="안녕하십니까" style="height:399px;">
                   </div>
                   <div class="carousel-item">
                     <img src="resources/images/postpage3.jpg" class="d-block w-100" alt="안녕하십니까" style="height:399px;">
                   </div>
                 </div>
                 <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                   <span class="sr-only">Previous</span>
                 </a>
                 <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                   <span class="carousel-control-next-icon" aria-hidden="true"></span>
                   <span class="sr-only">Next</span>
                 </a>
               </div>
            </div>
            <div class="notice">
               <div class="title_box">
                  <a href="noticeList">공지사항</a>
                  <a href="noticeList" class="more">more</a>
                  <div class="boardwrite" style="margin-top:10px;height: 1409%;; border:solid black 1px;">
                     <iframe src="http://localhost:8080/FinalWebProject/delivery" style="width:100%;height:100%;"></iframe>
                  </div>
               </div>
            </div>
         </div>
         <div class="right">
            <div class="calendar">
               <div class="title_box">
                  <a href="">마을 요청 목록</a>
                  <a href="" class="more">more</a>
                  <div class="boardwrite" style="margin-top:10px;height: 1409%;; border:solid black 1px;">
                     <iframe src="http://localhost:8080/FinalWebProject/delivery" style="width:100%;height:100%;"></iframe>
                  </div>
               </div>
            </div>
            <div class="restaurant">
               <div class="title_box">
                  <a href="">배송 내역</a>
                  <a href="" class="more">more</a>
                  <div class="boardwrite" style="margin-top:10px;height: 1409%;; border:solid black 1px;">
                     <iframe src="http://localhost:8080/FinalWebProject/delivery" style="width:100%;height:100%;"></iframe>
                  </div>
               </div>
            </div>
         </div>
      </div>         
   </div>
   <div class="footer">
   </div>
</body>
</html>