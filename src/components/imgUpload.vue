<template>
	<div class="mask" v-show="show" @click="imguploadHide">
		<div class="upload" @click.stop>
			<div class="title">上传图片<i></i></div>
			<form method="post" action="handle_form.php" enctype="multipart/form-data">
				<div class="file">
					<input type="file" id="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="file" ref='file'>
					<span>上传：</span>
					<a href="javascript:void(0)" @click="upload">选择图片</a>
				</div>
				<p>每张图片大少不超过 5M, 支持 JPG、 PNG、 BMP格式</p>
				<div id="filelist" class="filelist">+</div>
				<button>提交</button>
			</form>
		</div>
	</div>
</template>
<script type="text/javascript">
  export default {
    name: 'Imgupload',
    data () {
      return {
      }
    },
    computed: {
      show () {
        return this.$store.state.imguploadShow
      }
    },
    methods: {
      imguploadHide () {
        this.$store.state.imguploadShow = false
      },
      upload () {
        console.log(this)
      }
    },
    updated () {
      let mask = this.$el
      let a = mask.children[0].children[1].children[0].children[2]
      let file = mask.children[0].children[1].children[0].children[0]
      let fileList = mask.children[0].children[1].children[2]
      file.onchange = () => {
        const files = file.files
        const fd = new FormData(file.form)
        let url = window.URL || window.webkitURL
        let img = new Image()
        let ajax = new XMLHttpRequest()
        fd.append('upload', 1)
        fd.append('upfile', files[0])
        ajax.open('post', '/headupload', true)
        ajax.onload = function () {
          console.log(ajax.responseText)
        }
        ajax.send(fd)
        fileList.innerHTML = ''
        if (url) {
          let src = url.createObjectURL(files[0])
          img.onload = () => {
            url.revokeObjectURL(src)
          }
          img.src = src
          img.height = fileList.offsetHeight
          fileList.appendChild(img)
        } else if (window.FileReader) {
          let fr = new FileReader()
          fr.readAsDataURL(files[0])
          fr.onload = function (e) {
            img = new Image()
            img.src = this.result
            fileList.appendChild(img)
          }
        }
      }
      a.onclick = () => {
        file.click()
      }
    }
  }
</script>
<style type="text/css" scoped>
	.mask{position: fixed; width: 100%; height: 100%; background-color: rgba(0,0,0,.7); top:0; left: 0; z-index: 5;}
	.upload{position: absolute; width: 5.8rem; height: 4.468rem; margin-top: -2.234rem; margin-left: -2.9rem; left: 50%; top:50%; background-color: #FFF;}
	.upload .title{position:relative;height: .5rem; font-size: .256rem; line-height: .5rem; padding-left: .2048rem; box-sizing: border-box; text-align: left; color: #a6a6a6; background: #f2f2f2;}
	.upload .title i{position: absolute; width: .1536rem; height: 100%; background: url(../assets/close.png) no-repeat; background-size: 100% auto; background-position: center; right: .2048rem;}
	.upload .file {margin-top: .187rem; text-align: center;}
	.upload .file input{display: none;}
	.upload .file {height: .47rem; line-height: .47rem; overflow: hidden;}
	.upload .file span{float: left; height: 100%; margin-left: .2048rem; font-size: .256rem;}
	.upload .file a{float: left; width: 1.024rem; height: 100%; background: #f5f5f4; border: 1px solid #dbdbdb; box-sizing: border-box;}
	.upload p{font-size: .17rem; text-align: left; margin-left: .2048rem; width: 3.47rem; box-sizing: border-box; margin-top: .187rem; color: #a3a3a3;}
	.upload .filelist{width: 1.1rem; height: 1.1rem; background: #dbdbdb; overflow: hidden; color:#fff; text-align: center; line-height: 1.1rem; margin: .187rem 0 0 .2048rem; font-size: .256rem;}
	form { text-align: left; }
	.upload button {width: 1.3824rem; height: .5rem; border-radius: 5px; color: #FFF; background: #f39524; border:none; padding: 0; text-align: center; margin-left: .2048rem; margin-top: .187rem;}
</style>