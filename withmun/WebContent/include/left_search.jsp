<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.color_on {color:#1f497d;}
#toggle_menu a{color:#404040;}
</style>

<div class = "left">
	<div style="margin-left:10px;margin-top:20px;margin-bottom:20px;">
		<div style="font-size:23px;color:#1f497d;">
			Search
		</div>				
		
		<div class="toggle_menu" style="margin-bottom:30px;margin-top:20px;width:95%;font-size:14px;color:#404040;font-weight:400;margin-left:10px;">
			<div id ="all">
				<a href="./find.fd?findStr=${findStr }">
				All
				</a>
				<div class="line2"></div>
			</div>
	
			<div id ="general" style="margin-top:20px;">
				<a class="color_on" href="./find.fd?grp=일반행정&findStr=${findStr }">
				일반행정
				</a>
				<div class="line2"></div>
			</div>
	
			<div id ="foreign" style="margin-top:20px;">
				<a class="color_on" href="./find.fd?grp=외국어번역행정&findStr=${findStr }">
				외국어번역행정
				</a>
				<div class="line2"></div>
			</div>	
			
			<div id ="about" style="margin-top:20px;">
				<a href="./find.fd?grp=About&findStr=${findStr }">
				About
				</a>
				<div class="line2"></div>
			</div>	
			
			<div id ="other"  style="margin-top:20px;">
				<a href="./find.fd?grp=Other&findStr=${findStr }">
				Other
				</a>
				<div class="line2"></div>
			</div>	
		</div>
	</div>
</div>