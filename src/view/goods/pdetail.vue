<template>
	<div class="detailWrap">
	    <fheader></fheader>
		<div class="imgBox">
			<img :src="item.url">
			<dl>
				<dt>{{item.title}}</dt>
				<dd>{{item.summary}}</dd>
			</dl>
		</div>
		<div class="summary">
			<img :src="item.url">
			<dl>
				<dt>{{item.title}}</dt>
				<dd class="address"><a href="#">{{item.address}}</a></dd>
				<dd class="tel">{{item.tel}}<span>转</span>{{item.phone}}</dd>
			</dl>
		</div>
		<div class="content">
			{{item.content}}
		</div>
	</div>
</template>
<script type="text/javascript">
   import axios from 'axios'
   import Fheader from '../../components/fheader'
   export default {
     name: 'detail',
     data () {
       return {
         item: {},
         cid: this.$store.state.cid
       }
     },
     components: {
       Fheader
     },
     mounted () {
       let code = this.$route.query.code
       let _this = this
       axios.get('/pdetail?code=' + code)
       .then((res) => {
         if (res.data.msg) {
           _this.item = res.data.list[0]
         }
       })
     }
   }
</script>
<style type="text/css" scoped>
	.detailWrap{ text-align: left;}
	.detailWrap .imgBox {background-color:#FFF;}
	.detailWrap .imgBox img{width: 100%;display: block;}
	.detailWrap .imgBox dl {margin:0;padding: .18rem .2048rem;border-bottom: 1px solid #ddd;}
	.detailWrap .imgBox dt {font-size: .273rem; color: #141414; font-weight: bold; line-height: 1.2;}
	.detailWrap .imgBox dd {font-size: .256rem; color: #595959; line-height: 1.2; margin-top: .16rem;}
	.detailWrap .summary {padding: .17rem; margin-top: .213rem;background-color:#FFF;overflow: hidden;}
	.detailWrap .summary img{float:left; width: 1.25rem; height: 1.25rem;}
	.detailWrap .summary dl {float: left; margin-left: .17rem; width: 4.64rem;}
	.detailWrap .summary dt {font-size: .256rem; color:#1e1d1d;}
	.detailWrap .summary dd.address a{font-size: .22rem; color:#514f4f;line-height: 1;}
	.detailWrap .summary dd.tel{position:relative; padding-left:17px;font-size: .22rem;color:#0add27;}
	.detailWrap .summary dd.tel span{ color:#514f4f; margin: 0 5px;}
	.detailWrap .summary dd.tel:before{background-image: url(../../assets/icon.png); width: 12px; height: 15px; left: 0; top:50%; margin-top:-7.5px; position: absolute; content: ""; background-position: -27px -129px; background-size:216px auto;}
	.content{background: #FFF;margin-top:.213rem; padding: .2048rem;}
</style>