## Steps

- Read images

- Write a function to apply a Gaussian filter to both images.

- Write a function to divide the image by 2.

- Write a function to construct the Laplacian pyramid given an image.

    - Upsample the smaller image. (0 between each pixel)
 
    - Perform low pass filtering (Gaussian filtering)

    - Substract unsampled Gaussian - original image in current scale.

- Construct Gaussian pyramid for the mask

    - Combined Laplacian = mask * Laplacian A  + (1 - mask) * Laplacian B