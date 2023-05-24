<?php 
    $time_format = '';
    if ($time_difference < 60){
        $seconds = $time_difference;
        if ($seconds == 1 || (strval($seconds)[-1] == 1 && $seconds > 20))
            $time_format = "$seconds sekundę temu";
        else if (($seconds <= 4 && $seconds >= 2) || (strval($seconds)[-1] <= 4 && strval($seconds)[-1] >= 2 && $seconds > 20))
            $time_format = "$seconds sekundy temu";
        else if ($seconds <= 20 || (strval($seconds)[-1] <= 10 && $seconds > 20))
            $time_format = "$seconds sekund temu";
    }
    else if ($time_difference < 3600){
        $minutes = round($time_difference / 60);
        if ($minutes == 1 || (strval($minutes)[-1] == 1 && $minutes > 20))
            $time_format = "$minutes minutę temu";
        else if  ($minutes <= 4 || (strval($minutes)[-1] <= 4 && strval($minutes)[-1] >= 2 && $minutes > 20))
            $time_format = "$minutes minuty temu";
        else if ($minutes <= 20 || (strval($minutes)[-1] <= 10 && $minutes > 20))
            $time_format = "$minutes minut temu";
    }
    else if ($time_difference < 86400){
        $hours = round($time_difference / 3600);
        if ($hours == 1 || (strval($hours)[-1] == 1 && $hours > 20))
            $time_format = "$hours godzinę temu";
        else if ($hours <= 4 || (strval($hours)[-1] <= 4 && strval($hours)[-1] >= 2 && $hours > 20))
            $time_format = "$hours godziny temu";
        else if ($hours <= 20 || (strval($hours)[-1] <= 10 && $hours > 20))
            $time_format = "$hours godzin temu";
    }
    else if ($time_difference < 86400 * 30){
        $month = round($time_difference / 86400);
        if ($month == 1 || (strval($month)[-1] == 1 && $month > 20))
            $time_format = "$month miesiąc temu";
        else if ($month <= 4 || (strval($month)[-1] <= 4 && strval($month)[-1] >= 2 && $month > 20))
            $time_format = "$month miesiące temu";
        else if ($month <= 20 || (strval($month)[-1] <= 10 && $month > 20))
            $time_format = "$month miesięcy temu";
    }
    else if ($time_difference < 86400 * 30 * 12){
        $year = round($time_difference / 86400 * 30);
        if ($year == 1 || (strval($year)[-1] == 1 && $year > 20))
            $time_format = "$year rok temu";
        else if ($year <= 4 || (strval($year)[-1] <= 4 && strval($year)[-1] >= 2 && $year > 20))
            $time_format = "$year lata temu";
        else if ($year <= 20 || (strval($year)[-1] <= 10 && $year > 20))
            $time_format = "$year lat temu";
    }
?>