<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div class="tb_attend_detail2">
		<div id="time_zone" class="tb_div tb_head">

			<div class="tb_cell">
				<span class="time">00</span>
			</div>
			<div class="tb_cell">
				<span class="time">01</span>
			</div>
			<div class="tb_cell">
				<span class="time">02</span>
			</div>
			<div class="tb_cell">
				<span class="time">03</span>
			</div>
			<div class="tb_cell">
				<span class="time">04</span>
			</div>
			<div class="tb_cell">
				<span class="time">05</span>
			</div>
			<div class="tb_cell">
				<span class="time">06</span>
			</div>
			<div class="tb_cell">
				<span class="time">07</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">08</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">09</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">10</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">11</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">12</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">13</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">14</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">15</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">16</span>
			</div>
			<div class="tb_cell workinghours">
				<span class="time">17</span>
			</div>
			<div class="tb_cell">
				<span class="time">18</span>
			</div>
			<div class="tb_cell">
				<span class="time">19</span>
			</div>
			<div class="tb_cell">
				<span class="time">20</span>
			</div>
			<div class="tb_cell">
				<span class="time">21</span>
			</div>
			<div class="tb_cell">
				<span class="time">22</span>
			</div>
			<div class="tb_cell">
				<span class="time">23</span>
			</div>
		</div>

		<div class="wrap_timeline tb_body">
			<!--
        클래스명 설명
        .part_default : 일반 근무 시간
        .part_approval : 승인 근무 시간
        .part_overtime : 초과 근무 시간
        .part_approval.wait : 연장근무 승인대기
        .part_overtime.wait : 초과근무 승인대기
        .start : 시작
        .close : 종료
        .initial : 최초 출근 시(출근 30분 후 클래스 제거), 출/퇴근이 60분 이내에 이루어졌을 경우 적용
    -->
			<div id="data_zone" class="tb_div time_data">
				<div id="clockinout_progress" class="tb_row total_time">
					<div class="progress  start close part_default"
						style="left: 54.1632%; width: 6.31269%;">
						<span id="clockIn" class="txt label_l" style="cursor: pointer;">출근</span>
						<span id="clockOut" class="txt label_r" style="cursor: pointer;">외근
						</span>
					</div>
					<div class="progress  start initial part_default"
						style="left: 64.2797%; width: 2.77778%;">
						<span id="clockIn" class="txt label_l" style="cursor: pointer;">업무</span>
					</div>
				</div>
				<div id="approval_progress" class="tb_row total_time">
					<div id="95" class="progress part_approval start close"
						style="left: 75%; width: 8.33333%;">
						<span class="txt">연장 <span> (완료)</span>
						</span>
					</div>
				</div>
				<div id="working_state_666" class="tb_row workingstate">
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min coretime_s" title="의무 근로 시작 시간"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min break"></div>
							<div class="min break"></div>
							<div class="min break"></div>
							<div class="min break"></div>
							<div class="min break"></div>
							<div class="min break"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min">
								<div class="time_schedule">
									<span class="txt">퇴근</span>
									<div class="tool_tip">
										<p class="time">
											<span class="ic_ehr ic_watch"></span>15:15
										</p>
										<p class="tit">퇴근</p>
									</div>
								</div>
							</div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min coretime_s" title="의무 근로 종료 시간"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
				</div>


				<div id="working_state_667" class="tb_row workingstate">
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min coretime_s" title="의무 근로 시작 시간"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min break"></div>
							<div class="min break"></div>
							<div class="min break"></div>
							<div class="min break"></div>
							<div class="min break"></div>
							<div class="min break"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min">
								<div class="time_schedule">
									<span class="txt">반차</span>
									<div class="tool_tip">
										<p class="time">
											<span class="ic_ehr ic_watch"></span>15:16
										</p>
										<p class="tit">반차</p>
									</div>
								</div>
							</div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min coretime_s" title="의무 근로 종료 시간"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">

							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
				</div>
			</div>


			<!-- 상태 추가 시 row가 한줄씩 추가됨 (상태가 여러개일 경우 레이블이 서로 겹치는 현상을 방지하기 위함)-->
			<div id="time_wrapper" class="tb_div tb_bg" style="height: 136px;">
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min coretime_s" title="의무 근로 시작 시간"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min break"></div>
						<div class="min break"></div>
						<div class="min break"></div>
						<div class="min break"></div>
						<div class="min break"></div>
						<div class="min break"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell workinghours">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min coretime_s" title="의무 근로 종료 시간"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
				<div class="tb_cell">
					<div class="tb_div">

						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
						<div class="min"></div>
					</div>
				</div>
			</div>
		</div>

		<!--
<div class="time_tb" id="timeline_list">
</div>
-->
	</div>



</body>
</html>