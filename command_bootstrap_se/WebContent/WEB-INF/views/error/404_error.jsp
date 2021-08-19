<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<%@ include file="/WEB-INF/views/include/style.jsp" %>
</head>
<body>
<section class="content">
      <div class="error-page">
        <img alt="404" src="../../resources/images/404.jpg" style="width: 180px; height: 140px; float: left;">
        <div class="error-content">
          <h3><i class="fas fa-exclamation-triangle text-warning"></i>페이지를 찾을 수 없습니다.</h3>

          <p>
           	요청하신 페이지를 찾을 수 없습니다.<br/>
			관리자에게 문의바랍니다.
          </p>

          <form class="search-form">
            <div class="input-group">
              <input type="text" name="search" class="form-control" placeholder="Search">

              <div class="input-group-append">
                <button type="submit" name="submit" class="btn btn-warning"><i class="fas fa-search"></i>
                </button>
              </div>
            </div>
            <!-- /.input-group -->
          </form>
        </div>
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
</section>
<%@ include file="/WEB-INF/views/include/js.jsp" %>
</body>
</html>