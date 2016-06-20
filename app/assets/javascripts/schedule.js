        $(function () {
            $('.schedule_starting_time').datetimepicker({
                defaultDate: "4/1/2016",
                disabledDates: [
                    moment("12/25/2016"),
                    new Date(2016, 4 - 1, 21),
                    "11/22/2013 00:53"
                ]
            });
        });
        
        $(function () {
            $('.schedule_end_time').datetimepicker({
                defaultDate: "4/1/2016",
                disabledDates: [
                    moment("12/25/2013"),
                    new Date(2016, 4 - 1, 21),
                    "11/22/2013 00:53"
                ]
            });
        });
