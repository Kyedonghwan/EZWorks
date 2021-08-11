<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

str += "	<div class="tb_attend_detail2">                                                                 ";
str += "		<div id="time_zone" class="tb_div tb_head">                                                 ";
str += "			<c:forEach var="i" begin="0" end="23">                                                  ";
str += "				<div                                                                                ";
str += "					class="tb_cell <c:if test="${i>7 && i<18 }">workinghours</c:if>">               ";
str += "					<span class="time"><fmt:formatNumber value="${i }"                              ";
str += "							minIntegerDigits="2"></fmt:formatNumber></span>                         ";
str += "				</div>                                                                              ";
str += "			</c:forEach>                                                                            ";
str += "		</div>                                                                                      ";
str += "		<div class="wrap_timeline tb_body">                                                         ";
str += "			<div id="data_zone" class="tb_div time_data">                                           ";
str += "				<div id="clockinout_progress" class="tb_row total_time">                            ";
str += "					<div class="progress  start close part_default"                                 ";
str += "						style="left: 54.1632%; width: 6.31269%;">                                   ";
str += "						<span id="clockIn" class="txt label_l" style="cursor: pointer;">출근</span> ";
str += "						<span id="clockOut" class="txt label_r" style="cursor: pointer;">외근       ";
str += "						</span>                                                                     ";
str += "					</div>                                                                          ";
str += "					<div class="progress  start initial part_default"                               ";
str += "						style="left: 64.2797%; width: 2.77778%;">                                   ";
str += "						<span id="clockIn" class="txt label_l" style="cursor: pointer;">업무</span> ";
str += "					</div>                                                                          ";
str += "				</div>                                                                              ";
str += "				<div id="approval_progress" class="tb_row total_time">                              ";
str += "					<div id="95" class="progress part_approval start close"                         ";
str += "						style="left: 75%; width: 8.33333%;">                                        ";
str += "						<span class="txt">연장 <span> (완료)</span>                                 ";
str += "						</span>                                                                     ";
str += "					</div>                                                                          ";
str += "				</div>                                                                              ";
str += "				<div class="tb_row workingstate">                                                   ";
str += "					<c:forEach var="j" begin="0" end="23">                                          ";
str += "						<div class="tb_cell">                                                       ";
str += "							<div class="tb_div">                                                    ";
str += "								<c:forEach var="k" begin="0" end="5">                               ";
str += "									<div class="min"></div>                                         ";
str += "								</c:forEach>                                                        ";
str += "							</div>                                                                  ";
str += "						</div>                                                                      ";
str += "					</c:forEach>                                                                    ";
str += "				</div>                                                                              ";
str += "			</div>                                                                                  ";
str += "			<div id="time_wrapper" class="tb_div tb_bg" style="height: 136px;">                     ";
str += "				<c:forEach var="l" begin="0" end="23">                                              ";
str += "					<div class="tb_cell">                                                           ";
str += "						<div class="tb_div">                                                        ";
str += "							<c:forEach var="m" begin="0" end="5">                                   ";
str += "								<div class="min"></div>                                             ";
str += "							</c:forEach>                                                            ";
str += "						</div>                                                                      ";
str += "					</div>                                                                          ";
str += "				</c:forEach>                                                                        ";
str += "			</div>                                                                                  ";
str += "		</div>                                                                                      ";
str += "	</div>                                                                                          ";
</body>
</html>