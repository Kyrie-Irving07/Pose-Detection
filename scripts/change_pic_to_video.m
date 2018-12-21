function [] = change_pic_to_video(pathName,videoName, fps, format)
% %  change_pic_to_video  
pathName=[pathName,'\'];
%sort the picture name
fileName = dir([pathName, '*.', format]);
count = size(fileName, 1);

[~,order]=sort_nat({fileName.name});
fileName=fileName(order);
%make picture to video
videoRoute = [pathName, videoName,'.mp4'];
videoObj = VideoWriter(videoRoute,'MPEG-4');
videoObj.FrameRate = fps;
open(videoObj);
for i = 1:count
    img = imread([pathName, fileName(i).name]);  %num2str(i-1)
    writeVideo(videoObj, (img));
end
close(videoObj);

% %framesPath :ͼ����������·����ͬʱҪ��֤ͼ���С��ͬ
% %videoName:  ��ʾ��Ҫ��������Ƶ�ļ�������
% %quality:    ������Ƶ������ 0-100
% %Compressed: ѹ�����ͣ� 'Indeo3'��Ĭ�ϣ�, 'Indeo5', 'Cinepak', 'MSVC', 'RLE' or 'None'
% %fps: ֡��
% %startFrame ,endFrame ;��ʾ����һ֡��ʼ����һ֡����
% 
% if(exist('videoName','file'))
%     delete videoName.avi
% end
% 
% %������Ƶ�Ĳ����趨
% aviobj=VideoWriter(videoName);  %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��
% aviobj.Fps=fps;
% 
% %����ͼƬ
% for i=startFrame:endFrame
%     fileName=sprintf('%08d',i);    %�����ļ������� �������ļ�����00000001.jpg 00000002.jpg ....
%     frames=imread([framesPath,fileName,'.jpg']);
%     aviobj=writeVideo(aviobj,uint8(frames));
% end
% close(aviobj); % �رմ�����Ƶ
end


% videoRoute = [pathName, videoName];
% videoObj = VideoWriter(videoRoute);
% videoObj.FrameRate = fps;
% picName = dir([pathName, '*.png']);
% count = size(picName, 1);
% open(videoObj);
% for i = 1:5451
%     img = imread([pathName, num2str(i-1), '.png']);
%     writeVideo(videoObj, im2frame(img));
% end
% close(videoObj);
