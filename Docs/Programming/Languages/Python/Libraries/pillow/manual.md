# Python Library - PIL (aka pillow)

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
+ PIL (Pillow) is a built-in python library that contains functions involving the I/O Processing and manipulation of Image Files

## Setup
### Dependencies
+ python
+ python-pip
- PyPI Packages
    + pillow (If is not built-in)

## Documentation

### Packages
- PIL : Short form for 'Pillow', PIL is an Image Manipulation library used to perform I/O Operations to image files (such as Importing images, managing and outputing images similar to OpenCL in C)

### Modules
- PIL

### Classes
- PIL
    - `.Image()` : Contains functions regarding the creation/managing of Image objects
    - `.ImageDraw()` : Contains function for drawing images into a virtual buffer object for use

### Functions
- PIL.Image
    - `.new(name, size, ...)`
        - Return
            - im : Return the new image object created
                + Type: PIL.Image
- PIL.ImageDraw
    - `.Draw(im)` : Draw the specified image into a new image and return the object for application
        - Parameter Signature/Header
            - im : Specify the image you wish to draw into the container
                + Type: PIL.Image
        - Return
            - draw : The drawn image object
                + Type: PIL.ImageDraw

### Data Types and Objects

### Attributes/Variables

### Usage

- Import library/packages
    - I/O Handling
        ```python
        from PIL import Image
        ```

- Import a file as an image and return as a PIL.Image object
    ```python
    im = Image.open(image_file_name)
    ```

- Load an image object and extract the pixel mappings from the image
    ```python
    pixel_map = im.load()
    ```

- Convert the image from RGB to RGBA
    ```python
    rgba = im.convert("RGBA")
    ```

- Get the image's resolution (sizes)
    ```python
    width, height = im.size
    ```

- Get the image's color mode (RGB(A))
    ```python
    image_mode = im.mode
    ```

- Get the image data
    ```python
    data = im.getdata()
    ```

- Get the value of the pixel located in the specified coordinates/position (X (row), Y (column))
    - If your image's color mode is "RGBA", returns an alpha channel as well for transparency (property of PNG)
        ```python
        r, g, b, a = im.getpixel((row,col))
        ```
    - If your image's color mode is "RGB", doesnt contain an alpha channel for transparency (JPG/JPEG etc)
        ```python
        r, g, b = im.getpixel((row,col))
        ```

- Update the image object with new pixel data
    - If your image's color mode is "RGBA", returns an alpha channel as well for transparency (property of PNG)
        ```python
        im.putdata([[r,g,b,a], ...])
        ```
    - If your image's color mode is "RGB", doesnt contain an alpha channel for transparency (JPG/JPEG etc)
        ```python
        im.putdata([[r,g,b], ...])
        ```

- Updating the image's pixel mapping directly
    - If your image's color mode is "RGBA", returns an alpha channel as well for transparency (property of PNG)
        ```python
        pixel_map[x,y] = (int(R), int(G), int(B))
        ```
    - If your image's color mode is "RGB", doesnt contain an alpha channel for transparency (JPG/JPEG etc)
        ```python
        pixel_map[x,y] = (int(R), int(G), int(B))
        ```

- Save/Export the image object buffer into the specified output file and the specified image format
    ```python
    im.save(output_file_name, format="your-format (png)")
    ```

## Wiki

### Snippets
- Obtaining a complete mapping of your entire image
    - Initialize Variables
        - image_map of type<Dictionary> mapping the pixel coordinates (as a tuple) to the pixel's RGB(A) color values
            - Notes
                - In python, hashable types can be used as a key in key-mapping data structures, i.e. strings, integers, and tuples
                    + Tuples, unlike lists, are useful as they are not just immutable, they can be hashed into a value and thereby, be used as a key identifier in a hashmap (aka dictionary, map, key-value mappings)
        ```python
        image_map = {
            # (x,y) : [r,g,b(,a)]
        }
        ```
    - Iterate through the image pixel by pixel across the row and down the columns and map the pixel value of the cell in each row (X axis) corresponding to the subsequent columns (Y axis)
        ```python
        for x in range(width):
            for y in range(height):
        ```
        - Get the value of the pixel located in the specified coordinates/position (X (row), Y (column))
            - If your image's color mode is "RGBA", returns an alpha channel as well for transparency (property of PNG)
                ```python
                r, g, b, a = im.getpixel((x,y))
                ```
            - If your image's color mode is "RGB", doesnt contain an alpha channel for transparency (JPG/JPEG etc)
                ```python
                r, g, b = im.getpixel((x,y))
                ```
        - Map the current pixel's RGB(A) values to the dictionary as a key mapping the row x column as a tuple (i,j) to the pixel's RGB(A) color values
            - If your image's color mode is "RGBA", returns an alpha channel as well for transparency (property of PNG)
                ```python
                image_map[i,j] = [r,g,b,a]
                ```
            - If your image's color mode is "RGB", doesnt contain an alpha channel for transparency (JPG/JPEG etc)
                ```python
                image_map[i,j] = [r,g,b]
                ```
    - Return the image map
        ```python
        return image_map
        ```

- Grayscaling an image
    - Choose a factor (what fraction of the image you want to grayscale - whole, N = (1/N))
        - Choose the orientation (direction) you wish to split the grayscaling of the image - Split by the X axis (horizontally) or Split by the Y axis (vertically)
            - Entire image (whole)
                - Iterate through the entire width (horizontal length - rows) of the image and down the entire height (vertical length - aka columns) of the image
                    ```python
                    for i in range(width): 
                        for j in range(height): 
                            # Your statements here
                    ```
            - Grayscale horizontally (split by the width)
                - Iterate through the specified fraction (factor) of the width (horizontal length - rows) of the image and down the entire height (vertical length - aka columns) of the image
                    ```python
                    for i in range(width//factor):
                        for j in range(height):
                            # Your statements here
                    ```
            - Grayscale vertically (split by the height)
                - Iterate through the entire width (horizontal length - rows) of the image and down the specified fraction (factor) of the height (vertical length - aka columns) of the image
                    ```python
                    for i in range(width):
                        for j in range(height//factor):
                            # Your statements here
                    ```
        - Check if the Image's color mode is RGB or RGBA
            - If your image's color mode is "RGBA", returns an alpha channel as well for transparency (property of PNG)
                ```python
                # getting the RGB pixel value + alpha channel. 
                r, g, b, a = input_image.getpixel((i, j)) 
                ```
            - If your image's color mode is "RGB", doesnt contain an alpha channel for transparency (JPG/JPEG etc)
                ```python
                # getting the RGB pixel value. 
                r, g, b = input_image.getpixel((i, j)) 
                ```
        - Apply the grayscale transformation to your RGB values and sum them up to obtain the grayscale factor
            ```python
                # Apply formula of grayscale: 
                grayscale = (0.299*r + 0.587*g + 0.114*b) 
            ```
        - Setting the grayscaled value to the pixel mapping in the XY coordinate (i,j)
            - If your image's color mode is "RGBA", returns an alpha channel as well for transparency (property of PNG)
                ```python
                # setting the pixel value. 
                pixel_map[i, j] = (int(grayscale), int(grayscale), int(grayscale), int(a))
                ```
            - If your image's color mode is "RGB", doesnt contain an alpha channel for transparency (JPG/JPEG etc)
                ```python
                # setting the pixel value. 
                pixel_map[i, j] = (int(grayscale), int(grayscale), int(grayscale))
                ```

- Apply a transparency mask
    - Create a mask to make the background transparent
        ```python
        mask = Image.new("L", im.size, 0)
        ```

    - Draw the mask into a new image and return the object for application
        ```python
        draw = ImageDraw.Draw(mask)
        ```

    - Create a bounding box for a circle
        ```python
        bbox = [0, 0, width, height]
        ```

    - Draw a filled white circle in the mask in the bounding box
        ```python
        draw.ellipse(bbox, fill=255)
        ```

    - Smooth the mask to reduce artifacts
        ```python
        mask = mask.filter(ImageFilter.GaussianBlur(2))
        ```

    - Create a mask for black pixels
        ```python
        r,g,b,a = rgba.split()
        ```

    - Composite the new alpha channel (transparency/opacity) with the existing alpha channel
        ```python
        new_alpha = ImageChops.multiply(a, mask)
        ```

    - Create a new image with the updated alpha channel
        ```python
        im.putalpha(new_alpha)
        ```

    - Get the image data
        ```python
        rgba_data = rgba.getdata()
        ```

    - Iterate through the image data and obtain the new updated pixels
        ```python
        # Initialize Variables
        new_pixels = [] # To hold the new pixels
        black_threshold = 5 # Define the threshold for near-black pixels

        # Iterate through the data
        for pixel_values in rgba_data:
            # Get RGB value of the current pixel
            R = pixel_values[0]
            G = pixel_values[1]
            B = pixel_values[2]

            # Check if the pixel is near the threshold (Adjust threshold as necessary)
            if R <= threshold and G <= threshold and B <= threshold:
                # Near-threshold found (RGB values are almost zero)
                # Make pixel transparent (set alpha to 0)
                new_pixels.append((R,G,B,0))
            else:
                # Not the value - store the original pixel as per normal
                new_pixels.append(pixel_values)  # other colours remain unchanged
        ```

    - Update image with new pixel data
        ```python
        rgba.putdata(new_pixels)
        ```

### Pixel Color Transformation Formulas
> Formulas to scale/translate/transform the RGB values. R = Red, G = Green, B = Blue

+ Formula: `(r_Factor*R + g_Factor*G + b_Factor*B)`
+ Grayscale: `(0.299*R + 0.587*G + 0.114*B)`

### Terminologies

### Related
+ OpenCL : Multicore GPU Programming in C Programming - Similar use cases and project ideas include : Concurrent GPU Rendering/Image Manipulation

## References

## Resources
+ [Python Docs - PIL](https://docs.python.org/3/library/pillow.html)

## Remarks

