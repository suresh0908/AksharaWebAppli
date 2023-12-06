
$(document).ready(function () {


$(function () {
    $(".datepicker").datepicker({
        autoclose: true,
        todayHighlight: true,
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: '1950:2200'
    }).datepicker('update', new Date());
});


$(function () {
    $('.datetimepicker1').datetimepicker();
});
$(function () {
    $('.datetimepicker2').datetimepicker({
        locale: 'en'
    });
});
$(function () {
    $('#datetime').datetimepicker({
        format: 'LT'
    });
});

$(function () {
    $('.datetimepicker6').datetimepicker();
    $('.datetimepicker7').datetimepicker({
        useCurrent: false //Important! See issue #1075
    });
    $(".datetimepicker6").on("dp.change", function (e) {
        $('.datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $(".datetimepicker7").on("dp.change", function (e) {
        $('.datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});

$(function () {
    var bindDatePicker = function () {
        $(".date").datetimepicker({
            format: 'DD-MM-YYYY',
            icons: {
                time: "fa fa-clock-o",
                date: "fa fa-calendar",
                up: "fa fa-arrow-up",
                down: "fa fa-arrow-down"
            }
        }).find('input:first').on("blur", function () {
            // check if the date is correct. We can accept dd-mm-yyyy and yyyy-mm-dd.
            // update the format if it's yyyy-mm-dd
            var date = parseDate($(this).val());

            if (!isValidDate(date)) {
                //create date based on momentjs (we have that)
                date = moment().format('YYYY-MM-DD');
            }

            $(this).val(date);
        });
    }

    var isValidDate = function (value, format) {
        format = format || false;
        // lets parse the date to the best of our knowledge
        if (format) {
            value = parseDate(value);
        }

        var timestamp = Date.parse(value);

        return isNaN(timestamp) == false;
    }

    var parseDate = function (value) {
        var m = value.match(/^(\d{1,2})(\/|-)?(\d{1,2})(\/|-)?(\d{4})$/);
        if (m)
            value = m[5] + '-' + ("00" + m[3]).slice(-2) + '-' + ("00" + m[1]).slice(-2);

        return value;
    }

    bindDatePicker();
});
});