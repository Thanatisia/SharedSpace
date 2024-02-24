# Converting images to ASCII art

## Information
- Goal:
    + Input an image, scan and convert the image into an ASCII art

## Algorithm
1. Center the picture on the screen
2. Draw the picture
3. Iterate through each pixel and grey-scale the image so that its black and white
4. Create a memory map of [X rows, Y columns] that will hold the pixels as blocks
    ```
    [
        [Y items],
        ... X times
    ]
    ```
    - Image Structure
        - Identify the height of the image (Number of Rows; aka X)
        - Identify the width of the image (Number of Columns; aka Y)
        ```c
        typedef struct image_specifications = {
            const char *image_name;
            const char *image_ext;
            int height;
            int width;
        };

        int main() {
            // Initialize new image
            image_specifications img1 = new image_specifications();
            
            // Set Attributes
            img1.image_name = "Image-File";
            img1.image_ext = ".jpg";
            img1.height = stoi(obtain_height());
            img1.width = stoi(obtain_width());
        } 
        ```
    - Memory Map Structure
    - Each individual pixel is a block
    - Every index in the memory map will be a row of the image
        - Create an empty list for every new row
        - Every block will be added into the container/list corresponding to the row number (index)
5. Iterate through every pixel
    - Obtain the luminosity of the pixel/block
    - Pick a character given a brightness:
        - If the brightness is 0000, Set current block to "#"
        - If the brightness is 0125, Set current block to "&"
        - If the brightness is 0250, Set current block to "%"
        - If the brightness is 0375, Set current block to "+"
        - If the brightness is 0500, Set current block to "-"
        - If the brightness is 0625, Set current block to ";"
        - If the brightness is 0750, Set current block to ","
        - If the brightness is 0875, Set current block to "."
        - If the brightness is 1000, Set current block to " "
    + Append the block to the list corresponding to the current row number
6. Iterate through the list of lists
    - For each row in the list
        - Print out the elements in the list to standard output

