function [mean_ecc1,eccSdi,mean_EL,ELSdi] = find_cells(image,vec,filter,im) 
if nargin==1
vec=[8,10,11,15,20,23,18,28];
filter=1;
im=0;
end
if nargin==2
filter=1;
im=0;
end
if nargin==3
im=0;
end

%step 1: load the image and change it to gray scale
I = imread(image);
I = rgb2gray(I);
if im==1
imshow(I)
saveas(figure(1), 'step1.tif')
end

%step 2: Filter the image
I=medfilt2(I,[12,12]); 
if filter==1
I = imadjust(I,[],[],2.5);
end
if im==1
imshow(I)
saveas(figure(1), 'step2.tif')
end


%Step 3: Detect Entire Cell
[~,threshold] = edge(I,'sobel');
fudgeFactor = 0.5;
BWs = edge(I,'sobel',threshold * fudgeFactor);
if im==1
imshow(BWs)
saveas(figure(1), 'step3.tif')
end

%Step 4: Dilate the Image
se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWdil = imdilate(BWs,[se90 se0]);
if im==1
imshow(BWdil)
saveas(figure(1), 'step4.tif')
end

%Step 5: Fill Interior Gaps
BWdfill = imfill(BWdil,'holes');
if im==1
imshow(BWdfill)
saveas(figure(1), 'step5.tif')
end

%Step 6: Remove Connected Objects on Border
BWnobord = imclearborder(BWdfill,4);
if im==1
imshow(BWnobord)
saveas(figure(1), 'step6.tif')
end

%Step 7: Smooth the Object
seD = strel('diamond',5);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
if im==1
saveas(figure(1), 'step7.tif')
end
BW12=bwlabel(BWfinal);

%splicing
vislabels(BW12)
if im==1
saveas(figure(1), 'step8.tif')
end

DATA= regionprops('table', BW12,  'Eccentricity','MajorAxisLength','MinorAxisLength');
DATA(vec,:)=[];

%mean value
mean_ecc1 = mean(DATA.Eccentricity);
mean_EL=mean(log2((DATA.MajorAxisLength)./(DATA.MinorAxisLength)));
%sd
ELSdi=std(log2((DATA.MajorAxisLength)./(DATA.MinorAxisLength)));
eccSdi=std(DATA.Eccentricity);

