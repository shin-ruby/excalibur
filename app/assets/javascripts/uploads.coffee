# uploader = Qiniu.uploader(
#   runtimes: 'html5,html4'
#   browse_button: 'pickfiles'
#   uptoken: '<%= @uptoken %>'
#   unique_names: true
#   save_key: true
#   domain: '<%= Rails.application.config.qiniu_domain %>'
#   container: 'container'
#   max_file_size: '5mb'
#   max_retries: 3
#   dragdrop: true
#   drop_element: 'container'
#   chunk_size: '1mb'
#   auto_start: true
#   init:
#     'FilesAdded': (up, files) ->
#       plupload.each files, (file) ->
#         # 文件添加进队列后,处理相关的事情
#         return
#       return
#     'BeforeUpload': (up, file) ->
#       # 每个文件上传前,处理相关的事情
#       return
#     'UploadProgress': (up, file) ->
#       # 每个文件上传时,处理相关的事情
#       return
#     'FileUploaded': (up, file, info) ->
#       # 每个文件上传成功后,处理相关的事情
#       # 其中 info 是文件上传成功后，服务端返回的json，形式如
#       # {
#       #    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
#       #    "key": "gogopher.jpg"
#       #  }
#       # 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html
#       domain = up.getOption('domain')
#       res = $.parseJSON(info)
#       sourceLink = domain + res.key
#       #获取上传成功后的文件的Url
#       console.log info
#       console.log sourceLink
#       return
#     'Error': (up, err, errTip) ->
#       #上传出错时,处理相关的事情
#       return
#     'UploadComplete': ->
#       #队列文件处理完毕后,处理相关的事情
#       return
#     'Key': (up, file) ->
#       # 若想在前端对每个文件的key进行个性化处理，可以配置该函数
#       # 该配置必须要在 unique_names: false , save_key: false 时才生效
#       key = ''
#       # do something with key here
#       key
# )
