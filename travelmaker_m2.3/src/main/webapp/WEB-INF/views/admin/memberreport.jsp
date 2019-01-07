<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script> -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script> -->
<!-- <script src="utils.js"></script> -->
<script src="http://code.jquery.com/jquery-2.2.4.js"></script>
<%--ChartJS CDN--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

	<div class="main-panel ">
  		<div class="content-wrapper1">
	    	<p><h1 class=text-left>회원 통계</h1><p>
	  	    	<div class="grid-margin stretch-card">
	  	    		<div style="width: 40%;" class="card">	
                		<div class="card-body">
							<h3>월별 가입자</h3>
							<div class="panel-body col-md">
								<canvas id="bar1" width="400" height="150"></canvas>
							</div><br><br>
						&nbsp;&nbsp;&nbsp;<h4>총 회원수 ${count}명</h4><br>
						<table style="width:80%" align="center" class="table table-hover">
		                    <thead>
		                      <tr>
		                        <td align="center" width="35%" style="font-size: initial;font-weight: bold;">월 별</td>
		                        <td class="t1" align="left" width="30%" style="font-size: initial;font-weight: bold;">인 원</td>
		                      </tr>
		                    </thead>
								<tr align="center">
			                      	<td width="35%">1월</td>
			                      	<td align="left" width="30%">${report[0].m01} 명</td>
								</tr>
			                    <tr align="center">  	
			                      	<td width="35%">2월</td>
			                      	<td align="left" width="30%">${report[0].m02} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">3월</td>
			                      	<td align="left" width="30%">${report[0].m03} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">4월</td>
			                      	<td align="left" width="30%">${report[0].m04} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">5월</td>
			                      	<td align="left" width="30%">${report[0].m05} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">6월</td>
			                      	<td align="left" width="30%">${report[0].m06} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">7월</td>
			                      	<td align="left" width="30%">${report[0].m07} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">8월</td>
			                      	<td align="left" width="30%">${report[0].m08} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">9월</td>
			                      	<td align="left" width="30%">${report[0].m09} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">10월</td>
			                      	<td align="left" width="30%">${report[0].m10} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">11월</td>
			                      	<td align="left" width="30%">${report[0].m11} 명</td>
			                    </tr> 	
			                    <tr align="center">  	
			                      	<td width="35%">12월</td>
			                      	<td align="left" width="30%">${report[0].m12} 명</td>
			                    </tr> 	
	                    </table>							
						</div>
					</div>
				</div>
			</div>
		</div>

<script type="text/javascript">

// $(document).ready(function(){

	//비동기 실행
	/* 
	$.ajax({
		url:"memberreport.htm",
		type:"post",
		dataType: 'json',

		success:function(data){

			alert(data);
		},
		error:function(request,status,error){
        	console.log("code = "+ request.status + " error = " + error); 
		}
	});	
	*/
	
// });
 
//  function functionChart(){

	/* 
	Samples.utils = {
			
		transparentize: function(color, opacity) {
			var alpha = opacity === undefined ? 0.5 : 1 - opacity;
			return Color(color).alpha(alpha).rgbString();
		}	
	}; 
	var utils = Samples.utils;
	 */
	
// 	var report = ${report};
	
	
	var chart = new Array();

// 	<c:forEach items="${report}" var="report">
		chart.push("${report.m01}");
		chart.push("${report.m02}");
		chart.push("${report.m03}");
		chart.push("${report.m04}");
		chart.push("${report.m05}");
		chart.push("${report.m06}");
		chart.push("${report.m07}");
		chart.push("${report.m08}");
		chart.push("${report.m09}");
		chart.push("${report.m10}");
		chart.push("${report.m11}");
		chart.push("${report.m12}");
// 	</c:forEach>
	console.log(chart);

		
	var config = {
		
	    type: 'line',
	    data: {
	      labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	      datasets: [
	        {
	          label: ["회원가입 수"],
	          backgroundColor: 'rgb(255, 99, 132)',
	          borderColor: 'rgb(255, 99, 132)',
	          lineTension:0,
	          fill:false,
	          data: chart
	        }]
	    },
	    options:{
	      layout: {
	          
	    	  padding: {
	              left: 10,
	              right: 10,
	              top: 10,
	              bottom: 10
	          }
	      },
	      
	      scales: {
		    	 xAxes: [{
		    		 scaleLabel: {
							display: true,
						}
		    	    /*  
		    	 	ticks: {
		    	       callback: function(value) {
		    	         if (value.length > 6) {
		    	          	return value.substr(0, 6) + '...'; //차트라벨 4글자 이후에 ... 처리
		    	        	} else {
		    	           	return value
		    	        	}
		    	        },
		    	      }
		    	  */
		    	    }],
	    	
		        yAxes: [{
		        	scaleLabel: {
						display: true,
						labelString: '가입자 수'
					},
			         ticks: {
			             stepSize: 10
			         	}
		     	}]
	       },
	       tooltips: {
	    	    enabled: true,
	    	    mode: 'label',
	    	    callbacks: {
	    	      title: function(tooltipItems, data) {
	    	        var idx = tooltipItems[0].index;
	    	        return data.labels[idx];
	    	      }
	    	    }
	    	  },		       
	    }
 	};

 
	window.onload = function() {
		 
		var ctx = document.getElementById('bar1').getContext('2d');
			
	 
		window.myLine = new Chart(ctx, config);
	};


	
	
// }
	
	
</script>
		