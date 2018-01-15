Bash script to resize images to a particular ratio, with a blurred background
where the image is not in the same ratio.

By default this converts to 3x2 ratio, with a min-width ot 700 px.

Run on a single file with:
```
./go.sh <filename>
```

Run recursively finding all .jpgs in a folder with:
```
./go_in_folder.sh <folder>
```
# Examples
## Squareish image
The original source image is resized to fit inside the 3x2 frame

<img src="samples/source.jpg" alt="squareish source image with yellowish colour" width="300">
<img src="samples-output/source.jpg" alt="3x2 image with yellowish colour with source image horizontally centered" width="300">

## Wide source image
Both wide and tall images are supported by this script

<img src="samples/source-scaled.jpg" alt="wide source image" width="300">
<img src="samples-output/source-scaled.jpg" alt="3x2 image with image vertically centered" width="300">

## Tiny source images
Tiny source images will be scaled up 150% so they're legible on mobile, but remain centered in the overall image.

<img src="samples/portrait.jpg" alt="tiny image">
<img src="samples-output/portrait.jpg" alt="3x2 image with original centered at 150% of the original size" width="300">

## Background blur example
The background blur effect means the colour and theme is continued throughout the image

<img src="samples/6a00e0097e4e6888330120a8cac313970b-pi.jpg" alt="squareish source image with grey colour" width="300">
<img src="samples-output/6a00e0097e4e6888330120a8cac313970b-pi.jpg" alt="3x2 source image with grey colour with source image horizontally centered" width="300">
