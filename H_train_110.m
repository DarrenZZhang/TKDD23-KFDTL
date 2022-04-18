      
function [H_train2]=H_train_110(H_train,H_train1)
    H_train2=[];
    H_train2(:,1:8)= H_train(:,1:8);
    H_train2(:,9:11)= H_train1(:,1:3);
    
    H_train2(:,12:19)= H_train(:,9:16);
    H_train2(:,20:22)= H_train1(:,4:6);
    
    H_train2(:,23:30)= H_train(:,17:24);
    H_train2(:,31:33)= H_train1(:,7:9);
    
    H_train2(:,34:41)= H_train(:,25:32);
    H_train2(:,42:44)= H_train1(:,10:12);
    
    H_train2(:,45:52)= H_train(:,33:40);
    H_train2(:,53:55)= H_train1(:,13:15);
    
    H_train2(:,56:63)= H_train(:,41:48);
    H_train2(:,64:66)= H_train1(:,16:18);
    
    H_train2(:,67:74)= H_train(:,49:56);
    H_train2(:,75:77)= H_train1(:,19:21);
    
    H_train2(:,78:85)= H_train(:,57:64);
    H_train2(:,86:88)= H_train1(:,22:24);
    
    H_train2(:,89:96)= H_train(:,65:72);
    H_train2(:,97:99)= H_train1(:,25:27);
    
    H_train2(:,100:107)= H_train(:,73:80);
    H_train2(:,108:110)= H_train1(:,28:30); 