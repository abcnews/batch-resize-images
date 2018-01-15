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

# Example before
![source image](samples/source.jpg)

# Example after
![destination image](samples-output/source.jpg)
