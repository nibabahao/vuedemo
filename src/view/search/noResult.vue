<template>
	<div class="resultWrap">
		<img src="../../assets/no_result.png">
		<p>抱歉，没有找到相关上商品!</p>
		<p>给我留言告诉你喜欢的东西吧</p>
		<button>我要留言</button>
		<div class="mask">
			<div class="layer">
				<div class="bar"><span>留言</span></div>
				<textarea :value=smsg></textarea>
				<a href="javascript:void(0)">提交</a>
			</div>
		</div>
	</div>
</template>
<script type="text/javascript">
   export default {
     data () {
       return {
         isNowPage: true,
         smsg: '想买点什么商品'
       }
     }
   }
</script>
<style type="text/css" scoped>
	.resultWrap img{width: 1.23rem;margin:1.22rem auto .18rem;}
	.resultWrap p{font-size: .256rem;color:#8e8e8e;}
	.resultWrap button { width: 2rem; height: .6rem;font-size: .256rem;line-height: .6rem;border-radius: 7px;border: 1px solid #ededed;background: -webkit-linear-gradient(top,#f8f8f8,#e9e8e9);background: linear-gradient(top,#f8f8f8,#e9e8e9);color: #a5a5a5;box-shadow: 0 0 2px #DDD;-webkit-box-shadow: 0 0 2px #DDD;margin-top: .4608rem;padding: 0;
	}
	.resultWrap .mask{position: absolute; z-index:4; top:0; left: 0;width: 100%;height: 100vh;background: rgba(0,0,0,.3);}
	.mask .layer{position: absolute;top:50%;left: 50%;width: 5.8rem;margin-left: -2.9rem;height: 5.7rem; margin-top: -2.85rem;background: #FFF;}
	.mask .layer .bar{position:relative;height: .512rem;background-color: #f2f2f2; line-height: .512rem; text-align: left; padding-left: .273rem;}
	.mask .layer span{color:#999999; font-size: .256rem;}
	.mask .layer .bar:after { width: .1536rem;height: .1536rem;display: block; position: absolute; content: ""; background: url(../../assets/close.png) no-repeat; background-size: 100% auto; top:.1792rem; right: .273rem;}
	.mask textarea{width: 5.26rem; height: 3.667rem; resize: none; outline: none; border: 1px solid #d2d2d2; margin-top: .208rem;padding: .2048rem;box-sizing: border-box; font-size: .256rem; color:#999;}
	.mask a{display: block; width: 1.36rem; height: .426rem; margin:.426rem auto 0; font-size: .256rem; color:#FFF; background: #f29525; line-height: .426rem; border-radius: 5px;} 
</style> 