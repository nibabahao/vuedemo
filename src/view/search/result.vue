<template>
	<div class="resultWrap">
		<ul>
			<li v-for="i in items">
				<a href="#">
					<img :src="i.url">
					<dl>
						<dt>{{i.title}}</dt>
						<dd>&yen;{{i.price}}</dd>
					</dl>
				</a>
			</li>
		</ul>
	</div>
</template>
<script type="text/javascript">
   export default {
     data () {
       return {
         isNowPage: true,
         items: [
           {id: 0, url: 'http://10.161.18.113:3000/assets/search_image.png', title: '坚果特产山核桃奶油味碧根...', price: 29.5}
         ]
       }
     }
   }
</script>
<style type="text/css" scoped>
	.resultWrap {background-color: #FFF; min-height: 100vh; margin-top: .17rem;}
	.resultWrap ul{padding: .17rem;}
	.resultWrap li{height: 1.2544rem;}
	.resultWrap li a{display: block; height: 100%;}
	.resultWrap li a img{width: 1.2544rem;float: left; border:1px solid #e6e6e6;box-sizing: border-box;}
	.resultWrap li dl {width: 4.5rem;float: left;margin-left: .17rem;text-align: left;}
	.resultWrap li dt {font-size: .256rem;color:#1a1a1a;margin-bottom: .14rem;}
	.resultWrap li dd{font-size: .2218rem;color: #de0000;}
</style> 