<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="http://code.jquery.com/jquery-2.2.4.js"></script>
<script src="utils.js"></script>
<%--ChartJS CDN--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

	<div class="main-panel ">
  		<div class="content-wrapper1">
	    	<p><h1 class=text-left>여행지 통계</h1><p>
	  	    	<div class="grid-margin stretch-card">
	  	    		<div style="width: 40%;" class="card">	
                		<div class="card-body">
							<h4>많이 간 여행지</h4>
							<div class="panel-body bar1">
								<canvas id="bar1"></canvas>
							</div>
						<table style="width:80%" align="center" class="table table-hover">
		                    <thead>
		                      <tr align="center">
		                      	<td width="40%" style="font-size: initial;font-weight: bold;">#</td>
		                        <td align="left" width="30%" style="font-size: initial;font-weight: bold;">국 가</td>
		                        <td class="t1" align="left" width="30%" style="font-size: initial;font-weight: bold;">횟 수</td>
		                      </tr>
		                    </thead>
			                <c:forEach var="r" items="${report}" begin="0" end="4" step="1" varStatus="status">
								<tr align="center">
									<td width="40%">${status.count}</td>
			                      	<td width="30%" align="left" class="flag"><img src="image/flag/${r.country}.svg">&nbsp;&nbsp;${r.country}</td>
									<td align="left" width="30%">${r.t_Country} 회</td>
								</tr>
							</c:forEach>
	                    </table>	
	                    <br><br><hr><br><br>
		                    <h4>남성 인기 여행지</h4><br>
			                    <div class="panel-body bar1">
									<canvas id="bar2"></canvas>
								</div>
		                    <table style="width:80%" align="center" class="table table-hover">
			                    <thead>
			                      <tr align="center">
			                        <td width="40%" style="font-size: initial;font-weight: bold;">#</td>
			                        <td align="left" width="30%" style="font-size: initial;font-weight: bold;">국 가</td>
			                        <td class="t1" align="left" width="30%" style="font-size: initial;font-weight: bold;">횟 수</td>
			                      </tr>
			                    </thead>
				                <c:forEach var="m" items="${mreport}" begin="0" end="4" step="1" varStatus="status">
				                	<tr align="center">
				                		<td width="40%">${status.count}</td>
				                      	<td width="30%" align="left" class="flag"><img src="image/flag/${m.country}.svg">&nbsp;&nbsp;${m.country}</td>
										<td align="left" width="30%">${m.t_Country} 회</td>
									</tr>
								</c:forEach>
		                    </table>
		                <br><br><hr><br><br>		                   
	                    <h4>여성 인기 여행지</h4><br>
		                    <div class="panel-body bar1">
								<canvas id="bar3"></canvas>
							</div>	
	                    <table style="width:80%" align="center" class="table table-hover">
		                    <thead>
		                      <tr align="center">
		                      	<td width="40%" style="font-size: initial;font-weight: bold;">#</td>
		                        <td align="left" width="30%" style="font-size: initial;font-weight: bold;">국 가</td>
		                        <td class="t1" align="left" width="30%" style="font-size: initial;font-weight: bold;">횟 수</td>
		                      </tr>
		                    </thead>
			                <c:forEach var="w" items="${wreport}" begin="0" end="4" step="1" varStatus="status">
								<tr align="center">
									<td width="40%">${status.count}</td>
			                      	<td width="30%" align="left" class="flag"><img src="image/flag/${w.country}.svg">&nbsp;&nbsp;${w.country}</td>
									<td align="left" width="30%">${w.t_Country} 회</td>
								</tr>
							</c:forEach>
	                    </table>
	                    </div>
					</div>
				</div>
			</div>
		</div>

<script type="text/javascript">
	
	var country = new Array();
	var num = new Array();

	<c:forEach items="${report}" var="report">
		country.push("${report.country}");
	</c:forEach>	
	<c:forEach items="${report}" var="report">
		num.push("${report.t_Country}");
	</c:forEach>	
	console.log(country);
	console.log(num);

	
	var config = {
		
	    type: 'bar',
	    data: {
	      labels: [country[0], country[1], country[2], country[3], country[4]],
	      datasets: [{
	        label: ["여행 다녀온 수"],
            backgroundColor: [
                'rgb(255, 99, 132, 0.5)',
                'rgba(54, 162, 235, 0.5)',
                'rgba(255, 206, 86, 0.5)',
                'rgba(75, 192, 192, 0.5)',
                'rgba(153, 102, 255, 0.5)',
                'rgba(255, 159, 64, 0.5)'
            ],  
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1,
	        data: [num[0], num[1], num[2], num[3], num[4]]
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
		    	    }],
		        yAxes: [{
		        	scaleLabel: {
						display: true,
						labelString: '여행자 수'
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
 
	// 남성 차트 	
	var mcountry = new Array();
	var mnum = new Array();

	<c:forEach items="${mreport}" var="mreport">
		mcountry.push("${mreport.country}");
	</c:forEach>	
	<c:forEach items="${mreport}" var="mreport">
		mnum.push("${mreport.t_Country}");
	</c:forEach>	

	
	var config2 = {
		
	    type: 'bar',
	    data: {
	      labels: [mcountry[0], mcountry[1], mcountry[2], mcountry[3], mcountry[4]],
	      datasets: [{
	          label: ["여행 다녀온 수"],
	          backgroundColor: 'rgba(54, 162, 235, 0.5)',
	          borderColor: 'rgba(54, 162, 235, 1)',
	          borderWidth: 1,
	          data: [mnum[0], mnum[1], mnum[2], mnum[3], mnum[4]]
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
		    	    }],
		        yAxes: [{
		        	scaleLabel: {
						display: true,
						labelString: '여행자 수'
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
 	
	// 여성 차트 	
	var wcountry = new Array();
	var wnum = new Array();

	<c:forEach items="${wreport}" var="wreport">
		wcountry.push("${wreport.country}");
	</c:forEach>	
	<c:forEach items="${wreport}" var="wreport">
		wnum.push("${wreport.t_Country}");
	</c:forEach>	

	
	var config3 = {
		
	    type: 'bar',
	    data: {
	      labels: [wcountry[0], wcountry[1], wcountry[2], wcountry[3], wcountry[4]],
	      datasets: [{
	          label: ["여행 다녀온 수"],
	          backgroundColor: 'rgb(255, 99, 132, 0.5)',
	          borderColor: 'rgba(255,99,132,1)',
	          borderWidth: 1,
	          data: [wnum[0], wnum[1], wnum[2], wnum[3], wnum[4]]
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
		    	    }],
		        yAxes: [{
		        	scaleLabel: {
						display: true,
						labelString: '여행자 수'
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
	    	ctx.canvas.height = $('#bar1').height();
		var ctx2 = document.getElementById('bar2').getContext('2d');
		var ctx3 = document.getElementById('bar3').getContext('2d');
		
		window.myLine = new Chart(ctx, config);
		window.myLine2 = new Chart(ctx2, config2);
		window.myLine3 = new Chart(ctx3, config3);
		
	};
	
</script>
		