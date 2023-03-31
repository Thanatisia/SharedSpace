<?php
    /*
     * PHP Utilities 
     */
    function file_check_duplicate($file_hndlr, $unique_field, $file_type="csv")
    {
        $file_hndlr = False;

        // Open File and get all rows
        if($file_hndlr) 
        {
            // File exists and can open
            $file_open = true;
            $row = 0;

            /* While there's still line in fgetcsv
             * - Store file as csv, so open the file as csv format 
             */
            while( ($data = fgetcsv($my_file, 10000, ",")) != FALSE)
            {
                /*
                 * fgetcsv($file_handler, lines, delimiter)
                 * - Read through csv file
                 *  returns array
                 */
                $num_Col = count($data);    // Get number of columns from first row
                $name[$row] = $data[0];         // Append all row's names into the array
                $age[$row] = $data[1];          // Append all row's age into the array
                $avg[$row] = $data[2];          // Append all row's average into the array
                $keyval[$name[$row]] = array($age[$row], $avg[$row]);  // Key-Value Dictionary/HashMap
                $row++; // Increment
            }

            // Always close the file after usage
            fclose($my_file);
            echo "<br/><br/>";
        }

        // Unique value validation
        // Check if file is open
        if( $file_open && array_key_exists($u_Name, $keyval) )
        {
            // If file is opened AND u_Name exists in keyval dictionary
            $is_duplicate = True;
        }
        return $is_duplicate;
    } 
?>
