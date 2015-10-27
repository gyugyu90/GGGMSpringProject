<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>bxSlider</title>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.bxslider/jquery.bxslider.min.js"></script>
    <script>
        $( function () {
            var mySlider = $( '#slide_banner' ).bxSlider( {
                mode: 'horizontal',// ���� ���� ���� �����̵�
                speed: 500,        // �̵� �ӵ��� ����
                pager: false,      // ���� ��ġ ����¡ ǥ�� ���� ����
                moveSlides: 1,     // �����̵� �̵��� ����
                slideWidth: 1200,   // �����̵� �ʺ�
                minSlides: 4,      // �ּ� ���� ����
                maxSlides: 4,      // �ִ� ���� ����
                slideMargin: 5,    // �����̵尣�� ����
                auto: false,        // �ڵ� ���� ����
                autoHover: true,   // ���콺 ȣ���� ���� ����
                controls: false    // ���� ���� ��ư ���� ����
            } );
            
 
     
            $( '#prevBtn' ).on( 'click', function () {
                mySlider.goToPrevSlide();  //���� �����̵� ��ʷ� �̵�
                return false;              //<a>�� ��ũ ����
            } );
 
 
            $( '#nextBtn' ).on( 'click', function () {
                mySlider.goToNextSlide(); 
                return false;
            } );
        } );
        $( function () {
            var mySlider = $( '#slide_banner1' ).bxSlider( {
                mode: 'horizontal',// ���� ���� ���� �����̵�
                speed: 500,        // �̵� �ӵ��� ����
                pager: false,      // ���� ��ġ ����¡ ǥ�� ���� ����
                moveSlides: 1,     // �����̵� �̵��� ����
                slideWidth: 1200,   // �����̵� �ʺ�
                minSlides: 4,      // �ּ� ���� ����
                maxSlides: 4,      // �ִ� ���� ����
                slideMargin: 5,    // �����̵尣�� ����
                auto: false,        // �ڵ� ���� ����
                autoHover: true,   // ���콺 ȣ���� ���� ����
                controls: false    // ���� ���� ��ư ���� ����
            } );
            
 
     
            $( '#prevBtn' ).on( 'click', function () {
                mySlider.goToPrevSlide();  //���� �����̵� ��ʷ� �̵�
                return false;              //<a>�� ��ũ ����
            } );
 
 
            $( '#nextBtn' ).on( 'click', function () {
                mySlider.goToNextSlide(); 
                return false;
            } );
        } );
        $( function () {
            var mySlider = $( '#slide_banner2' ).bxSlider( {
                mode: 'horizontal',// ���� ���� ���� �����̵�
                speed: 500,        // �̵� �ӵ��� ����
                pager: false,      // ���� ��ġ ����¡ ǥ�� ���� ����
                moveSlides: 1,     // �����̵� �̵��� ����
                slideWidth: 1200,   // �����̵� �ʺ�
                minSlides: 4,      // �ּ� ���� ����
                maxSlides: 4,      // �ִ� ���� ����
                slideMargin: 5,    // �����̵尣�� ����
                auto: false,        // �ڵ� ���� ����
                autoHover: true,   // ���콺 ȣ���� ���� ����
                controls: false    // ���� ���� ��ư ���� ����
            } );
            
 
     
            $( '#prevBtn' ).on( 'click', function () {
                mySlider.goToPrevSlide();  //���� �����̵� ��ʷ� �̵�
                return false;              //<a>�� ��ũ ����
            } );
 
 
            $( '#nextBtn' ).on( 'click', function () {
                mySlider.goToNextSlide(); 
                return false;
            } );
        } );
    </script>
    <style>
        
        #banner_wrap {padding-top:0px; position: relative; width: 90%; margin: 0 auto; vertical-align: middle;
  }
        #prevBtn { position: absolute; left: 0; top: 40%; }
        #nextBtn { position: absolute; right: 0; top: 40%; }
      
    </style>
</head>
 
<body>
    <div id="banner_wrap">
        <ul id="slide_banner">
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                   <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>            
        </ul>
        <ul id="slide_banner1">
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                   <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>            
        </ul>
        <ul id="slide_banner2">
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                   <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="<%=request.getContextPath() %>/img/image_test1.jpg" alt="">
                </a>
            </li>            
        </ul>
        
        

        <p>
            <a href="#" id="prevBtn">
                <img src="<%=request.getContextPath() %>/img/prev.jpg" alt="����">
            </a>
        </p>
        <p>
            <a href="#" id="nextBtn">
                <img src="<%=request.getContextPath() %>/img/next.jpg" alt="����">
            </a>
        </p>

    </div>
</body>
</html>