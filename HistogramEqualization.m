

Nk = zeros(1,256);
Nd = zeros(1,256);

src = imread('problem.jpg');
pixels = rgb2gray(src);
[ImageHeight,ImageWidth] = size(pixels);
TotalPixel = ImageWidth*ImageHeight;
%[pixels,count] = fread(fp,[ImageWidth,ImageHeight]);
%fclose(fp);
%figure(2);
%imshow(pixels,[ImageWidth,ImageHeight]);
figure(1);
subplot(2,2,1);
imshow(pixels);

for i = 1:ImageHeight
    for j = 1:ImageWidth
        for px = 1:256
            if(pixels(i,j) == (px-1))
                Nk(px) = Nk(px)+1;
                break;
            end
        end
    end
end
%%% before HistogramEqualization
%stem(Nk,'Marker','none');
%%% before HistogramEqualization
for i = 1:ImageHeight
    for j = 1:ImageWidth
        tmp = pixels(i,j);
        Sk = 0;
        for t = 1:tmp
            Sk = Sk + Nk(t)/TotalPixel;
        end
        pixels(i,j) = round(Sk*256);
        for px = 1:256
            if(pixels(i,j) == (px-1))
                Nd(px) = Nd(px)+1;
                break;
            end
        end
    end
end

%%% after HistogramEqualization
%stem(Nd,'Marker','none');
%%% after HistogramEqualization

%fp = fopen('out.raw','wb');
%fwrite(fp,pixels,'unsigned char');
%fclose(fp);

imwrite(pixels,'out.jpg');

subplot(2,2,3);
imshow(pixels);

subplot(2,2,2);
stem(Nk,'Marker','none');
subplot(2,2,4);
stem(Nd,'Marker','none');

