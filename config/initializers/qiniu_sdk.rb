require 'qiniu'

Qiniu.establish_connection! access_key: ENV["QINIU_ACCESS_KEY"],
                            secret_key: ENV["QINIU_SECRET_KEY"]

Rails.application.config.qiniu_domain = "http://shin.ftghub.com"