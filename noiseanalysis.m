

%% 读取 txt 文件中的数据，画图
[a, b, c, channel_b, e,channel_g,g,channel_r,i] = textread('noiseleve.txt', '%s%s%c%f%s%f%s%f%s', 92);
timeline = 5:50;
std_index = 1:2:92;
est_index = 2:2:92;
channel_b_std = channel_b(std_index);
channel_b_est = channel_b(est_index);
channel_g_std = channel_g(std_index);
channel_g_est = channel_g(est_index);
channel_r_std = channel_r(std_index);
channel_r_est = channel_r(est_index);
%% 画出通道 B 的图
handle_b = plot(timeline,channel_b_std,'b-o',timeline,channel_b_est,'b-*');
set(xlabel('timeline'));
set(ylabel('noise level'));
set(title('channel b error between esti and true'));
set(gcf,'outerposition',get(0,'screensize'));
legend('groundtruth','estimation');
image_b = getframe(gcf);
imwrite(image_b.cdata,'b-lena.bmp');
close gcf
%% 画出通道 G 的图
handle_g = plot(timeline,channel_g_std,'g-o',timeline,channel_g_est,'g-*');
set(xlabel('timeline'));
set(ylabel('noise level'));
set(title('channel g error between esti and true'));
set(gcf,'outerposition',get(0,'screensize'));
legend('groundtruth','estimation');
image_g = getframe(gcf);
imwrite(image_g.cdata,'g-lena.bmp');
close gcf
%% 画出通道 R 的图
handle_r = plot(timeline,channel_r_std,'r-o',timeline,channel_r_est,'r-*');
set(xlabel('timeline'));
set(ylabel('noise level'));
set(title('channel r error between esti and true'));
set(gcf,'outerposition',get(0,'screensize'));
legend('groundtruth','estimation');
image_r = getframe(gcf);
imwrite(image_r.cdata,'r-lena.bmp');
close gcf