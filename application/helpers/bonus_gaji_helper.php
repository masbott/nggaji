<?php 


if (!function_exists('date_translate')) {
    function date_translate($date, $from='en', $to='id') {
        $en = array(
            'January', 'February', 'March', 'May', 'June',
            'July', 'August', 'October', 'December', 'Sunday',
            'Monday', 'Tuesday', 'Wednesday', 'Thursday',
            'Friday', 'Saturday', 'Aug', 'Oct', 'Dec', 'Sun',
            'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' );
        $id = array(
            'Januari', 'Februari', 'Maret', 'Mei', 'Juni',
            'Juli', 'Agustus', 'Oktober', 'Desember', 'Minggu',
            'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat',
            'Sabtu', 'Agt', 'Okt', 'Des', 'Min', 'Sen', 'Sel',
            'Rab', 'Kam', 'Jum', 'Sab' );
        return (is_array($from) && is_array($to)) ?
            str_replace($from, $to, $date) :
            str_replace($$from, $$to, $date);
    }
}
