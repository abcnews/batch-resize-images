# ratio of 1.5 equates to 3x2
# Calculate this with width/height (eg. ratio 3x2 => 3/2 => 1.5)
RATIO="1.5"

function process_file {
  filename="$1"

  # get the height from the image
  height=`convert "$filename" -format '%h' info:`
  width=`convert "$filename" -format '%w' info:`

  # assuming a portrait image, adjust the widto so we have a 3x2 image
  new_width=$(bc <<< "scale=4; $height * $RATIO")
  new_width_num=$(bc <<< "scale=0; $new_width / 1");
  new_height_num=$height

  # if the image is not tall enough
  if [ $new_width_num -lt $width ]; then
    # adjust the height so we ahve a 3x2 image
    new_width_num=$width
    new_height=$(bc <<< "scale=4; $width / $RATIO")
    new_height_num=$(bc <<< "scale=0; $new_height / 1");
  fi

  # if the image isn't yet 700px wide, expand the canvas so the image will be
  # centered in the middle. This stops Core upscaling it.
  if [ $new_width_num -lt 700 ]; then
    new_width_num=700
    new_height_num=467
  fi

  # If the source image is tiny, scale it up 150% so it's legible on mobile
  # Note: most of these will probably be replaced editorially
  src_filename="$filename"
  if [ $width -lt 200 ]; then
    convert "$filename" -resize 150% temp-resized.png
    src_filename="temp-resized.png";
  fi

  # Create the blurred, darkened background image
  convert "$filename" -resize $new_width_num"x"$new_height_num"!" -brightness-contrast -10x0 -blur 0x50 temp.png

  # Composite the image over the background
  composite -gravity center "$src_filename"  temp.png out.png

  # Convert back to the original filename
  convert out.png -quality 100 "$filename"

  # clean up
  rm temp.png temp-resized.png out.png &> /dev/null
}

echo "$1";
process_file "$1";
