#!/bin/sh
root_path=ec2-user@52.1.104.176:/usr/local/system/trade_site

# 同步当前项目全部源文件
#rsync -avzPcI * $root_path/ --exclude=".*"

#root_path=deployment@192.168.1.200:/usr/local/system/trade_site
#rsync -avzPcI app/controllers/mapi/* $root_path/app/controllers/mapi/ --exclude=".*" --exclude="controllers/application_controller.rb" #注意：这个路径必须是一个相对路径，不能是绝对路径

#-----------------------------------------------------------------
 rsync -avzPcI db/migrate/* $root_path/db/migrate/ --exclude=".*"
 rsync -avzPcI app/* $root_path/app/ --exclude=".*"
#-----------------------------------------------------------------

#rsync -avzPcI config/* $root_path/config/
#rsync -avzPcI config/routes.rb $root_path/config/routes.rb
#rsync -avzPcI lib/support/* $root_path/lib/support/ --exclude=".*"
#rsync -avzPcI config/environment.rb $root_path/config/environment.rb
rsync -avzPcI public/* $root_path/public/ --exclude=".*" --exclude="test/*" --exclude="attachment/*" --exclude="temp/*" --exclude="feed/*" --exclude="excel/*" --exclude="order_images/*"  --exclude="competitor_product/" --exclude="themes/*" --exclude="load/*" --exclude="themes/*" --exclude="pdf/*"  --exclude="site_logos/*" --exclude="gz/*" --exclude="ppc/*"  --exclude="product_images/*" --exclude="upload/*" --exclude="complain_images/*" --exclude="email_attachments/*"
#rsync -avzPcI lib/* $root_path/lib/ --exclude=".*"
#rsync -avzPcI lib/tasks/* $root_path/lib/tasks/ --exclude=".*"
#rsync -avzPcI config/locales/* $root_path/config/locales/ --exclude=".*"
#rsync -avzPcI config/initializers/* $root_path/config/initializers/ --exclude=".*"