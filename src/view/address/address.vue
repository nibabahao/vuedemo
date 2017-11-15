<template>
	<div class="wrap">
    <dl class="title">
      <dt>当前城市</dt>
      <dd>广州市</dd>
    </dl>
    <p class="list">省市列表</p>
    <ul class="province" v-for="(province,idx) in provinces">
      <li><router-link :to="{path:'/city',query:{id:idx}}">{{province}}</router-link></li>
    </ul>
    <footer-nav :class="{'isIndex':isNowPage}"></footer-nav>
	</div>
</template>
<script type="text/javascript">
   import FooterNav from '../../components/footer'
   export default {
     name: 'address',
     data () {
       return {
         isNowPage: true,
         provinces: ['北京市', '上海市', '天津市', '重庆市', '河北省', '山西省', '辽宁省', '吉林省', '河南省', '江苏省', '浙江省', '安徽省', '福建省', '江西省', '山东省', '湖北省', '湖南省', '广东省', '海南省', '四川省', '贵州省', '云南省', '陕西省', '甘肃省', '青海省', '黑龙江省', '内蒙古自治区', '广西壮族自治区', '西藏自治区', '宁夏回族自治区', '新疆维吾尔自治区', '台湾省', '香港特别行政区', '澳门特别行政区']
       }
     },
     components: {
       FooterNav
     },
     beforeCreate () {
       this.$store.state.cid = 0
     }
   }
</script>
<style type="text/css" scoped>
   .wrap{padding-bottom: 50px;}
   dl, ul,p.list{text-align: left;}
   dl.title dt{font-size: .256rem; box-sizing: border-box; height: .8rem;line-height: .8rem; border-bottom:1px solid #e5e5e5; padding-left: .18rem;}
   dl.title dd{font-size: .256rem; box-sizing: border-box; height: .96rem;line-height: .96rem;  padding-left: .18rem;}
   p.list{font-size: .256rem; box-sizing: border-box; height: .8rem;line-height: .8rem; padding-left: .18rem; background: #e6e6e6;}
   .province a{display: block;font-size: .256rem; box-sizing: border-box; height: .96rem;line-height: .96rem;  padding-left: .18rem;}
   .province li{border-bottom:1px solid #e5e5e5; }
</style>