document.addEventListener 'turbolinks:load', ->
  editor = new Simditor(
    textarea: $('#editor')
    toolbar: ['bold', 'italic', 'color', '|', 'ol', 'ul', '|', 'image', '|', 'indent', 'outdent', '|', 'hr', 'table']
 
    # fileKey: 'picture'  #指定服务器获取上传文件数据的参数params["upload_file"]
    upload: {
      url: '/admin/infos/upload'  #对应的request routes
    }
  )