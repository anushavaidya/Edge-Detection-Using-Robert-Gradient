img = imread("airplane_grayscale.png");

[height,width] = size(img);
fxy = double(img);
img2 = double(img);

robert = img;

figure(1);
imshow(img);
title("Original Image");

for i =2:height -1
    for j=2:width-1
        Gx=fxy(i,j)-fxy(i+1,j+1);
        Gy = fxy(i+1,j)-fxy(i,j+1);
        robert(i,j)= sqrt(Gx^2+Gy^2);
    end
end

%--------- Type 1 --------------%
type1 = uint8(robert);
figure(2)
imshow(type1);
title("Type 1");


%--------- Type 2 ---------------%
sample1= robert;
for i=2:height-1
    for j=2:width-1
        if sample1(i,j) < 25.0
            sample1(i,j) = img2(i,j);
        end
    end
end
type2 = uint8(sample1);
figure(3);
imshow(type2);
title("Type 2");


%---------- Type 3 -----------------%
sample2 = robert;
for i=2:height-1
    for j=2:width-1
        if sample2(i,j) >= 25
            sample2(i,j) = 255;
        else
            sample2(i,j) = img2(i,j);
        end
    end
end

type3 = uint8(sample2);
figure(4);
imshow(type3);
title("Type 3");

%------------- Type 4---------------%
sample3 = robert;
for i=2:height-1
    for j=2:width-1
        if sample3(i,j) < 25
            sample3(i,j) = 0;
        end
    end
end
type4 = uint8(sample3);
figure(5);
imshow(type4);
title("Type 4");

%------------ Type 5 ---------------%
sample4 = robert;
for i=2:height-1
    for j=2:width-1
        if sample4(i,j)>= 25
            sample4(i,j) = 255;
        else
            sample4(i,j) = 0;
        end
    end
end
type5 = uint8(sample4);
figure(6);
imshow(type5);
title("Type 5");
