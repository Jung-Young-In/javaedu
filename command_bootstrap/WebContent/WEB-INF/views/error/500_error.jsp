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
        <img alt="500" src="../../resources/images/500.png" style="width: 180px; height: 140px; float: left;">
        <div class="error-content">
          <h3><i class="fas fa-exclamation-triangle text-warning"></i>내부 서버 오류</h3>

          <p>
           	서버 오류로 인하여 요청 사항을 수행할 수 없습니다.<br/>
			관리자에게 문의바랍니다.
          </p>

          <form class="search-form">
            <div class="input-group">
              <input type="text" name="search" class="form-control" placeholder="Search">

              <div class="input-group-append">
                <button type="submit" name="submit" class="btn btn-danger"><i class="fas fa-search"></i>
                </button>
              </div>
            </div>
            <!-- /.input-group -->
          </form>
        </div>
      </div>
      <!-- /.error-page -->

    </section>
    <%@ include file="/WEB-INF/views/include/js.jsp" %>
</body>
</html>