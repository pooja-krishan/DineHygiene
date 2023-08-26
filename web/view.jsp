<%-- 
    Document   : view.jsp
    Created on : 15 Feb, 2020, 6:56:03 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link rel="stylesheet" type="text/css" href="buttbimg.css">
	<script>
		var myNestedVals = {
        'Chennai': {
            'Adambakkam': ['The Arabian Plate', 'Deepam Tiffin Centre', 'The Chennai Dhaba'],
            'Chetpet': ['Kailash Parbat', 'Ox and Tomato', 'Wangs Kitchen'],
            'Saidapet': ['Namma Chennai', 'AI Arabian Delights', 'Sri Balaji Bhavan', 'Pottery Kitchen']
        }
    };

    function createOption(Chennai, text, value) {
        var opt = document.createElement('option');
        opt.value = value;
        opt.text = text;
        Chennai.options.add(opt);
    }

    function createOptions(optionsArray, Chennai) {
        for (i = 0; i < optionsArray.length; i++) {
            createOption(Chennai, optionsArray[i], optionsArray[i]);
        }
    }

    function configureL2(l1, l2, l3) {
        l2.options.length = 0;
        l3.options.length = 0;
        createOption(l2, "Select area", "");
        var l2keys = Object.keys(myNestedVals[l1.value]);
        createOptions(l2keys, l2)
    }

    function configureL3(l1, l2, l3) {
        l3.options.length = 0;
        createOption(l3, "Select restaurant", "");
        var l3keys = myNestedVals[l1.value][l2.value];
        createOptions(l3keys, l3);
    }
	</script>
</head>
    <body>
        <center>
            <form action="retrieve.jsp" method="post">
                <select name="district" id="l1" onchange="configureL2(this, document.getElementById('l2'), document.getElementById('l3'))">
                    <option value="">Select district</option>
                    <option value="Chennai">Chennai</option>
                </select>
                <select name="area" id="l2" onchange="configureL3(document.getElementById('l1'), this, document.getElementById('l3'))">
                </select>
                <select name="restaurant" id="l3">
                </select>
                <p> <button class="modern" style="height:30px;width:150px;border-radius:20px/60px;background-image:linear-gradient(to right, rgba(188,98,223,1), rgba(94,40,253,1));color:white;"> VIEW RATING </button> </p>
            </form>
        </center>
    </body>
</html>
