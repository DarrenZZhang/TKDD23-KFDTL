    function [H_train2]=H_train_440(H_train,H_train1)
    H_train2=[];
    H_train2(:,1:20)=H_train(:,1:20);
    H_train2(:,21:22)=H_train1(:,1:2);
    
    H_train2(:,23:42)=H_train(:,21:40);
    H_train2(:,43:44)=H_train1(:,3:4);
    
    H_train2(:,45:64)=H_train(:,41:60);
    H_train2(:,65:66)=H_train1(:,5:6);
    
    H_train2(:,67:86)=H_train(:,61:80);
    H_train2(:,87:88)=H_train1(:,7:8);
    
    H_train2(:,89:108)=H_train(:,81:100);
    H_train2(:,109:110)=H_train1(:,9:10);
    
    H_train2(:,111:130)=H_train(:,101:120);
    H_train2(:,131:132)=H_train1(:,11:12);
    
    H_train2(:,133:152)=H_train(:,121:140);
    H_train2(:,153:154)=H_train1(:,13:14);
    
    H_train2(:,155:174)=H_train(:,141:160);
    H_train2(:,175:176)=H_train1(:,15:16);
    
    H_train2(:,177:196)=H_train(:,161:180);
    H_train2(:,197:198)=H_train1(:,17:18);
    
    H_train2(:,199:218)=H_train(:,181:200);
    H_train2(:,219:220)=H_train1(:,19:20);
    
    H_train2(:,221:240)=H_train(:,201:220);
    H_train2(:,241:242)=H_train1(:,21:22);
    
    H_train2(:,243:262)=H_train(:,221:240);
    H_train2(:,263:264)=H_train1(:,23:24);
    
    H_train2(:,265:284)=H_train(:,241:260);
    H_train2(:,285:286)=H_train1(:,25:26);
    
    H_train2(:,287:306)=H_train(:,261:280);
    H_train2(:,307:308)=H_train1(:,27:28);
    
    H_train2(:,309:328)=H_train(:,281:300);
    H_train2(:,329:330)=H_train1(:,29:30);
    
    H_train2(:,331:350)=H_train(:,301:320);
    H_train2(:,351:352)=H_train1(:,31:32);
    
    H_train2(:,353:372)=H_train(:,321:340);
    H_train2(:,373:374)=H_train1(:,33:34);
    
    H_train2(:,375:394)=H_train(:,341:360);
    H_train2(:,395:396)=H_train1(:,35:36);
    
    H_train2(:,397:416)=H_train(:,361:380);
    H_train2(:,417:418)=H_train1(:,37:38);
    
    H_train2(:,419:438)=H_train(:,381:400);
    H_train2(:,439:440)=H_train1(:,39:40);