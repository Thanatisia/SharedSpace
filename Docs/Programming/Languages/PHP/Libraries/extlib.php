<?php
    function sanitize_input($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    function conv_obj_to_str($obj)
    {
        return serialize($obj);
    }
?>
