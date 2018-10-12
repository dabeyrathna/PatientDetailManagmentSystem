<script type="text/javascript" src="js/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="js/jquery.slidertron-1.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#menu > ul').dropotron({
			mode: 'fade',
			globalOffsetY: 11,
			offsetY: -15
		});
		$('#slider').slidertron({
			viewerSelector: '.viewer',
			indicatorSelector: '.indicator span',
			reelSelector: '.reel',
			slidesSelector: '.slide',
			speed: 'slow',
			advanceDelay: 4000
		});
	});
	
	
	
</script>


	<div id="slider">
            <div class="viewer">
                <div class="reel">
                    <div class="slide">
                        <img src="images/1.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="images/2.png" alt="" />
                    </div>
                    <div class="slide">
                        <img src="images/3.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="images/4.png" alt="" />
                    </div>
                    <div class="slide">
                        <img src="images/5.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="images/6.jpg" alt="" />
                    </div>
					<div class="slide">
                        <img src="images/7.jpg" alt="" />
                    </div>
                </div>
            </div>
            <div class="indicator">
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>
                <span>6</span>
				<span>7</span>
            </div>
        </div>