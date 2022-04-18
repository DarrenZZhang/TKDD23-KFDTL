function [Train_label]=Train_label_440(tr_dat,train1_data_label)

    Train_label=[];
    Train_label(1:20,:)=tr_dat(1:20,:);
    Train_label(21:22,:)=train1_data_label(1:2,:);
    
    Train_label(23:42,:)=tr_dat(21:40,:);
    Train_label(43:44,:)=train1_data_label(3:4,:);
    
    Train_label(45:64,:)=tr_dat(41:60,:);
    Train_label(65:66,:)=train1_data_label(5:6,:);
    
    Train_label(67:86,:)=tr_dat(61:80,:);
    Train_label(87:88,:)=train1_data_label(7:8,:);
    
    Train_label(89:108,:)=tr_dat(81:100,:);
    Train_label(109:110,:)=train1_data_label(9:10,:);
    
    Train_label(111:130,:)=tr_dat(101:120,:);
    Train_label(131:132,:)=train1_data_label(11:12,:);
    
    Train_label(133:152,:)=tr_dat(121:140,:);
    Train_label(153:154,:)=train1_data_label(13:14,:);
    
    Train_label(155:174,:)=tr_dat(141:160,:);
    Train_label(175:176,:)=train1_data_label(15:16,:);
    
    Train_label(177:196,:)=tr_dat(161:180,:);
    Train_label(197:198,:)=train1_data_label(17:18,:);
    
    Train_label(199:218,:)=tr_dat(181:200,:);
    Train_label(219:220,:)=train1_data_label(19:20,:);
    
    Train_label(221:240,:)=tr_dat(201:220,:);
    Train_label(241:242,:)=train1_data_label(21:22,:);
    
    Train_label(243:262,:)=tr_dat(221:240,:);
    Train_label(263:264,:)=train1_data_label(23:24,:);
    
    Train_label(265:284,:)=tr_dat(241:260,:);
    Train_label(285:286,:)=train1_data_label(25:26,:);
    
    Train_label(287:306,:)=tr_dat(261:280,:);
    Train_label(307:308,:)=train1_data_label(27:28,:);
    
    Train_label(309:328,:)=tr_dat(281:300,:);
    Train_label(329:330,:)=train1_data_label(29:30,:);
    
    Train_label(331:350,:)=tr_dat(301:320,:);
    Train_label(351:352,:)=train1_data_label(31:32,:);
    
    Train_label(353:372,:)=tr_dat(321:340,:);
    Train_label(373:374,:)=train1_data_label(33:34,:);
    
    Train_label(375:394,:)=tr_dat(341:360,:);
    Train_label(395:396,:)=train1_data_label(35:36,:);
    
    Train_label(397:416,:)=tr_dat(361:380,:);
    Train_label(417:418,:)=train1_data_label(37:38,:);
    
    Train_label(419:438,:)=tr_dat(381:400,:);
    Train_label(439:440,:)=train1_data_label(39:40,:);